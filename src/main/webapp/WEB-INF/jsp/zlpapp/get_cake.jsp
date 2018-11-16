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
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
		<meta content="Discover the rich set of features in CanvasFlip. Explore everything about rapid prototyping, sharing and analyzing the UX of prototypes on the tool. Know more." name="description">
		 <meta name="apple-mobile-web-app-capable" content="yes">
    	<meta name="apple-mobile-web-app-status-bar-style" content="black">
    	<meta name="format-detection" content="telephone=no">
    <link href="static/lshapp/css/center/sytle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/lshapp/css/center/common.css"/>
      <link href="static/lshapp/css/component_5ae80bf.css" rel="stylesheet" type="text/css">
   <link href="static/lshapp/css/m_71b98de.css" rel="stylesheet" type="text/css">
     <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
     <link href="<%=basePath%>static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="<%=basePath%>static/lshapp/js/center/jquery-1.9.1.min.js"></script>
    <style type="text/css">
		.comment-inf{
			height: 30px;
			width: 60%;
			border-radius: 8px;
			text-align: center;
			font-size: 1.5rem;
			margin-left:20%;
			background-color:#ED4C44;
			color: white;
			line-height:30px;
		}
		.return_image{
			width:1.2rem;
			height:1.8rem;
		}
		.submint {
				height: 30px;
				width: 66%;
				/* border: 1.3px solid #00AEED; */
				border-radius: 20px;
				margin-left: 17%;
				margin-top: 25px;
				text-align: center;
				font-size: 1.3rem;
				background-color:#ED4C44;
				color: white;
				line-height:30px;
			}
			.productList_box{
			padding: 0px;
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
    	function getAward(ID) {
			if(parseInt($("#count").val())==1){
				d_messages("您领取的次数已经用完!");
			}else{
				var name=$("#name"+ID).val();
				var img=$("#img"+ID).val();
				var h1 = document.getElementById('awardAD');
			    h1.innerHTML = ''+name;
				$("#imgId").attr('src',img);
			 	className = $(this).attr('class');
				$('#dialogBg').fadeIn(300);
				$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
				$("#goods_id").val(ID);
			}
		}
    	function getCake(){
    		var name=$("#goods_id").val();
    		window.location.replace("<%=basePath%>lshapp/userbrithday/save_cake.do?GOODS_ID="+name);
    	}
    </script>
<title>领取蛋糕</title>
</head>
<body style="background-color: #E8E8E8;">
<jsp:include page="head_title.jsp">
	<jsp:param value="领取蛋糕" name="pageTitle"/>
</jsp:include>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>
<%-- <section class="search category-search common-search" style="background-color: white;">
	       <div class="text-all dis-box j-text-all text-all-back">
						<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
	                        	<img class="return_image" src="static/lshapp/images/return.png">
	                   </a>
					  <div style="text-align: center;width: 90%;" >
	                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">领取蛋糕</span>
					  </div>
			</div>
			<input type="hidden" id="count" name="count" value="${count}"/>
			<input type="hidden" id="goods_id" name="goods_id" value=""/>
</section>
<hr style="height:1px;border:none;border-top:1px solid #E1E1E1;width: 100%;margin-top: 0.1rem;" /> --%>

			<input type="hidden" id="count" name="count" value="${count}"/>
			<input type="hidden" id="goods_id" name="goods_id" value=""/>
<div class="component productList_box productList productList_3_twoColumnWithBrand" id="component-233994" style="background-color: #E8E8E8;"><!-- style="margin-top: -1.0rem;" -->
       <!--  <a href="https://m.shengri.cn/hd/rec/sale/dangaoshouyerenqituijianbayueshangbeijing?cityId=110100&amp;r=cake.layout_index..6-233994-0">
        <div class="topTitle">
            人气推荐  ???
        </div>
            <div class="subTitle">
                Popular recommendation
            </div>
        </a> -->


        <ul class=" ui-glist ui-glist-align">
        	<c:forEach items="${goodsList}" var="var" varStatus="vs">
            <li  onclick="getAward('${var.GOODS_ID}')" style="background-color: white;width: 47%;margin: 5px 1.5% 5px 1.5%;">
                  <div class="img-c ui-box ui-border" style="border: 0px;">
                  <input type="hidden" id="img${var.GOODS_ID}" name="img${var.GOODS_ID}" value="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}"/>
                  <input type="hidden" id="name${var.GOODS_ID}" name="name${var.GOODS_ID}" value="${var.GOODS_NAME}"/>
                  <input type="hidden" id="count" name="count" value="${count}"/>
                     <%--  <img  src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}"  class="lazy ui-box-in" alt="">
                       --%> <img  src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}"  class="lazy ui-box-in" alt="">
                  </div>
                   <div class="info-c">
                      <h3 class="ui-nowrap name">${var.GOODS_NAME}</h3>
                      <h5 class="price">￥0<span class="oriPrice">￥${var.ORIGINAL_PRICE}</span></h5>
                      <div class="comment-inf">
                      	点击领取
                     	</div>
					</div>
             </li>
             </c:forEach>
        </ul>
    </div>

</body>
<div id="dialogBg"></div>
	<div id="dialog" class="animated">
		<div class="dialogTop" >
			<a href="javascript:;" class="claseDialogBtn">
				<img src="static/lshapp/images/Close-hdpi.png" style="height:25px;width:25px;"></img>
			</a>
		</div>
		<ul class="editInfos">
			<li style="margin-left: 35%;">
				<img id="imgId" src="static/lshapp/images/Cake-hdpi.png" style="width:60px;height:60px;"></img>
			</li>
			<li id="awardAD" style="text-align: center;"></li>
			<li>
			<div class="submint" onclick="getCake()">
        			确认领取该蛋糕?
			</div>
			</li>
		</ul>
	</div>
</html>