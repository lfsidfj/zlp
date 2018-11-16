<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
											已领取
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
									<div class="padding-all f-05 user-order-money b-color-f">
										<label class="t-remark" style="float:left;">
										</label>
										<em class="t-first" style="color:#9A9A9A">领奖时间</em><em class="t-first">：${var.CREATE_DATE}</em>
									</div>
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