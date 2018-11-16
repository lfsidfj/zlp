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
<base href="<%=basePath%>">
	<!-- 下拉框 -->
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>用户注册</title>
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/gongyong.css">
	<link href="<%=basePath%>static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
	<script src="static/lshapp/js/zepto.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script src="static/lshapp/js/jquery.form.js"></script>
	<script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
</head>
<style>
	.input{
		font-size: 14px;
	}
	* {
	/* -webkit-box-sizing: border-box; */
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
input[type="radio"] + label::before {
			content: "\a0"; /*不换行空格*/
			display: inline-block;
			vertical-align: middle;
			font-size: 16px;
			width: 1em;
			height: 1em;
			margin-right: .4em;
			border-radius: 50%;
			border: 1px solid #01cd78;
			text-indent: .15em;
			line-height: 3;

        }
		input[type="radio"]:checked + label::before {
			background-color: #01cd78;
			background-clip: content-box;
			padding: .27em;

		}
		input[type="radio"] {
			position: absolute;
			clip: rect(0, 0, 0, 0);

		}
#myframe{
	position: fixed;
    top: 0px;
    left: 0px;
    right: 0px;
    width: 90%;
    height: 90%;
    margin-left:auto;
    margin-right:auto;
    margin-top: 5%;
    border: 2px #DA5751 solid;
    display: none;
}
 .return_image{
			width:1.2rem;
			height:1.8rem;
		}
		
		.z_mask {
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .5);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
           display: none;
        }
        .z_alert {
            width: 80px;
            height: 50px;
            font-size: 16px;
            text-align: center;
            position: absolute;
            left:40%;
            top: 50%;
            margin-top: -5rem;
        }
</style>
<body style="background-color: white;">




<!-- <section class="">
       <div style="width: 100%;height: 44px;border:1px red solid;">
		<a class="h" href="javascript:history.go(-1);">
             <img class="return_image" src="static/lshapp/images/return.png" style="float: left;">
        </a>
				  <div style="text-align: center;width: 90%;" >
                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">编辑资料</span>
				  </div>
		</div>
  </section> -->

<jsp:include page="head_title.jsp">
	<jsp:param value="注册" name="pageTitle"/>
</jsp:include>

<form action="<%=basePath%>lshapp/appLogin/save.do" name="Form" id="Form" method="post">
<div class="zhuce">
<div style="height: 50px;width: 100%;text-align: center;">
	<div style="float:left;height: 50px;width: 21%;line-height:50px">推荐码</div>
	<div class="text" style="width: 78%;float: right;">
       <input type="text" placeholder="请输入推荐码" class="input" id="INVITE_CODE" name="INVITE_CODE" onblur="judgeInviteCode()">
    </div>
 </div>

 <div style="height: 50px;width: 100%;text-align: center;">
	<div style="float:left;height: 50px;width: 21%;line-height:50px">昵称</div>
	<div class="text" style="width: 78%;float: right;">
       <input type="text" placeholder="请输入昵称" class="input"id="NICK_NAME" name="NICK_NAME">
    </div>
 </div>

  <div style="height: 50px;width: 100%;text-align: center;">
	<div style="float:left;height: 50px;width: 21%;line-height:50px">密码</div>
	<div class="text" style="width: 78%;float: right;">

       <input type="password" placeholder="密码至少输入六位数字字母组合" class="input" id="PASSWORD" name="PASSWORD">
    </div>
 </div>

  <div style="height: 50px;width: 100%;text-align: center;">
	<div style="float:left;height: 50px;width: 21%;line-height:50px">确认密码</div>
	<div class="text" style="width: 78%;float: right;">
       <input type="password" placeholder="密码至少输入六位数字字母组合" class="input"  id="confirm_PASSWORD" name="confirm_PASSWORD" onblur="judegPassWord()">
    </div>
 </div>

  <div style="height: 50px;width: 100%;text-align: center;">
	<div style="float:left;height: 50px;width: 21%;line-height:50px">性别</div>
	<div class="text" style="width: 78%;height: 48px; ">
      <div style="margin-top: 7px;float: left;width: 150px;">
      <input  type="radio" name="SEX" id="female" value="1" checked="checked" /> <label style="margin-top: 10px;" for="female">男</label>
			&nbsp; &nbsp;&nbsp; <input  type="radio" id="male" name="SEX" value="2" /> <label for="male">女</label></div>
    </div>
 </div>

