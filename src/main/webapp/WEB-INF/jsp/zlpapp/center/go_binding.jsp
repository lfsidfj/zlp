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
    <title>绑定支付宝</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/lshapp/css/center/common.css"/>
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/center/sytle.css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
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
    	function queding(){
			if($("#Alipay").val()=="" || $("#ALIPAYNAME").val()==""){
				alert("请输入正确的支付宝信息!");
			}else{
				 $.ajax({
	         		 	async : false,
	 			        type : 'POST',
	 			        url : "<%=basePath%>lshapp/userCenter/save_binding_alipay.do",// 请求的action路径
	 			        data:{"ALIPAY":$("#Alipay").val(),"ALIPAYNAME":$("#ALIPAYNAME").val()},
	 			        success: function(data){// 请求失败处理函数
 			        		className = $(this).attr('class');
 							$('#dialogBg').fadeIn(300);
 							$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
 							setTimeout(tip,"1600");
	 			        },
	 			    });
			}
    	}
    	function tip(){
			$('#dialogBg').fadeOut(300,function(){
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
			window.location.replace("<%=basePath%>lshapp/userCenter/go_roll_out.do");
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
<!-- 	                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">绑定支付宝</span> -->
<!-- 					  </div> -->
<!-- 			</div> -->
<!-- 	  </section> -->
	<div class="s-user-top onclik-nick_name" style="background:#fff;margin-top: 0.8rem;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size"><input type="text" placeholder="请输入支付宝真实姓名" id="ALIPAYNAME" name="ALIPAYNAME" value="${pd.ALIPAYNAME}" style="margin-top: 0.1rem;font-size: 1.5rem;"/></h3>
		</div>
	</div>

	<div class="s-user-top onclik-nick_name" style="background:#fff;margin-top: 0.8rem;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size"><input type="number" placeholder="请输入支付宝账号" id="Alipay" name="Alipay" value="${pd.ALIPAY}" style="margin-top: 0.1rem;font-size: 1.5rem;"/></h3>
		</div>
	</div>
	<div class="ect-button-more dis-box filter-btn" onclick="queding()">
						<a  class="btn-submit box-flex">确定</a>
	</div>
	<div id="dialogBg"></div>
	<div id="dialog" class="animated" style="background-color:#555555;height:140px;border-color:#555555">
		<ul class="editInfos">
			<li><img src="static/lshapp/images/center/Successful hints-hdpi.png" style="width: 7rem;height:4.5rem;"/></li>
			<li style="color:white;font-size:18px">支付宝绑定成功</li>
		</ul>
	</div>
</body>
</html>