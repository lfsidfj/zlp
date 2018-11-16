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
				padding: 0px;
			}
			.mui-segmented-control.mui-scroll-wrapper .mui-control-item{
				width: 32vw;
			}
		</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">我的贴子</h1>
		</header>
		<div class="mui-content">
			<div id="slider" class="mui-slider mui-fullscreen">
				<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<div class="mui-scroll">
						<a class="mui-control-item mui-active" href="#item1mobile">
							我的贴子
						</a>
						<a class="mui-control-item" href="#item2mobile">
							我的评论
						</a>
						<a class="mui-control-item" href="#item3mobile">
							回复我的
						</a>
					</div>
				</div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="background-color: white;padding: 5vw;margin-top: 5px;margin-bottom: 5px;">
											<div>
												<div style="float: left;width: 30px;height: 30px;margin-right: 10px;"><img style="width: 100%;height: 100%;" alt="" src="static/lshapp/images/default_head.png"></div>
												<div style="float: left;height: 30px;width: 50vw;">
													<div style="height: 15px;font-size: 15px;">陈某<img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/default_head.png"></div>
													<div style="font-size: 13px;color: gray;">2018.05.12</div>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="margin-top: 10px;margin-bottom: 10px;">大规模数学情书大规模数学情书大规模数学情书大规模数学情书大规模数学情书大规模数学情书
											</div>
											<div>
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-bottom: 3vw;" alt="" src="static/lshapp/images/default_head.png">
												<div style="clear: both;"></div>
											</div>
											<div>
												<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/default_head.png">40
												</div>
												<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/default_head.png">40
												</div>
												<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/default_head.png">40
												</div>
												<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/default_head.png">40
												</div>
											</div>
											<div style="clear: both;"></div>
										</div>
									</li><!--
									<li class="mui-table-view-cell">
										第1个选项卡子项-2
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-3
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-4
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-5
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-6
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-7
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-8
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-9
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-10
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-11
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-12
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-13
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-14
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-15
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-16
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-17
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-18
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-19
									</li>
									<li class="mui-table-view-cell">
										第1个选项卡子项-20
									</li> -->
								</ul>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="padding: 10px;">
											<div style="width: 15vw;float: left;margin-right: 10px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="width: 100%;height: 15vw;">
											</div>
											<div style="width: 50vw;float: left;">
												<div><font>你回复了</font><font style="color: #858E97;">炮时</font></div>
												<div style="margin: 10px 0px 10px 0px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
												<div>
													<div style="float: left;color: #858E97;">06月17日</div>
													<div style="float: left;border: 1px solid #E5E5E5;border-radius: 50px;padding-left: 10px;padding-right: 10px;margin-left: 10px;">回复</div>
												</div>
											</div>
											<div style="background-color: #F5F5F5;float: right;width: 20vw;padding: 5px;">
											大规模加格达奇非机动车大规模加格达奇非机动车
											</div>
											<div style="clear: both;"></div>
										</div>
									</li>
									<li class="mui-table-view-cell">
										<div style="padding: 10px;">
											<div style="width: 15vw;float: left;margin-right: 10px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="width: 100%;height: 15vw;">
											</div>
											<div style="width: 50vw;float: left;">
												<div><font>你回复了</font><font style="color: #858E97;">炮时</font></div>
												<div style="margin: 10px 0px 10px 0px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
												<div>
													<div style="float: left;color: #858E97;">06月17日</div>
													<div style="float: left;border: 1px solid #E5E5E5;border-radius: 50px;padding-left: 10px;padding-right: 10px;margin-left: 10px;">回复</div>
												</div>
											</div>
											<div style="background-color: #F5F5F5;float: right;width: 20vw;padding: 5px;">
											大规模加格达奇非机动车大规模加格达奇非机动车
											</div>
											<div style="clear: both;"></div>
										</div>
									</li><!--
									<li class="mui-table-view-cell">
										第2个选项卡子项-2
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-3
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-4
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-5
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-6
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-7
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-8
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-9
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-10
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-11
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-12
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-13
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-14
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-15
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-16
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-17
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-18
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-19
									</li>
									<li class="mui-table-view-cell">
										第2个选项卡子项-20
									</li> -->
								</ul>
							</div>
						</div>
					</div>
					<div id="item3mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<div style="padding: 10px;">
											<div style="width: 15vw;float: left;margin-right: 10px;">
												<img alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png" style="width: 100%;height: 15vw;">
											</div>
											<div style="width: 50vw;float: left;">
												<div><font>炮时</font><font style="color: #858E97;">回复了你</font></div>
												<div style="margin: 10px 0px 10px 0px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
												<div>
													<div style="float: left;color: #858E97;">06月17日</div>
													<div style="float: left;border: 1px solid #E5E5E5;border-radius: 50px;padding-left: 10px;padding-right: 10px;margin-left: 10px;">回复</div>
												</div>
											</div>
											<div style="background-color: #F5F5F5;float: right;width: 20vw;padding: 5px;">
											大规模加格达奇非机动车大规模加格达奇非机动车
											</div>
											<div style="clear: both;"></div>
										</div>
									</li><!--
									<li class="mui-table-view-cell">
										第3个选项卡子项-1
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-2
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-3
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-4
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-5
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-6
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-7
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-8
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-9
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-10
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-11
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-12
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-13
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-14
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-15
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-16
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-17
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-18
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-19
									</li>
									<li class="mui-table-view-cell">
										第3个选项卡子项-20
									</li> -->
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
									var ul = self.element.querySelector('.mui-table-view');
									var $ul1=jQuery(ul);
									$ul1.append(jQuery(".mui-table-view").first().children().first().html());
									self.endPullUpToRefresh();
									/* setTimeout(function() {
										var ul = self.element.querySelector('.mui-table-view');
										var $ul1=jQuery(ul);
										$ul1.append(jQuery(".mui-table-view").first().children().first().html());
										//ul.appendChild(createFragment(ul, index, 5));
										self.endPullUpToRefresh();
									}, 1000); */
									
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
		<script type="text/javascript">
			
		</script>
	</body>

</html>