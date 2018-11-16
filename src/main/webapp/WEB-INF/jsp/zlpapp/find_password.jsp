<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>找回密码</title>
    <link href="static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="<%=basePath%>static/lshapp/js/center/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
    <link rel="stylesheet" href="static/lshapp/css/center/common.css"/>
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/center/sytle.css">
    <script type="text/javascript">
    	var status=true;
		$(function(){
			if(status){
				$("#second").click(function (){
					status=false;
			        sendCode($("#second"));
			    });
			}

		  //  v = getCookieValue("secondsremained");//获取cookie值

		})
		//开始倒计时
		var countdown=60;
		function settime(obj) {

		    if (countdown == 0) {
		        obj.removeAttr("disabled");
		        obj.val("获取验证码");
		        countdown=60;
		        status=true;
		        return;
		    } else {
		        obj.attr("disabled", true);
		        obj.val("重新发送(" + countdown + ")");
		        countdown--;

		    }
		    setTimeout(function() {
		    	settime(obj)
		    	},1000) //每1000毫秒执行一次
		}

			//发送验证码
		function sendCode(obj){
		    var phonenum = $("#PHONE_NUMBER").val();
		    if(phonenum==""){
		    	d_messages("手机号不能为空");
		    	return false;
		    }
		    var result = isPhoneNum();
		    if(result){
		    	 $.ajax({
				        type : 'POST',
				        url : "<%=basePath%>lshapp/appLogin/judgePhone.do",// 请求的action路径
				        data:{"PHONE_NUMBER":phonenum,"type":'find'},
				        success: function(data){// 请求失败处理函数
				        	if(data=="success"){
				        		doPostBack({"PHONE_NUMBER":phonenum},obj);
				        	}else if(data=="falseQ"){
				        		d_messages("请输入你资料中的手机号!");
				        		return false;
				        	}

				        },
				    });
		    }
		}

		 function doPostBack(queryParam,obj) {
		    $.ajax({
		        /* async : false,
		        cache : false, */
		        cache: false,
		        type : 'POST',
		        url : "<%=basePath%>lshapp/appLogin/sendMsg.do",// 请求的action路径
		        data:queryParam,
		        success: function(data){// 请求失败处理函数
		        	if(data=="success"){
		    	        settime(obj);//开始倒计时
		        		d_messages("验证码发送成功！");
		        	}else if(data=="false"){
		        		d_messages("验证码发送失败！");
		        	}else if(data=="falseQ"){
		        		d_messages("请输入你资料中的手机号!");
		        	}

		        },
		    });
		}

		//校验手机号是否合法
		function isPhoneNum(){
		    var phonenum = $("#PHONE_NUMBER").val();
		    var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
			 if(!myreg.test(phonenum)){
		        d_messages('请输入有效的手机号码！');
		        return false;
		    }else{
		        return true;
		    }
		}
		var jud=true;
		//提交保存
		function save(){
				var zhengze = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
			 	var PHONE_NUMBER = $("#PHONE_NUMBER").val();
			 	var PASSWORD = $("#PASSWORD").val();
				var code =document.getElementById("CODE").value;
			 	if(PHONE_NUMBER==""){
					d_messages("手机号不能为空!");
					return false;
				}else{
					 var phonenum = $("#PHONE_NUMBER").val();
					    var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
						 if(!myreg.test(phonenum)){
					        d_messages('请输入有效的手机号码！');
					        return false;
					    }
				}
				if(code==""){
					d_messages("验证码不能为空");
					return false;
				}else if(PASSWORD==""){
					d_messages("密码不能为空!");
					return false;
				}else if(!zhengze.test(PASSWORD)){
					d_messages("密码由6-20位英文字母、数字或符号组成");
					return false;
				}else{
					$.ajax({
				        /* async : false,
				        cache : false, */
				        cache: false,
				        type : 'POST',
				        url : "<%=basePath%>lshapp/appLogin/sendJudge.do",// 请求的action路径
				        data:{"PHONE_NUMBER":PHONE_NUMBER,"code":code},
				        success: function(data){// 请求失败处理函数
				        	if(data=="success"){
				        		updateq();
				        	}else if(data=="false"){
				        		d_messages("验证码过期！");
				        	}else if(data=="false1"){
				        		d_messages("验证码错误！");
				        	}

				        },
				    });

				}

		}
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
		function updateq(){
			var PHONE_NUMBER = $("#PHONE_NUMBER").val();
		 	var PASSWORD = $("#PASSWORD").val();
		 	$.ajax({
		        /* async : false,
		        cache : false, */
		        cache: false,
		        type : 'POST',
		        url : "<%=basePath%>lshapp/appLogin/update_password.do",// 请求的action路径
		        data:{"PHONE_NUMBER":PHONE_NUMBER,"PASSWORD":PASSWORD},
		        success: function(data){// 请求失败处理函数
		        		className = $(this).attr('class');
						$('#dialogBg').fadeIn(300);
						$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
						setTimeout(tip,"1600");
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
</head>
<body>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>


<div class="con" id="pjax-container">
    <div id="show">
      <form action="<%=basePath%>lshapp/appLogin/update_password.do" method="post" name="Form" id="Form">
        <section class="user-center j-f-tel margin-lr">
             <div class="b-color-f  user-login-ul">
                <div class="text-all dis-box j-text-all login-li">
                    <div class="box-flex input-text">
                        <input class="j-input-text" name="PHONE_NUMBER" id="PHONE_NUMBER" type="number" onkeyup="this.value=this.value.replace(/\D/g,'')" placeholder="请输入手机号">
                       <!--  <i class="iconfont icon-guanbi1 close-common j-is-null"></i> -->
                    </div>
                </div>

                <div class="text-all dis-box j-text-all login-li m-top10" >
					<div class="box-flex input-text">
						<input  id="CODE" name="CODE" type="number" placeholder="请输入验证码">

					</div>
					<div>
						<input value="获取验证码" id="second" type="button" style="	font-size:15px;height: 31px;margin-left: 1%;margin-top: -1px;	border: none;"/>
					</div>
				</div>
				<div class="text-all dis-box j-text-all login-li m-top10" >
					<div class="box-flex input-text">
						<input  name="PASSWORD" id="PASSWORD" type="password" placeholder="请输入新密码">

					</div>
				</div>

            </div>
            <input type="hidden" name="enabled_sms" value="1">
            <button id="next" type="button" class="btn-submit min-two-btn br-5" onclick="save()">保存</button>
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
<script>

</script>


</body></html>