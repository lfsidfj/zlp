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
<title>商品评论</title>
<base href="<%=basePath%>">
<link href="static/lshapp/css/goods_type.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	var ROOT_URL = '/mobile/';
</script>
<script src="static/lshapp/js/goods_type.js"></script>
<style type="text/css">
.isNoMore{
	text-align: center;
	font-size: 1.3rem;
	font-style: initial;
	color: gray;
	font-weight: bold;
	padding: 0.5rem;
}
.hidden_noMore{
	display:none;
}
.jt_image {
	width: 1.3rem;
	height: 1.3rem;
	position: absolute;
	left: .2rem;
	top: 36.6%;
}
.navigat_image{
	width: 2rem;
	height: 2rem;
}
</style>
</head>
<body>
	<p style="text-align:right; display:none;"></p>
	<div id="loading" style="display: none;">
		<img src="/mobile/public/img/loading.gif">
	</div>

	<div class="con b-color-f">
		<header class="dis-box header-menu n-header-menu new-goods-nav ts-5">
			<h3 class="box-flex">
				<nav
					class="n-goods-shop-list-nav box-flex swiper-container-horizontal ">
					<ul class="swiper-wrapper  dis-box text-c">
						<li
							class="div1 box-flex swiper-slide position-rel swiper-slide-active"
							category="1"><div class="product-div-link"
								onclick="goGoodsIndex('${pd.GOODS_ID}');"></div>商品</li>
						<li
							class="div3 box-flex swiper-slide position-rel swiper-slide-next"
							category="3">
							<div class="product-div-link"
								onclick="goGoodsDetails('${pd.GOODS_ID}');"></div>详情
						</li>
						<li class="div4 box-flex swiper-slide position-rel active"
							category="4">
							<div class="product-div-link"
								onclick="goGoodsComment('${pd.GOODS_ID}');"></div>评论
						</li>
					</ul>
				</nav>
			</h3>
		</header>
		<div  id="change_goods">
		<div class="goods-evaluation-page of-hidden ect-tab j-ect-tab"
			style="padding-top:4.2rem">
			<div id="j-tab-con"
				class="b-color-f tab-con swiper-container-horizontal swiper-container-autoheight swiper-container-android"
				style="margin-top:0">
				<div class="swiper-wrapper divrank">

					<!-- 全部评价 -->
					<section
						class="swiper-slide of-hidden sectrank swiper-slide-active">
						<c:if test="${not empty commentList }">
							<input type="hidden" name="GOODS_ID" id="GOODS_ID" value="${pd.GOODS_ID}"/>
							<input type="hidden" name="totalPage" id="totalPage" value="${totalPage}"/>
							<div class="comment-info rank-all" id="comment_more">
								<c:forEach items="${commentList}" var="var" varStatus="vs">
								<div class="evaluation-list padding-all">
									<div class="dis-box comment-list-box">
										<div class="box-flex p-r">
											<span class="comment-header"> <img
												src="<%=basePath%>uploadFiles/uploadImgs/${var.USER_PATH}">
											</span> <span class="f-05 col-7 comment-admin"> ${var.NICK_NAME}
											</span>
										</div>
										<div class="box-flex">
											<div class="fr t-remark">${var.CREATE_DATE}</div>
										</div>
									</div>
									<c:if test="${not empty var.CONTENT }"><p class="clear f-05 col-3">${var.CONTENT }</p></c:if>
									<c:if test="${not empty var.pictureList }">
										<div class="g-e-p-pic m-top08">
											<div class="my-gallery" data-pswp-uid="5">
											<c:forEach items="${var.pictureList}" var="pvar" varStatus="pvs">
												<div style="float: left;width: 24%;margin: .1rem;border: 1px solid #eee;">
													<div class="comment-img">
														<div data-size="640x640">
															<img class="img"
																src="<%=basePath%>uploadFiles/uploadImgs/${pvar.COMMENT_PATH}">
														</div>
													</div>
												</div>
												</c:forEach>
											</div>
										</div>
									</c:if>
									<p class="clear t-remark">规格:${var.SPEC }</p>
								</div>
								</c:forEach>
							</div>
							<div id="isNoMore" class="isNoMore hidden_noMore"><p id="tv_more">没有更多了</p></div>
						</c:if>
						<c:if test="${empty commentList }">
							<div class="comment-info rank-all">
								<div class="no-div-message">
									<p>暂无商品评论。</p>
								</div>
							</div>
						</c:if>
					</section>
				</div>
			</div>
		</div>
		</div>
	</div>
	<!--快捷导航-->
	<script>
    $(function(){
       // 获取节点
          var block = document.getElementById("ectouch-top");
          var oW,oH;
          // 绑定touchstart事件
          block.addEventListener("touchstart", function(e) {
           var touches = e.touches[0];
           //oW = touches.clientX - block.offsetLeft;
           oH = touches.clientY - block.offsetTop;
           //阻止页面的滑动默认事件
           document.addEventListener("touchmove",defaultEvent,false);
          },false)
         
          block.addEventListener("touchmove", function(e) {
           var touches = e.touches[0];
           //var oLeft = touches.clientX - oW;
           var oTop = touches.clientY - oH;
          //  if(oLeft < 0) {
          //   oLeft = 0;
          //  }else if(oLeft > document.documentElement.clientWidth - block.offsetWidth) {
          //   oLeft = (document.documentElement.clientWidth - block.offsetWidth);
          //  }
          // block.style.left = oLeft + "px";
           block.style.top = oTop + "px";
          var max_top = block.style.top =oTop;
          if(max_top < 30){
             block.style.top = 30 + "px";
          }
          if(max_top > 440){
            block.style.top = 440 + "px";
          }
          },false);
           
          block.addEventListener("touchend",function() {
           document.removeEventListener("touchmove",defaultEvent,false);
          },false);
          function defaultEvent(e) {
           e.preventDefault();
          }
    })
