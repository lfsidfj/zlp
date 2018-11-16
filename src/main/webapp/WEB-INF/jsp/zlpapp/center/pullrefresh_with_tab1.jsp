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
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

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
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">我的订单</h1>
		</header>
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
				</div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：266548954668</div>
												<div style="float: right;color: red;">交易成功</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共2件商品&nbsp;&nbsp;合计：￥19.00(含运费￥0.00)
											</div>
											<div style="padding: 5px;">
												<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;">查看详情</div>
												<div style="clear: both;"></div>
											</div>
										</div>
									</li>


									<li class="mui-table-view-cell">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：266548954668</div>
												<div style="float: right;color: red;">交易成功</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共2件商品&nbsp;&nbsp;合计：￥19.00(含运费￥0.00)
											</div>
											<div style="padding: 5px;">
												<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;">查看详情</div>
												<div style="clear: both;"></div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：266548954668</div>
												<div style="float: right;color: red;">交易成功</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共2件商品&nbsp;&nbsp;合计：￥19.00(含运费￥0.00)
											</div>
											<div style="padding: 5px;">
												<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;">查看详情</div>
												<div style="clear: both;"></div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="item3mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：266548954668</div>
												<div style="float: right;color: red;">交易成功</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共2件商品&nbsp;&nbsp;合计：￥19.00(含运费￥0.00)
											</div>
											<div style="padding: 5px;">
												<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;">查看详情</div>
												<div style="clear: both;"></div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="item4mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：266548954668</div>
												<div style="float: right;color: red;">交易成功</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共2件商品&nbsp;&nbsp;合计：￥19.00(含运费￥0.00)
											</div>
											<div style="padding: 5px;">
												<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;">查看详情</div>
												<div style="clear: both;"></div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="item5mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="background-color: white;margin:8px 0px 0px 0px;">
											<div style="padding: 5px;">
												<div style="float: left;">订单编号：266548954668</div>
												<div style="float: right;color: red;">交易成功</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;background-color: #FAFAFA;margin-bottom: 3px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="display: block;float: left;width: 20vw;">
												<div style="width: 40vw;float: left;margin-left: 5px;">
												木耳肉片饭
												</div>
												<div style="text-align: right;width: 20vw;float: right;">
													<font>￥14.47</font><br/>
													<font style="text-decoration: line-through;color: #858E97;">￥16.00</font><br/>
													<font style="color: #858E97;">x1</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="padding: 5px;text-align: right;border-bottom: 1px solid #C8C7CC;">
												共2件商品&nbsp;&nbsp;合计：￥19.00(含运费￥0.00)
											</div>
											<div style="padding: 5px;">
												<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;">查看详情</div>
												<div style="clear: both;"></div>
											</div>
										</div>
									</li>
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
									setTimeout(function() {
										var ul = self.element.querySelector('.mui-table-view');
										ul.insertBefore(createFragment(ul, index, 10, true), ul.firstChild);
										self.endPullDownToRefresh();
									}, 1000);
								}
							},
							up: {
								callback: function() {
									var self = this;
									setTimeout(function() {
										var ul = self.element.querySelector('.mui-table-view');
										var $ul1=jQuery(ul);
										$ul1.append(jQuery(".mui-table-view").first().children().first().html());
										//ul.appendChild(createFragment(ul, index, 5));
										self.endPullUpToRefresh();
									}, 1000);
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
	</body>

</html>