using System.Web;
using System.Web.SessionState;
using Xiucai.BPM.Core;
using Xiucai.BPM.Core.Bll;
using Xiucai.BPM.Core.Dal;
using Xiucai.BPM.Core.Model;
using Omu.ValueInjecter;
using Xiucai.Common;

namespace Xiucai.BPM.Admin.sys.ashx
{
    /// <summary>
    /// Summary description for PermissionHandler
    /// </summary>
    public class ButtonHandler : IHttpHandler,IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            if(SysVisitor.Instance.IsGuest)
            {
                context.Response.Write(
                    new JsonMessage{ Success = false,Data = "-99",Message = "登录已过期，请重新登录"}.ToString()
                    );
                context.Response.End();
            }

            var json = HttpContext.Current.Request["json"];
            var rpm = new RequestParamModel<Button>(context) { CurrentContext = context };
            if (!string.IsNullOrEmpty(json))
            {
                rpm = JSONhelper.ConvertToObject<RequestParamModel<Button>>(json);
                rpm.CurrentContext = context;
            }

            switch (rpm.Action)
            { 
                case "add":
                    var b = new Button();
                    b.InjectFrom(rpm.Entity);
                    AddButton(b, context);
                    break;
                case "edit":
                    var p = new Button();
                    p.InjectFrom(rpm.Entity);
                    p.KeyId = rpm.KeyId;
                    EditButton(p,context);
                    break;
                case "delete":
                    DelButton(rpm.KeyId,context);
                    break;
                default:
                    context.Response.Write(ButtonDal.Instance.JsonDataForEasyUIdataGrid(rpm.Pageindex, rpm.Pagesize,rpm.Filter,rpm.Sort,rpm.Order));
                    break;
            }
        }

        private void AddButton(Button b,HttpContext context)
        {
            int k = ButtonDal.Instance.Insert(b);
            var msg = "添加成功。";
            if (k <= 0)
                msg = "添加失败。";
            else
            {
                LogBll<Button> log = new LogBll<Button>();
                b.KeyId = k;
                log.AddLog(b);
            }
            context.Response.Write(new JsonMessage { Success = true, Data = k.ToString(), Message = msg }.ToString());
        }

        private void EditButton(Button b,HttpContext context)
        {
            var oldBtn = ButtonDal.Instance.Get(b.KeyId);
            int k = ButtonDal.Instance.Update(b);
            var msg = "修改成功。";
            if (k <= 0)
                msg = "修改失败。";
            else
            {
                LogBll<Button> log = new LogBll<Button>();
                log.UpdateLog(oldBtn,b);
            }
            context.Response.Write(new JsonMessage { Success = true, Data = k.ToString(), Message = msg }.ToString());
        }

        private void DelButton(int btnId,HttpContext context)
        {
            var btn = ButtonDal.Instance.Get(btnId);
            int k = ButtonDal.Instance.Delete(btnId);

            var msg = "删除成功。";
            if (k <= 0)
                msg = "删除失败。";
            else
            {
                LogBll<Button> log = new LogBll<Button>();
                log.DeleteLog(btn);
            }
            context.Response.Write(new JsonMessage { Success = true, Data = k.ToString(), Message = msg }.ToString());
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}