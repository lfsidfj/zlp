<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%request.setAttribute("ctx", request.getContextPath()); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
openid:${myuser.openid }<br/>
昵称:${myuser.nickname }<br/>
头像:<img alt="" src="${myuser.headimgurl }"><br/>
国家:${myuser.country }<br/>
省份:${myuser.province }<br/>
城市:${myuser.city }
<a href="${ctx}/weixin/web/example/weixinPay.do">微信支付</a>
</body>
<jsp:include page="share.jsp"></jsp:include>
</html>