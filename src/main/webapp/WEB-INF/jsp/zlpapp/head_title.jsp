<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div style="height: 50px;line-height: 50px;border-bottom: 1px solid #E1E1E1;background-color: white;">
	<div style="width: 12vw;height: 100%;float: left;padding-top: 16px;" onclick="history.go(-1);">
		<img alt="" src="static/lshapp/images/return.png" style="width: 12px;height: 18px;margin: 0 auto;display: block;">
	</div>
	<div style="text-align: center;width: 76vw;float: left;font-size: 20px;color: black;font-weight: bolder;">
	<%=request.getParameter("pageTitle")%>
	</div>
	<div style="width: 12vw;height: 100%;float: right;">
	</div>
</div> --%>