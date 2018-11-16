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
	<link href="static/lshapp/css/center/sytle.css" rel="stylesheet" type="text/css">
    	 <link rel="stylesheet" href="static/lshapp/css/center/common1.css"/>
<script type="text/javascript">
	var ROOT_URL = '/mobile/';
</script>
<script src="static/lshapp/js/goods_type.js"></script>
<script src="static/lshapp/js/center/layer.js"></script>
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
.pay_image{
	width:2.2rem;
	height:2.2rem;

}
.select_image{
	width:2.2rem;
	height:2.2rem;
	float: right;
}
.hidden_pay{
	display:none;
}
.submint {
	height: 45px;
	width: 80%;
	/* border: 1.3px solid #00AEED; */
	border-radius: 10px;
	margin-left: 9%;
	margin-top: 44px;
	text-align: center;
	font-size: 21.3px;
	background-color: #716A71;
	color: white;
	line-height: 40px;
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
.tv_comment{
	border: 1px solid #EE4B46;
	padding-top: 0.1rem;
	padding-bottom: 0.1rem;
	padding-left: 0.5rem;
	padding-right: 0.5rem;
	color: #ee4b46;
	border-radius: 0.5rem;
	font-size: 1.4rem;
}
</style>
		<div class="con">
			<div class="flow-checkout">
				<input type="hidden" name="orderId" id="orderId" value="${pd.ORDER_ID}"/>
				<div class="flow-header" id="flow-header" >
					<section class="flow-checkout-adr padding-all">
						<p class="flow-no-adr" style="display:none">
							<i class="iconfont icon-dingwei"></i>请选择配送地址
						</p>
						<div class="address-icon">
							<i class="iconfont"><img class="location_image" src="static/lshapp/images/Location-hdpi.png"></i>
						</div>
						<div class="flow-have-adr">
							<p class="f-h-adr-title ">
								${pd.RECEIVER} &nbsp; <label>${pd.PHONE_NUMBER}</label>
							</p>
							<p class="f-h-adr-con f-04 m-top04">${pd.PROVINCE}&nbsp;${pd.CITY}&nbsp;${pd.AREA}&nbsp;
								${pd.DETAILS_ADDRESS}</p>
						</div>
						<span class="t-jiantou" style="right: 1rem;"><i
							class="iconfont tf-180"><img class="right_arrow" src="static/lshapp/images/right_arrow.png" /></i></span>
					</section>

				</div>
				<div id="flow-cont-height" >
					<!-- 门店信息-->
					<section class="m-top10">
						<section class="flow-checkout-pro j-flow-checkout-pro  active">
							<div class="b-color-f padding-all"> <span  style="font-size:1.7rem !important;">礼尚汇商城</span> </div>
							<div class="product-list-small m-top1px b-color-f dis-box">
								<ul class="box-flex flow-checkout-bigpic">
								<c:forEach items="${cartList}" var="var" varStatus="vs">
									<li>
										<div class="product-div">
											<img class="product-list-img"
												src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">
											<div class="product-text">
												<h4>${var.GOODS_NAME }</h4>
												<c:if test="${pd.PAY_WAY =='3' }">
													<p>
														<span class="p-price">
															<span style="color: #f4c610;font-size: 1.5rem;" id="ru_amount0">
																<img class="bean_image" style="width: 2rem;height: 2rem;display: inline;border:none;" src="static/lshapp/images/ritual_bean.png">${var.INTEGRATION_AMOUNT }
															</span>
															<span style="margin-left:0.5rem;TEXT-DECORATION: line-through;font-size: 1.5rem;">¥${var.GOODS_CURRENT_PRICE }</span>
															<small class="fr t-remark">x${var.AMOUNT }</small>
														</span>
													</p>
												</c:if>
												<c:if test="${pd.PAY_WAY !='3' }">
													<p>
														<span class="p-price t-first ">¥${var.GOODS_CURRENT_PRICE } <small
															class="fr t-remark">x${var.AMOUNT }</small>
														</span>
													</p>
												</c:if>
												<p class="p-t-remark" style="margin-top:0.5rem">
													<span class="" style="clear: both;overflow: hidden;">${var.SPEC }</span>
													<c:if test="${pd.ORDER_STATUS =='3'}">
														<c:if test="${var.IS_COMMENT!='1'}"><span class="fr tv_comment" onclick="goComment('${var.CART_ID}');">去评论</span></c:if>
													</c:if>
												</p>
											</div>
										</div>
									</li>
									</c:forEach>
								</ul>

							</div>
						</section>

					</section>
					<section class="flow-checkout-select b-color-f m-top08">
						<ul>
							<li class="dis-box padding-all"><label
								class="t-remark g-t-temark">订单编号:${pd.ORDER_ID }</label></li>
							<li class="dis-box padding-all"><label
								class="t-remark g-t-temark">下单时间:${pd.PAY_TIME }</label></li>
							<li>
								<section
									class="dis-box j-goods-dist  j-show-get-val padding-all">
									<label class="t-remark g-t-temark">商品总额</label>
									<div class="box-flex t-goods1 text-right onelist-hidden">
										<span>￥${pd.GOODS_AMOUNT }</span>
									</div>
								</section>
							</li>

							<li class="dis-box padding-all"><label
								class="t-remark g-t-temark">优惠金额</label>
								<div class="box-flex t-goods1 text-right onelist-hidden">
									<span <c:if test="${pd.PAY_WAY !='3' }">style="color:red;"</c:if>>优惠${pd.discount }元</span>
								</div></li>
							<c:if test="${pd.FREIGHT_AMOUNT !='0' }">
								<li class="dis-box padding-all"><label
									class="t-remark g-t-temark">+运费</label>
									<div class="box-flex t-goods1 text-right onelist-hidden">
										<span <c:if test="${pd.PAY_WAY !='3' }">style="color:red;"</c:if>>${pd.FREIGHT_AMOUNT }元</span>
									</div>
								</li>
							</c:if>
						</ul>
						<p class="padding-all f-05 text-right t-remark">
							实付：
							<c:if test="${pd.PAY_WAY =='3' }"><span style="color: #f4c610;font-weight: bold;" id="ru_amount0"><img class="bean_image" src="static/lshapp/images/ritual_bean.png">${pd.INTEGRATION_AMOUNT }</span></c:if>
							<c:if test="${pd.PAY_WAY !='3' }"><span class="t-first" id="ru_amount0">¥${pd.REAL_PAY_AMOUNT }</span></c:if>
						</p>
					</section>
					<c:if test="${pd.PAY_STATUS =='0' }">
						<section class="m-top10">
							<ul>
								<li class="dis-box padding-all-n m-top1px b-color-f ">
									<label class="t-remark g-t-temark" style="color: #000;font-size: 1.6rem;">请选择支付方式</label>
								</li>
								<li class="dis-box padding-all-n m-top1px b-color-f " style="display: block;" onclick="selectPayment('1');">
									<img class="pay_image" src="static/lshapp/images/alipay.png">
									<label class="t-remark">支付宝支付</label>
									<img id="ali_img" class="select_image" src="static/lshapp/images/select2.png">
								</li>
								<li class="dis-box padding-all-n m-top1px b-color-f " style="display: block;"  onclick="selectPayment('2');">
									<img class="pay_image" src="static/lshapp/images/wx.png">
									<label class="t-remark">微信支付</label>
									<img id="wx_img" class="select_image hidden_pay" src="static/lshapp/images/select2.png">
								</li>
								<!--支付方式 (默认支付宝支付)-->
								 <input id="payment" name="payment" value="alipay" type="hidden">
							</ul>
						</section>
					</c:if>
					<c:if test="${pd.order_tate !='0' }">
						<section class="m-top10">
							<div style="text-align:center;font-size:14px;">支付成功，增加${pd.order_tate }礼豆</div>
						</section>
					</c:if>


					<section class="m-top10" id="ECS_ORDERTOTAL"></section>
				</div>
			</div>
		</div>

		<div class="mask-filter-div"></div>
		<!--悬浮btn star-->
		<section class="filter-btn f-checkout-filter-btn dis-box pl">
			<input name="user_id" value="" type="hidden"> <input
				id="store_id" name="store_id" value="0" type="hidden"> <span
				class="box-flex t-remark"> <em class="t-first" id="amount"></em></span>
			<div>
				<c:if test="${pd.PAY_STATUS =='1' }">
					<div type="button" class="btn-submit" onclick="submit('${pd.ORDER_ID }');">查看物流</div>
				</c:if>
				<c:if test="${pd.PAY_STATUS =='0' }">
					<div type="button" class="btn-submit" onclick="submitOrder();">立即支付</div>
				</c:if>
			</div>
		</section>
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
		function selectPayment(e){ // 选择支付方式
			if(e=="1"){ // 支付宝支付
				$("#payment").val("alipay");
				$("#ali_img").removeClass("hidden_pay");
				$("#wx_img").addClass("hidden_pay");
			}else if(e=="2"){ // 微信支付
				$("#payment").val("wxpay");
				$("#ali_img").addClass("hidden_pay");
				$("#wx_img").removeClass("hidden_pay");
			}
		}

		function submitOrder(){
			var payment = $("#payment").val(); // 支付方式
			var orderId = $("#orderId").val(); // 订单ID
			$.ajax({
	            type: "POST",
	            url: '<%=basePath%>lshapp/order/orderContinuePay.do',
				data: {"orderId":orderId,"payment":payment},
				dataType: "json",
	            success: function (data) {
	            	if(data.status =="0"){ // 成功返回支付信息
	            		orderContinuePay(data); // 唤起原生支付
	                }
	            }
	        });
		}
		// 待支付订单继续支付
		function orderContinuePay(data) {
	           //调用本地java方法
	           //第一个参数是 调用java的函数名字 第二个参数是要传递的数据 第三个参数js在被回调后具体执行方法，responseData为java层回传数据
				window.WebViewJavascriptBridge.send(
		               data
		               , function(responseData) {
		            	   var obj = JSON.parse(responseData);
		            	   if(obj.type=="success" || obj.type=="fail"){
		            		   if(obj.orderId !=''){
		            			   window.location.replace("<%=basePath%>lshapp/order/goOrderDetail.do?orderId="+obj.orderId);
		            		   }
		            	   }else if(obj.type=="cancel" || obj.type=="exception"){
		            		   window.location.href="<%=basePath%>lshapp/shop/index.do";
		            	   }
		               }
		           );
	       }


	       //注册事件监听
	       function connectWebViewJavascriptBridge(callback) {
	           if (window.WebViewJavascriptBridge) {
	               callback(WebViewJavascriptBridge)
	           } else {
	               document.addEventListener(
	                   'WebViewJavascriptBridgeReady'
	                   , function() {
	                       callback(WebViewJavascriptBridge)
	                   },
	                   false
	               );
	           }
	       }
	       //注册回调函数，第一次连接时调用 初始化函数
	       connectWebViewJavascriptBridge(function(bridge) {
	           bridge.init(function(message, responseCallback) {
	               var responseData = '默认接收收到来自Java的数据，回传数据给你';
	               responseCallback(responseData);
	           });

	           bridge.registerHandler("functionInJs", function(data, responseCallback) {
	               var responseData = '指定接收收到来自Java的数据，回传数据给你';
	               responseCallback(responseData);
	           });
	       });
		 //查寻物流信息
		 function submit(ID){
			  $.ajax({
			        /* async : false,
			        cache : false, */
			        //cache: false,
			        type : 'POST',
			        url : "<%=basePath%>lshapp/order/logistics.do",// 请求的action路径
			        data:{"ORDER_ID":ID},
			        success: function(data){// 请求失败处理函数
			        	$("#dialog").append(data);
		        		className = $(this).attr('class');
						$('#dialogBg').fadeIn(300);
						$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
			        },
			    });
		 }
		 $('.claseDialogBtn').click(function(){
				$('#dialogBg').fadeOut(100,function(){
					$('#dialog').addClass('bounceOutUp').fadeOut();
				});
			});
		 // 去评论
		 function goComment(Id){
			 window.location.href="<%=basePath%>lshapp/userCenter/go_goods_comment.do?CART_ID="+Id;
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
		$(function($) {
			document.getElementById("flow-cont-height").style.marginTop = $(
					"#flow-header").height()
					+ 10 + "px";
		});
	</script>
	<div id="dialogBg"></div>

	<div data-mohe-type="kuaidi_new" class="g-mohe " style="height:450px;top: 40%;overflow-y:auto" id="dialog">
		<div class="dialogTop" style="padding: 1px 0">
			<a class="claseDialogBtn">
				<img src="static/lshapp/images/Close-hdpi.png" style="height:25px;width:25px;"></img>
			</a>
		</div>
	</div>
</body>
</html>