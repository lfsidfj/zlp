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
					
					<form action="article/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ARTICLE_ID" id="ARTICLE_ID" value="${pd.ARTICLE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文章类目:</td>
								<td>
									<select class="chosen-select form-control" name="ARTICLE_CATEGORY_ID" id="ARTICLE_CATEGORY_ID" data-placeholder="请选择文章类目" style="vertical-align:top;width: 220px;">
										<c:forEach items="${categoryList}" var="var" varStatus="vs">
											<option value="${var.ARTICLE_CATEGORY_ID}" <c:if test="${pd.ARTICLE_CATEGORY_ID==var.ARTICLE_CATEGORY_ID}">selected="selected"</c:if>>${var.CATEGORY_NAME}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文章名称:</td>
								<td><input type="text" name="ARTICLE_NAME" id="ARTICLE_NAME" value="${pd.ARTICLE_NAME}" maxlength="255" placeholder="这里输入文章名称" title="文章名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文章内容:</td>
								<td>
									<script id="editor1" name="ARTICLE_CONTENT" type="text/plain" style="width:89%;height:180px;" ></script>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序:</td>
								<td><input type="number" name="SEQENCE" id="SEQENCE" value="${pd.SEQENCE}" maxlength="32" placeholder="这里输入排序" title="排序" style="width:20%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否展示:</td>
								<td>
									<select class="chosen-select form-control" name="IS_SHOW" id="IS_SHOW" data-placeholder="请选择是否展示" style="vertical-align:top;width: 220px;">
										<option value="0" <c:if test="${pd.IS_SHOW=='0'}">selected="selected"</c:if>>展示</option>
										<option value="1" <c:if test="${pd.IS_SHOW=='1'}">selected="selected"</c:if>>不展示</option>
									</select>
								</td>
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

	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
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
			if($("#ARTICLE_NAME").val()==""){
				$("#ARTICLE_NAME").tips({
					side:3,
		            msg:'请输入文章名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ARTICLE_NAME").focus();
			return false;
			}
			if($("#ARTICLE_CONTENT").val()==""){
				$("#ARTICLE_CONTENT").tips({
					side:3,
		            msg:'请输入文章内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ARTICLE_CONTENT").focus();
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

			if($("#DELETE_STATUS").val()==""){
				$("#DELETE_STATUS").tips({
					side:3,
		            msg:'请输入是否展示',
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
	<script type="text/javascript">

		//百度富文本
		function ueditor(){

			var desc2='${pd.ARTICLE_CONTENT}';

			UE.getEditor('editor1');
			//判断ueditor 编辑器是否创建成功
			UE.getEditor('editor1').addListener("ready", function () {
				// editor准备好之后才可以使用
				UE.getEditor('editor1').setContent(desc2);
			});
		}

		//start
		jQuery(function($) {

			ueditor();
		});

	</script>
</body>
</html>