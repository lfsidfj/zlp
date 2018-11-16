<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:forEach items="${myCommentList}" var="var" varStatus="vs">
<li class="mui-table-view-cell" myvalue="${var.ARTICLE_ID }">
	<div style="padding: 10px;">
		<div style="width: 15vw;float: left;margin-right: 10px;">
			<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.MYPATH}" style="width: 100%;height: 15vw;">
		</div>
		<div style="width: 50vw;float: left;">
			<c:if test="${var.OTHERNICKNAME == null}">
			<div><font>我评论了帖子</font></div>
			</c:if>
			<c:if test="${var.OTHERNICKNAME != null}">
			<div><font>你回复了</font><font style="color: #858E97;">${var.OTHERNICKNAME}</font></div>
			</c:if>
			<div style="margin: 10px 0px 10px 0px;">${var.MYCOMMENT }</div>
			<div>
				<div style="float: left;color: #858E97;">${var.COMMENTDATE }</div>
			</div>
		</div>
		<div style="background-color: #F5F5F5;float: right;width: 20vw;padding: 5px;">
		${var.TITLE }
		</div>
		<div style="clear: both;"></div>
	</div>
</li>
	<input type="hidden" value="${totalPageOne }" class="totalPageOne">
	
</c:forEach>