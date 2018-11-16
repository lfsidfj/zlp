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
					
					<form action="wechatuser/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="OPENID" id="OPENID" value="${pd.OPENID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">OPENID:</td>
								<td><input type="text" name="OPENID" id="OPENID" value="${pd.OPENID}" maxlength="28" placeholder="这里输入OPENID" title="OPENID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关注状态:</td>
								<td><input type="number" name="SUBSCRIBE" id="SUBSCRIBE" value="${pd.SUBSCRIBE}" maxlength="32" placeholder="这里输入关注状态" title="关注状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">昵称:</td>
								<td><input type="text" name="NICKNAME" id="NICKNAME" value="${pd.NICKNAME}" maxlength="32" placeholder="这里输入昵称" title="昵称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td><input type="number" name="SEX" id="SEX" value="${pd.SEX}" maxlength="32" placeholder="这里输入性别" title="性别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">语言:</td>
								<td><input type="text" name="LANGUAGE" id="LANGUAGE" value="${pd.LANGUAGE}" maxlength="255" placeholder="这里输入语言" title="语言" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">城市:</td>
								<td><input type="text" name="CITY" id="CITY" value="${pd.CITY}" maxlength="32" placeholder="这里输入城市" title="城市" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份:</td>
								<td><input type="text" name="PROVINCE" id="PROVINCE" value="${pd.PROVINCE}" maxlength="16" placeholder="这里输入省份" title="省份" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">国家:</td>
								<td><input type="text" name="COUNTRY" id="COUNTRY" value="${pd.COUNTRY}" maxlength="32" placeholder="这里输入国家" title="国家" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">头像:</td>
								<td><input type="text" name="HEADIMGURL" id="HEADIMGURL" value="${pd.HEADIMGURL}" maxlength="512" placeholder="这里输入头像" title="头像" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关注时间:</td>
								<td><input class="span10 date-picker" name="SUBSCRIBE_TIME" id="SUBSCRIBE_TIME" value="${pd.SUBSCRIBE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="关注时间" title="关注时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">UNIONID:</td>
								<td><input type="text" name="UNIONID" id="UNIONID" value="${pd.UNIONID}" maxlength="64" placeholder="这里输入UNIONID" title="UNIONID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">分组:</td>
								<td><input type="number" name="GROUPID" id="GROUPID" value="${pd.GROUPID}" maxlength="32" placeholder="这里输入分组" title="分组" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标签列表:</td>
								<td><input type="text" name="TAGID_LIST" id="TAGID_LIST" value="${pd.TAGID_LIST}" maxlength="255" placeholder="这里输入标签列表" title="标签列表" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input class="span10 date-picker" name="CREATETIME" id="CREATETIME" value="${pd.CREATETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加时间" title="添加时间" style="width:98%;"/></td>
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
			if($("#OPENID").val()==""){
				$("#OPENID").tips({
					side:3,
		            msg:'请输入OPENID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPENID").focus();
			return false;
			}
			if($("#SUBSCRIBE").val()==""){
				$("#SUBSCRIBE").tips({
					side:3,
		            msg:'请输入关注状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBSCRIBE").focus();
			return false;
			}
			if($("#NICKNAME").val()==""){
				$("#NICKNAME").tips({
					side:3,
		            msg:'请输入昵称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NICKNAME").focus();
			return false;
			}
			if($("#SEX").val()==""){
				$("#SEX").tips({
					side:3,
		            msg:'请输入性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEX").focus();
			return false;
			}
			if($("#LANGUAGE").val()==""){
				$("#LANGUAGE").tips({
					side:3,
		            msg:'请输入语言',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LANGUAGE").focus();
			return false;
			}
			if($("#CITY").val()==""){
				$("#CITY").tips({
					side:3,
		            msg:'请输入城市',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CITY").focus();
			return false;
			}
			if($("#PROVINCE").val()==""){
				$("#PROVINCE").tips({
					side:3,
		            msg:'请输入省份',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCE").focus();
			return false;
			}
			if($("#COUNTRY").val()==""){
				$("#COUNTRY").tips({
					side:3,
		            msg:'请输入国家',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUNTRY").focus();
			return false;
			}
			if($("#HEADIMGURL").val()==""){
				$("#HEADIMGURL").tips({
					side:3,
		            msg:'请输入头像',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HEADIMGURL").focus();
			return false;
			}
			if($("#SUBSCRIBE_TIME").val()==""){
				$("#SUBSCRIBE_TIME").tips({
					side:3,
		            msg:'请输入关注时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBSCRIBE_TIME").focus();
			return false;
			}
			if($("#UNIONID").val()==""){
				$("#UNIONID").tips({
					side:3,
		            msg:'请输入UNIONID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNIONID").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			if($("#GROUPID").val()==""){
				$("#GROUPID").tips({
					side:3,
		            msg:'请输入分组',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUPID").focus();
			return false;
			}
			if($("#TAGID_LIST").val()==""){
				$("#TAGID_LIST").tips({
					side:3,
		            msg:'请输入标签列表',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TAGID_LIST").focus();
			return false;
			}
			if($("#CREATETIME").val()==""){
				$("#CREATETIME").tips({
					side:3,
		            msg:'请输入添加时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATETIME").focus();
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