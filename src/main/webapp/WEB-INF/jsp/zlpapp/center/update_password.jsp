<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html><head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>修改密码</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">

    <link href="<%=basePath%>static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="static/lshapp/css/center/common.css"/>
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/center/sytle.css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
    <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
    <script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>

    <style type="text/css">
		.inlin{
			display:inline-block;
		}
		.user_name{
			display:inline-block;
			margin-right:0.5rem;
			padding-top: .3rem;
			font-size: 1.6rem;
			color: #333;
			line-height: normal;
			list-style: none;
			font-weight: 450;
			box-sizing: border-box;
			font-family: inherit;
		}
		.user_icon{
			width: 1.0rem;
			height: 1.0rem;
			border-radius: 0.5rem;
		}
		.user_icon1{
			width: 2.0rem;
			height: 2.0rem;
			margin-bottom: .5rem;
		}
		.user_list{
			background:#fff;
			padding-top: 1rem;
			padding-bottom:1rem;
			border-bottom: 1px solid #f6f6f9;
		}
		.s-user-top {
			padding: 0 1.5rem;
			position: relative;
		}
		.submint {
		height: 32px;
		width: 92%;
		/* border: 1.3px solid #00AEED; */
		border-radius: 8px;
		margin-left: 3.5%;
		margin-top: 30px;
		text-align: center;
		font-size: 1.8rem;
		background-color:#ED4C44;
		color: white;
		line-height:32px;
}
		.btn_base{
			color:#FFFFFF;
            font-weight: bold;
            font-size: 1.5em;
            float: left;
            padding: 0.4em 3em;
           	margin-left:5%;
           	margin-top:20px;
            width: 90%;
            height:45px;
            border-radius: .5em;
            text-align: center;
        }
        .return_image{
			width:1.2rem;
			height:1.8rem;
		}
        .btn_color{
            background: #ec5151;
        }
	</style>
</head>
<body>
<jsp:include page="../head_title.jsp">
	<jsp:param value="修改密码" name="pageTitle"/>
</jsp:include>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>
<div class="con" id="pjax-container">
    <div id="show">
      <form action="<%=basePath%>lshapp/appLogin/update_password.do" method="post" name="Form" id="Form">
        <section class="user-center j-f-tel margin-lr">
             <div class="b-color-f  user-login-ul">
                <div class="text-all dis-box j-text-all login-li">
                    <div class="box-flex input-text">
                    <input id="PASSWORD" name="PASSWORD" type="hidden" value="${pd.PASSWORD }"/>
                        <input class="j-input-text" name="password" id="password" type="password"  placeholder="请输入原密码" >
                        <i class="iconfont icon-guanbi1 close-common j-is-null"></i>
                    </div>
                </div>

				<div class="text-all dis-box j-text-all login-li m-top10" >
					<div class="box-flex input-text">
						<input  name="newpassword" id="newpassword" type="password" placeholder="请输入新密码">

					</div>
				</div>
				<div class="text-all dis-box j-text-all login-li m-top10" >
					<div class="box-flex input-text">
						<input  name="affirmpassword" id="affirmpassword" type="password" placeholder="确认新密码">

					</div>
				</div>

            </div>
            <input type="hidden" name="enabled_sms" value="1">
            <div style="font-size:13px;margin-left:15px;margin-top:10px;color: red;">密码由6-20位英文字母、数字或符号组成</div>
            <button id="next" type="button" class="btn-submit min-two-btn br-5" onclick="save()">保存密码</button>
        </section>
        </form>
    </div>
    <div class="div-messages"></div>
</div>
	<div id="dialogBg"></div>
	<div id="dialog" class="animated" style="background-color:#555555;height:140px;border-color:#555555">
		<ul class="editInfos">
			<li><img src="static/lshapp/images/center/Successful hints-hdpi.png" style="width: 7rem;height:4.5rem;"/></li>
			<li style="color:white;font-size:18px">密码已更改成功</li>
		</ul>

	</div>
<!--悬浮菜单e-->
		<script>

     	</script>


</body>
	<script type="text/javascript">
		var w,h,className;
		function getSrceenWH(){
			w = $(window).width();
			h = $(window).height();
			$('#dialogBg').width(w).height(h);
		}

		window.onresize = function(){
			getSrceenWH();
		}
		$(window).resize();

		function save(){
			var zhengze = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
			var password=document.getElementById("password").value;
			var newpassword=document.getElementById("newpassword").value;
			var affirmpassword=document.getElementById("affirmpassword").value;
			var PASSWORD=document.getElementById("PASSWORD").value;
			if(password==""){
				d_messages("原密码不能为空!");
				return false;
			}else if(newpassword==""){
				d_messages("新密码不能为空!");
				return false;
			}else if(!zhengze.test(newpassword)){
				d_messages("密码由6-20位英文字母、数字或符号组成");
				return false;
			}else if(affirmpassword==""){
				d_messages("确认密码不能为空!");
				return false;
			}else if(newpassword==affirmpassword){

					$.ajax({
	         		 	async : false,
	 			        /* async : false,
	 			        cache : false, */
	 			        //cache: false,
	 			        type : 'POST',
	 			        url : "<%=basePath%>lshapp/userCenter/judge_password.do",// 请求的action路径
	 			        data:{"PASSWORD":password},
	 			        success: function(data){// 请求失败处理函数
	 			        	if(data=="success"){
	 			        		uppass(affirmpassword);
	 			        	}else{
	 			        		d_messages("请输入正确的原密码!");
	 			        		return false;
	 			        	}
	 			        },
	 			    });


			}else{
				d_messages("新密码和确认密码不同!");
				return false;
			}
		}
		function uppass(affirmpassword){
			$.ajax({
     		 	async : false,
			        /* async : false,
			        cache : false, */
			        //cache: false,
			        type : 'POST',
			        url : "<%=basePath%>lshapp/userCenter/update_password.do",// 请求的action路径
			        data:{"PASSWORD":affirmpassword},
			        success: function(data){// 请求失败处理函数
			        	if(data=="success"){
			        		className = $(this).attr('class');
							$('#dialogBg').fadeIn(300);
							$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
							setTimeout(tip,"1600");
			        	}else{
			        		d_messages("保存失败！");
			        		return false;
			        	}
			        },
			    });
		}
		function tip(){
			$('#dialogBg').fadeOut(300,function(){
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
<%-- 			window.location.href="<%=basePath%>lshapp/appLogin/go_user_login.do"; --%>
			openPage();
		}

		 function openPage() {
			 var data='{"index":"-1"}';
		        window.WebViewJavascriptBridge.callHandler(
		            'openPage'
		            ,data
		            , function(responseData) {
		            }
		        );
		 }

	</script>
</html>
