<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="description" content="">
<meta name="keywords" content="">
<title>搜索</title>
<base href="<%=basePath%>">
<link href="static/lshapp/css/goods_type.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	var ROOT_URL = '/mobile/';
</script>
<script src="static/lshapp/js/goods_type.js"></script>
<style type="text/css">
.return_image{
	width:1.2rem;
	height:1.8rem;
}
.search_find{
	color: #1b242c;
	display: block;
	width: 100%;
	text-align: center;
	box-sizing: border-box;
}
.search_image{
		width:1.5rem;
		height:1.5rem;
		margin-right:0.5rem;
		margin-top: -2px;
	}
</style>
</head>
<body class="show-search-div">
	<p style="text-align:right; display:none;"></p>
	<div id="loading" style="display: none;">
		<img src="%E6%90%9C%E7%B4%A2_files/loading.gif">
	</div>


	<div class="search-div j-search-div ts-3">
		<section class="search common-search">
			<form action="/mobile/index.php?m=category&amp;a=search"
				method="post" id="search-form">
				<div class="text-all dis-box j-text-all text-all-back">
					<a class="a-icon-back" href="javascript:history.go(-1);">
						<img class="return_image" src="static/lshapp/images/return.png">
					</a>
					<div class="box-flex input-text">
						<input class="j-input-text" style="padding-left: 1.0rem;" id="keyword" name="keyword" autofocus="autofocus" type="text">
					<!-- 	<input name="type_select" value="2" type="hidden"> 
						<input name="isself" value="" type="hidden"> 
						<input name="brand" value="" type="hidden">
						<input name="price_min" value="" type="hidden"> 
						<input name="price_max" value="" type="hidden"> 
						<input name="filter_attr" value="" type="hidden"> -->
					</div>
					<div type="button" class="btn-submit search-btn"
						onclick="directSearch();" style="width: 6.5rem;margin-top: -2px;">
						<img class="search_image" src="static/lshapp/images/search.png"><span style="color:black;">搜索</span></div>
				</div>
			</form>
		</section>
		<section class="search-con">
			<div class="history-search">
				<!-- <div class="swiper-wrapper">
                <div class="swiper-slide">-->
				<p>
					<label class="fl">热门搜索</label>
				</p>
				<ul class="hot-search a-text-more a-text-more-btn">
					<c:forEach items="${searchList}" var="var" varStatus="vs">
						<li class="w-3">
							<div class="search_find" onclick="searchGoods('${var.HOT_SEARCH}');">
								<span class="onelist-hidden">${var.HOT_SEARCH}</span>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="swiper-scrollbar"></div>
			</div>
		</section>
		<div class="other-login search-footer">
			<h4 class="title-hrbg">
				<a href="javascript:history.go(-1);"><span class="col-6">点击关闭搜索</span></a>
				<hr>
			</h4>
		</div>
		<!--<a href="javascript:history.go(-1);">
     <footer class="close-search">
      关闭
    </footer>
    </a>-->
	</div>
	<script type="text/javascript">
		function directSearch(){ // 直接搜索商品
			var GOODS_NAME =  $("#keyword").val();
			if(!isNull(GOODS_NAME)){
				window.location.replace("<%=basePath%>lshapp/shop/sort.do?SEQENCE=SEQENCE&keywords="+GOODS_NAME);
			}else{
				d_messages("请输入商品名称");
			}
		}
		function searchGoods(keyword){ // 通过关键词搜索商品
			if(!isNull(keyword)){
				window.location.replace("<%=basePath%>lshapp/shop/sort.do?SEQENCE=SEQENCE&keywords="+keyword);
			}else{
				d_messages("请输入商品名称");
			}
		}
		function isNull( str ){
			if ( str == "" ) return true;
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			return re.test(str);
		}
	</script>
	<script type="text/javascript">
		$(function() {
			//清除搜索记录
			var history = "";
			$(".clear_history")
					.click(
							function() {
								if (history && $("ul#search-con").length > 0) {
									$
											.get(
													"/mobile/index.php?m=category&a=clear_history",
													'',
													function(data) {
														if (data.status) {
															$("#search-con")
																	.remove();
															var no = '<div class="no-div-message"><p>暂无搜索记录</p></div>';
															$(".hos-search")
																	.after(no);
														}
													}, 'json');
								}
							});
		})
	</script>

</body>
</html>