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

					<form action="lshuser/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">头像:</td>
								<td>
									<img src="${pd.PATH}" style="width: 40px;height:50px;"></img>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">昵称:</td>
								<td>${pd.NICK_NAME}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
									<c:if test="${pd.SEX == 1}">男</c:if>
									<c:if test="${pd.SEX == 2}">女</c:if>
									<c:if test="${pd.SEX == 0}">未知</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生日:</td>
								<td>${pd.SOLAR_BIRTHDAY}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">角色:</td>
								<td>
<%-- 								<c:if test="${pd.ROLE=='common'}">普通用户</c:if> --%>
<%-- 								<c:if test="${pd.ROLE=='agent'}">代理商</c:if> --%>
<%-- 								<c:if test="${pd.ROLE=='partner'}">合伙人</c:if> --%>
<%-- 								<c:if test="${pd.ROLE=='vip'}">VIP用户</c:if> --%>
<%-- 								<c:if test="${pd.ROLE=='members'}">付费会员</c:if> --%>
									<select class="chosen-select form-control" name="ROLE" id="ROLE" data-placeholder="角色" style="vertical-align:top;width: 120px;">
									<option value="common"<c:if test="${pd.ROLE=='common' }">selected="selected"</c:if>>普通用户</option>
									<option value="agent"<c:if test="${pd.ROLE=='agent' }">selected="selected"</c:if>>代理商</option>
									<option value="partner"<c:if test="${pd.ROLE=='partner' }">selected="selected"</c:if>>合伙人</option>
									<option value="vip"<c:if test="${pd.ROLE=='vip' }">selected="selected"</c:if>>VIP会员</option>
									<option value="members"<c:if test="${pd.ROLE=='members' }">selected="selected"</c:if>>付费会员</option>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
								<td>${pd.PHONE_NUMBER}</td>
							</tr>
							
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">密码:</td>
								<td>${pd.PASSWORD}</td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邀请码:</td>
								<td>${pd.INVITE_CODE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">上级:</td>
								<td>
								<c:if test="${pd.PARENT_NAME != null}">${pd.PARENT_NAME}(${pd.PARENT_PHONE_NUMBER})</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">上级的合伙人:</td>
								<td>
								<c:if test="${pd.PARTNER_USER_NAME != null}">${pd.PARTNER_USER_NAME }(${pd.PARTNER_PHONE_NUMBER})</c:if>
								
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">礼豆:</td>
								<td>${pd.INTEGRATION}</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">余额:</td>
								<td>${pd.MONEY}</td>
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
			var role=$("#ROLE").val();
			var user_id=$("#USER_ID").val();
			$.ajax({
					type: "POST",
					url: '<%=basePath%>lshuser/editRole.do',
			    	data: {ROLE:role,USER_ID:user_id},
					//dataType:'json',
					cache: false,					      				 
					success: function(data){
						top.Dialog.close()
					}
			});
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