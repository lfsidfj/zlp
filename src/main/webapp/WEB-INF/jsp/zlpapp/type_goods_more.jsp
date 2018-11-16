<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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