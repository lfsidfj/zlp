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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>收货地址</title>
    <link href="<%=basePath %>static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="<%=basePath %>static/lshapp/js/center/app.js"></script>
	<script src="<%=basePath %>static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">

	</script>
	<style type="text/css">
	.user_icon{
			width: 1.6rem;
			height: 1.6rem;
			border-radius: 0.5rem;
	}
	.user_icon1{
		width: 1.8rem;
		height: 1.8rem;
		margin-top:-0.29rem;
	}
	 .return_image{
			width:1.2rem;
			height:1.8rem;
		}
	.manage_tv{
		text-align: center;
		margin-top:0.8rem;
		padding: 0.0rem 3rem;
		border: 1px solid gray;
		border-radius: 0.5rem;
		margin-left: 2rem;
		margin-right: 2rem;
		font-size: 400 !important;
	}
	</style>

</head>
<body>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>
			<!-- <section class="search category-search common-search" style="background-color: white;">
		       <div class="text-all dis-box j-text-all text-all-back">
							<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
		                        	<img class="return_image" src="static/lshapp/images/return.png">
		                   </a>
						  <div style="text-align: center;width: 90%;" >
		                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">收货地址管理</span>
						  </div>
				</div>
	  		</section> -->
		<div class="manage_tv" onclick="goUserAddress();">
			管理
		</div>
		<div class="con">

			<div class="flow-consignee-list j-get-consignee-one select-three">
				<input type="hidden" name="type" id="type" value="${type}"/>
				<c:forEach items="${pd}" var="var" varStatus="vs">
					<input id="no" name="no" value="${no}" type="hidden"/>
					<section class="flow-checkout-adr m-top08">
					<div class="flow-have-adr padding-all" onclick="select('${var.ADDRESS_ID}');">
						<div class="f-h-adr-title dis-box">
			                  <div class="box-flex"><label>${var.NAME}</label>
			                  </div>
			                  <div class="box-flex"><div class="fr"><span class="f-05">${var.PHONE_NUMBER}</span></div></div>
			             </div>
			             <p class="f-04  m-top04">${var.PROVINCE}${var.CITY}${var.AREA}${var.DETAILS_ADDESS}</p>
					</div>
				</section>
				</c:forEach>

			</div>

		</div>
    <!--快捷导航-->
    <script>

</script>

    <div class="common-show"></div>
   <script type="text/javascript">
        // 选择当前地址
        function select(Id){
        	var type = $("#type").val();
        	// 礼豆兑换界面
        	if(type!=""&&type=="exchange"){
        		window.location.replace("<%=basePath%>lshapp/order/goExchangeSubmit.do?ADDRESS_ID="+Id);
        	}else if(type!=""&&type=="order"){ //普通商品购买界面
        		window.location.replace("<%=basePath%>lshapp/order/submit.do?ADDRESS_ID="+Id);
        	}
        }
        // 去地址管理
        function goUserAddress(){
        	var type = $("#type").val();
        	if(type!=""){
        	 	window.location.replace("<%=basePath%>lshapp/userCenter/user_address.do?type="+type);
        	}
        }
    </script>
</body></html>