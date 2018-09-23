using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Xiucai.BPM.Core.Model;
using Xiucai.Common.Data;
using Xiucai.Common.Provider;

namespace Xiucai.BPM.Core.Dal
{
    public class DicDal : BaseRepository<Dic>
    {
        public static DicDal Instance
        {
            get { return SingletonProvider<DicDal>.Instance; }
        }

        public IEnumerable<Dic> GetListBy(string categoryCode)
        {
            return GetList("select * from sys_dics where code=@code", new { code = categoryCode });
        }

        public IEnumerable<Dic>  GetListBy(int categoryId)
        {
            return GetWhere(new {CategoryId = categoryId});
        }

        public IEnumerable<Dic> GetListBy(int categoryid, int parentId)
        {
            var list = GetListBy(categoryid);
            return from n in list
                   where n.ParentId == parentId
                   select n;
        }
    }
}
