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
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="description" content="">
<meta name="keywords" content="">
<title>订单确认</title>
<base href="<%=basePath%>">
<link href="static/lshapp/css/goods_type.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	var ROOT_URL = '/mobile/';
	</script>
<script src="static/lshapp/js/goods_type.js"></script>

</head>
<body>
	<p style="text-align:right; display:none;"></p>
	<div id="loading" style="display: none;">
		<img src="/mobile/public/img/loading.gif">
	</div>

	<style>
.con-filter-div-scrll {
	overflow-y: scroll;
}

.con-filter-div-scrll::-webkit-scrollbar {
	width: 2px;
	height: 2px;
}

.select-three-invoice .ect-select label {
	line-height: normal;
	height: auto;
}

.select-three-invoice {
	padding: 0 1.1rem;
}

.select-three-invoice  .invoice-list {
	padding: .4rem 0;
}

.select-three-invoice  .header-cont {
	padding: 1rem 0;
	font-size: 1.6rem;
	color: #333;
}

.flow-receipt-title-1 input,.flow-receipt-title input {
	font-size: 1.6rem;
}

.btn-box {
	background: #f6f6f9;
	color: #999
}
.select_image{
	width:2.2rem;
	height:2.2rem;
	float: right;
}
.location_image{
	width: 2rem;
	height: 2.5rem;
	margin-top: -1rem;
}
.right_arrow{
	width: 1rem;
	height: 1.5rem;
	margin-top: -0.2rem;
	margin-left: 0.2rem;
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
.bean_image{
	margin-top: -0.2rem;
	margin-right: 0.3rem;
}
.empty_address{
	text-align: center;
	padding: 1rem;
	background: #ec5151;
	border-radius: 1rem;
	color: white;
	margin-left: -1rem;
	margin-top: 1rem;
	margin-bottom: 1rem;
}
.bean_tv1{
	color: #f4c610!important;
}
.bean_tv2{
	color: #f4c610!important;
	font-size: 1.5rem !important;
}
.bean_tv{
	color: #f4c610!important;
	font-weight: bold!important;
}
.bean_image{
	width: 1.8rem!important;
	height: 1.8rem!important;
	display: inline!important;
	border: none!important;
	margin-top: -0.3rem!important;
	margin-right: 0.5rem!important;
}
.bean_image1{
	width: 1.8rem !important;
	height: 1.8rem !important;
	display: inline !important;
	border: none !important;
	margin-top: 0.3rem !important;
	margin-right: -0.2rem !important;
}
.price1{
	TEXT-DECORATION: line-through;
	color: #999;
	font-size: 1.5rem !important;
}
</style>
	<form name="theForm" id="theForm" >
		<div class="con">
			<div class="flow-checkout">
				<input type="hidden" name="GOODS_ID" id="GOODS_ID" value="${pd.GOODS_ID}"/>
				<input type="hidden" name="ADDRESS_ID" id="ADDRESS_ID" value="${address.ADDRESS_ID}"/>
				<input type="hidden" name="SKU_ID" id="SKU_ID" value="${pd.SKU_ID}"/>
				<input type="hidden" name="number" id="number" value="${pd.number}"/>
				<div class="flow-header" id="flow-header" onclick="goAddressList();">
					<section class="flow-checkout-adr padding-all">
						<c:if test="${not empty address}">
							<div class="address-icon">
								<i class="iconfont"><img class="location_image" src="static/lshapp/images/Location-hdpi.png"></i>
							</div>
							<div class="flow-have-adr">
								<p class="f-h-adr-title ">
									${address.NAME} &nbsp; <label>${address.PHONE_NUMBER}</label>
								</p>
								<p class="f-h-adr-con f-04 m-top04">${address.PROVINCE}&nbsp;${address.CITY}&nbsp;${address.AREA}&nbsp;
									${address.DETAILS_ADDESS}</p>
							</div>
							<span class="t-jiantou" style="right: 1rem;"><i
								class="iconfont tf-180"><img class="right_arrow" src="static/lshapp/images/right_arrow.png" /></i></span>
						</c:if>
						<c:if test="${empty address}">
							<div class="empty_address" onclick="goAddressList();">去添加地址</div>
						</c:if>
					</section>
				</div>
				<div id="flow-cont-height">
					<!-- 门店信息-->
					<section class="m-top10">
						<section class="flow-checkout-pro j-flow-checkout-pro  active">
							<header class="b-color-f padding-all"> 礼尚汇商城 </header>
							<div class="product-list-small m-top1px b-color-f dis-box">
								<ul class="box-flex flow-checkout-bigpic">
									<li>
										<div class="product-div">
											<img class="product-list-img"
												src="<%=basePath%>uploadFiles/uploadImgs/${goods.PATH}">
											<div class="product-text">
												<h4>${goods.GOODS_NAME }</h4>
												<p>
													<span class="p-price"><img class="bean_image1" src="static/lshapp/images/ritual_bean.png"> <span class="bean_tv2">${pd.neet_integration }&nbsp;&nbsp;&nbsp;</span><span class="price1">¥${sku.GOODS_PRICE }</span> <small
														class="fr t-remark">x${pd.number }</small></span>
												</p>
												<p class="dis-box p-t-remark">
													${sku.SPECVALUE_NAME } <br>
												</p>
											</div>
										</div>
									</li>
								</ul>

							</div>
						</section>

					</section>
					<section class="flow-checkout-select b-color-f m-top08">
						<ul>
							<li class="dis-box padding-all"><label
								class="t-remark g-t-temark">买家留言</label>
								<div class="box-flex t-goods1 flow-check-input">
									<input name="postscript[]" class="f-04"
										style="line-height: normal;" maxlength="50"
										placeholder="选填(20)">
								</div></li>
						</ul>
						<p class="padding-all f-05 text-right t-remark">
							共 ${pd.number } 件商品，合计：<span class="bean_tv1" id="ru_amount0"><img class="bean_image" src="static/lshapp/images/ritual_bean.png">${pd.neet_integration }</span>
						</p>
					</section>
				</div>
			</div>
		</div>

		<div class="mask-filter-div"></div>
		<!--悬浮btn star-->
		<section class="filter-btn f-checkout-filter-btn dis-box pl">
			<input name="user_id" value="" type="hidden"> <input
				id="store_id" name="store_id" value="0" type="hidden"> <span
				class="box-flex t-remark">实付礼豆: <em class="bean_tv" id="amount"><img class="bean_image" src="static/lshapp/images/ritual_bean.png">${pd.neet_integration }</em></span>
			<div>
				<div  type="button" class="btn-submit"
					onclick="submitExOrder();">提交订单</div>
			</div>
		</section>
	</form>
	<!--悬浮btn end-->
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
		function goAddressList(){ // 去地址列表
			window.location.href="<%=basePath%>lshapp/order/order_address.do?type=exchange";
		}
		
		// 创建礼豆兑换订单
		function submitExOrder(){
			var GOODS_ID = $("#GOODS_ID").val(); // 商品ID
			var ADDRESS_ID = $("#ADDRESS_ID").val(); // 地址ID
			var SKU_ID = $("#SKU_ID").val(); // 支付的购物车ID
			var number = $("#number").val(); // 支付的购物车ID
			 $.ajax({
	            type: "POST",
	            url: '<%=basePath%>lshapp/order/createExchangeOrder.do',
				data: {"ADDRESS_ID":ADDRESS_ID,"GOODS_ID":GOODS_ID,"SKU_ID":SKU_ID,"number":number},
				dataType: "json",
	            success: function (data) {
	            	if(data.msg =="ok"){ // 成功返回支付信息
	            		 window.location.replace("<%=basePath%>lshapp/order/goOrderDetail.do?orderId="+data.orderId);
	                }else if(data.msg =="noEnough"){
	                	d_messages("礼豆不足");
	                }else if(data.msg =="no"){
	                	d_messages("兑换失败");
	                }
	            }
	        }); 
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
    
    $(function ($) {
        document.getElementById("flow-cont-height").style.marginTop = $("#flow-header").height() + 10 + "px";
    });
    var flow_no_payment = "";
    var flow_no_shipping = "";
    $(function () {
      
        //自提点
        $(".j-goods-site-li li label").click(function () {
            var point = parseInt($(this).attr("data-point"));
            var ru_id = parseInt($(this).attr("data-ruid"));
            console.log(1);
            if (point > 0) {
                $.post("/mobile/index.php?m=flow&a=select_picksite", {picksite_id: point, ru_id: ru_id}, function (result) {
                    if (result.error > 0) {
                        if (result.err_msg) {
                            d_messages(result.err_msg);
                        }
                        return false;
                    }
                    $("#point_id" + ru_id).val(point);
                }, 'json');
            }
        });
        $(".radio-switching").click(function () {
            if($(".radio-switching").hasClass("active")){
                $(".radio-switching").removeClass("active");
                changeIntegral(0);
            }else{
                $(".radio-switching").addClass("active");
                changeIntegral();
            }
        });
        $(".invhead").css('display', 'none');
        $(".invliothers").click(function () {
            $(".invhead").css('display', 'block');
        });
        $(".invli").click(function () {
            $(".invhead").css('display', 'none');
        });
    });
                      
        $(".j-get-invoice li").click(function () {
            $(this).find("label").addClass("active").parent(".ect-select").siblings().find("label").removeClass("active");
          if($(this).find("label").attr("data") == 1) {
                $(".invoice-cont").removeClass("cur");
                $(".invoice-cont-1").removeClass("cur");
            }
            if($(this).find("label").attr("data") == 2) {
                $(".invoice-cont-1").addClass("cur");
                $(".invoice-cont").addClass("cur");
            }
        });
              /*单选consignee*/
    $(".j-invoice-r label").click(function () {
        $(this).addClass("active").parents(".flow-checkout-adr").siblings().find("label").removeClass("active");
    });
	
</script>

</body>
</html>