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

					<form action="expresscompany/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="EXPRESSCOMPANY_ID" id="EXPRESSCOMPANY_ID" value="${pd.EXPRESSCOMPANY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">编号:</td>
								<td><input type="number" name="EXPRESSCOMPANY_ID" id="EXPRESSCOMPANY_ID" value="${pd.EXPRESSCOMPANY_ID}" maxlength="32" placeholder="这里输入编号" title="编号" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">快递公司排序:</td>
								<td><input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="SEQENCE" id="SEQENCE" value="${pd.SEQENCE}" maxlength="255" placeholder="这里输入快递公司排序" title="快递公司排序" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">快递公司编号:</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="255" placeholder="这里输入快递公司编号" title="快递公司编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">快递公司名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入快递公司名称" title="快递公司名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td colspan="2" style="color: red;">*说明快递公司排名越小，展示时越靠前</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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

			if($("#CODE").val()==""){
				$("#CODE").tips({
					side:3,
		            msg:'请输入快递公司编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CODE").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入快递公司名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}

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