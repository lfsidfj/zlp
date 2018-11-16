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
					
					<form action="advertisement/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ADVERTISEMENT_ID" id="ADVERTISEMENT_ID" value="${pd.ADVERTISEMENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">广告位:</td>
								<td>
									<select class="chosen-select form-control" name="AD_SPACE_ID" id="AD_SPACE_ID" data-placeholder="请选择广告位" style="vertical-align:top;width: 220px;">
										<c:forEach items="${adspaceList}" var="var" varStatus="vs">
											<option value="${var.AD_SPACE_ID}" <c:if test="${pd.AD_SPACE_ID==var.AD_SPACE_ID}">selected="selected"</c:if>>${var.AD_SPACE_NAME}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">广告标题:</td>
								<td><input type="text" name="AD_NAME" id="AD_NAME" value="${pd.AD_NAME}" maxlength="255" placeholder="这里输入广告标题" title="广告标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片:</td>
								<td><input type="text" name="PICTURE" id="PICTURE" value="${pd.PICTURE}" maxlength="255" placeholder="这里输入图片" title="图片" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">广告链接:</td>
								<td><input type="text" name="AD_URL" id="AD_URL" value="${pd.AD_URL}" maxlength="255" placeholder="这里输入广告链接" title="广告链接" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序:</td>
								<td><input type="number" name="SEQENCE" id="SEQENCE" value="${pd.SEQENCE}" maxlength="32" placeholder="这里输入排序" title="排序" style="width:98%;"/></td>
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
			if($("#AD_SPACE_ID").val()==""){
				$("#AD_SPACE_ID").tips({
					side:3,
		            msg:'请输入广告位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AD_SPACE_ID").focus();
			return false;
			}
			if($("#AD_NAME").val()==""){
				$("#AD_NAME").tips({
					side:3,
		            msg:'请输入广告标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AD_NAME").focus();
			return false;
			}
			if($("#PICTURE").val()==""){
				$("#PICTURE").tips({
					side:3,
		            msg:'请输入图片',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PICTURE").focus();
			return false;
			}
			if($("#AD_URL").val()==""){
				$("#AD_URL").tips({
					side:3,
		            msg:'请输入广告链接',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AD_URL").focus();
			return false;
			}
			if($("#SEQENCE").val()==""){
				$("#SEQENCE").tips({
					side:3,
		            msg:'请输入排序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEQENCE").focus();
			return false;
			}else if(parseInt($("#SEQENCE").val())<=0){
                $("#SEQENCE").tips({
                    side:3,
                    msg:'请输入正确排序',
                    bg:'#AE81FF',
                    time:2
                });
                $("#SEQENCE").focus();
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