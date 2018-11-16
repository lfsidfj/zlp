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
					
					<form action="wechatnewsitem/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="NEWS_ID" id="NEWS_ID" value="${pd.NEWS_ID}"/>
						<input type="hidden" name="WECHAT_MEDIA_ID" id="WECHAT_MEDIA_ID" value="${pd.WECHAT_MEDIA_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入备注2" title="备注2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">封面:</td>
								<td><input type="text" name="THUMB_MEDIA_ID" id="THUMB_MEDIA_ID" value="${pd.THUMB_MEDIA_ID}" maxlength="255" placeholder="这里输入备注3" title="备注3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否显示封面:</td>
								<td><input type="text" name="SHOW_COVER_PIC" id="SHOW_COVER_PIC" value="${pd.SHOW_COVER_PIC}" maxlength="255" placeholder="这里输入备注4" title="备注4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">作者:</td>
								<td><input type="text" name="AUTHOR" id="AUTHOR" value="${pd.AUTHOR}" maxlength="255" placeholder="这里输入备注5" title="备注5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">摘要:</td>
								<td><input type="text" name="DIGEST" id="DIGEST" value="${pd.DIGEST}" maxlength="255" placeholder="这里输入备注6" title="备注6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">内容:</td>
								<td><input type="text" name="CONTENT" id="CONTENT" value="${pd.CONTENT}" maxlength="21845" placeholder="这里输入备注7" title="备注7" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">URL:</td>
								<td><input type="text" name="URL" id="URL" value="${pd.URL}" maxlength="255" placeholder="这里输入备注8" title="备注8" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">原文:</td>
								<td><input type="text" name="CONTENT_SOURCE_URL" id="CONTENT_SOURCE_URL" value="${pd.CONTENT_SOURCE_URL}" maxlength="255" placeholder="这里输入备注9" title="备注9" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序:</td>
								<td><input type="number" name="ORDER_BY" id="ORDER_BY" value="${pd.ORDER_BY}" maxlength="32" placeholder="这里输入备注12" title="备注12" style="width:98%;"/></td>
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
			/* if($("#NEWS_ID").val()==""){
				$("#NEWS_ID").tips({
					side:3,
		            msg:'请输入备注1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NEWS_ID").focus();
			return false;
			} */
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入备注2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#THUMB_MEDIA_ID").val()==""){
				$("#THUMB_MEDIA_ID").tips({
					side:3,
		            msg:'请输入备注3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#THUMB_MEDIA_ID").focus();
			return false;
			}
			if($("#SHOW_COVER_PIC").val()==""){
				$("#SHOW_COVER_PIC").tips({
					side:3,
		            msg:'请输入备注4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SHOW_COVER_PIC").focus();
			return false;
			}
			if($("#AUTHOR").val()==""){
				$("#AUTHOR").tips({
					side:3,
		            msg:'请输入备注5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AUTHOR").focus();
			return false;
			}
			if($("#DIGEST").val()==""){
				$("#DIGEST").tips({
					side:3,
		            msg:'请输入备注6',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DIGEST").focus();
			return false;
			}
			if($("#CONTENT").val()==""){
				$("#CONTENT").tips({
					side:3,
		            msg:'请输入备注7',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT").focus();
			return false;
			}
			/* if($("#URL").val()==""){
				$("#URL").tips({
					side:3,
		            msg:'请输入备注8',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#URL").focus();
			return false;
			} */
			if($("#CONTENT_SOURCE_URL").val()==""){
				$("#CONTENT_SOURCE_URL").tips({
					side:3,
		            msg:'请输入备注9',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT_SOURCE_URL").focus();
			return false;
			}
			if($("#ORDERBY").val()==""){
				$("#ORDERBY").tips({
					side:3,
		            msg:'请输入备注10',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDERBY").focus();
			return false;
			}
			/* if($("#MEDIA_ID").val()==""){
				$("#MEDIA_ID").tips({
					side:3,
		            msg:'请输入备注11',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEDIA_ID").focus();
			return false;
			} */
			if($("#ORDER_BY").val()==""){
				$("#ORDER_BY").tips({
					side:3,
		            msg:'请输入备注12',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_BY").focus();
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