<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:forEach items="${financeList}" var="var" varStatus="vs">
					<div style="float: left;font-size: 1.3rem;color:#999;width: 43%;text-align: center; margin-top: 0.3rem;">${var.CREATE_DATE}</div>
					<div style="float: left;font-size: 1.3rem;color:#999;width: 28%;text-align: center;margin-top: 0.3rem;">
						<c:if test="${var.INCOME_REASON=='1' }">订单收入</c:if>
						<c:if test="${var.INCOME_REASON=='2' }">后台增加</c:if>
						<c:if test="${var.INCOME_REASON=='3' }">提现</c:if>
						<c:if test="${var.INCOME_REASON=='4' }">后台减少</c:if>
					</div>
					<c:if test="${var.FINANCE_TYPE=='0' }">
						<div style="float: left;font-size: 1.3rem;width: 28%;text-align: center;margin-top: 0.3rem;">
							${var.AMOUNT}
						</div>
					</c:if>
					<c:if test="${var.FINANCE_TYPE=='1' }">
						<div style="float: left;font-size: 1.3rem;width: 28%;text-align: center;margin-top: 0.3rem;">
							-${var.AMOUNT}
						</div>
					</c:if>
				</c:forEach>