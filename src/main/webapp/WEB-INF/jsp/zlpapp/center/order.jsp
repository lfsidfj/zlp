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
<html>

	<head>
	<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>我的订单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
 		<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" href="static/lshapp/mui/css/mui.min.css">
		<style>
			html,
			body {
				background-color: #efeff4;
			}
			.mui-bar~.mui-content .mui-fullscreen {
				top: 44px;
				height: auto;
			}
			.mui-pull-top-tips {
				position: absolute;
				top: -20px;
				left: 50%;
				margin-left: -25px;
				width: 40px;
				height: 40px;
				border-radius: 100%;
				z-index: 1;
			}
			.mui-bar~.mui-pull-top-tips {
				top: 24px;
			}
			.mui-pull-top-wrapper {
				width: 42px;
				height: 42px;
				display: block;
				text-align: center;
				background-color: #efeff4;
				border: 1px solid #ddd;
				border-radius: 25px;
				background-clip: padding-box;
				box-shadow: 0 4px 10px #bbb;
				overflow: hidden;
			}
			.mui-pull-top-tips.mui-transitioning {
				-webkit-transition-duration: 200ms;
				transition-duration: 200ms;
			}
			.mui-pull-top-tips .mui-pull-loading {
				/*-webkit-backface-visibility: hidden;
				-webkit-transition-duration: 400ms;
				transition-duration: 400ms;*/

				margin: 0;
			}
			.mui-pull-top-wrapper .mui-icon,
			.mui-pull-top-wrapper .mui-spinner {
				margin-top: 7px;
			}
			.mui-pull-top-wrapper .mui-icon.mui-reverse {
				/*-webkit-transform: rotate(180deg) translateZ(0);*/
			}
			.mui-pull-bottom-tips {
				text-align: center;
				background-color: #efeff4;
				font-size: 15px;
				line-height: 40px;
				color: #777;
			}
			.mui-pull-top-canvas {
				overflow: hidden;
				background-color: #fafafa;
				border-radius: 40px;
				box-shadow: 0 4px 10px #bbb;
				width: 40px;
				height: 40px;
				margin: 0 auto;
			}
			.mui-pull-top-canvas canvas {
				width: 40px;
			}
			.mui-slider-indicator.mui-segmented-control {
				background-color: #efeff4;
			}
			.mui-table-view-cell{
				padding: 0px;background-color: #EFEFF4;
			}
		</style>
		<script type="text/javascript">
			<%-- function goOrderDetail(ID){
				alert(ID);
				window.location.href="<%=basePath%>lshapp/order/goOrderDetail.do?orderId="+ID;
			} --%>
		</script>
	</head>

	<body>
		<!-- <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">我的订单</h1>
		</header> -->
		<div class="mui-content">
			<div id="slider" class="mui-slider mui-fullscreen">
				<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<div class="mui-scroll">
						<a class="mui-control-item mui-active" href="#item1mobile">
							全部
						</a>
						<a class="mui-control-item" href="#item2mobile">
							待付款
						</a>
						<a class="mui-control-item" href="#item3mobile">
							待发货
						</a>
						<a class="mui-control-item" href="#item4mobile">
							待收货
						</a>
						<a class="mui-control-item" href="#item5mobile">
							已完成
						</a>
					</div>
					<input type="hidden" name="totalPage0" id="totalPage0" value="${totalPage0}"/>
					<input type="hidden" name="totalPage1" id="totalPage1" value="${totalPage1}"/>
					<input type="hidden" name="totalPage2" id="totalPage2" value="${totalPage2}"/>
					<input type="hidden" name="totalPage3" id="totalPage3" value="${totalPage3}"/>
					<input type="hidden" name="totalPage4" id="totalPage4" value="${totalPage4}"/>
				</div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view" id="order000">
									<c:forEach items="${orderList0}" var="var" varStatus="vs">
									<li class="mui-table-view-cell" id="liQ${var.ORDER_ID}">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：${var.ORDER_ID}</div>
												<div style="float: right;color: red;">
													<c:if test="${var.ORDER_STATUS=='0'}">待支付</c:if>
													<c:if test="${var.ORDER_STATUS=='1'}">待发货</c:if>
													<c:if test="${var.ORDER_STATUS=='2'}">待收货</c:if>
													<c:if test="${var.ORDER_STATUS=='3'}">待评价</c:if>
													<c:if test="${var.ORDER_STATUS=='4'}">已完成</c:if>
												</div>
												<div style="clear: both;"></div>
											</div>
											<c:forEach items="${var.goodsList}" var="vargg" varStatus="vsgg">
												<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
													<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${vargg.PATH}" style="display: block;float: left;width: 20vw;">
													<div style="width: 40vw;float: left;margin-left: 5px;">
													${vargg.GOODS_NAME}[${vargg.SPEC}]
													</div>
													<div style="text-align: right;width: 20vw;float: right;">
														<font>￥${vargg.GOODS_CURRENT_PRICE}</font><br/>
														<font style="text-decoration: line-through;color: #858E97;">￥${vargg.GOODS_ORIGINAL_PRICE}</font><br/>
														<font style="color: #858E97;">x${vargg.AMOUNT}</font>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:forEach>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共${var.AMOUNT}件商品&nbsp;&nbsp;合计：￥${var.REAL_PAY_AMOUNT}(含运费￥${var.FREIGHT_AMOUNT})
											</div>
											<c:if test="${var.ORDER_STATUS=='0'}">
												<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ" >
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;" class="zhifuOrder">
														<div myvalue="${var.ORDER_ID}">确认支付</div>
													</div>

													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="quxiaoOrder">
														<div myvalue="${var.ORDER_ID}">取消订单</div>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:if>
											<c:if test="${var.ORDER_STATUS=='1'}">
												<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ" >
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:if>
											<c:if test="${var.ORDER_STATUS=='2'}">
												<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ">
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;" class="querenSH">
														<div myvalue="${var.ORDER_ID}">确认收货</div>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:if>
											<c:if test="${var.ORDER_STATUS=='3'}">
												<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ" >
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:if>
											<c:if test="${var.ORDER_STATUS=='4'}">
												<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ" >
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:if>
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view" id="order111">
									<c:forEach items="${orderList1}" var="var" varStatus="vs">
									<li class="mui-table-view-cell" id="liW${var.ORDER_ID}">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：${var.ORDER_ID}</div>
												<div style="float: right;color: red;">
													<c:if test="${var.ORDER_STATUS=='0'}">待支付</c:if>
													<c:if test="${var.ORDER_STATUS=='1'}">待发货</c:if>
													<c:if test="${var.ORDER_STATUS=='2'}">待收货</c:if>
													<c:if test="${var.ORDER_STATUS=='3'}">待评价</c:if>
													<c:if test="${var.ORDER_STATUS=='4'}">已完成</c:if>
												</div>
												<div style="clear: both;"></div>
											</div>
											<c:forEach items="${var.goodsList}" var="vargg" varStatus="vsgg">
												<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
													<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${vargg.PATH}" style="display: block;float: left;width: 20vw;">
													<div style="width: 40vw;float: left;margin-left: 5px;">
													${vargg.GOODS_NAME}[${vargg.SPEC}]
													</div>
													<div style="text-align: right;width: 20vw;float: right;">
														<font>￥${vargg.GOODS_CURRENT_PRICE}</font><br/>
														<font style="text-decoration: line-through;color: #858E97;">￥${vargg.GOODS_ORIGINAL_PRICE}</font><br/>
														<font style="color: #858E97;">x${vargg.AMOUNT}</font>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:forEach>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共${var.AMOUNT}件商品&nbsp;&nbsp;合计：￥${var.REAL_PAY_AMOUNT}(含运费￥${var.FREIGHT_AMOUNT})
											</div>
											<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ">
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;" class="zhifuOrder">
														<div myvalue="${var.ORDER_ID}">确认支付</div>
													</div>

													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;" class="quxiaoOrder">
														<div myvalue="${var.ORDER_ID}">取消订单</div>
													</div>
													<div style="clear: both;"></div>
											</div>
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<div id="item3mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view" id="order222">
									<c:forEach items="${orderList2}" var="var" varStatus="vs">
									<li class="mui-table-view-cell" id="liE${var.ORDER_ID}">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：${var.ORDER_ID}</div>
												<div style="float: right;color: red;">
													<c:if test="${var.ORDER_STATUS=='0'}">待支付</c:if>
													<c:if test="${var.ORDER_STATUS=='1'}">待发货</c:if>
													<c:if test="${var.ORDER_STATUS=='2'}">待收货</c:if>
													<c:if test="${var.ORDER_STATUS=='3'}">待评价</c:if>
													<c:if test="${var.ORDER_STATUS=='4'}">已完成</c:if>
												</div>
												<div style="clear: both;"></div>
											</div>
											<c:forEach items="${var.goodsList}" var="vargg" varStatus="vsgg">
												<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
													<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${vargg.PATH}" style="display: block;float: left;width: 20vw;">
													<div style="width: 40vw;float: left;margin-left: 5px;">
													${vargg.GOODS_NAME}[${vargg.SPEC}]
													</div>
													<div style="text-align: right;width: 20vw;float: right;">
														<font>￥${vargg.GOODS_CURRENT_PRICE}</font><br/>
														<font style="text-decoration: line-through;color: #858E97;">￥${vargg.GOODS_ORIGINAL_PRICE}</font><br/>
														<font style="color: #858E97;">x${vargg.AMOUNT}</font>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:forEach>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共${var.AMOUNT}件商品&nbsp;&nbsp;合计：￥${var.REAL_PAY_AMOUNT}(含运费￥${var.FREIGHT_AMOUNT})
											</div>
											<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ">
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="clear: both;"></div>
												</div>
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<div id="item4mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view" id="order333">
									<c:forEach items="${orderList3}" var="var" varStatus="vs">
									<li class="mui-table-view-cell" id="liR${var.ORDER_ID}">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：${var.ORDER_ID}</div>
												<div style="float: right;color: red;">
													<c:if test="${var.ORDER_STATUS=='0'}">待支付</c:if>
													<c:if test="${var.ORDER_STATUS=='1'}">待发货</c:if>
													<c:if test="${var.ORDER_STATUS=='2'}">待收货</c:if>
													<c:if test="${var.ORDER_STATUS=='3'}">待评价</c:if>
													<c:if test="${var.ORDER_STATUS=='4'}">已完成</c:if>
												</div>
												<div style="clear: both;"></div>
											</div>
											<c:forEach items="${var.goodsList}" var="vargg" varStatus="vsgg">
												<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
													<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${vargg.PATH}" style="display: block;float: left;width: 20vw;">
													<div style="width: 40vw;float: left;margin-left: 5px;">
													${vargg.GOODS_NAME}[${vargg.SPEC}]
													</div>
													<div style="text-align: right;width: 20vw;float: right;">
														<font>￥${vargg.GOODS_CURRENT_PRICE}</font><br/>
														<font style="text-decoration: line-through;color: #858E97;">￥${vargg.GOODS_ORIGINAL_PRICE}</font><br/>
														<font style="color: #858E97;">x${vargg.AMOUNT}</font>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:forEach>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共${var.AMOUNT}件商品&nbsp;&nbsp;合计：￥${var.REAL_PAY_AMOUNT}(含运费￥${var.FREIGHT_AMOUNT})
											</div>

											<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;" class="querenSH">
														<div myvalue="${var.ORDER_ID}">确认收货</div>
													</div>
													<div style="clear: both;"></div>
												</div>

										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<div id="item5mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view" id="order444">
									<c:forEach items="${orderList4}" var="var" varStatus="vs">
									<li class="mui-table-view-cell" id="liT${var.ORDER_ID}">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：${var.ORDER_ID}</div>
												<div style="float: right;color: red;">
													<c:if test="${var.ORDER_STATUS=='0'}">待支付</c:if>
													<c:if test="${var.ORDER_STATUS=='1'}">待发货</c:if>
													<c:if test="${var.ORDER_STATUS=='2'}">待收货</c:if>
													<c:if test="${var.ORDER_STATUS=='3'}">待评价</c:if>
													<c:if test="${var.ORDER_STATUS=='4'}">已完成</c:if>
												</div>
												<div style="clear: both;"></div>
											</div>
											<c:forEach items="${var.goodsList}" var="vargg" varStatus="vsgg">
												<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
													<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${vargg.PATH}" style="display: block;float: left;width: 20vw;">
													<div style="width: 40vw;float: left;margin-left: 5px;">
													${vargg.GOODS_NAME}[${vargg.SPEC}]
													</div>
													<div style="text-align: right;width: 20vw;float: right;">
														<font>￥${vargg.GOODS_CURRENT_PRICE}</font><br/>
														<font style="text-decoration: line-through;color: #858E97;">￥${vargg.GOODS_ORIGINAL_PRICE}</font><br/>
														<font style="color: #858E97;">x${vargg.AMOUNT}</font>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:forEach>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共${var.AMOUNT}件商品&nbsp;&nbsp;合计：￥${var.REAL_PAY_AMOUNT}(含运费￥${var.FREIGHT_AMOUNT})
											</div>
											<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ">
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="clear: both;"></div>
												</div>
										</div>
									</li>
									</c:forEach>
					</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
		<script src="static/lshapp/mui/js/mui.min.js"></script>
		<script src="static/lshapp/mui/js/mui.pullToRefresh.js"></script>
		<script src="static/lshapp/mui/js/mui.pullToRefresh.material.js"></script>
		<script>
			mui.init();
			var currentPage=2;
			var totalPage = $("#totalPage0").val();
			var totalPage1 = $("#totalPage1").val();
			var totalPage2 = $("#totalPage2").val();
			var totalPage3 = $("#totalPage3").val();
			var totalPage4 = $("#totalPage4").val();
			(function($) {
				//阻尼系数
				var deceleration = mui.os.ios?0.003:0.0009;


				$('.mui-scroll-wrapper').scroll({
					bounce: false,
					indicators: true, //是否显示滚动条
					deceleration:deceleration
				});
				$.ready(function() {
					//循环初始化所有下拉刷新，上拉加载。
					$.each(document.querySelectorAll('.mui-slider-group .mui-scroll'), function(index, pullRefreshEl) {
						$(pullRefreshEl).pullToRefresh({
							down: {
								callback: function() {
									var self = this;
									/* if(parseInt(index)==0){

										index="";
									}else{
										index=parseInt(index)-1;
									} */
									setTimeout(function() {

										$.ajax({
					                          type:"POST",
					                          url:"<%=basePath%>lshapp/userCenter/order.do",
					                          cache: false,
					                          data: {currentPage:1,showCount:10,"ORDER_STATUS":index,zww:1},
					                          success:function(ret){
					                        	  var ul = self.element.querySelector('.mui-table-view');
					                        	  var $ul1=jQuery(ul);
					                        	  $ul1.html("");
					                        	  $ul1.append(ret);
												  self.endPullDownToRefresh();
					                          }
					                      })

									}, 1000);
								}
							} ,
							up: {

									callback: function() {
										var self = this;
										if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了
											self.endPullUpToRefresh();
										}else{
											setTimeout(function() {
												var ul = self.element.querySelector('.mui-table-view');
												var $ul1=jQuery(ul);
												if(parseInt(index)==0){
													index=0;
													totalPage=totalPage;
												}
												if(parseInt(index)==1){
													totalPage=totalPage1;
												}
												if(parseInt(index)==2){
													totalPage=totalPage2;
												}
												if(parseInt(index)==3){
													totalPage=totalPage3;
												}
												if(parseInt(index)==4){
													totalPage=totalPage4;
												}

												if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了

												}else{
													  $.ajax({
								                          type:"POST",
								                          url:"<%=basePath%>lshapp/userCenter/order.do",
								                          cache: false,
								                          data: {currentPage:currentPage,showCount:10,"ORDER_STATUS":index,zww:1},
								                          success:function(ret){
								                        	  var ul = self.element.querySelector('.mui-table-view');
																var $ul1=jQuery(ul);
								                        	  $ul1.append(ret);
																//ul.appendChild(createFragment(ul, index, 5));
																self.endPullUpToRefresh();
																currentPage++
								                          }
								                      })
												}
											}, 1000);
										}
									}
							}
						});
					});
					var createFragment = function(ul, index, count, reverse) {
						alert(index);
						var length = ul.querySelectorAll('li').length;
						var fragment = document.createDocumentFragment();
						var li;
						for (var i = 0; i < count; i++) {
							li = document.createElement('li');
							li.className = 'mui-table-view-cell';
							li.innerHTML = '第' + (index + 1) + '个选项卡子项-' + (length + (reverse ? (count - i) : (i + 1)));
							li.innerHTML=jQuery(".mui-table-view").first().children().first().html();
							fragment.appendChild(li);
						}
						return fragment;
					};
				});
			})(mui);
		</script>
		<div id="scriptNew">
			<script type="text/javascript">
			<!--支付订单-->
			mui(".zhifuOrder").on("tap","div",function(){
				var Id = $(this).attr("myvalue");
				window.location.href='<%=basePath%>lshapp/order/goOrderDetail.do?orderId='+Id;
			});
			<!--查看详情-->
			 mui(".seeOrderXQ").on("tap","div",function(){
				var Id = $(this).attr("myvalue");
				window.location.href='<%=basePath%>lshapp/order/goOrderDetail.do?orderId='+Id;
			});
			 <!--取消订单-->
			mui(".quxiaoOrder").on("tap","div",function(){
				var Id = $(this).attr("myvalue");
	                var btnArray = ['否', '是'];
	                mui.confirm('取消订单，确认？', '', btnArray, function(e) {
	                    if (e.index == 1) {
	                    	$.ajax({
	            				type: "POST",
	            				url: '<%=basePath%>lshapp/order/cancel_order.do',
	            		    	data: {ORDER_ID:Id},
	            				//cache: false,
	            				success: function(data){
	            					if(data=="success"){
	            						var name="liQ"+Id;
	            						var name1="liW"+Id;
										$("#"+name).remove();
										$("#"+name1).remove();
	            					}else{

	            					}

	            				}
	            			});
	                    } else {

	                    }
	                })
			});

			<!--确认收货-->
			mui(".querenSH").on("tap","div",function(){
				var Id = $(this).attr("myvalue");
				 var btnArray = ['否', '是'];
	                mui.confirm('确认收货，确认？', '', btnArray, function(e) {
	                    if (e.index == 1) {
	                    	$.ajax({
	            				type: "POST",
	            				url: '<%=basePath%>lshapp/order/confirm_goods.do',
	            		    	data: {ORDER_ID:Id},
	            				//cache: false,
	            				success: function(data){
	            					if(data=="success"){
	            						var name="liR"+Id;
										$("#"+name).remove();
	            					}else{

	            					}

	            				}
	            			});
	                    } else {

	                    }
	                })
			});

		</script>
		</div>

	</body>

</html>