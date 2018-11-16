<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="<%=basePath%>static/lshapp/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/lshapp/mui/css/app.css"/>
		<style>

			.title{
				margin: 20px 15px 10px;
				color: #6d6d72;
				font-size: 15px;
			}

			.oa-contact-cell.mui-table .mui-table-cell {
				padding: 11px 0;
				vertical-align: middle;
			}

			.oa-contact-cell {
				position: relative;
				margin: -11px 0;
			}

			.oa-contact-avatar {
				width: 75px;
			}
			.oa-contact-avatar img {
				border-radius: 50%;
			}
			.oa-contact-content {
				width: 100%;
			}
			.oa-contact-name {
				margin-right: 20px;
			}
			.oa-contact-name, oa-contact-position {
				float: left;
			}
		</style>
	</head>

	<body>
		<!-- <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">生日</h1>
		</header> -->
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item mui-active" href="#tabbar">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">生日</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-chat">
				<span class="mui-icon mui-icon-email"><span class="mui-badge">9</span></span>
				<span class="mui-tab-label">送礼</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-contact">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">社区</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">个人中心</span>
			</a>
		</nav>
		<div class="mui-content">
			<div id="tabbar" class="mui-control-content mui-active" style="padding: 8px;background-color: #FFFFFF;">
				<div style="border-radius:5px;background-color: #ED4C44;padding:5px;margin-left:16px;
				width: 35vw;height:25px;box-sizing:content-box;color: white;line-height: 25px;float: left;font-size: 15px;">
					<div style="float: left;margin-left: 10px;">
						<img alt="" src="static/lshapp/images/user-hdpi.png" style="width: 25px;height: 25px;">
					</div>
					<div style="float: right;margin-right: 10px;">
						添加生日
					</div>
					<div style="clear: both;"></div>
				</div>
				<div style="border-radius:5px;background-color: #F4C610;padding:5px;margin-right:16px;
				width: 35vw;height:25px;box-sizing:content-box;color: white;line-height: 25px;float: right;font-size: 15px;">
					<div style="float: left;margin-left: 10px;">
						<img alt="" src="static/lshapp/images/Anniversaries.png" style="width: 25px;height: 25px;">
					</div>
					<div style="float: right;">
						添加纪念日
					</div>
					<div style="clear: both;"></div>
				</div>
				<div style="clear: both;margin-bottom: 8px;"></div>
				<img alt="" src="static/lshapp/images/user11-hdpi.png" style="width: 15px;height: 15px;">
				<font style="font-size: 15px;color: gray;">生日</font>
				<ul class="mui-table-view mui-table-view-chevron" style="margin-top: 8px;margin-bottom: 8px;">

				<li class="mui-table-view-cell mui-media">
					<a class="mui-navigate-right">
						<img class="mui-media-object mui-pull-left" src="static/lshapp/images/default_head.png">
						<div class="mui-media-body">
							<div>
								<div style="float: left;width: 50%;">CBD<img alt="" src="static/lshapp/images/default_head.png" style="height: 15px;width: 15px;"></div>
								<div style="float: right;width: 80px;text-align: right;color: white;background-color: #ED4C44;border-radius: 5px;text-align: center;font-size: 15px;">选择礼品</div>
								<div style="clear: both;"></div>
							</div>

							<div style="font-size: 12px;">
								<div style="float: left;width: 50%;">1992.03.23</div>
								<div style="float: right;width: 50%;text-align: right;color: gray;">13790445950</div>
								<div style="clear: both;"></div>
							</div>
						</div>
					</a>
				</li>
				<li class="mui-table-view-cell mui-media">
					<a class="mui-navigate-right">
						<img class="mui-media-object mui-pull-left" src="static/lshapp/images/default_head.png">
						<div class="mui-media-body">
							<div>
								<div style="float: left;width: 50%;">CBD<img alt="" src="static/lshapp/images/default_head.png" style="height: 15px;width: 15px;"></div>
								<div style="float: right;width: 80px;text-align: right;color: white;background-color: #ED4C44;border-radius: 5px;text-align: center;font-size: 15px;">选择礼品</div>
								<div style="clear: both;"></div>
							</div>

							<div style="font-size: 12px;">
								<div style="float: left;width: 50%;">1992.03.23</div>
								<div style="float: right;width: 50%;text-align: right;color: gray;">13790445950</div>
								<div style="clear: both;"></div>
							</div>
						</div>
					</a>
				</li>
				<li class="mui-table-view-cell mui-media">
					<a class="mui-navigate-right">
						<img class="mui-media-object mui-pull-left" src="static/lshapp/images/default_head.png">
						<div class="mui-media-body">
							<div>
								<div style="float: left;width: 50%;">CBD<img alt="" src="static/lshapp/images/default_head.png" style="height: 15px;width: 15px;"></div>
								<div style="float: right;width: 80px;text-align: right;color: white;background-color: #ED4C44;border-radius: 5px;text-align: center;font-size: 15px;">选择礼品</div>
								<div style="clear: both;"></div>
							</div>

							<div style="font-size: 12px;">
								<div style="float: left;width: 50%;">1992.03.23</div>
								<div style="float: right;width: 50%;text-align: right;color: gray;">13790445950</div>
								<div style="clear: both;"></div>
							</div>
						</div>
					</a>
				</li>
			</ul>
			<img alt="" src="static/lshapp/images/Anniversaries of important events-hdpi.png" style="width: 15px;height: 15px;">
			<font style="font-size: 15px;color: gray;">纪念日</font>
			<ul class="mui-table-view" style="margin-top: 8px;">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								毕业日
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								幸福
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								幸福
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								幸福
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								幸福
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								幸福
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								幸福
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div style="float: right;height: 100%;line-height: 42px;">25天</div>
						<div class="mui-media-body">
								幸福
							<p class='mui-ellipsis'>想要这样一间小木屋，夏天挫冰吃瓜，冬天围炉取暖.</p>
						</div>
					</a>
				</li>
			</ul>
			</div>
			<div id="tabbar-with-chat" class="mui-control-content" style="background-color: #EFEFF4;">
			<!-- <div style="background-color: white;padding: 10px;position:fixed;left: 0px;top: 0px;z-index: 1000;right: 0px;">
				<div style="background-color: #F2F2F2;border-radius: 50px;padding: 5px;padding-left: 15px;width: 80vw;float: left;">
					<img alt="" src="static/lshapp/mui//images/shuijiao.jpg" style="width: 25px;height: 25px;display: block;float: left;">
					<div style="float: left;line-height: 25px;margin-left: 5px;color: gray;">搜索商品</div>
					<div style="clear: both;"></div>
				</div>
				<img alt="" src="static/lshapp/mui//images/shuijiao.jpg" style="width: 25px;height: 25px;display: block;float: right;margin-top: 5px">
				<div style="clear: both;"></div>
			</div> -->
		<div id="slider" class="mui-slider" ><!-- style="margin-top: 55px;" -->
			<div class="mui-slider-group mui-slider-loop">
				<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="static/lshapp/mui/images/yuantiao.jpg">
					</a>
				</div>
				<!-- 第一张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="static/lshapp/mui//images/shuijiao.jpg">
					</a>
				</div>
				<!-- 第二张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="static/lshapp/mui//images/muwu.jpg">
					</a>
				</div>
				<!-- 第三张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="static/lshapp/mui//images/cbd.jpg">
					</a>
				</div>
				<!-- 第四张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="static/lshapp/mui//images/yuantiao.jpg">
					</a>
				</div>
				<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="static/lshapp/mui//images/shuijiao.jpg">
					</a>
				</div>
			</div>
			<div class="mui-slider-indicator">
				<div class="mui-indicator mui-active"></div>
				<div class="mui-indicator"></div>
				<div class="mui-indicator"></div>
				<div class="mui-indicator"></div>
			</div>
		</div>
		<div>
			<img style="display: block;height: 200px;width:100%;margin: 10px 0px 0px 0px;" alt="" src="static/lshapp/mui//images/yuantiao.jpg">
		</div>
			<div style="clear: both;"></div>
			<div style="margin-bottom: 50px;">
				<div style="float: left;width: 49vw;background-color: white;margin-top: 10px;">
					<img style="width: 100%;height: 49vw;display: block;" alt="" src="static/lshapp/mui//images/yuantiao.jpg">
					<div style="height: 34px;margin: 5px;overflow: hidden;">
						<div style="float: left;background-color: #EB4D44;border-radius: 5px;color: white;font-size: 13px;padding: 2px 5px 2px 5px;margin-right: 5px;line-height: 13px;">商品<br/>折扣</div>
						<div style="font-size: 15px;line-height: 17px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
					</div>
					<div></div>
				</div>
				<div style="float: left;width: 49vw;background-color: white;margin-top: 10px;margin-left: 2vw;">
					<img style="width: 100%;height: 49vw;display: block;" alt="" src="static/lshapp/mui//images/yuantiao.jpg">
					<div style="height: 34px;margin: 5px;overflow: hidden;">
						<div style="float: left;background-color: #EB4D44;border-radius: 5px;color: white;font-size: 13px;padding: 2px 5px 2px 5px;margin-right: 5px;line-height: 13px;">商品<br/>折扣</div>
						<div style="font-size: 15px;line-height: 17px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
					</div>
					<div></div>
				</div>
				<div style="float: left;width: 49vw;background-color: white;margin-top: 10px;">
					<img style="width: 100%;height: 49vw;display: block;" alt="" src="static/lshapp/mui//images/yuantiao.jpg">
					<div style="height: 34px;margin: 5px;overflow: hidden;">
						<div style="float: left;background-color: #EB4D44;border-radius: 5px;color: white;font-size: 13px;padding: 2px 5px 2px 5px;margin-right: 5px;line-height: 13px;">商品<br/>折扣</div>
						<div style="font-size: 15px;line-height: 17px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
					</div>
					<div></div>
				</div>
				<div style="float: left;width: 49vw;background-color: white;margin-top: 10px;margin-left: 2vw;">
					<img style="width: 100%;height: 49vw;display: block;" alt="" src="static/lshapp/mui//images/yuantiao.jpg">
					<div style="height: 34px;margin: 5px;overflow: hidden;">
						<div style="float: left;background-color: #EB4D44;border-radius: 5px;color: white;font-size: 13px;padding: 2px 5px 2px 5px;margin-right: 5px;line-height: 13px;">商品<br/>折扣</div>
						<div style="font-size: 15px;line-height: 17px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
					</div>
					<div></div>
				</div>
				<div style="float: left;width: 49vw;background-color: white;margin-top: 10px;">
					<img style="width: 100%;height: 49vw;display: block;" alt="" src="static/lshapp/mui//images/yuantiao.jpg">
					<div style="height: 34px;margin: 5px;overflow: hidden;">
						<div style="float: left;background-color: #EB4D44;border-radius: 5px;color: white;font-size: 13px;padding: 2px 5px 2px 5px;margin-right: 5px;line-height: 13px;">商品<br/>折扣</div>
						<div style="font-size: 15px;line-height: 17px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
					</div>
					<div></div>
				</div>
				<div style="float: left;width: 49vw;background-color: white;margin-top: 10px;margin-left: 2vw;">
					<img style="width: 100%;height: 49vw;display: block;" alt="" src="static/lshapp/mui//images/yuantiao.jpg">
					<div style="height: 34px;margin: 5px;overflow: hidden;">
						<div style="float: left;background-color: #EB4D44;border-radius: 5px;color: white;font-size: 13px;padding: 2px 5px 2px 5px;margin-right: 5px;line-height: 13px;">商品<br/>折扣</div>
						<div style="font-size: 15px;line-height: 17px;">顶替大规模顶替大规模顶替大规模顶替大规模顶替大规模</div>
					</div>
					<div></div>
				</div>
				<div style="clear: both;"></div>
			</div>
			</div>
			<div id="tabbar-with-contact" class="mui-control-content">
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
			</div>
			<div id="tabbar-with-map" class="mui-control-content"><!--
				<div class="title">这是div模式选项卡中的第4个子页面，该页面展示一个常见的设置示例.</div> -->
				<ul class="mui-table-view mui-table-view-chevron">
					<li class="mui-table-view-cell mui-media">
						<a class="mui-navigate-right" href="#account">
							<img class="mui-media-object mui-pull-left head-img" id="head-img" src="static/lshapp/images/default_head.png">
							<div class="mui-media-body">
								Hello MUI<img alt="" style="width: 17px;height: 17px;" src="static/lshapp/images/center/Girl student-hdpi.png">
								<p class='mui-ellipsis'><img alt="" style="width: 14px;height: 14px;" src="static/lshapp/images/center/Grade-hdpi.png">普通会员</p>
							</div>
						</a>
					</li>
				</ul>
				<div style="background-color: #FFFFFF;margin-top: 10px;margin-bottom: 10px;padding-bottom: 10px;">
					<div style="float: left;width: 25vw;">
						<div style="width: 25px;height: 25px;margin: 10px auto;">
							<img style="width: 100%;height: 100%;" alt="" src="static/lshapp/images/default_head.png">
						</div>
						<div style="text-align: center;">购物车</div>
					</div>
					<div style="float: left;width: 25vw;">
						<div style="width: 25px;height: 25px;margin: 10px auto;">
							<img style="width: 100%;height: 100%;" alt="" src="static/lshapp/images/default_head.png">
						</div>
						<div style="text-align: center;">订单</div>
					</div>
					<div style="float: left;width: 25vw;">
						<div style="width: 25px;height: 25px;margin: 10px auto;">
							<img style="width: 100%;height: 100%;" alt="" src="static/lshapp/images/default_head.png">
						</div>
						<div style="text-align: center;">推荐码</div>
					</div>
					<div style="float: left;width: 25vw;">
						<div style="width: 25px;height: 25px;margin: 10px auto;">
							<img style="width: 100%;height: 100%;" alt="" src="static/lshapp/images/default_head.png">
						</div>
						<div style="text-align: center;">收藏</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right">
						新消息通知
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right">
						隐私
					</a>
				</li>
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right">
						通用
					</a>
				</li>
			</ul><!--
			<ul class="mui-table-view" style="margin-top: 25px;">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right">
						关于mui
					</a>
				</li>
			</ul> -->
			<ul class="mui-table-view" style="margin-top: 25px;">
				<li class="mui-table-view-cell">
					<a style="text-align: center;color: #FF3B30;">
						退出登录
					</a>
				</li>
			</ul>
			</div>
		</div>
	</body>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script src="<%=basePath%>static/lshapp/mui/js/mui.min.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		var slider = mui("#slider");
		document.getElementById("switch").addEventListener('toggle', function(e) {
			if (e.detail.isActive) {
				slider.slider({
					interval: 5000
				});
			} else {
				slider.slider({
					interval: 0
				});
			}
		});
	</script>
</html>