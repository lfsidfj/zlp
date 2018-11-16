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
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>用户登录</title>
    <link href="<%=basePath%>static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="<%=basePath%>static/lshapp/js/app.js"></script>
    <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
    <script src="<%=basePath%>static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		function save(){
			var submit=1;
			var phone=$("#PHONE_NUMBER").val();
			var password=$("#PASSWORD").val();
			if(phone==""){
				d_messages("手机号不能为空");
				$("#PHONE_NUMBER").focus();
				submit=0;
				return false;
			}else{
				var phonenum = $("#PHONE_NUMBER").val();
				var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
				if(!myreg.test(phonenum)){
				        d_messages("请输入有效的手机号码！");
						submit=0;
						$("#PHONE_NUMBER").focus();
						return false;
				}
			}
			if(password==""){
				d_messages("密码不能为空");
				submit=0;
				$("#PASSWORD").focus();
				return false;
			}
			if(submit==1){
				$.ajax({
				        /* async : false,
				        cache : false, */
				        //cache: false,
				        type : 'POST',
				        url : "<%=basePath%>lshapp/appLogin/user_login.do",// 请求的action路径
				        data:{"PHONE_NUMBER":phone,"PASSWORD":password},
				        success: function(data){// 请求失败处理函数
				        	if(data=="success"){
				        		window.location.href="<%=basePath%>lshapp/userbrithday/list.do";
				        	}else{
				        		d_messages("手机号或密码错误");
				        	}

				        },
				});
			}
		}
	</script>
</head>
<body>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/loading.gif"></div>

<div class="con">
    <section class="user-center user-login margin-lr p-r">
        <div class="user-login-header-box">
            <div class="user-login-header"><div class="user-login-header-img"><img src="static/lshapp/images/get_avatar.png"></div></div>
        </div>
            <div class="b-color-f  user-login-ul user-login-ul-after">
                <div class="text-all dis-box j-text-all login-li " name="usernamediv">

                    <div class="box-flex input-text">
                        <input class="j-input-text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="PHONE_NUMBER" id="PHONE_NUMBER" datatype="*" nullmsg="请输入手机号码" type="number" placeholder="请输入手机号码">

                    </div>
                </div>
                <div class="text-all dis-box j-text-all login-li m-top10" name="passworddiv">

                    <div class="box-flex input-text">
                        <input class="j-input-text" name="PASSWORD" id="PASSWORD" type="PASSWORD" datatype="*" nullmsg="请输入密码" placeholder="请输入您的密码">

                    </div>
                    <i class="iconfont icon-yanjing is-yanjing j-yanjing disabled"></i>
                </div>
             </div>
            <input type="hidden" name="back_act" value="http://www.lxshopping.cn/mobile/index.php?m=cart">
            <button type="button" class="btn-submit min-two-btn br-5" onclick="save()">立即登录</button>

        <div class="dis-box user-login-list">
            <div class="box-flex">
                 <a class="list-password f-04" href="<%=basePath%>lshapp/appLogin/go_find_password.do">忘记密码</a>
            </div>
            <div class="box-flex">
                 <a class="list-new f-04" href="<%=basePath%>lshapp/appLogin/go_user_regisrer.do">新用户注册</a>
            </div>

        </div>
       		<div style="margin-top: 8rem;font-size: 1.5rem;text-align: center;color: #E94D40;">
            	<img alt="" src="static/lshapp/images/WeChat1-hdpi.png" style="width: 1.5rem;height: 1.5rem;">
            	使用微信快速登陆
            </div>
            </section>
</div>
<script>

</script>


</body></html>

