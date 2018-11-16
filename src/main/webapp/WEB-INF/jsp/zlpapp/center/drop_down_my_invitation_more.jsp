<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:forEach items="${articleList}" var="var" varStatus="vs">
		<section class="com-nav" style="margin-top:0.2rem;">
			<ul class="dis-box padding-all" style="margin-left: -0.7rem;">
				<li class="box-flex">
					<div class="com-adm-box new-t">
						<h4 style="color:#9A9A9A;font-size:1.6rem;">已发布</h4>
					</div>
				</li>
				<li>
					<div class="t-time"><img class="user_icon" src="static/lshapp/images/center/time-hdpi.png"><span style="font-size:1.6rem;">${var.CREATE_DATE }</span>
					</div>
				</li>
			</ul>
			<div class="margin-lr com-min-tit" style="margin-left: 0.8rem;">
							<span style="font-size:1.9rem;">${var.TITLE }</span>
			</div>
			<div class="margin-lr com-min-tit position-rel" style="margin-left: 0.8rem;">
					<span style="color:#989898"> ${var.CONTENT }</span>
			</div>
			 <section class="product-list j-product-list product-list-medium new-flow-bottom">
                <ul>
                	<c:forEach items="${var.PATH }" var="pp" varStatus="vss">
                    <li>
                        <div class="product-div" id="product-div">
                           	<div class="shop-list-width" style="height: 150px;">
                                <img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${pp.PATH}">
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </section>
		</section>
		</c:forEach>