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
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>添加生日</title>
    <link href="static/lshapp/css/users.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/weui.css" />
	<link href="static/lshapp/css/goods_type.css" rel="stylesheet"type="text/css">
	<script src="static/lshapp/js/zepto.min.js"></script>
	<script src="static/lshapp/js/goods_type.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script src="static/lshapp/js/jquery.form.js"></script>
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
			width: 1.0rem;
			height: 1.0rem;
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
			color:#FFFFFF;
            font-weight: bold;
            font-size: 1.1em;
           	margin-left:5%;
           	margin-top:20px;
            width: 90%;
            height:45px;
            border-radius: .5em;
            text-align:center;
          	line-height: 45px;
        }
        .btn_color{
            background: #ec5151;
        }
        .btn_title{

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
</head>
<body style="background:#fff;">
<jsp:include page="head_title.jsp">
	<jsp:param value="添加生日" name="pageTitle"/>
</jsp:include>

<div class="con mb-7">
<form action="<%=basePath%>lshapp/userbrithday/addUserBirthday.do" name="Form" id="Form" method="post">
	<div class="s-user-top" style="background:#fff;margin-bottom:0.8rem;">
		<div class="user_profile_box p-r">
			<div class="dis-box t-goods1 onelist-hidden jian-top" for="logo" style="padding-top:2.5rem;padding-bottom:2.0rem;padding-left:37%;">
				<div class="user-img " style="width: 7.5rem;height: 7.5rem;">
					<input type="file" id="file" name="file" class="user-profile-img" style="opacity: 0" >
					<input id="PICTURE_ID" name="PICTURE_ID" type="hidden"/>
					<div class="user-head-img-box-1" style="width: 7.5rem;height: 7.5rem;border-radius: 4.5rem;">
						<img id="imgId" src="static/lshapp/images/default_head.png" style="width: 7.5rem;height: 7.5rem;">
					</div>
				</div>
			</div>
			<div style="font-size: 1.7rem;color:#ABABAB;text-align:center;padding-top:0.1rem;">点击更换头像</div>
		</div>

	</div>




	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;margin-top: 7px;">姓名</h3>
			<input type="text" id="NAME" name="NAME"  placeholder="请输入姓名" style="font-size: 1.4rem;"/>
		</div>
	</div>

	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;margin-top: 7px;">性别</h3>
			<input type="radio" name="SEX" id="sex" value="1" checked="checked" /> <label for="sex" style="font-size: 16px">男</label>
			&nbsp; &nbsp;&nbsp; <input type="radio" id="sexs" name="SEX" value="2" /> <label for="sexs" style="font-size: 16px">女</label>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;margin-top: 7px;">生日</h3>

			 <input style="border: 0;font-size:1.4rem;" type="text" placeholder="请选择生日" class="input" id="SOLAR_BIRTHDAY" name="SOLAR_BIRTHDAY" readonly="readonly" onclick="showDate(this);">


		</div>
		<input type="hidden" id="BIRTHDAY" name="BIRTHDAY" value="1992-1-1">
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;margin-top: 7px;">手机</h3>
			<input id="PHONE_NUMBER" name="PHONE_NUMBER" type="number"  placeholder="请输入手机号" style="font-size: 1.4rem;"/>
		</div>
	</div>


	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;margin-top: 13px;">关系</h3>
			<div style="width: 85%">
			<input type="radio" name="RELATIONSHIP" id="jiaren" value="家人" checked="checked" /> <label for="jiaren"style="font-size: 16px">家人</label>
			&nbsp; <input type="radio" id="pengyou" name="RELATIONSHIP" value="朋友" /> <label for="pengyou"style="font-size: 16px">朋友</label>
			&nbsp; <input type="radio" id="tongshi" name="RELATIONSHIP" value="同事" /> <label for="tongshi"style="font-size: 16px">同事</label>
			&nbsp; <input type="radio" id="tongxue" name="RELATIONSHIP" value="同学" /> <label for="tongxue"style="font-size: 16px">同学</label>
 			&nbsp; <input type="radio" id="kehu" name="RELATIONSHIP" value="客户" /> <label for="kehu"style="font-size: 16px">客户</label>
			&nbsp; <input type="radio" id="qita" name="RELATIONSHIP" value="1" /> <label  for="qita"style="font-size: 16px">其他</label>
			</div>
		</div>
	</div>
	
	<div class="s-user-top onclik-nick_name" style="background:#fff;display: none" id="zidingyi">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 80px;font-size: 16px;margin-top: 7px;">关系名称</h3>
			<input type="text"  id="qitas" placeholder="请输入关系" style="font-size: 1.4rem;" />
			
		</div>
	</div>

	<div class="btn_base btn_color" onclick="addUser()">
		<!-- <div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">设置生日提醒</h3>
			<div  class="box-flex t-goods1 text-right onelist-hidden jian-top">
				<img src="static/images/right arrow1-hdpi.png">
			</div>
		</div> -->
	
       				 保存
    

	</div>
	<!-- 遮罩层 -->
    	<div class="z_mask">
			          <!--弹出框-->
			          <div class="z_alert">
			              <p ><img src="static/lshapp/images/jiazais.gif"/></p>	
			              <p style="color: white;padding-top: 5px;" id="xinxi">图片加载中</p>			  		          
			          </div>
			      </div>
	
	</form>
</div>
<!--悬浮菜单e-->
	<!--图片上传-->
		<script src="static/lshapp/js/center/ajaxfileupload.js"></script>
		<script type="text/javascript">
		$("#qita").click(function(){
			$("#zidingyi").css("display","block");
		});
		$("#jiaren").click(function(){
			$("#zidingyi").css("display","none");
		});
		$("#pengyou").click(function(){
			$("#zidingyi").css("display","none");
		});
		$("#tongshi").click(function(){
			$("#zidingyi").css("display","none");
		});
		$("#tongxue").click(function(){
			$("#zidingyi").css("display","none");
		});
		$("#kehu").click(function(){
			$("#zidingyi").css("display","none");
		});
		</script>

		<script type="text/javascript">
		 $("#file").change(function(){
	    	upPhoto();
	     });
    	function upPhoto(){
    		$(".z_mask").css("display","block") ;
    	    var url = "<%=basePath%>lshapp/uploading/pictures/saveForUrl.do";
    	    $.ajaxFileUpload({
    	        url : url,
    	        type : 'POST',
    	        fileElementId : 'file',  //这里对应html中上传file的id
    	        contentType:"application/json;charset=UTF-8",
    	        success: function(data){
    	            var str = $(data).find("body").text();//获取返回的字符串
    	            var json = $.parseJSON(str);//把字符串转化为json对象
    	            if(json.result=='ok'){
    	            	$("#PICTURE_ID").val(json.PICTURES_ID);
    	            	var p=json.PATH;
    	            	var path="<%=basePath%>"+"uploadFiles/uploadImgs/"+p;
    	            	localStorage.tempimg=path;
    	            	$("#imgId").attr('src',path);
    	            	$("#file").val("");
    	            	$(".z_mask").css("display","none") ;
    	                //alert("上传成功"+json.PICTURES_ID);
    	                //修改用户图片编号
//     	                var PICTURE_ID = $("#PICTURE_ID").val();
//     	            	 $.ajax({
//     	            		 	async : false,
//     	    			        /* async : false,
//     	    			        cache : false, */
//     	    			        //cache: false,
//     	    			        type : 'POST',
<%--    	    			        url : "<%=basePath%>lshapp/userCenter/update_picture.do", --%>
//     	    			        data:{"PICTURE_ID":PICTURE_ID},
//     	    			        success: function(data){// 请求失败处理函数
//     	    			        	if(data=="success"){

//     	    			        	}else{
//     	    			        		alert("保存失败！");
//     	    			        		return false;
//     	    			        	}
//     	    			        },
//     	    			    });
    	            }
    	            else{
    	                alert("上传失败");
    	            }
    	        },
    	        error: function(){
    	            alert("请链接网络");
    	        }
    	    })
    	}
	   </script>
	   <script type="text/javascript">
		function clock()
		{var d=new Date();
			if(localStorage.time&&d.getTime()<localStorage.time&&localStorage.val){
				$("#SOLAR_BIRTHDAY").val(localStorage.val);
				localStorage.removeItem("val");
			}
			localStorage.removeItem("tempimg");
			if(localStorage.tempimg){
				$("#imgId").attr("src",localStorage.tempimg);
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
	   

	 //保存
		function addUser(){
			 var inpval = $("#qitas").val();
			 if($('input[name="RELATIONSHIP"]:checked').val() == 1){
				 if(inpval==""){
						d_messages("请输入关系名称！");
						return false;
					}else{
						$("#qita").val(inpval);
					}				 
			 }
			if($("#NAME").val()==""){
				d_messages("姓名不能为空！");
				return false;
			}
			if($("#SOLAR_BIRTHDAY").val()==""){
				d_messages("生日不能为空！");
				return false;
			}
			var phonenum = $("#PHONE_NUMBER").val();
			var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
			if($("#PHONE_NUMBER").val()=="" || !myreg.test(phonenum)){
				d_messages("请输入正确的手机号码！");
				return false;
			}
			$("#xinxi").html("添加中...");
			$(".z_mask").css("display","block") ;
			$("#Form").submit();
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
    	/* if(responseText.status == "0"){
    	} else {
    	}	 */
    	openPage();
    	$(".z_mask").css("display","none") ;
    }
    function openPage() {
        var data='{"index":"0","refresh":"1"}';
        window.WebViewJavascriptBridge.callHandler(
            'openPage'
            ,data
            , function(responseData) {
            }
        );
    }
	 
	</script>
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>
</body></html>