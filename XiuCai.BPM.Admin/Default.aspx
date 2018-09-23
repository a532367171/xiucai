<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Xiucai.BPM.Admin.Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>疯狂秀才基本权限框架</title>
    <script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
    <link href="Scripts/jQgrid/default/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="scripts/qqmsg/msgbox.css" />
    <script type="text/javascript" src="scripts/qqmsg/jQuery.qqmsg.js"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css" />
	<link href="theme/<%=base.ThemeName %>/style.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="sys/ashx/ConfigHandler.ashx?action=js"></script>
	<link rel="stylesheet" type="text/css" id="easyui_theme" href="Scripts/easyui/themes/<%=base.ThemeName %>/easyui.css" />
    
    <link href="css/icon.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/jnotify/jquery.jnotify.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/css3btn.css" />

    <script src="Scripts/jnotify/jquery.jnotify.js" type="text/javascript"></script>
	

    <script src="Scripts/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="Scripts/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script  type="text/javascript" src="scripts/easyui/easyui-validate-rules.js"></script>

    <script type="text/javascript" src="/scripts/easyui/Xiucai.EasyUI.Extensions.js?v=18"></script>
    <script src="Scripts/jQuery.Ajax.js" type="text/javascript"></script>
	<script type="text/javascript">
	    var theme = '<%=base.ThemeName %>';

	    $(function () {
	        //$.hLoading.show();
	        //setTimeout($('#loading-mask').fadeOut(),500000);
	        $('#loginOut').click(function () {
	            $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function (r) {
	                if (r) {
	                    location.href = 'ashx/loginout.ashx';
	                }
	            });
	        });
	        $('#notity').jnotifyInizialize({
	            oneAtTime: true,
	            appendType: 'append'
	        }).css({ 'position': 'absolute',
	            '-top':'2px','left':'50%',
	            'margin':'20px 0px 0px -120px',
	            '-margin':'0px 0px 0px -120px',
	            //'right': '20px',
	            'width': '240px',
	            'z-index': '9999'
	        });


	        $(window).load(function() {
	            $('#loading').fadeOut();
	        });

	    });


	</script>
</head>

<body onselectstart="return false;" class="easyui-layout" style="overflow-y: hidden; "  fit="true"   scroll="no">
    
    <div id="loading" style="position: fixed;top: -50%;left: -50%;width: 200%;height: 200%;background: #fff;z-index: 100;overflow: hidden;">
        <img src="images/ajax-loader.gif" style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;margin: auto;"/>
    </div>
    

<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
	<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>


        <!-- 导航 -->


        <%=NavContent %>
	

    <div region="south" split="true" style="height: 30px;  ">
		<div class="footer">By 疯狂秀才 Email:1055818239@qq.com</div>
	</div>
	<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden" border="false">
		<div id="tabs" class="easyui-tabs"  fit="true"  >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
				
			</div>
		</div>
	</div>

	<div id="closeMenu" class="easyui-menu" style="width:150px;">
		<div id="refresh" iconCls="icon-arrow_refresh" >刷新</div>
		<div class="menu-sep"></div>
		<div id="close">关闭</div>
		<div id="closeall">全部关闭</div>
		<div id="closeother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="closeright">关闭右侧标签</div>
		<div id="closeleft">关闭左侧标签</div>
		<div class="menu-sep"></div>
		<div id="exit">退出</div>
	</div>
    
    <div id="notity"></div>
    
    
    
    
    <!-- 加入隐藏的帧，用于检查用户的登录状态是否已过期 -->
    <iframe height="0" width="0" src="CheckUserState.aspx"></iframe>
    
    


    <script src="Scripts/validate/jquery.validate.min.js" type="text/javascript"></script>
    <script src="Scripts/validate/jQuery.Validate.message_cn.js" type="text/javascript"></script>

    <script type="text/javascript" src="Editor/xhEditor/xheditor-1.1.14-zh-cn.min.js"></script>
    
    <script type="text/javascript" src="scripts/knockout/knockout-2.1.0.js"></script>
    <script type="text/javascript" src="scripts/knockout/knockout.mapping-latest.js"></script>
    
    <script type="text/javascript" src='ashx/MenuData.ashx'> </script>
    <script type="text/javascript" src='Scripts/business/newlayout.js?v=3'> </script>
    
    
    
    

</body>
</html>