<!--   <div style="height: 50px;width: 100%;text-align: center;"> -->
<!-- 	<div style="float:left;height: 50px;width: 21%;line-height:50px">生日</div> -->
<!-- 	<div class="text" style="width: 78%;float: right;"> -->

<!--        <input type="text" placeholder="请选择生日" class="input" id="SOLAR_BIRTHDAY" name="SOLAR_BIRTHDAY" readonly="readonly" onclick="showDate(this);"> -->
<!--     </div> -->
<!--  </div> -->

  <div style="height: 50px;width: 100%;text-align: center;">
	<div style="float:left;height: 50px;width: 21%;line-height:50px">手机号</div>
	<div class="text" style="width: 78%;float: right;">

       <input type="number" placeholder="请输入手机号" class="input" id="PHONE_NUMBER" name="PHONE_NUMBER">
    </div>
 </div>

  <div style="height: 50px;width: 100%;text-align: center;">
	<div style="float:left;height: 50px;width: 21%;line-height:50px">验证码</div>
	<div class="text" style="width: 78%;float: right;">
        <input type="text" placeholder="请输入验证码" class="input" style="width:55%" id="CODE" name="CODE">
      <span class="yzm" ><input type="button" id="second" value="获取验证码" style="float: right;width:75px; height: 42px;-webkit-appearance: none"></span>
    </div>
 </div>

    <div class="btndl"  onclick="save()"><input type="button" value="注 册" style="margin-bottom: 30px;-webkit-appearance: none"></div>
</div>
<input type="hidden" id="OPENID" name="OPENID" value="${pd.OPENID }"/>
				 <div class="z_mask">
			          <!--弹出框-->
			          <div class="z_alert">
			              <p ><img src="static/lshapp/images/jiazais.gif"/></p>	
			              <p style="color: white;padding-top: 5px;">正在注册</p>			  		          
			          </div>
			      </div>
</form>
<iframe id="myframe" src="<%=basePath%>lshapp/appLogin/dateSelector.do"></iframe>

