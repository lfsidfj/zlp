<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />

</head>
<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">

					<form action="goodscomment/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GOODSCOMMENT_ID" id="GOODSCOMMENT_ID" value="${pd.GOODSCOMMENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">

							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">评论内容:</td>
								<td>${pd.CONTENT}</td>
							</tr>
							<c:forEach items="${list}" var="var" varStatus="vs">
								<tr>
									<td colspan="2">
									<a class="p" href="https://ss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1653949661.png" target="_blank"><img src="https://ss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1653949661.png" width="600" height="300"></a>
									</td>
									<%-- <td colspan="2">
									<a class="p" href="<%=basePath%>${var.PATH}" target="_blank"><img src="<%=basePath%>${var.PATH}" width="100" height="55"></a>
									</td> --%>
								</tr>
							</c:forEach>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
								</td>
							</tr>
						</table>
						</div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){

			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>