



 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <style>
 .package-status{padding:5px 0 0 10px}
.package-status .status-list{margin:0;padding:0;margin-top:-5px;padding-left:8px;list-style:none;}
.package-status .status-list li{border-left:2px solid #d9d9d9;text-align:left;}
.package-status .status-list li:before{ /* 流程点的样式 */
	content:'';
	border:3px solid #f3f3f3;
	background-color:#d9d9d9;
	display:inline-block;
	width:10px;
	height:10px;
	border-radius:10px;
	margin-left:-9px;
	margin-right:10px
}
.package-status .status-list .latest:before{background-color:#0dad12;border-color:#f8e9e4;}
.package-status .status-box{overflow:hidden}
.package-status .status-list li{height:auto;}
.package-status .status-list{margin-top:-8px}
.package-status .status-box{position:relative}
.package-status .status-box:before{content:" ";background-color:#f3f3f3;display:block;position:absolute;top:-8px;left:20px;width:10px;height:4px}
.package-status .status-list{margin-top:0px;}
.status-list li:not(:first-child){
	padding-top:10px;
}

.status-content-before{
	text-align:left;
	margin-left:25px;
	margin-top:-20px;
}
.status-content-latest{
	text-align:left;
	margin-left:25px;
	color:green;
	margin-top:-20px;
}
.status-time-before{qqqqqqqqq
	text-align:left;
	margin-left:25px;
	font-size:10px;
	margin-top:5px;

}
.status-time-latest{
	text-align:left;
	margin-left:25px;
	color:green;
	font-size:10px;
	margin-top:5px;
}
.status-line{
	border-bottom:1px solid #ccc;
	margin-left:25px;
	margin-top:10px;

}
</style>
		<div class="package-status" style="margin-top: -5px;">
			<div class="status-box" >
				<ul  class="status-list">
				<li></li>
				<c:choose>
								<c:when test="${not empty json}">
				<c:forEach items="${json}" var="var" varStatus="vs">
					<c:if test="${vs.index+1=='1'}">
						<li class="latest">
							<div class="status-content-latest">${var.AcceptStation}</div>
							<div class="status-time-latest">${var.AcceptTime}</div>
							<div class="status-line"></div>
						</li>
					</c:if>
					<c:if test="${vs.index+1!='1'}">
						<li>
							<div class="status-content-before">${var.AcceptStation}</div>
							<div class="status-time-before">${var.AcceptTime}</div>
							<div class="status-line"></div>
						</li>
					</c:if>
				</c:forEach>
				</c:when>
				<c:otherwise>
									<li style="text-align: center;color: red;font-size: 15px;">
							暂无物流信息
						</li>
								</c:otherwise>
				</c:choose>

				</ul>
			</div>
	</div>