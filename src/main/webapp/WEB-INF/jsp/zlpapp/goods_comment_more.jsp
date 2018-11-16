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
<c:forEach items="${commentList}" var="var" varStatus="vs">
	<div class="evaluation-list padding-all">
		<div class="dis-box comment-list-box">
			<div class="box-flex p-r">
				<span class="comment-header"> <img
					src="<%=basePath%>uploadFiles/uploadImgs/${var.USER_PATH}">
				</span> <span class="f-05 col-7 comment-admin"> ${var.NICK_NAME} </span>
			</div>
			<div class="box-flex">
				<div class="fr t-remark">${var.CREATE_DATE}</div>
			</div>
		</div>
		<c:if test="${not empty var.CONTENT }">
			<p class="clear f-05 col-3">${var.CONTENT }</p>
		</c:if>
		<c:if test="${not empty var.pictureList }">
			<div class="g-e-p-pic m-top08">
				<div class="my-gallery" data-pswp-uid="5">
					<c:forEach items="${var.pictureList}" var="pvar" varStatus="pvs">
						<div
							style="float: left;width: 24%;margin: .1rem;border: 1px solid #eee;">
							<div class="comment-img">
								<div data-size="640x640">
									<img class="img"
										src="<%=basePath%>uploadFiles/uploadImgs/${pvar.COMMENT_PATH}">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		<p class="clear t-remark">规格:${var.SPEC }</p>
	</div>
</c:forEach>