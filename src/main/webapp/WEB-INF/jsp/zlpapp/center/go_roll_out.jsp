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
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>转出</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/lshapp/css/center/common.css"/>
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/center/sytle.css">
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/center/stylezhifu.css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
    <script src="static/lshapp/js/goods_type.js"></script>
    <script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
    <style type="text/css">
		.return_image{
			width:1.2rem;
			height:1.8rem;
		}
		.submint {
		height: 4.5rem;
		width: 60%;
		/* border: 1.3px solid #00AEED; */
		border-radius: 20px;
		margin-left: 20%;
		margin-top: 44px;
		text-align: center;
		font-size: 1.7rem;
		background-color:#ED4C44;
		color: white;
		line-height:4.5rem;
		}
		.quee {
		height: 3.0rem;
		width: 50%;
		/* border: 1.3px solid #00AEED; */
		border-radius: 15px;
		margin-left: 23%;
		margin-top: 2.0rem;
		text-align: center;
		font-size: 1.6rem;
		background-color:#ED4C44;
		color: white;
		line-height:3.0rem;
		}
		.showList input[type="radio"]:checked + span{border:1px solid #66c068;border-radius:20px;background:url(static/lshapp/images/center/checkbox-on.png) no-repeat;background-size: 20px 20px;}
		.show input[type="radio"]:checked + span{border:1px solid #66c068;border-radius:20px;background:url(static/lshapp/images/center/checkbox-on.png) no-repeat;background-size: 20px 20px;}
		
    </style>
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

			$(function(){
				getSrceenWH();

				//显示弹框
				$('.adduser').click(function(){
					className = $(this).attr('class');
					$('#dialogBg').fadeIn(300);
					$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
				});

				//关闭弹窗
				$('.claseDialogBtn').click(function(){
					$('#dialogBg').fadeOut(300,function(){
						$('#dialog').addClass('bounceOutUp').fadeOut();
					});
				});
			});
		</script>
    <script type="text/javascript">
    	function queren(){
    		var way = $('input[name="Fruit"]:checked').val();
    		if($("#ALIPAY").val()==""&& way == 'alipay'){   			  			
   				className = $(this).attr('class');
       			$('#dialogBg').fadeIn(300);
       			$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
       			return;		
    		}else if($("#OPENID").val()=="" && way == 'wx'){
    			d_messages("请点击微信绑定微信账号 ！");
    			return ;
    		}else{
    			var way = $('input[name="Fruit"]:checked').val();
    			var AMOUNT = $('#AMOUNT').val();//转出金额
    			var ALIPAY = $('#ALIPAY').val();//支付宝账号
    			var openid = $('#OPENID').val()//微信oppenid
    			var MONEY = $('#MONEY').val();//用户总金额  	
    			if(parseInt(AMOUNT) > parseInt(MONEY)|| AMOUNT == '' || AMOUNT <= 0){
    				d_messages("请输入正确的转出金额");
    				return;
    			}
    			if(way == 'alipay'){//支付宝
    				$.ajax({
      					type: "POST",
      					url: '<%=basePath%>lshapp/userCenter/saveWithdraw.do',
      			    	data: {AMOUNT:AMOUNT,ACCOUNT:ALIPAY,ACCOUNT_TYPE:way},
      					//dataType:'json',
      					cache: false,					      				 
      					success: function(data){
      						d_messages("申请提现成功！");
      						setTimeout(function(){
      							window.history.go(-1);
      						},1000);
      					}
      				});
    			}else{
    				$.ajax({
      					type: "POST",
      					url: '<%=basePath%>lshapp/userCenter/saveWithdraw.do',
      			    	data: {AMOUNT:AMOUNT,ACCOUNT:openid,ACCOUNT_TYPE:way},
      					//dataType:'json',
      					cache: false,					      				 
      					success: function(data){
      						d_messages("申请提现成功！");
      						setTimeout(function(){
      							window.history.go(-1);
      						},1000);
      					}
      				});
    			}
    		}

    	}
    	function go_binding(){
    		window.location.href="<%=basePath%>lshapp/userCenter/go_binding.do";
    	}
    	
    	function bindwx() {
            var data='';
            window.WebViewJavascriptBridge.callHandler(
                'wxlogin'
                ,data
                , function(responseData) {
                }
            );
        }
    	
    	
    	
    </script>
</head>
<body style="background-color: #F2F2F2">
<!-- 	<p style="text-align:right; display:none;"></p> -->
<!-- 	<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div> -->
<!-- 	<section class="search category-search common-search" style="background-color: white;"> -->
<!-- 	       <div class="text-all dis-box j-text-all text-all-back"> -->
<!-- 						<a class="a-icon-back j-close-search" href="javascript:history.go(-1);"> -->
<!-- 	                        	<img class="return_image" src="static/lshapp/images/return.png"> -->
<!-- 	                   </a> -->
<!-- 					  <div style="text-align: center;width: 85%;" > -->
<!-- 	                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">转出</span> -->
<!-- 					  </div> -->
<!-- 			</div> -->
<!-- 	  </section> -->
	 <a href="<%=basePath%>lshapp/userCenter/go_binding.do">
	 		<div style="width: 120px;height: 15px;margin-top: 5px;margin-left: 10px;">转入账户</div>
		 <div class="s-user-top onclik-nick_name" style="background:#fff;margin-top:.8rem;">
			<div class="dis-box s-xian-box s-user-top-1">
				<h3 class="box-flex text-all-span my-u-title-size" style="font-size: 1.7rem;">
				<img src="static/lshapp/images/center/Alipay2-hdpi.png" style="width: 3.7rem;height: 3.7rem;"/>&nbsp;&nbsp;支付宝</h3>
				<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top" style="color:#F9D936;">&nbsp;&nbsp;&nbsp; <img style="margin-top: 9px;" class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
			</div>
		</div>
		
	</a>
	
	<div class="s-user-top onclik-nick_name" style="background:#fff;margin-top:.8rem;" onclick="bindwx()">
			<div class="dis-box s-xian-box s-user-top-1" >
				<h3 class="box-flex text-all-span my-u-title-size" style="font-size: 1.7rem;"><img src="static/lshapp/images/center/weixin.png" style="width: 3.7rem;height: 3.7rem;"/>&nbsp;&nbsp;微信</h3>
				<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top" style="color:#F9D936;">&nbsp;&nbsp;&nbsp; <img style="margin-top: 9px;" src="static/lshapp/images/right_arrow.png"></div>
			</div>
		</div>
	<!--支付 star-->
	<div class="pay">
		<div class="show">
		 <ul>
		 	<div style="width: 120px;height: 25px;margin-top: 5px;margin-left: 10px;">转出方式</div>
			<li><label><img src="static/lshapp/images/center/Alipay2-hdpi.png" >转入宝支付<input name="Fruit" type="radio" value="alipay" checked/><span style="width: 21px;height: 21px;"></span></label> </li>
    		<li><label><img src="static/lshapp/images/center/weixin.png" >转入微信<input name="Fruit" type="radio" value="wx" /><span style="width: 21px;height: 21px;"></span></label> </li>
    		
		 </ul>
		</div>
		
	</div> 
	
	
	<div  style="background:#fff;padding: 0 1.5rem;">
		<div style="padding: 1.1rem 0">
			<h3 class="box-flex text-all-span my-u-title-size" style="font-size: 1.7rem;">转出金额（元）</h3>
			<input  type="hidden" value="${pd.ALIPAY}" id="ALIPAY" name="ALIPAY"/>
			<input  type="hidden" value="${pd.OPENID}" id="OPENID" name="OPENID"/>
			余额：<input  type="text" value="${pd.MONEY}" id="MONEY" name="MONEY" readonly="readonly"/>
		</div>
		<div style="padding: 1.1rem 0;margin-top: -1.0rem;width: 100%;">
			<h3 class="box-flex text-all-span my-u-title-size" style="font-size: 3.4rem;font-weight: 500;">¥ &nbsp;<input type="number" placeholder="请输入金额" id="AMOUNT" name="AMOUNT" style="margin-top: 0.1rem;font-size: 2.0rem;"/></h3>
		</div>
	</div>

	<div class="submint" onclick="queren()">
        		确认转出
	 </div>
	<div id="dialogBg"></div>
	<div id="dialog" class="animated" style="background-color:#555555;height:120px;border-color:#555555">
		<ul class="editInfos">
			<li style="color:white;font-size:18px">请绑定支付宝账号</li>
			<!-- <li><img src="static/lshapp/images/center/Successful hints-hdpi.png"/></li> -->
			<li><div class="quee" onclick="go_binding()">确定</div></li>

		</ul>

	</div>
</body>
</html>