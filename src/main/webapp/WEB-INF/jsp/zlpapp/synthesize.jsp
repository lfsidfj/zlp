<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>菌菇类</title>
    <base href="<%=basePath%>">
    <link href="static/lshapp/css/goods_type.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/goods_type.js"></script>
<style type="text/css">
	.return_image{
		width:1.2rem;
		height:1.8rem;
	}
	.search_image{
		width:1.5rem;
		height:1.5rem;
		margin-left: -2rem;
		margin-right:0.5rem;
		margin-top: -2px;
	}
	.jt_image{
		width: 1.3rem;
    	height: 1.3rem;
    	position: absolute;
   		left: .2rem;
   		top: 31.6%;
	}
	.viewlist_image{
		width:2.2rem;
		height:2.2rem;
		margin-top: -0.5rem;
	}
	.isNoMore{
		text-align: center;
		font-size: 1.4rem;
		font-style: initial;
		color: gray;
		font-weight: bold;
		padding: 0.5rem;
	}
	.hidden_noMore{
		display:none;
	}
	.selcet_active {
   	 	color: #ec5151;
	}
</style>
</head>
<body>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>

		<div class="con" id="checkPage" style="display: block;">
			<div class="category">
				<section class="search category-search common-search">
                    <div class="text-all dis-box j-text-all text-all-back">
                        <a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
                        	<img class="return_image" src="static/lshapp/images/return.png">
                        </a>
				  <div class="box-flex input-text n-input-text i-search-input" onclick="searchGoods();">
                        <div class="a-search-input" ></div>
                        <div class="j-input-text nav-soso">
                        	<img class="search_image" src="static/lshapp/images/search.png">商品搜索
                        </div>
				</section>
				<section class="product-sequence dis-box">
					<input type="hidden" name="GOODSTYPE_ID" id="GOODSTYPE_ID" value="${pd.GOODSTYPE_ID}"/>
                    <div id="synthesize" class="box-flex selcet_active" onclick="goodsSynthesize('${pd.GOODSTYPE_ID}');">综合</div>
                    <div id="salesVolume" class="box-flex " onclick="salesVolume('${pd.GOODSTYPE_ID}');">销量</div>
					<div id="currentPrice" class="box-flex " onclick="currentPrice('${pd.GOODSTYPE_ID}');">价格</div>
					<!-- <a class="a-sequence j-a-sequence">
						<img class="iconfont icon-viewlist viewlist_image" src="static/lshapp/images/viewlist.png" data="2">
					</a> -->
				</section>
                <!-- 内容 -->
				<section class="product-list j-product-list  product-list-small" data="2">
					<input type="hidden" name="totalPage" id="totalPage" value="${totalPage}"/>
					<input type="hidden" name="keywords" id="keywords" value="${pd.keywords}"/>
					<c:if test="${not empty goodsList}">
						<ul id="type_goods">
		                       <c:forEach items="${goodsList}" var="var" varStatus="vs">
			                        <li>
			                            <div class="product-div" onclick="goGoods('${var.GOODS_ID}')">
			                                <img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">
			                                <div class="product-text index-product-text">
			                                   	<h4>${var.GOODS_NAME}</h4>
			                                    <p>
			                                  	  <span class="p-price t-first ">¥${var.CURRENT_PRICE}</span>
			                                    </p>
			                                    <p class="dis-box p-t-remark">
			                                    	<span class="box-flex">销量：${var.SALES_VOLUME}</span>
			                                    </p>
			                                    <div  class="icon-flow-cart fr j-goods-attr" onclick="addToCart(4409, 0)">
			                                    	<img style="width: 1.8rem;height: 1.8rem;margin: 0.4rem auto;border:0;" src="static/lshapp/images/shopping_cart.png" />
			                                   </div>
			                               </div>
			                           </div>
			                       </li>
		                       </c:forEach>
	                    </ul>
                    </c:if>
                    <c:if test="${empty goodsList}">
                   		 <div class="isNoMore"><p id="tv_more">暂无商品</p></div>
                    </c:if>
                    <div id="isNoMore" class="isNoMore hidden_noMore"><p id="tv_more">没有更多了</p></div>
                    </section>
			</div>
            </div>
           
            <div class="choose-address-page" id="chooseAddressPage" style="display: none;">
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
                <i class="iconfont icon-jiantou"></i>
                <span>顶部</span>
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
	var totalPage = $("#totalPage").val();
	var keywords = $("#keywords").val();
	var isMore=false;//是否正在下拉耍新
	// 下拉加载更多     
	var currentPage=2;
	function goGoods(Id){ // 商品详情
		window.location.href="<%=basePath%>lshapp/shop/goods.do?index=index&GOODS_ID="+Id;
	}
	function searchGoods(){ // 搜索商品
		window.location.href="<%=basePath%>lshapp/shop/search.do";
	}
	function goodsSynthesize(Id){ // 综合排序
		if(!$("#synthesize").hasClass("selcet_active")){
			$.ajax({ // 加载更多数据
	            type:"POST",
	            url:'<%=basePath%>lshapp/shop/typeGoods.do',
	            //dataType:'json',
	            cache: false,
	            data: {"SEQENCE":"SEQENCE",GOODSTYPE_ID:Id,"keywords":keywords},
	            beforeSend:function(){
	              d_messages("正在加载...");
	            },
	            success:function(ret){
	            	$("#synthesize").addClass("selcet_active");
	            	$("#salesVolume").removeClass("selcet_active");
	            	$("#currentPrice").removeClass("selcet_active");
	            	currentPage=2;
	            	$("#isNoMore").addClass("hidden_noMore");
	                 $("#type_goods").html(ret); //将ajxa请求的数据追加到内容里面
	            }
	        });
		};
	}
	function salesVolume(Id){ // 销量排序
		if(!$("#salesVolume").hasClass("selcet_active")){
			$.ajax({ // 加载更多数据
	            type:"POST",
	            url:'<%=basePath%>lshapp/shop/typeGoods.do',
	            //dataType:'json',
	            cache: false,
	            data: {"SALES_VOLUME":"SALES_VOLUME","keywords":keywords},
	            beforeSend:function(){
	            	d_messages("正在加载..."); //显示加载时候的提示
	            },
	            success:function(ret){
	            	$("#synthesize").removeClass("selcet_active");
	            	$("#salesVolume").addClass("selcet_active");
	            	$("#currentPrice").removeClass("selcet_active");
	            	currentPage=2;
	            	$("#isNoMore").addClass("hidden_noMore");
	                 $("#type_goods").html(ret); //将ajxa请求的数据追加到内容里面
	            }
	        });
		}
	}
	function currentPrice(Id){ // 价格排序
		if(!$("#currentPrice").hasClass("selcet_active")){
			$.ajax({ // 加载更多数据
	            type:"POST",
	            url:'<%=basePath%>lshapp/shop/typeGoods.do',
	            //dataType:'json',
	            cache: false,
	            data: {"CURRENT_PRICE":"CURRENT_PRICE","keywords":keywords},
	            beforeSend:function(){
	            	d_messages("正在加载..."); //显示加载时候的提示
	            },
	            success:function(ret){
	            	$("#synthesize").removeClass("selcet_active");
	            	$("#salesVolume").removeClass("selcet_active");
	            	$("#currentPrice").addClass("selcet_active");
	            	currentPage=2;
	            	$("#isNoMore").addClass("hidden_noMore");
	                 $("#type_goods").html(ret); //将ajxa请求的数据追加到内容里面
	            }
	        });
		};
	}
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
	                          url:'<%=basePath%>lshapp/shop/typeGoodsMore.do',
	                          //dataType:'json',
	                          cache: false,
	                          data: {currentPage:currentPage,showCount:10,"keywords":keywords},
	                          beforeSend:function(){
	                        	  d_messages("正在加载..."); //显示加载时候的提示
	                          },
	                          success:function(ret){
		                           $("#type_goods").append(ret); //将ajxa请求的数据追加到内容里面
		                           currentPage ++;
		                           $("#isNoMore").addClass("hidden_noMore");
		                           $("#tv_more").val("没有更多了");
		                           isMore = false;
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
</body></html>