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
<html><head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>我的抽奖</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
    <script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		function mygoods(obj){

			if($("#goods").hasClass("active")){
				//alert("checked");
				}else{
					$("#goods").addClass("active");
					$("#invitation").removeClass("active");
					//alert("notchecked");
				}
			window.location.replace("<%=basePath%>lshapp/userCenter/favorite.do?COLLECTION_TYPE="+0);
			/* document.getElementById("myInvitation").style.display="none";
			document.getElementById("myGoods").style.display="block"; */
		}
		function myinvitation(obj){
			var id=document.getElementById("back");
			if($("#invitation").hasClass("active")){
			//alert("checked");
			}else{
				$("#invitation").addClass("active");
				$("#goods").removeClass("active");
				//alert("notchecked");
			}
			window.location.replace("<%=basePath%>lshapp/userCenter/favorite.do?COLLECTION_TYPE="+1);
			<%-- /*window.location.href="<%=basePath%>lshapp/userCenter/favorite.do?COLLECTION_TYPE="+1;
			 document.getElementById("myGoods").style.display="none";
			document.getElementById("myInvitation").style.display="block"; */ --%>

		}
	</script>
	 <script type="text/javascript">

	 	var currentPage=2;
	 	var isMore=false;//是否正在下拉耍新
       $(document).ready(function(){
         $(window).scroll(function(){
           if($(document).scrollTop()>=$(document).height()-$(window).height()){
        	   var totalPage = $("#totalPage").val();
         	  if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了

         	  }else{
         		  if(!isMore){
         			  isMore = true;
         			 $.ajax({
                         type:"post",
                         url:"<%=basePath%>lshapp/userCenter/award.do",
                         data:{currentPage:currentPage,showCount:10},
                         beforeSend:function(){
                           $('.ajax_loading').show() //显示加载时候的提示
                         },
                         success:function(ret){
                        	 $("#myAward").after(ret) //将ajxa请求的数据追加到内容里面
                          $('.ajax_loading').hide() //请求成功,隐藏加载提示
                          currentPage ++;
                         }
                     })
         			   return true;
         	  }else{
     				return false;
     			}
         	  }

           }
         })
       })
        </script>
        <script type="text/javascript">
        	<!--去商品详情-->
	        function querenlingqu(Id,id1){
	        	window.location.replace("<%=basePath%>lshapp/shop/goods.do?CART_ID="+Id+"&GOODS_ID="+id1);
	        }
        	<!--去提交订单-->
	        function querenlingqu1(Id,id1){
	        	window.location.replace("<%=basePath%>lshapp/order/submit.do?ids="+Id);
	        }
	        function querenlingqu3(AWARD_ID,IS_LOGIN){
	        	$.ajax({
	  		        type:"post",//请求方式get/post
	  		        url:'<%=basePath%>lshapp/userCenter/get_award_record.do?AWARD_ID='+AWARD_ID+'&IS_LOGIN='+IS_LOGIN+'&TYPE='+1,//请求对应的地址

		  		        success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
		  		        	window.location.replace("<%=basePath%>lshapp/userCenter/award.do?currentPage=1");
		  		        }
		   	 	});

	        }
        	<!--去重新支付-->
	        function querenlingqu2(Id,id1){
	        	window.location.replace("<%=basePath%>lshapp/order/goOrderDetail.do?orderId="+Id);
	        }
	        function xiangqing(Id){
	        	window.location.replace("<%=basePath%>lshapp/order/goOrderDetail.do?orderId="+Id);
	        }
        </script>
    <style type="text/css">
	.user_icon{
			width: 2rem;
			height: 1.9rem;
			border-radius: 0.5rem;
	}
	.user_icon1{
		width: 1.8rem;
		height: 1.8rem;
		margin-top:-0.29rem;
	}
	.return_image{
			width:1.2rem;
			height:1.8rem;
		}
	.div_award{
		padding: .3rem .8rem;
		font-size: 1.4rem;
		width: auto;color: #EE4B46;
		border: 1px solid #EE4B46;
		border-radius: 0.5rem;
	}
	</style>
</head>
<body>
<jsp:include page="../head_title.jsp">
	<jsp:param value="我的抽奖记录" name="pageTitle"/>
