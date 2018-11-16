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
		<title>收藏</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="static/lshapp/mui/css/mui.min.css">
		<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
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
			.mui-segmented-control.mui-scroll-wrapper .mui-control-item{
				width: 49vw;
			}
		</style>
		<script type="text/javascript">

		</script>
	</head>

	<body>
		<!-- <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">我的收藏</h1>
		</header> -->
		<div class="mui-content">
			<div id="slider" class="mui-slider mui-fullscreen">
				<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<div class="mui-scroll">
						<a class="mui-control-item mui-active" href="#item1mobile">
							商品
						</a>
						<a class="mui-control-item" href="#item2mobile">
							贴子
						</a>
					</div>
					<input type="hidden" name="totalPage1" id="totalPage1" value="${totalPage1}"/>
					<input type="hidden" name="totalPage2" id="totalPage2" value="${totalPage2}"/>
				</div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view" id="goodsList">
								<c:forEach items="${goodsList}" var="var" varStatus="vs">
									<li class="mui-table-view-cell">
										<div style="padding: 15px;background-color: white;margin-top: 10px;">
										<div class="goodsXQ">
				<img style="width: 20vw;height: 20vw;border: 1px solid #DCDCDC;float: left;" myvalue="${var.GOODS_ID}"  alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">

			</div>
											<div style="width: 67vw;height: 20vw;float: left;margin-left: 10px;">
												<div style="height: 12vw;" class="goodsNM">
													<div myvalue="${var.GOODS_ID}">${var.GOODS_NAME}</div>
												</div>
												<div style="height: 4vw;color: #989898;">${var.FAVORITE_NUMBER}人收藏</div>
												<div style="height: 4vw;" class="deleteGoods">
													<div style="float: left;color: red;">￥${var.CURRENT_PRICE}</div>
													<img alt=""  style="width: 15px;height: 15px;float: right;"  myvalue="${var.COLLECTION_ID}"  src="static/lshapp/images/center/delete1-hdpi.png">
												</div>
											</div>
											<div style="clear: both;"></div>
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
								<ul class="mui-table-view" id="artList">
								<c:forEach items="${articleList}" var="var" varStatus="vs">
									<li class="mui-table-view-cell">
										<div style="padding: 15px;background-color: white;margin-top: 10px;">
											<div style="margin-bottom: 10px;">
												<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.USER_PATH}" style="float: left;width: 45px;height: 45px;border-radius:100px; ">
												<div style="float: left;margin-left: 15px;">
													${var.NICK_NAME}&nbsp;&nbsp;<img style="width: 15px;height: 15px;vertical-align: middle;" alt="" src="
														<c:if test="${var.SEX=='1'}">static/lshapp/images/Girl_student-hdpi.png</c:if>
														<c:if test="${var.SEX=='2'}">static/lshapp/images/Schoolboy-hdpi.png</c:if>
													"><br/>
													<font style="color: #989898;">${var.CREATE_DATE}</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="font-size: 16px;" class="conntent"  >
												<div myvalue="${var.ARTICLE_ID}">${var.CONTENT}</div>
											</div>
											<div style="margin-top: 15px;">
												<div style="float: left;margin-left: 15px;">
													<img style="width: 15px;height: 15px;vertical-align: middle;" alt="" src="static/lshapp/images/browse-hdpi.png">
													<font style="color: #989898;">${var.VISITOR_VOLUME}</font>
												</div>
												<div style="float: right;margin-left: 15px;" class="articleXQN"  >
													<img style="width: 15px;height: 15px;vertical-align: middle;" myvalue="${var.COLLECTION_ID}" alt="" src="static/lshapp/images/center/delete1-hdpi.png">
													<font style="color: #989898;"></font>
												</div>
												<div style="float: right;margin-left: 15px;" class="articleXQ"  >
													<img style="width: 15px;height: 15px;vertical-align: middle;" myvalue="${var.ARTICLE_ID}" alt="" src="static/lshapp/images/comment-xhdpi.png">
													<font style="color: #989898;">${var.COMMENT_COUNT}</font>
												</div>
												<div style="float: right;margin-left: 15px;" class="dianza"   >
													<!-- <img style="width: 15px;height: 15px;vertical-align: middle;" alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png">
													 --><img id="img${var.ARTICLE_ID}" myvalue="${var.ARTICLE_ID}" style="width: 15px;height: 15px;vertical-align: middle;" src="
													 <c:if test="${var.A_ID != null }">static/lshapp/images/A_little_praise1.png</c:if>
													 <c:if test="${var.A_ID == null }">static/lshapp/images/No_praise1.png</c:if>">
													<font style="color: #989898;" id="font${var.ARTICLE_ID}">${var.PRAISE_VOLUME}</font>
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
			var totalPage1 = $("#totalPage1").val();
			var totalPage2 = $("#totalPage2").val();
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
										$.ajax({
					                          type:"POST",
					                          url:"<%=basePath%>lshapp/userCenter/favorite.do",
					                          cache: false,
					                          data: {currentPage:1,showCount:10,"COLLECTION_TYPE":index},
					                          success:function(ret){
					                        	  var ul = self.element.querySelector('.mui-table-view');
					                        	  var $ul1=jQuery(ul);
					                        	  $ul1.html("");
					                        	  $ul1.append(ret);
					                        	  jQuery("#scriptNew").remove();

													self.endPullDownToRefresh();
					                          }
					                      })
									}, 1000);
								}
							},
							up: {
								callback: function() {
									var self = this;
									if(parseInt(index)==0){
										totalPage=totalPage2;
									}
									if(parseInt(index)==1){
										totalPage=totalPage1;
									}
									if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了
										self.endPullUpToRefresh();
									}else{
									setTimeout(function() {
										$.ajax({
					                          type:"POST",
					                          url:"<%=basePath%>lshapp/userCenter/favorite.do",
					                          cache: false,
					                          data: {currentPage:currentPage,showCount:10,"COLLECTION_TYPE":index},
					                          success:function(ret){
					                        	  var ul = self.element.querySelector('.mui-table-view');
					                        	  var $ul1=jQuery(ul);
					                        	  $ul1.append(ret);
													//ul.appendChild(createFragment(ul, index, 5));
													jQuery("#scriptNew").remove();
													self.endPullUpToRefresh();
													currentPage++
					                          }
					                      })
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
		mui(".goodsXQ").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
 			window.location.replace("<%=basePath%>lshapp/shop/goods.do?GOODS_ID="+Id);
		});
		mui(".goodsNM").on("tap","div",function(){
			var Id = $(this).attr("myvalue");
 			window.location.replace("<%=basePath%>lshapp/shop/goods.do?GOODS_ID="+Id);
		});
		<!--删除收藏的商品-->
		mui(".deleteGoods").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
			var btnArray = ['否', '是'];
			mui.confirm('删除收藏商品，确认？', '', btnArray, function(e) {
                if (e.index == 1) {
                	$.ajax({
        				type: "POST",
        				url: '<%=basePath%>lshapp/userCenter/delete_favorite.do',
        		    	data: {COLLECTION_ID:Id,"COLLECTION_TYPE":0},
        				//cache: false,
        				success: function(data){
        					$("#goodsList").html(data);
        				}
        			});
                } else {

                }
            })

		});
		<!--去帖子详情-->
		mui(".articleXQ").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
			window.location.href='<%=basePath%>lshapp/article/articleDetail.do?ARTICLE_ID='+Id;
		});
		mui(".articleXQN").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
			var btnArray = ['否', '是'];
			 mui.confirm('删除收藏的帖子，确认？', '', btnArray, function(e) {
                 if (e.index == 1) {
                	 $.ajax({
         				type: "POST",
         				url: '<%=basePath%>lshapp/userCenter/delete_favorite.do',
         		    	data: {COLLECTION_ID:Id,"COLLECTION_TYPE":1},
         				//cache: false,
         				success: function(data){
         					$("#artList").html(data);
         				}
         			});
                 } else {

                 }
             })
		});
		<!--去帖子详情-->
		mui(".conntent").on("tap","div",function(){
			var Id = $(this).attr("myvalue");
			window.location.href='<%=basePath%>lshapp/article/articleDetail.do?ARTICLE_ID='+Id;
		});
		<!--点赞-->
		mui(".dianza").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
 			$.ajax({
				type: "POST",
				url: '<%=basePath%>lshapp/article/articlePraise.do?',
		    	data: {ARTICLE_ID:Id},
				dataType:'json',
				//cache: false,
				success: function(data){
					$("#img"+Id).attr("src","static/lshapp/images/A_little_praise1.png");
					//$(th).find("img").attr("src","static/lshapp/images/A_little_praise1.png");
					//$(th).find("span").text(" "+data);
					$("#font"+Id).text(" "+data);
				}
			});
		});
		</script>
		</div>

	</body>

</html>