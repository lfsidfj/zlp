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
					
					<form action="smsrecord/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SMSRECORD_ID" id="SMSRECORD_ID" value="${pd.SMSRECORD_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">编号:</td>
								<td><input type="number" name="SMSRECORD_ID" id="SMSRECORD_ID" value="${pd.SMSRECORD_ID}" maxlength="32" placeholder="这里输入编号" title="编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
								<td><input type="text" name="PHONE_NUMBER" id="PHONE_NUMBER" value="${pd.PHONE_NUMBER}" maxlength="255" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发送内容:</td>
								<td><input type="text" name="CONTENT" id="CONTENT" value="${pd.CONTENT}" maxlength="255" placeholder="这里输入发送内容" title="发送内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发送状态:</td>
								<td><input type="number" name="SEND_STATUS" id="SEND_STATUS" value="${pd.SEND_STATUS}" maxlength="32" placeholder="这里输入发送状态" title="发送状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注5:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="255" placeholder="这里输入备注5" title="备注5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注6:</td>
								<td><input type="text" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}" maxlength="255" placeholder="这里输入备注6" title="备注6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注7:</td>
								<td><input type="text" name="UPDATE_DATE" id="UPDATE_DATE" value="${pd.UPDATE_DATE}" maxlength="255" placeholder="这里输入备注7" title="备注7" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注8:</td>
								<td><input type="text" name="UPDATE_USER" id="UPDATE_USER" value="${pd.UPDATE_USER}" maxlength="255" placeholder="这里输入备注8" title="备注8" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注9:</td>
								<td><input type="number" name="DELETE_STATUS" id="DELETE_STATUS" value="${pd.DELETE_STATUS}" maxlength="32" placeholder="这里输入备注9" title="备注9" style="width:98%;"/></td>
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
			if($("#SMSRECORD_ID").val()==""){
				$("#SMSRECORD_ID").tips({
					side:3,
		            msg:'请输入编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SMSRECORD_ID").focus();
			return false;
			}
			if($("#PHONE_NUMBER").val()==""){
				$("#PHONE_NUMBER").tips({
					side:3,
		            msg:'请输入手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE_NUMBER").focus();
			return false;
			}
			if($("#CONTENT").val()==""){
				$("#CONTENT").tips({
					side:3,
		            msg:'请输入发送内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT").focus();
			return false;
			}
			if($("#SEND_STATUS").val()==""){
				$("#SEND_STATUS").tips({
					side:3,
		            msg:'请输入发送状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEND_STATUS").focus();
			return false;
			}
			if($("#CREATE_DATE").val()==""){
				$("#CREATE_DATE").tips({
					side:3,
		            msg:'请输入备注5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_DATE").focus();
			return false;
			}
			if($("#CREATE_USER").val()==""){
				$("#CREATE_USER").tips({
					side:3,
		            msg:'请输入备注6',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_USER").focus();
			return false;
			}
			if($("#UPDATE_DATE").val()==""){
				$("#UPDATE_DATE").tips({
					side:3,
		            msg:'请输入备注7',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_DATE").focus();
			return false;
			}
			if($("#UPDATE_USER").val()==""){
				$("#UPDATE_USER").tips({
					side:3,
		            msg:'请输入备注8',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_USER").focus();
			return false;
			}
			if($("#DELETE_STATUS").val()==""){
				$("#DELETE_STATUS").tips({
					side:3,
		            msg:'请输入备注9',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DELETE_STATUS").focus();
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