</jsp:include>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>
		<div class="con">
				<!-- <section class="search category-search common-search" style="background-color: white;">
			       <div class="text-all dis-box j-text-all text-all-back">
								<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
			                        	<img class="return_image" src="static/lshapp/images/return.png">
			                   </a>
							  <div style="text-align: center;width: 80%;" >
			                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">我的抽奖记录</span>
							  </div>
					</div>
	  			</section>
	  			  <hr style="height:1px;border:none;border-top:1px solid #E1E1E1;width: 100%;margin-top: -1.0rem;" /> -->
				<div class="goods-info user-order of-hidden ts-3" style="margin-top: -6.0rem;" id="myAward">
							<c:forEach items="${awardList}" var="var" varStatus="vs">
							<section class="store_info">
							<section class="flow-checkout-pro  m-top08">
								<header class="b-color-f dis-box padding-all">
									<span class=" box-flex">
										<input type="hidden" name="totalPage" id="totalPage" value="${totalPage}"/>
										 <label class="t-remark"> 抽奖时间:${var.CREATE_DATE}</label>
									</span>
									<!--状态，0为未领取，1为已领取  -->
									<em class="j-goods-coupon t-first f-04">
										<%-- <c:if test="${var.STATUS=='0' }">未领取</c:if>
										<c:if test="${var.STATUS=='1' }">已领取</c:if> --%>
										<c:if test="${var.TYPE=='0'}">
											<c:if test="${var.ORDER_STATUS!=null}">
												<c:if test="${var.ORDER_STATUS!='0'}">已领取</c:if>
												<c:if test="${var.ORDER_STATUS=='0'}">未领取</c:if>
											</c:if>
											<c:if test="${var.ORDER_STATUS==null}">
												未领取
											</c:if>

										</c:if>
										<c:if test="${var.TYPE=='1'}">
											<c:if test="${var.STEP=='2'}">已领取</c:if>
											<c:if test="${var.STEP!='2'}">未领取</c:if>

										</c:if>
									</em>
								</header>
							<section class="flow-checkout-pro j-flow-checkout-pro  active" >
										<div class="product-list-small m-top1px b-color-f dis-box">
										   <ul class="box-flex flow-checkout-bigpic">
										   			<li>
														<div class="product-div">

															<img class="product-list-img" style="width: 10rem;height: 10rem;" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">
															<div class="product-text">
																<h4>
																</h4>
																<p><span class="p-price t-first" style="color:black">
																<c:if test="${var.TYPE=='0' }">${var.GOODS_NAME }</c:if>
																	<c:if test="${var.TYPE=='1' }">${var.AWARD_NAME }礼豆</c:if>
																<small class="fr t-remark" style="color:#EA4A4C">
																	<c:if test="${var.TYPE=='0' }">商品</c:if>
																	<c:if test="${var.TYPE=='1' }">非商品</c:if>
																</small></span></p>
																<p class="dis-box p-t-remark"> <br>
																	</p>
															</div>
														</div>
													</li>
										   </ul>
										</div>
							</section>
								<c:if test="${var.TYPE=='1' }">
								<c:if test="${var.STEP=='2'}">
									<div class="padding-all f-05 user-order-money b-color-f">
										<label class="t-remark" style="float:left;">
										</label>
										<em class="t-first" style="color:#9A9A9A">领奖时间</em><em class="t-first">：${var.CREATE_DATE}</em>
									</div>
								</c:if>
								<c:if test="${var.STEP!='2'}">
									<footer class="padding-all b-color-f m-top1px of-hidden dis-box">
										<h4 class="t-remark2 box-flex"></h4>
										<p class="ect-button-more ect-button-more-dete n-br-5">
											<c:if test="${var.STEP!='2' }">
												<div class="div_award" style="color:#EE4B46;border:1px solid #EE4B46;" onclick="querenlingqu3('${var.AWARD_ID}','${var.IS_LOGIN}')">确认领取</div>
											</c:if>
										</p>
									</footer>
								</c:if>


								</c:if>
								<c:if test="${var.TYPE=='0' }">
									<c:if test="${var.ORDER_STATUS!=null }">
									<c:if test="${var.ORDER_STATUS!='0' }">
										<div class="padding-all f-05 user-order-money b-color-f">
											<label class="t-remark" style="float:left;">
											订单号:${var.ORDER_ID}
											</label>
											<em class="t-first" style="color:#9A9A9A">领奖时间</em><em class="t-first">：${var.GET_DATE1}</em>
										</div>
									</c:if>
									</c:if>
									<footer class="padding-all b-color-f m-top1px of-hidden dis-box">
										<h4 class="t-remark2 box-flex"></h4>
										<p class="ect-button-more ect-button-more-dete n-br-5">
										<c:if test="${var.ORDER_STATUS!=null }">
											<c:if test="${var.ORDER_STATUS=='0' }">
													<input type="hidden" name="ORDER_ID${var.CART_ID}" id="ORDER_ID${var.CART_ID}" value="${var.ORDER_ID}"/>
													<div class="div_award" style="color:#EE4B46;border:1px solid #EE4B46;" onclick="querenlingqu2('${var.ORDER_ID}','${var.GOODS_ID }')">确认领取</div>
											</c:if>
											<c:if test="${var.ORDER_STATUS!='0' }">
											<div class="div_award" style="color:#EE4B46;border:1px solid #EE4B46;" onclick="xiangqing('${var.ORDER_ID}')">查看详情</div>
											</c:if>
										</c:if>
										<c:if test="${var.ORDER_STATUS==null }">
											<c:if test="${var.STEP=='0' }">

												<div class="div_award" style="color:#EE4B46;border:1px solid #EE4B46;" onclick="querenlingqu('${var.CART_ID}','${var.GOODS_ID }')">确认领取</div>
											</c:if>
											<c:if test="${var.STEP=='1' }">

												<div class="div_award" style="color:#EE4B46;border:1px solid #EE4B46;" onclick="querenlingqu1('${var.CART_ID}','${var.GOODS_ID }')">确认领取</div>
											</c:if>
										</c:if>
										</p>
									</footer>
								</c:if>
							</section>
							</section>
							</c:forEach>
					</div>
				</div>
	<div class='ajax_loading' style='background:#F0F0F0;height:60px;width:100%;text-align:center;line-height:60px;font-size:18px;display:none;position:fixed;bottom:0px'><img style="width: 4.0rem;height: 4.0rem;" src="static/lshapp/images/center/loading.gif"> 数据加载中</div>
         <!--快捷导航-->
    <script>

</script>

    <div class="common-show"></div>
    <script type="text/javascript">


    </script>

</body></html>