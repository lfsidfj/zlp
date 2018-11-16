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
<html lang="en"><head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>我的推荐</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/lshapp/css/center/common3.css"/>
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script src="static/lshapp/js/center/ajaxfileupload.js"></script>
	<script src="static/lshapp/js/center/jquery.qrcode.min.js"></script>
	<style type="text/css">
		.return_image{
			width:1.2rem;
			height:1.8rem;
		}
	</style>
</head>

<body style="background:url(static/lshapp/images/center/QR_code-hdpi.jpg) no-repeat; background-size: cover;width: 100%; ">
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>

<div class="con" style="width: 100%;max-height: 300px;">
   <div class="affiliate-cont-box" style="background-color: white;position:relative;max-width: 100%;max-height: 100%; ">
		    <!-- <div style="max-width: 100%;max-height: 100%;"><img src="static/lshapp/images/center/QR_code-hdpi.jpg" class="img" style="max-width: 100%;max-height: 100%;"></div>
		      --><!-- <div id="dialog" style="position:absolute;top:26vw;left:35vw;height: auto;margin: 10px auto;width: 115px;padding: 10px;background-color: white; padding-bottom:5px;"></div> -->
		     <div id="dialog" style="display: block;padding: 10px;padding-bottom:5px;padding-right: 5px;left: 65%;top:55.6%;"></div>
			 <div  style="position:absolute;top:130.3vw;left:21.1vw;">
					<h2 style="color: white;font-weight: 500;">邀请码: &nbsp; ${pd.INVITE_CODE}</h2>
			   </div>
   </div>
   <div id="qrcode"></div>
</div>

<!--快捷导航-->


    <div class="common-show"></div>
<!-- <script>
function qrcode(){
	$("#code").qrcode({
		render: "table", //table方式
		width: 200, //宽度
		height:200, //高度
		text: "http://xcx.58wyh.com/chihaodian/page/index.html"
	});
	//$('#code').qrcode("${pd.CONSUME_SN}");
};
qrcode();
</script> -->
<script>
jQuery('#dialog').qrcode({width: 95,height: 95,text: "http://xcx.58wyh.com/chihaodian/page/index.html"});
</script>
<script src="static/lshapp/js/center/qrcode.js"></script>

</body></html>