</script>
	<nav class="commom-nav dis-box ts-5" id="ectouch-top">
		<div class="left-icon">
			<div class="nav-icon">
				<img class="jt_image" src="static/lshapp/images/jiantou.png">快速导航
			</div>
			<div class="filter-top filter-top-index" id="scrollUp">
				<i class="iconfont icon-jiantou"></i> <span>顶部</span>
			</div>
		</div>
		 <div class="right-cont box-flex">
			<ul class="nav-cont">
				<li><div onclick="goBIndex();"> <i
						class="iconfont"><img class="navigat_image" src="static/lshapp/images/Birthday-Silhouett-hdpi.png"></i>
						<p>首页</p>
				</div></li>
				<li><div onclick="goGIndex();"> <i
						class="iconfont"><img class="navigat_image" src="static/lshapp/images/Give_a_gift-Silhouett.png"></i>
						<p>送礼</p>
				</div></li>
				<li><div  onclick="goAIndex();"> <i
						class="iconfont"><img class="navigat_image" src="static/lshapp/images/Community-Silhouett-hdpi.png"></i>
						<p>社区</p>
				</div></li>
				<li><div onclick="goUIndex();"> <i
						class="iconfont"><img class="navigat_image" src="static/lshapp/images/Personal_Center-Silhouette.png"></i>
						<p>个人中心</p>
				</div></li>

			</ul>
		</div>
	</nav>
	<div class="common-show"></div>
	<script type="text/javascript">
		function goGoodsIndex(Id){
			if(!$(".div1").hasClass("active")&&Id!=""){
				d_messages("正在加载..."); //显示加载时候的提示
				window.location.replace("<%=basePath%>lshapp/shop/goods.do?GOODS_ID="+Id);
			}
		}	
		
		function goGoodsComment(Id){
			if(!$(".div4").hasClass("active")&&Id!=""){
				d_messages("正在加载..."); //显示加载时候的提示
				window.location.replace("<%=basePath%>lshapp/shop/goodsComment.do?GOODS_ID="+Id);
			}
		}
	
		function goGoodsDetails(Id){ // 商品详情图片
			if(!$(".div3").hasClass("active")&&Id!=""){
				$.ajax({ // 加载更多数据
		            type:"POST",
		            url:'<%=basePath%>lshapp/shop/goodsDetailPicture.do',
					//dataType:'json',
					cache : false,
					data : {
						"GOODS_ID" : Id
					},
					beforeSend : function() {
						d_messages("正在加载..."); //显示加载时候的提示
					},
					success : function(ret) {
						$("#change_goods").html(ret); //将ajxa请求的数据追加到内容里面
					}
				});
			}
		}
		
		// 生日去首页
		function goBIndex(){
			var data='{"index":"0"}';
           window.WebViewJavascriptBridge.callHandler(
               'openPage'
               ,data
               , function(responseData) {
               }
           );
		}
		
		// 送礼去首页
		function goGIndex(){
			var data='{"index":"1"}';
           window.WebViewJavascriptBridge.callHandler(
               'openPage'
               ,data
               , function(responseData) {
               }
           );
		}
		
		// 社区去首页
		function goAIndex(){
			var data='{"index":"3"}';
           window.WebViewJavascriptBridge.callHandler(
               'openPage'
               ,data
               , function(responseData) {
               }
           );
		}
		
		// 个人中心去首页
		function goUIndex(){
			var data='{"index":"4"}';
			window.WebViewJavascriptBridge.callHandler(
               'openPage'
               ,data
               , function(responseData) {
               }
			);
		}
	</script>
	<script type="text/javascript">
    var totalPage = $("#totalPage").val();
    var GOODS_ID = $("#GOODS_ID").val();
    var isMore=false;//是否正在下拉耍新
	// 下拉加载更多     
	var currentPage=2;
          $(document).ready(function(){
            $(window).scroll(function(){
              if($(document).scrollTop()>=$(document).height()-$(window).height()){
            	  if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了
            		  $("#tv_more").val("没有更多了");
            		  $("#isNoMore").removeClass("hidden_noMore");
            		  return;
            	  }else{
            		  if(!isMore){
            			  isMore = true;
            			  $.ajax({ // 加载更多数据
                              type:"POST",
                              url:'<%=basePath%>lshapp/shop/goodsCommentMore.do',
                              //dataType:'json',
                              cache: false,
                              data: {"currentPage":currentPage,"showCount":10,"GOODS_ID":GOODS_ID},
                              beforeSend:function(){
                             	 d_messages("正在加载..."); //显示加载时候的提示
                              },
                              success:function(ret){
                               $("#comment_more").append(ret); //将ajxa请求的数据追加到内容里面
                               currentPage ++;
                               $("#isNoMore").addClass("hidden_noMore");
                               $("#tv_more").val("没有更多了");
                               isMore =false;
                              }
                          }); 
            			  return true;
          			}else{
          				return false; 
          			}
            	  };
              };
            });
          });
        </script> 
</body>
</html>