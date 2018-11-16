<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
		<div
			class="goods-info of-hidden ect-tab b-color-f j-goods-info j-ect-tab ts-3"
			style="padding-top:4.2rem">


			<div id="j-tab-con"
				class="b-color-f m-top1px swiper-container-horizontal swiper-container-autoheight swiper-container-android">
				<div class="swiper-wrapper" >
					<c:if test="${goods.GOODS_DETAILS !=''}">
						<section class="swiper-slide swiper-slide-active">
							<div>
								${goods.GOODS_DETAILS}
							</div>
	
						</section>
					</c:if>
					<c:if test="${goods.GOODS_DETAILS ==''}">
						<section class="swiper-slide goods-info-attr swiper-slide-next"
							style="width: 400px;">
							<div class="no-div-message">
								<p>亲，此处没有内容～！</p>
							</div>
						</section>
					</c:if>
				</div>
			</div>
		</div>