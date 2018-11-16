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
    <title>修改生日</title>
    <link href="static/lshapp/css/users.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/weui.css" />
	<!-- <link rel="stylesheet" type="text/css" href="static/lshapp/css/commons.css" /> -->
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/global.css"/>

	<script src="static/lshapp/js/goods_type.js"></script>
	<script src="static/lshapp/js/zepto.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script src="static/lshapp/js/jquery.form.js"></script>
    <style type="text/css">
    	.layermbox{position:absolute;left:0;top:0;width:100%;z-index:19891014}
    	.layermmain,.laymshade{position:fixed;left:0;top:0;width:100%;height:100%}
    	.layermbtn span,.layermchild{display:inline-block;position:relative}
    	.laymshade{background-color:rgba(0,0,0,.5);pointer-events:auto}
    	.layermmain{display:table;font-family:Helvetica,arial,sans-serif;pointer-events:none}
    	.layermmain .section{display:table-cell;vertical-align:middle;text-align:center}
    	.layermcont{padding:20px 15px;line-height:22px;border-radius:5px}
    
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
            font-size: 17px;
            float: left;
            padding: 0.75em;
           	margin-left:10%;
           	margin-top:20px;
            width: 35%;
            height:45px;
            border-radius: .5em;
            text-align: center;
        }
        .btn_color{
            background: #ec5151;
        }
        .bc_color{
        	background: #2aa146;
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
	<jsp:param value="编辑生日" name="pageTitle"/>
</jsp:include>
<div class="con mb-7">
<form action="<%=basePath%>lshapp/userbrithday/editUserBirthday.do" name="Form" id="Form" method="post">
	<input type="hidden" id="BIRTHDAY_ID" name="BIRTHDAY_ID" value="${pd.BIRTHDAY_ID }">
	<div class="s-user-top" style="background:#fff;margin-bottom:0.8rem;">
		<div class="user_profile_box p-r">
			<div class="dis-box t-goods1 onelist-hidden jian-top"  style="padding-top:2.5rem;padding-bottom:2.0rem;padding-left:37%;">
				<div class="user-img " style="width: 7.5rem;height: 7.5rem;">
					<input id="file" name="file" class="user-profile-img" style="opacity: 0" type="file">
					<input id="PICTURE_ID" name="PICTURE_ID" type="hidden"/>
					<div class="user-head-img-box-1" style="width: 7.5rem;height: 7.5rem;border-radius: 4.5rem;">
					
					<c:if test="${pd.PATH != null}"><img id="imgId" src="<%=basePath%>uploadFiles/uploadImgs/${pd.PATH}" style="width: 7.5rem;height: 7.5rem;"></img></c:if>
					<c:if test="${pd.PATH == null}"><img id="imgId"src="static/lshapp/images/default_head.png"></img></c:if>

					</div>
				</div>
			</div>
			<div style="font-size: 1.7rem;color:#ABABAB;text-align:center;padding-top:0.1rem;" >点击更换头像</div>
		</div>
	</div>


	

	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px; margin-top: 3px;">姓名</h3>
			<input type="text" id="NAME" name="NAME" value="${pd.NAME }"  placeholder="请输入姓名" style="font-size: 16px"/>
		</div>
	</div>

	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;">性别</h3>

			<input type="radio" name="SEX" id="SEX" value="1" <c:if test="${pd.SEX == 1 }">checked="checked"</c:if> /> <label for="sex" style="font-size: 16px">男</label>
			&nbsp; &nbsp;&nbsp;
			<input type="radio" id="sexs" name="SEX" value="2" <c:if test="${pd.SEX == 2 }">checked="checked"</c:if>/> <label for="sexs"style="font-size: 16px">女</label>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;margin-top: 1px;" >生日</h3>
			<input style="border: 0;font-size:1.4rem;" type="text" placeholder="请选择生日" value="${pd.SOLAR_BIRTHDAY }" class="input" id="SOLAR_BIRTHDAY" name="SOLAR_BIRTHDAY" readonly="readonly" onclick="showDate(this);">
		</div>


	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;">手机</h3>
			<input id="PHONE_NUMBER" name="PHONE_NUMBER" type="number" value="${pd.PHONE_NUMBER }"  placeholder="请输入手机号" style="font-size: 1.4rem;"/>
		</div>
	</div>


	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 60px;font-size: 16px;">关系</h3>
			<div style="width: 85%">
			<input type="radio" name="RELATIONSHIP" id="jiaren" value="家人" <c:if test="${pd.RELATIONSHIP == '家人' }">checked="checked"</c:if> /> <label for="jiaren" style="font-size: 16px">家人</label>
			&nbsp; <input type="radio" id="pengyou" name="RELATIONSHIP" value="朋友" <c:if test="${pd.RELATIONSHIP == '朋友' }">checked="checked"</c:if> /> <label for="pengyou" style="font-size: 16px">朋友</label> 
 			&nbsp; <input type="radio" id="tongshi" name="RELATIONSHIP" value="同事"<c:if test="${pd.RELATIONSHIP == '同事' }">checked="checked"</c:if> /> <label for="tongshi"style="font-size: 16px">同事</label>
			&nbsp; <input type="radio" id="tongxue" name="RELATIONSHIP" value="同学" <c:if test="${pd.RELATIONSHIP == '同学' }">checked="checked"</c:if>/> <label for="tongxue"style="font-size: 16px">同学</label>
 			&nbsp; <input type="radio" id="kehu" name="RELATIONSHIP" value="客户" <c:if test="${pd.RELATIONSHIP == '客户' }">checked="checked"</c:if>/> <label for="kehu"style="font-size: 16px">客户</label>
 			&nbsp; <input type="radio" id="qita" name="RELATIONSHIP" value="1"<c:if test="${pd.RELATIONSHIP != '朋友' && pd.RELATIONSHIP != '家人' && pd.RELATIONSHIP != '同事' && pd.RELATIONSHIP != '同学' && pd.RELATIONSHIP != '客户'}">checked="checked"</c:if>/> <label  for="qita"style="font-size: 16px">其他</label> 
			</div>
			</div>
	</div>
	
	<div class="s-user-top onclik-nick_name" style="background:#fff;display: none" id="zidingyi">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 80px;font-size: 16px;margin-top: 3px;">关系名称</h3>
			<input type="text"  id="qitas" placeholder="请输入关系" style="font-size: 1.4rem;" value="${pd.RELATIONSHIP }" />
			
		</div>
	</div>
	
	
	

	<div class="s-user-top onclik-nick_name" style="background:#fff;" onclick="goBirthdayRemind('${pd.BIRTHDAY_ID}')">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">设置生日提醒</h3>
			<div  class="box-flex t-goods1 text-right onelist-hidden jian-top">
				<img src="static/lshapp/images/right arrow1-hdpi.png">
			</div>
		</div>
	</div>

	<div class="btn_base btn_color"  id="del">
        	删除
    	</div>
	<div class="btn_base bc_color" onclick="addUser()">
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
</div><!--
		<div id="dialogBg"></div>
		<div id="dialog" class="animated">
			<div class="dialogTop">
				<a href="javascript:;" class="claseDialogBtn">
				<img src="Close-hdpi.png" style="height:25px;width:25px"></img>
				</a>
			</div>

			<ul class="editInfos">
				<li>
					<img src="Cake-hdpi.png" style="width:60px;height:60px;"></img>
				</li>
				<li>罗亚明</li>
				<li>1992-02-03</li>
				<li style="color:#f3d040;font-size:18px"><img src="Music-hdpi.png" style="width:20px;height:20px;"> 祝您生日快乐</img></li>
			</ul>

		</div> -->
<!--悬浮菜单e-->
	<!--图片上传-->
		<script type="text/javascript" src="static/lshapp/js/windowOpen.js" ></script>
		<script src="static/lshapp/js/center/ajaxfileupload.js"></script>
		<script type="text/javascript">
		$("#qita").click(function(){
			$("#zidingyi").css("display","block");
			$("#qitas").val("");
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
		
		$(function(){
			var s = '${pd.RELATIONSHIP }';
			if(s != "朋友" && s != "家人" && s != "同学" && s != "同事" && s != "客户"){
				$("#zidingyi").css("display","block");
			}
		})
		
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
    	            	$("#imgId").attr('src',path);
    	                //alert("上传成功"+json.PICTURES_ID);
    	                //修改用户图片编号
    	                 $("#file").val("");
    	                var PICTURE_ID = $("#PICTURE_ID").val();
    	            	 $.ajax({
    	            		 	async : false,
    	    			        /* async : false,
    	    			        cache : false, */
    	    			        //cache: false,
    	    			        type : 'POST',
    	    			        url : "<%=basePath%>/lshapp/userbrithday/editUserImg.do",// 请求的action路径
    	    			        data:{"PICTURE_ID":PICTURE_ID},
    	    			        success: function(data){// 请求失败处理函数
    	    			        	if(data=="success"){
    	    			        		$(".z_mask").css("display","none") ;
    	    			        	}else{
    	    			        		alert("保存失败！");
    	    			        		return false;
    	    			        	}
    	    			        },
    	    			    });
    	            }
    	            else{
    	                alert("上传失败");
    	            }
    	        },
    	        
    	    })
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
		//删除用户
		var setTitle = '';
		var setContents = '';
		var setButton = '';
		$('#del').on('click',function(){
			setTitle = '提示';
			setContents = '确定要删除该用户吗？';
			setButton = '["取消","确定"]';
			$(this).openWindow(setTitle,setContents,setButton);
			$('.confirm-button').on('click',function(){
				$("#xinxi").html("正在删除...");
				$(".z_mask").css("display","block") ;
				$oMasking = $('.window-masking');
				$oWindowContainer = $('.window-container');
				//关闭弹窗的时候将蒙版和html从页面中移除掉
				$oMasking.remove();
				$oWindowContainer.remove();

					var Id=$("#BIRTHDAY_ID").val();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>lshapp/userbrithday/deleteUser.do',
				    	data: {BIRTHDAY_ID:Id},
						dataType:'json',
						cache: false,
						success: function(data){
<%-- 							window.location.replace("<%=basePath%>lshapp/userbrithday/list.do"); --%>
							openPage();
					    	$(".z_mask").css("display","none") ;
						}
					});


			});
		});









	   function goBirthdayRemind(Id){
			window.location.href='<%=basePath%>lshapp/userbrithday/goBirthdayRemind.do?BIRTHDAY_ID='+Id;
			//window.event.returnValue=false;
		}

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
			var phonenum = $("#PHONE_NUMBER").val();
			var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
			if($("#PHONE_NUMBER").val()=="" || !myreg.test(phonenum)){
				d_messages("请输入正确的手机号码！");
				return false;
			}
			$("#xinxi").html("保存中...");
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