<script type="text/javascript">
		var folg = true;
		$(function(){
			if(folg){
			    $("#second").click(function (){
			    	folg = false;
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
		        folg  = true;
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
		var status=0;
			//发送验证码
		function sendCode(obj){
	    var phonenum = $("#PHONE_NUMBER").val();
	    var result = isPhoneNum();
	    if(result){
	    	 $.ajax({
			        /* async : false,
			        cache : false, */
			        //cache: false,
			        type : 'POST',
			        url : "<%=basePath%>lshapp/appLogin/judgePhone.do",// 请求的action路径
			        data:{"PHONE_NUMBER":phonenum,"type":'save'},
			        success: function(data){// 请求失败处理函数
			        	if(data=="success"){
			        		doPostBack({"PHONE_NUMBER":phonenum},obj);
			        	}else if(data=="false"){
			        		d_messages("手机号已存在!");
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
		        		return false;
		        	}else if(data=="false1"){
		        		d_messages("手机号已存在！");
		        		return false;
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
		        status=1;
        		return false;
		    }else{
		        return true;
		    }
		}

		//提交保存
		function save(){ 
				var zhengze = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
			 	var NICK_NAME = $("#NICK_NAME").val();
			 	var PASSWORD = $("#PASSWORD").val();
			 	var confirm_PASSWORD = $("#confirm_PASSWORD").val();
				if(PASSWORD!=confirm_PASSWORD){
					d_messages("密码不相同，请确认!");
					return false;
				}
			 	
			 	
			 	
			 	if(NICK_NAME==""){
			 		d_messages("昵称不能为空!");
					return false;
				}else if(PASSWORD==""){
					d_messages("密码不能为空!");
					return false;
				}else if(!zhengze.test(PASSWORD)){
					d_messages("密码至少6-20位数字字母组合!");
					return false;
				}else if(confirm_PASSWORD==""){
					d_messages("确认密码不能为空!");
					return false;
				}
				var phone =document.getElementById("PHONE_NUMBER").value;
				var code =document.getElementById("CODE").value;
				if(phone==""){
					d_messages("手机号不能为空");
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
				}
				
				
				
				$.ajax({
			        type : 'POST',
			        url : "<%=basePath%>lshapp/appLogin/sendJudge.do",
			        data:{"PHONE_NUMBER":phone,"code":code},
			        success: function(data){// 请求失败处理函数
			        	if(data=="success"){		        		
			        		$("#Form").submit();
			        		//$(".z_mask").css("display","block") ;
			        		
			        	}else if(data=="false"){
			        		d_messages("验证码已过期!");
			        	}else if(data=="false1"){
			        		d_messages("验证码错误!");
			        	}
			        },
			    });
		}
		//验证推荐码
		function judgeInviteCode(){
			var INVITE_CODE = $("#INVITE_CODE").val();
			if(INVITE_CODE!=""){
				$.ajax({
					cache: false,
					type: "POST",
					url: '<%=basePath%>lshapp/appLogin/judgeInviteCode.do',
			    	data: {INVITE_CODE:INVITE_CODE},
				//	cache: false,
					success: function(data){
						if(data=="success"){
							document.getElementById("GGG").value="";
						}else{
							d_messages("推荐码不正确!");
							document.getElementById("GGG").value="CUOWU";
							return false;
						}
					}
				});
			}
		}
		//验证两次密码是否等值
		function judegPassWord(){
			var PASSWORD = $("#PASSWORD").val();
			var confirm_PASSWORD = $("#confirm_PASSWORD").val();
			if(PASSWORD==confirm_PASSWORD){

			}else{
				d_messages("密码不相同，请确认!");
				return false;
			}
		}

		function returns(){
			 window.history.go(-1);
		}
	</script>
	<script type="text/javascript">
		function clock()
		{var d=new Date();
			if(localStorage.time&&d.getTime()<localStorage.time&&localStorage.val){
				$("#SOLAR_BIRTHDAY").val(localStorage.val);
				localStorage.remove("val");
			}
		}
		var int1=self.setInterval("clock()",500);

		function showDate(obj){
			if($(obj).val()){
				window.location.href="<%=basePath%>lshapp/appLogin/dateSelector1.do?ymd="+$(obj).val();
			}else{
				window.location.href="<%=basePath%>lshapp/appLogin/dateSelector1.do";
			}

		}
	</script>
	
	<script type="text/javascript">
	$(function(){	
		var options = { 
			type: 'POST',
	        success:showResponse, 
			error : function(xhr, status, err) {			
				alert("操作失败");
			}
	    }; 
	    $("#Form").submit(function(){ 
	        $(this).ajaxSubmit(options); 
	        return false;   //防止表单自动提交
	    });
	});
    /**
     * 保存操作
     */
    function toSave(){ 
    	$("#Form").submit();
    }
     
    /**
     * 保存后，执行回调
     * @param responseText
     * @param statusText
     * @param xhr
     * @param $form
     */
    function showResponse(responseText, statusText, xhr, $form){ 	
    	if(responseText == 0){
    		d_messages("微信号已存在 ！");
    	} else {
    		d_messages("注册账号成功！");
			setTimeout(function(){
				openPage();
				//$(".z_mask").css("display","none") ;	
			},1000);
			
    		
    	}	
    	
    }
    function openPage() {
        var data='{"index":"5"}';
        window.WebViewJavascriptBridge.callHandler(
            'openPage'
            ,data
            , function(responseData) {
            }
        );
    }
	</script>
	
	
     <!-- <style type="text/css">
		.user_icon1{
			width: 1.0rem;
			height: 1.0rem;
			margin-bottom: .5rem;
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
		margin-left: 4%;
		margin-top: 30px;
		text-align: center;
		font-size: 20px;
		background-color:red;
		color: white;
		line-height:32px;
		}
		input[type="radio"] + label::before {
			content: "\a0"; /*不换行空格*/
			display: inline-block;
			vertical-align: middle;
			font-size: 16px;
			width: 1em;
			height: 1em;
			margin-right: .4em;
			border-radius: 50%;
			border: 1px solid #01cd78;
			text-indent: .15em;
			line-height: 1;
        }
		input[type="radio"]:checked + label::before {
			background-color: #01cd78;
			background-clip: content-box;
			padding: .27em;
		}
		input[type="radio"] {
			position: absolute;
			clip: rect(0, 0, 0, 0);
		}

		.btn_base{
            float: left;
            padding: 0.4em 3em;
           	margin-left:5%;
           	margin-top:20px;
            width: 90%;
            height:45px;
            border-radius: .5em;
            text-align: center;
        }
        .btn_color{
            background-color: #ec5151;
        }
        .btn_title{
            color:#FFFFFF;
            font-weight: bold;
            font-size: 0.9em;
        }
	</style>
</head>
<body style="background:#fff;">
<p style="text-align:right; display:none;"></p>


<div class="con mb-7">

	<div class="s-user-top" style="background:#fff;margin-bottom:0.8rem;">


	</div>
	<%-- <form action="<%=basePath=%>lshapp/appLogin/save.do" name="Form" id="Form" method="post"> --%>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">推荐码</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top">
				<input type="hidden" id="GGG" value=""/>
				<input type="text" id="INVITE_CODE" name="INVITE_CODE" placeholder="请输入推荐码" onblur="judgeInviteCode()" style="text-align:right;font-size: 1.4rem;"/>
			</div>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">昵称</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><input type="text" id="NICK_NAME" name="NICK_NAME"  placeholder="请输入昵称" style="text-align:right;font-size: 1.4rem;"/></div>
		</div>
	</div>

	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">密码</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><input type="password" id="PASSWORD" name="PASSWORD" placeholder="请输入密码" style="text-align:right;font-size: 1.4rem;"/></div>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">确认密码</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><input type="password" id="confirm_PASSWORD" name="confirm_PASSWORD" onblur="judegPassWord()" placeholder="确认密码" style="text-align:right;font-size: 1.4rem;"/></div>
		</div>
	</div>

	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">性别</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><input type="radio" name="SEX" id="female" value="1" checked="checked" /> <label for="female">男</label>
			&nbsp; &nbsp;&nbsp; <input type="radio" id="male" name="SEX" value="2" /> <label for="male">女</label> </div>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name birthday" style="background:#fff;">
		 <div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">生日</h3>
			<input type="hidden" id="BIRTHDAY" name="BIRTHDAY">
			<font></font><!--
			<input class="birthday" type="text" readonly="readonly">
		</div>

	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1" style="width:100%">
			<h3 style="font-size:0.8em;margin-top:9px;">手机</h3>
			<input type="number" id="PHONE_NUMBER" name="PHONE_NUMBER" placeholder="请输入手机号" style="text-align:right;font-size: 1.4rem;"/>
			<div style="width:60%">
				<!-- <button id="second" style="width:80px;height:30px;float:right;font-size:1px" onclick="sendSms()" type="button" >获取验证码</button>
				<input value="获取验证码" id="second" type="button" style="	font-size:15px;height: 31px;margin-left: 55%;margin-top: -1px;	border: none;"/>
			</div>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">验证码</h3>
			<div  class="box-flex t-goods1 text-right onelist-hidden jian-top"><input type="number" id="CODE" name="CODE" placeholder="请输入验证码" style="text-align:right;font-size: 1.4rem;"/></div>
		</div>
	</div>
	 <div class="btn_base btn_color" onclick="save()">
        <a class="btn_title">保存</a>
    </div>

	</form>
</div>



<div id="content" style="display: none;">
<!-- 显示日期详情
  <div id="detail">
       <div id="date_content"></div>

       <div id="animal_year"></div>
        <!-- 显示时钟
        <p id="clock"></p>
  </div>
  <form name="calender_content" style="margin-top: -15px;background-color: white;">
                  <table class="week">
                    <tbody>
                       <tr>
                          <td class="ch">
                                  <!-- 日历头部
                                 <table>
                                     <tbody>
                                           <tr class="day">
                                                  <td>日</td>
                                                  <td>一</td>
                                                  <td>二</td>
                                                  <td>三</td>
                                                  <td>四</td>
                                                  <td>五</td>
                                                  <td>六</td>
                                              </tr>
                                         </tbody>
                                  </table>
                                  </tr>
                                  </td>
                                    <!-- 头部END -->

                 <!-- js动态的向表格写入日期
                            <script>
                            var Num; //Num计算出日期位置
                            for(i=0;i<6;i++) {

                                    document.write('<table id="cal-content"><tr>');

                             for(j=0;j<7;j++) {
                                Num = i*7+j;
                                document.write('<td id="SD' + Num +'" onclick="addDay(' + Num +')" ');
                        //周六 周日 假期样式设定
                              if(j == 0|| j == 6)
                              {
                                    document.write(' class="aorange"');
                               }else{
                                    document.write(' class="one"');
                              }
                                    document.write('title=""> </td>')
                             }

                                document.write('</tr></table></td></tr><tr><td><table style="width:399;"><tr style="text-align:center"> ');
                           //农历
                           for(j=0;j<7;j++) {
                              Num = i*7+j;
                              document.write('<td id="LD' + Num +'" onclick="addDay(' + Num +')" class="bs" title=""> </td>')

                           }
                              document.write('</tr></table></td></tr>');

                         }
                         </script>
             <!-- 生成日期 END
                        </tr>
                     </table>
                   </td>
                </tr>
              </tbody>
            </table>
             <table>
               <tbody>
                <tr>
                  <td class="sm">
                    <table class="table_head">
                      <tbody>
                      <tr>
                        <td>
                        <!-- 选择年份菜单
                          <div class="year_select">
                              <span onClick="BtN('year_d')"><img src="static/lshapp/images/left.png"></span>
                                <select onChange="chaCld()" name="SY">
                                  <script>
                                     for(i=1900;i<2050;i++)
                                    document.write('<option>'+i+"年")
                                  </script>
                                </select>
                              <span onClick="BtN('year_a')"><img src="static/lshapp/images/right.png"></span>
                          </div>
                          <!-- 回到当天菜单
                          <div  class="home_select">
                               <span onClick="BtN('')"><img src="static/lshapp/images/2.png" style="width:26px;height:26px"></span>
                          </div>

                          <!-- 选择月份菜单 -->
                              <!-- <div style="display:inline-block;">
                                  <span onClick="BtN('month_d')"><img src="static/lshapp/images/left.png"></span>
                                   <select onChange="chaCld()" name="SM">
                                    <script>
                                    for(i=1;i<13;i++) document.write('<option>'+i+"月")
                                    </script>
                                    </select>
                                  <span onClick="BtN('month_a')"><img src="static/lshapp/images/right.png"></span>
                              </div>
                           </td>
                       </tr>
                     </tbody>
                    </table>
                  </td>
                </tr>
             </tbody>
           </table>
      </form>
   </div>




	<script type="text/javascript" class="picker js_show">
	 $('#showDatePicker').on('click', function () {
	    	//var birthday=document.getElementById("birthday").value;
	    	//var BB=birthday.toString().replace(",","-").replace(",","-");
	        weui.datePicker({
	            start: 1970,
	            end: new Date().getFullYear(),
	           // defaultValue: [BB],
	            onChange: function (result) {
	            },
	            onConfirm: function (result) {
	            	  var re=result.toString().replace(",","-").replace(",","-");
	            	  document.getElementById("showDatePicker").innerHTML = re;
	            	  document.getElementById("BIRTHDAY").value = re;
	            }
	        });
	    });
	</script>
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>
	<script type="text/javascript" src="static/lshapp/js/main.js"></script>  --%> -->
</body></html>