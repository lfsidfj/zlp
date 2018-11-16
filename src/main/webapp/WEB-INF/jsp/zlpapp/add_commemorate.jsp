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
    <title>添加纪念日</title>
  	<link href="static/lshapp/css/users.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/weui.css" />
	<link href="static/lshapp/css/goods_type.css" rel="stylesheet"type="text/css">
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/global.css"/>
	<script src="static/lshapp/js/goods_type.js"></script>
	<script src="static/lshapp/js/zepto.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script src="static/lshapp/js/jquery.form.js"></script>
	
	<style type="text/css">
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

<form action="<%=basePath%>lshapp/memorialday/${msg}.do" name="Form" id="Form" method="post">
	<input type="hidden" id="MEMORIALDAY_ID" name="MEMORIALDAY_ID" value="${pd.MEMORIALDAY_ID }">
	<div class="con mb-7">
	<c:if test="${pd.NAME ==null }">
		<jsp:include page="head_title.jsp">
		<jsp:param value="添加纪念日" name="pageTitle"/>
		</jsp:include>
	</c:if>
	<c:if test="${pd.NAME !=null }">
		<jsp:include page="head_title.jsp">
		<jsp:param value="编辑纪念日" name="pageTitle"/>
		</jsp:include>
	</c:if>
			<div  style="width:100%;height:140px;">
				<img id="imgId" src="static/lshapp/images/banner-hdpi.jpg" style="height:140px;width:100%">	
			</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 80px;font-size: 16px;margin-top: 3px;">纪念名称</h3>
			<input type="text" id="NAME" name="NAME" value="${pd.NAME }"  placeholder="请输入纪念名称" style="font-size: 1.4rem;"/>
		</div>
	</div>
	
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 80px;font-size: 16px;margin-top: 3px;">日期</h3>
			
			<input style="border: 0;font-size:1.4rem;" type="text" value="${pd.COMMEMORATE_DATE }" placeholder="请选择日期" class="input" id="COMMEMORATE_DATE" name="COMMEMORATE_DATE" readonly="readonly" onclick="showDate(this);">
		</div>
	</div>
	<div class="z_mask">
			          <!--弹出框-->
			          <div class="z_alert">
			              <p ><img src="static/lshapp/images/jiazais.gif"/></p>	
			              <p style="color: white;padding-top: 5px;" id="xinxi">图片加载中</p>			  		          
			          </div>
			      </div>
	
	<c:if test="${pd != null }">
		<div class="btn_base btn_color"  id="del">
	        	删除
	    </div>
    </c:if>
	<div class="btn_base bc_color" onclick="add_commemorate()" <c:if test="${pd == null }">style="margin-left:32%;"</c:if>>
        	 保存
    </div>
	
</div>
</form>
	<script type="text/javascript" src="static/lshapp/js/windowOpen.js" ></script>
	<script type="text/javascript">
	function add_commemorate(){
		if($("#NAME").val()==""){
      	  	d_messages("纪念名称不能为空");
			return false;
		}
		if($("#COMMEMORATE_DATE").val()==""){
      	  	d_messages("纪念日期不能为空");
			return false;
		}
		$("#Form").submit();
		$("#xinxi").html("保存中...");
		$(".z_mask").css("display","block") ;
	}
	
	//删除用户
	var setTitle = '';
	var setContents = '';
	var setButton = '';
	$('#del').on('click',function(){			
		setTitle = '提示';
		setContents = '确定要删除该纪念日吗？';
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
			
				var Id=$("#MEMORIALDAY_ID").val();
				$.ajax({
					type: "POST",
					url: '<%=basePath%>lshapp/memorialday/deleteMemorialday.do',
			    	data: {MEMORIALDAY_ID:Id},
					dataType:'json',
					cache: false,
					success: function(data){
<%-- 						window.location.replace("<%=basePath%>lshapp/userbrithday/list.do"); --%>
							openPage();
							$(".z_mask").css("display","none") ;
					}
				});
			
			
		});
	});
	
	
	</script>
	<script type="text/javascript">
	   function clock(){		   
		   var d=new Date();
		   if(localStorage.time&&d.getTime()<localStorage.time&&localStorage.val){
				$("#COMMEMORATE_DATE").val(localStorage.val);
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