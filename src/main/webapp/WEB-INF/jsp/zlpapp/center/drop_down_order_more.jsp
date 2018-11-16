<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ" onclick="zeeee('${var.ORDER_ID}')">
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:if>
											<c:if test="${var.ORDER_STATUS=='4'}">
												<div style="padding: 5px;">
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ" onclick="zeeee('${var.ORDER_ID}')">
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="clear: both;"></div>
												</div>
											</c:if>
										</div>
									</li>
									</c:forEach>
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
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;"  class="seeOrderXQ">
														<div myvalue="${var.ORDER_ID}">查看详情</div>
													</div>
													<div style="float: right;padding: 5px;border: 1px solid #858E97;border-radius: 50px;padding: 5px;" class="querenSH">
														<div myvalue="${var.ORDER_ID}">确认收货</div>
													</div>
													<div style="clear: both;"></div>
												</div>

										</div>
									</li>
									</c:forEach>
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
	<div id="scriptNew">
			<script type="text/javascript">
			mui(".zhifuOrder").on("tap","div",function(){
				var Id = $(this).attr("myvalue");
				window.location.href='<%=basePath%>lshapp/order/goOrderDetail.do?orderId='+Id;
			});
			 mui(".seeOrderXQ").on("tap","div",function(){
				var Id = $(this).attr("myvalue");
				window.location.href='<%=basePath%>lshapp/order/goOrderDetail.do?orderId='+Id;
			});
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