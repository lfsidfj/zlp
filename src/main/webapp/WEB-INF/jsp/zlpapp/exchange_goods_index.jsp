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
<title>兑换商品详情</title>
<base href="<%=basePath%>">
<link href="static/lshapp/css/goods_type.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	var ROOT_URL = '/mobile/';
</script>
<script src="static/lshapp/js/goods_type.js"></script>
<style type="text/css">
.jt_image {
	width: 1.3rem;
	height: 1.3rem;
	position: absolute;
	left: .2rem;
	top: 36.6%;
}
.customer{
	width:1.8rem;
	height:1.8rem;
	margin-right:0.3rem;
	margin-top: -0.2rem;
}
.remark{
	width: 4rem;
	height: 4rem;
	margin-right:0.2rem;
}
.close_image{
	border:none;
	 position: absolute;
	 right: 0;
	 width: 2.3rem;
	 height: 2.3rem;
	 margin-top: -0.3rem;
	}
.close_images{
	border:none;
	 right: 0;
	 width: 2.3rem;
	 height: 2.3rem;
	 margin-top: -0.3rem;
	}
.collection{
	width:1.8rem;
	height:1.8rem;
	display: block;
	margin: 0.2rem auto 0 auto;
}
.right_arrow{
	width: 0.8rem;
	height: 1.3rem;
	margin-top: -0.2rem;
	margin-left: 0.2rem;
}
.change_background{
	background: #fff;
}
.navigat_image{
	width: 2rem;
	height: 2rem;
}
.bean_image{
	width: 1.8rem!important;
	height: 1.8rem!important;
	display: inline!important;
	border: none!important;
	margin-top: -0.3rem!important;
	margin-right: 0.5rem!important;
}
.bean_tv{
	color: #f4c610;
	font-weight: bold;
}
</style>
</head>
<body>
	<p style="text-align:right; display:none;"></p>
	<div id="loading" style="display: none;">
		<img src="/mobile/public/img/loading.gif">
	</div>

	<div class="con goods" id="checkPage" style="display: block;">
		<header class="dis-box header-menu n-header-menu new-goods-nav ts-5">
			<h3 class="box-flex">
				<nav
					class="n-goods-shop-list-nav box-flex swiper-container-horizontal ">
					<ul class="swiper-wrapper  dis-box text-c">
						<li
							class="div1 box-flex swiper-slide active position-rel swiper-slide-active"
							category="1"><div class="product-div-link"
							onclick="goGoodsIndex('${pd.GOODS_ID}');"></div>商品</li>
						<li class="div3 box-flex swiper-slide position-rel swiper-slide-next" category="3">
							<div class="product-div-link" onclick="goGoodsDetails('${pd.GOODS_ID}');"></div>详情</li>
						<li class="div4 box-flex swiper-slide position-rel" category="4">
							<div class="product-div-link" onclick="goGoodsComment('${pd.GOODS_ID}');"></div>评论
						</li>
					</ul>
				</nav>
			</h3>
		</header>
		<div id="change_goods">
		<form name="ECS_FORMBUY" id="ECS_FORMBUY" method="post">
			
				<div
					class="goods-photo j-show-goods-img goods-banner j-goods-box swiper-container-horizontal swiper-container-android">
					<span class="goods-num" id="goods-num"><span
						id="g-active-num">1</span>/<span id="g-all-num">2</span></span>
					<div class="swiper-wrapper">
						<c:forEach items="${pictureList}" var="var" varStatus="vs">
							<li class="swiper-slide tb-lr-center swiper-slide-active"
								style="width: 400px;"><img
								src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" alt="">
							</li>
						</c:forEach>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>

				<section class="goods-title b-color-f padding-all ">
					<h3>${goods.GOODS_NAME }</h3>

				</section>

				<section class="goods-price padding-all b-color-f">
					<p class="p-price">
						<span class="t-first" id="ECS_SHOPPRICE">¥${goods.CURRENT_PRICE }
							&nbsp;<span
							style="color:gray;font-size: 1.1rem;text-decoration: line-through;">¥${goods.ORIGINAL_PRICE }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销量${goods.SALES_VOLUME }
						</span>
						<!-- <em class="em-promotion"><font id="ECS_DISCOUNT">8.3</font>折</em> -->
					</p>

				</section>
				<section class="b-color-f m-top08 n-goods-box">
					<!--address-start-->
					<div id="editAddressForm">
						<input type="hidden" id="town_id" name="town_region_id" value="">
						<input type="hidden" id="village_id" name="village_region_id" value=""> 
					</div>
					<!--address-end-->
				</section>
				<section
					class="m-top08 b-color-f goods-attr j-goods-attr j-show-div">

					<!--商品属性弹出层star-->
					<div class="mask-filter-div"></div>
					<div class="show-goods-attr j-filter-show-div ts-3 b-color-1">
						<section class="s-g-attr-title b-color-1  product-list-small">
							<div class="product-div" style="overflow: inherit;">
								<div class="product-list-box">
									<img class="product-list-img"
										src="<%=basePath%>uploadFiles/uploadImgs/${goods.PATH}">
								</div>
								<div class="product-text">
									<div class="dis-box position-rel">
										<h5 class="f-04 box-flex onelist-hidden"
											style="margin-right: 2rem;">${goods.GOODS_NAME }</h5>
											<i class="iconfont show-div-guanbi"><img style="border:none; position: absolute; right: 0;width: 2.0rem;height: 2.0rem;margin-top: -0.3rem;" src="static/lshapp/images/Close-hdpi.png"/></i>
									</div>
									<div>
										<span class="f-06 t-first" ><img class="bean_image" src="static/lshapp/images/ritual_bean.png"><span class="bean_tv" id="ECS_GOODS_AMOUNT">${goods.INTEGRATION }</span></span>
									</div>
									<span class="box-flex f-02 col-9">库存:
										<font id="GOODS_INVENTORY" class="goods_attr_num">${goods.GOODS_INVENTORY }</font>
									</span>
								</div>
							</div>
						</section>
						<section
							class="s-g-attr-con swiper-scroll b-color-f padding-all m-top1px swiper-container-vertical swiper-container-free-mode swiper-container-android">
							<div class="swiper-wrapper">
								<div class="swiper-slide swiper-slide-active">
									<h4 class="t-remark">规格</h4>
									<!-- 判断属性是复选还是单选 -->
									<ul class="select-one j-get-one m-top10">
										<!-- pc没属性图片 -->
										<c:forEach items="${skuList}" var="var" varStatus="vs">
											<div class="ect-select dis-flex fl" onclick="skuChange('${var.SKU_ID}','${var.INTEGRATION}',${var.GOODS_INVENTORY});" > 
												<c:if test="${not empty skuList}">
													<label id="sku${var.SKU_ID}" class="ts-1" style="padding: .4rem 1.6rem;" for="spec_value_770">${var.SPECVALUE_NAME}</label>
												</c:if>
											</div>
										</c:forEach>
									</ul>
									<input type="hidden" name="spec_list" value="48">


									<h4 class="t-remark">数量</h4>
									<!-- 普通商品可修改数量 -->
									<div class="div-num dis-box m-top08">
										<a class="num-less" onclick="subtract()"></a>  
										<input class="box-flex" type="tel" value="1" onblur="inputPrice()" name="goods_number" id="goods_number">
										<a class="num-plus" onclick="add()"></a>
									</div>
								</div>
							</div>
							<div class="swiper-scrollbar"></div>
						</section>
						<section class="ect-button-more dis-box">
							<div class="btn-submit box-flex add-to-cart" 
								onclick="goExchangeSubmit('${pd.GOODS_ID}')">确认</div>
						</section>
					</div>
					<!--商品属性弹出层end-->
				</section>
				<section
					class="m-top1px padding-all b-color-f goods-service j-show-div">
					<div class="dis-box">
						<label class="t-remark g-t-temark">服务</label>
						<div class="box-flex">
							<div class="dis-box">
								<p class="box-flex t-goods1">由礼尚汇发货并提供售后服务。</p>
								<!-- <i class="iconfont icon-102 goods-min-icon"></i> -->
								<!--服务信息star-->
							<div class="show-goods-service j-filter-show-div ts-3 b-color-1">
                                <section class="goods-show-title of-hidden padding-all b-color-f">
                                    <h3 class="fl g-c-title-h3">服务说明</h3>
                                  <i class="iconfont show-div-guanbi"><img class="close_image" style="right: 0.3rem;" src="static/lshapp/images/Close-hdpi.png"/></i>
                                </section>
                                <section class="goods-show-con goods-big-service swiper-scroll swiper-container-vertical swiper-container-free-mode swiper-container-android">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide swiper-slide-active">
                                            <ul>

                                                                                                <li class="m-top1px b-color-f padding-all of-hidden">
                                                    <p class="dis-box t-remark3">
                                                        <em >
                                                       		<img class="remark" style="margin-top: 0.2rem;" src="static/lshapp/images/quality_assurance.png">
                                                        </em>
                                                        <span class="box-flex">正品保证</span>
                                                    </p>
                                                </li>
                                                <li class="m-top1px b-color-f padding-all of-hidden">
                                                    <p class="dis-box t-remark3">
                                                        <em >
                                                        <img class="remark" style="margin-top: 0.2rem;" src="static/lshapp/images/flash_delivery.png">
                                                        </em>
                                                        <span class="box-flex">闪速配送</span>
                                                    </p>
                                                </li>
                                                   

                                            </ul>

                                        </div>
                                    </div>

                                </section>
                           </div>

								<!--服务信息end-->
							</div>
							<div class="dis-box m-top08 g-r-rule">
								<p class="box-flex t-remark3">
									<em class="fl">
									<img class="customer" style="margin-top: 0.2rem;" src="static/lshapp/images/quality_assurance.png">
									</em>
									<span class="fl">正品保证</span>
								</p>
								<p class="box-flex t-remark3">
									<em class="fl"><img class="customer" style="margin-top: 0.2rem;" src="static/lshapp/images/flash_delivery.png"></em>
									<span class="fl">闪速配送</span>
								</p>
							</div>
						</div>
					</div>
				</section>


				<section class="m-top08 goods-evaluation">
					<div onclick="goGoodsComment('${pd.GOODS_ID}');">
						<div class="dis-box padding-all b-color-f  g-evaluation-title">
							<label class="t-remark g-t-temark">用户评价</label>
							<div class="box-flex t-goods1">
							</div>
							<div class="t-goods1">
								<em class="t-first">${comment.ids}</em><span class="t-jiantou">条评论
								<img class="right_arrow" src="static/lshapp/images/right_arrow.png" /></span>
							</div>
						</div>
					</div>
				</section>
				<section class="m-top08  goods-shop b-color-f no-shopping-title">
					<div
						class="ect-button-more n-ect-button-more m-top10 dis-box padding-all">
						<div class="box-flex btn-default-new br-5 min-btn" onclick="showPhone();" >
						<img class="customer" src="static/lshapp/images/customer_service.png" /><span style="color:#000;">联系客服</span></div>
					</div>
				</section>
			<!--悬浮btn star-->
			<section class="filter-btn dis-box">
				<!-- <div class="filter-btn-kefu heart" >
				<i class="kefu" style="background-size: 1.8rem 1.8rem;"></i><em>客服</em></div> -->
				<div
					class="btn-submit box-flex add-to-cart " 
					onclick="checkAdd();">立即兑换</div>
				<!--<a class="btn-submit box-flex click-show-attr add-to-cart" href="javascript:;" >立即购买</a>-->
			</section>

		</form>
		</div>
	</div>
	<!--地区选择 s-->
	<div class="choose-address-page" id="chooseAddressPage"
		style="display: none;">
		<div class="head-fix">
			<header>
				<div class="jd-index-header">
					<div class="jd-index-header-icon-back">
						<span id="goBack"></span>
					</div>
					<div class="jd-index-header-title"></div>
				</div>

			</header>
			<ul class="head-address-ul" id="headAddressUl">
				<li mytitle="0"></li>
				<li mytitle="1"></li>
				<li mytitle="2"></li>
				<li mytitle="3"></li>
				<li mytitle="4"></li>
			</ul>
		</div>
		<div class="address-container" id="addressContainer">
			<div class="address-content" id="addressContentDiv">
				<ul class="address-ul"></ul>
				<ul class="address-ul"></ul>
				<ul class="address-ul"></ul>
				<ul class="address-ul"></ul>
				<ul class="address-ul"></ul>
			</div>
		</div>
	</div>
	<!--地区选择 e-->
	<div class="shopping-prompt ts-2">
		<img src="/mobile/public/img/fengxiang.png">
	</div>
	<div class="goods-bg-box">
		<div class="goods-list-close position-abo">
			<i class="iconfont text-r"><img class="close_images" src="static/lshapp/images/Close-hdpi.png"/></i>
		</div>
	</div>
	<!--联系电话-->
	<div id="contact_number">
	</div>
	<!--快捷导航-->
	<script>
		$(function() {
			// 获取节点
			var block = document.getElementById("ectouch-top");
			var oW, oH;
			// 绑定touchstart事件
			block.addEventListener("touchstart", function(e) {
				var touches = e.touches[0];
				//oW = touches.clientX - block.offsetLeft;
				oH = touches.clientY - block.offsetTop;
				//阻止页面的滑动默认事件
				document.addEventListener("touchmove", defaultEvent, false);
			}, false)

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
				var max_top = block.style.top = oTop;
				if (max_top < 30) {
					block.style.top = 30 + "px";
				}
				if (max_top > 440) {
					block.style.top = 440 + "px";
				}
			}, false);

			block.addEventListener("touchend", function() {
				document.removeEventListener("touchmove", defaultEvent, false);
			}, false);
			function defaultEvent(e) {
				e.preventDefault();
			}
		});
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
		/* $('.j-del-store').click(
				function() {
					$(this).siblings('span').html(
							'门店自提' + '<em class="f-02 col-7">(可选择门店)</em>');
					$('#store_id').val('');
					$(this).removeAttr('style');
					$(this).children().removeClass(
							'icon-guanbi2 store-close-btn').addClass(
							'icon-jiantou tf-180 store-close-btn');
					$.ajax({
						url : "/mobile/index.php?m=goods&a=clearstoreid"
					});
				}); */
		/*商品详情相册切换*/
		var swiper = new Swiper(
				'.goods-photo',
				{
					paginationClickable : true,
					onInit : function(swiper) {
						document.getElementById("g-active-num").innerHTML = swiper.activeIndex + 1;
						document.getElementById("g-all-num").innerHTML = swiper.slides.length;
					},
					onSlideChangeStart : function(swiper) {
						document.getElementById("g-active-num").innerHTML = swiper.activeIndex + 1;
					}
				});
		/*推荐商品滚动*/
		var swiper = new Swiper('.j-g-s-p-con', {
			scrollbarHide : true,
			slidesPerView : 'auto',
			centeredSlides : false,
			grabCursor : true
		});
		$(function() {
			changePrice('onload');
			//商品详情属性弹出层
			$(".click-show-attr").click(function() {
				$(".show-goods-attr").addClass("show");
				$(".mask-filter-div").addClass("show");
			});
		});
		/*加入购物车的模式*/
		function checkAdd() {
			$(".show-goods-attr").addClass("show");
			$(".mask-filter-div").addClass("show");
		}
	</script>
	<script src="static/js/jquery.cookie.js"></script>
	<script src="static/lshapp/js/fastclick.js"></script>
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
		            cache: false,
		            data: {"GOODS_ID":Id},
		            beforeSend:function(){
		            	d_messages("正在加载..."); //显示加载时候的提示
		            },
		            success:function(ret){
		                 $("#change_goods").html(ret); //将ajxa请求的数据追加到内容里面
		                 $("#checkPage").addClass("change_background");
		            }
		        });
			}
		}
		
		var unitPrice = ""; //当前单价
		var skuId = ""; // 当前选中SKU
		function skuChange(Id,price,inventory){ 
			$("#sku"+Id).addClass("active"); //修改选中样式
			unitPrice = price; // 当前价格
			skuId = Id;
			var number = $("#goods_number").val(); // 当前数量
			if(isNumber(number)){
				$("#ECS_GOODS_AMOUNT").text((parseFloat(price)*number).toFixed(2)); //修改价格 保留两位小数
				$("#GOODS_INVENTORY").text(inventory); // 修改库存
			}
		}
		
		function subtract(){ // 减少商品数量
			var number =  $("#goods_number").val(); // 当前选择数量
			var current = 0;
			if(isNumber(number)&&parseInt(number)>1){
				current = parseInt(number)-1;
				$("#goods_number").val(current);
				$("#ECS_GOODS_AMOUNT").text((parseFloat(unitPrice)*current).toFixed(2)); //修改价格 保留两位小数
			}
		}
		
		function add(){ // 增加商品数量
			var number =  $("#goods_number").val(); // 当前选择数量
			var current = 0;
			if(isNumber(number)&&parseInt(number)>0){
				current = parseInt(number)+1;
				$("#goods_number").val(current);
				$("#ECS_GOODS_AMOUNT").text((parseFloat(unitPrice)*current).toFixed(2)); //修改价格 保留两位小数
			}
		
		}
		
		function inputPrice(){ //输入框改变值
			var number = $("#goods_number").val();// 当前选择数量
			if(isNumber(number)){
				$("#ECS_GOODS_AMOUNT").text((parseFloat(unitPrice)*number).toFixed(2)); //修改价格 保留两位小数
			}
		}
		
		// 去礼豆兑换提交订单界面
		function goExchangeSubmit(Id){
			var number =  $("#goods_number").val(); // 当前选择数量
			if(skuId == ""){
				 d_messages("请选择商品规格");
			}else{
				window.location.href="<%=basePath%>lshapp/order/goExchangeSubmit.do?GOODS_ID="+Id+"&SKU_ID="+skuId+"&number="+number;
			}
		}
		// 联系客服
		function showPhone(){
			$.ajax({
		        /* async : false,
		        cache : false, */
		        //cache: false,
		        type : 'POST',
		        url : "<%=basePath%>lshapp/shop/customerService.do",// 请求的action路径
		        data:{},
		        success: function(data){// 请求失败处理函数
		        	$("#contact_number").append(data);
		        },
		    });
		}
		// 关闭联系客服电话
		function closeNumber(){
			$("#contact_number").empty();
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
		
		/**
	     * 数字判断
	     * @param value
	     */
	    function isNumber(value) {
	        return /(0|^[1-9]\d*$)/.test(value);
	    }
		
	</script>
	<script type="text/javascript">
		$(function($) {
			/** 将商品信息存储 */
			var expireDate = new Date();
			var goods_info = {
				name : "上海青",
				url : "/mobile/index.php?m=goods&id=574"
			};
			expireDate.setTime(expireDate.getTime() + (60 * 1000));
			$.cookie('index-history', JSON.stringify(goods_info), {
				expires : expireDate
			});

			// 元素以及其他一些变量
			var eleFlyElement = document.querySelector("#flyItem"), eleShopCart = document
					.querySelector("#shopCart");
			var numberItem = 0;
			// 抛物线运动
			var myParabola = funParabola(eleFlyElement, eleShopCart, {
				speed : 10, //抛物线速度
				curvature : 0.009, //控制抛物线弧度
				complete : function() {
					eleFlyElement.style.visibility = "hidden";
					//eleShopCart.querySelector("span").innerHTML = ++numberItem;
				}
			});
			// 绑定点击事件
			if (eleFlyElement && eleShopCart) {

				[].slice
						.call(document.getElementsByClassName("btnCart"))
						.forEach(
								function(button) {
									button
											.addEventListener(
													"click",
													function(event) {
														// 滚动大小
														var scrollLeft = document.documentElement.scrollLeft
																|| document.body.scrollLeft
																|| 0, scrollTop = document.documentElement.scrollTop
																|| document.body.scrollTop
																|| 0;
														eleFlyElement.style.left = event.clientX
																+ scrollLeft
																+ "px";
														eleFlyElement.style.top = event.clientY
																+ scrollTop
																+ "px";
														eleFlyElement.style.visibility = "visible";

														// 需要重定位
														myParabola.position()
																.move();
													});
								});
			}
			//禁止ios双击穿透
			window.addEventListener('load', function() {
				FastClick.attach(document.body);
			}, false);
		});

		$(function() {
			/*点击弹出搜索层*/
			$(".j-price-ladder").click(function() {
				$(".t-price-ladder").toggleClass("active");
			});
		});
	</script>

</body>
</html>