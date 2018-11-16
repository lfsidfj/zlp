<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:forEach items="${goodsList}" var="var" varStatus="vs">
						<li data-v-dcddab0a="" onclick="goGoods('${var.GOODS_ID}');">
							<!---->
							<figure data-v-dcddab0a="">
								<div data-v-dcddab0a="" class="img-box"
									style="height: 150px; line-height: 150px;">
									<img data-v-dcddab0a=""
										src="static/lshapp/574_G_1471937542526.jpg"
										lazy="loaded" style="height: 100%;">
								</div>
								<figcaption data-v-dcddab0a="">
									<div >
										<c:choose>
										  <c:when test="${var.GOODS_POSITION =='0'}">
											   <div class="goods_type1">
													<img   class="goods_iamge1"  src="static/lshapp/images/commodity_discount.png" lazy="loaded">
												</div>
										  </c:when>
										  <c:when test="${var.GOODS_POSITION =='1'}">
										    	<div class="goods_type1">
													<img   class="goods_iamge1"  src="static/lshapp/images/commodity_exchange.png" lazy="loaded">
												</div>
										  </c:when>
										  <c:otherwise>
										  </c:otherwise>
										</c:choose>

										<div style="">
											<h4 data-v-dcddab0a="" >${var.GOODS_NAME} </h4>
										</div>
									</div>
									<p data-v-dcddab0a="" class="remark">
										<em data-v-dcddab0a="">库存：${var.GOODS_INVENTORY}</em>
										<em data-v-dcddab0a="" style="margin-left:1rem">销量：${var.SALES_VOLUME}</em>
									</p>
									<p data-v-dcddab0a="" class="price">
										<em data-v-dcddab0a="">¥${var.CURRENT_PRICE}</em>
									</p>
								</figcaption>
							</figure>
						</li>
					</c:forEach>