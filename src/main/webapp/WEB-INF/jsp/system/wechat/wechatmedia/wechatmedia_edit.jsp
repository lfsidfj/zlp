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
	<%@ include file="../../../system/index/top.jsp"%>
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
					
					<form action="wechatmedia/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="WECHATMEDIA_ID" id="WECHATMEDIA_ID" value="${pd.WECHATMEDIA_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注1:</td>
								<td><input type="text" name="MEDIA_ID" id="MEDIA_ID" value="${pd.MEDIA_ID}" maxlength="255" placeholder="这里输入备注1" title="备注1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注2:</td>
								<td><input type="text" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="255" placeholder="这里输入备注2" title="备注2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注3:</td>
								<td><input type="text" name="CREATED_AT" id="CREATED_AT" value="${pd.CREATED_AT}" maxlength="255" placeholder="这里输入备注3" title="备注3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注4:</td>
								<td><input type="text" name="LOCATION" id="LOCATION" value="${pd.LOCATION}" maxlength="255" placeholder="这里输入备注4" title="备注4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注5:</td>
								<td><input type="text" name="URL" id="URL" value="${pd.URL}" maxlength="255" placeholder="这里输入备注5" title="备注5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注6:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入备注6" title="备注6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注7:</td>
								<td><input type="text" name="INTRODUCTION" id="INTRODUCTION" value="${pd.INTRODUCTION}" maxlength="255" placeholder="这里输入备注7" title="备注7" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择文件:</td>
								<td><input type="file" name="pictureFile" id="pictureFile" title="请选择文件" style="width:98%;"/></td>
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
	<%@ include file="../../../system/index/foot.jsp"%>
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
			if($("#MEDIA_ID").val()==""){
				$("#MEDIA_ID").tips({
					side:3,
		            msg:'请输入备注1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEDIA_ID").focus();
			return false;
			}
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入备注2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
			return false;
			}
			if($("#CREATED_AT").val()==""){
				$("#CREATED_AT").tips({
					side:3,
		            msg:'请输入备注3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATED_AT").focus();
			return false;
			}
			if($("#LOCATION").val()==""){
				$("#LOCATION").tips({
					side:3,
		            msg:'请输入备注4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOCATION").focus();
			return false;
			}
			if($("#URL").val()==""){
				$("#URL").tips({
					side:3,
		            msg:'请输入备注5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#URL").focus();
			return false;
			}
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入备注6',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#INTRODUCTION").val()==""){
				$("#INTRODUCTION").tips({
					side:3,
		            msg:'请输入备注7',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTRODUCTION").focus();
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