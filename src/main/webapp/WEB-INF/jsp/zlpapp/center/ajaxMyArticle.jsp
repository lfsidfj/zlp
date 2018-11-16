<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:forEach items="${varList}" var="var" varStatus="vs">
<c:if test="${var.DELETE_STATUS == 0 }">
	<li class="mui-table-view-cell" myvalue="${var.ARTICLE_ID }">
		<div style="background-color: white;padding: 5vw;margin-top: 5px;margin-bottom: 5px;">
			<div>
				<div style="float: left;width: 30px;height: 30px;margin-right: 10px;"><img style="width: 100%;height: 100%;" alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}"></div>
				<div style="float: left;height: 30px;width: 50vw;">
					<div style="height: 15px;font-size: 15px;">${var.CREATE_USER }</div>
					<div style="font-size: 13px;color: gray;">${var.CREATE_DATE }</div>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="margin-top: 10px;margin-bottom: 10px;">${var.CONTENT }
			</div>
			<div>
				<c:forEach items="${var.articlePathList}" var="var1" varStatus="vs">
					<c:if test="${(vs.index+1) % 3 == 0 }">
					<img style="display: block;float: left;width: 28vw;height: 28vw;margin-bottom: 3vw;" alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var1.ARTICLE_PATH}">
					</c:if>
					<c:if test="${(vs.index+1) % 3 != 0 }">
					<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var1.ARTICLE_PATH}">
					</c:if>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>
<!-- 			<div> -->
<!-- 				<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/comment-xhdpi.png">40 -->
<!-- 				</div> -->
<!-- 				<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/not_collection.png">40 -->
<!-- 				</div> -->
<!-- 				<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/A_little_praise1.png">40 -->
<!-- 				</div> -->
<!-- 				<div style="float: right;margin-left: 10px;"><img style="width: 15px;height: 15px;" alt="" src="static/lshapp/images/browse-hdpi.png">40 -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div style="clear: both;"></div>
		</div>
	</li>
	<input type="hidden" value="${totalPageZero }" class="totalPageZero">
	</c:if>
</c:forEach>