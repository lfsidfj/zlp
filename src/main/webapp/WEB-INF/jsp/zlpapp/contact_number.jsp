



 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <style type="text/css">
.hide_goods{
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
    right: 0;
    bottom: 0;
	z-index: 16;
	background: rgba(0,0,0,.4);
	text-align: center;
}
.div_number{
	text-align: center; /*让div内部文字居中*/
   	background: rgba(0,0,0,.4);
    border-radius: 2rem;
    width: 28rem;
    height: 12rem;
    margin: auto;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}
.tv_color{
	color:#fff;
}
.tv_sure{
	border: 1px solid #ed4c44;
	background:#ed4c44;
	border-radius: 1rem;
	color:#fff;
	padding-left: 3rem;
	padding-right: 3rem;
}
.center{
	padding: 1rem;
}
</style>
<div class="hide_goods">
	<div class="div_number">
		<div class="center" >
			<div class="tv_color">如有疑问，请致电</div>
			<div class="tv_color" style="margin-bottom: 0.8rem;">客服电话：1852255000</div>
			<div style="margin-top: 1.8rem;"><span class="tv_sure" onclick="closeNumber();">确认</span></div>
		</div>
	</div>
</div>