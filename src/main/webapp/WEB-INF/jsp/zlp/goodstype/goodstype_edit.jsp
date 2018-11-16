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
					
					<form action="goodstype/${msg }.do"  name="Form" id="Form" method="post">
						<input type="hidden" name="GOODSTYPE_ID" id="GOODSTYPE_ID" value="${pd.GOODSTYPE_ID}"/>
						<input type="hidden" name="TYPE_IMAGE" id="TYPE_IMAGE" value="${pd.TYPE_IMAGE}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">	
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类目名称:</td>
								<td><input type="text" name="TYPE_NAME" id="TYPE_NAME" value="${pd.TYPE_NAME}" maxlength="255" placeholder="这里输入类目名称" title="类目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类目图片:</td>
								<td>
								<input  type="file" name="file" id="file" value="${pd.TYPE_IMAGE}" maxlength="255" placeholder="这里输入类目图片" title="类目图片" style="width:50%;"/>
								<span style="color: red">建议上传图片大小为120x120像素，格式为jpg或png格式</span>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类目排序:</td>
								<td><input type="number" name="SEQENCE" id="SEQENCE" value="${pd.SEQENCE}" maxlength="32" placeholder="这里输入类目排序" title="类目排序" style="width:98%;"/></td>
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
	<!--图片上传-->
	<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
	<script type="text/javascript">
		$("#file").change(function(){
			upPhoto();
			});
		function upPhoto(){
		    var url = "<%=basePath%>pictures/saveForUrl.do";//这里填请求的地址
		    $.ajaxFileUpload({
		        url : url,
		        type : 'POST',
		        fileElementId : 'file',  //这里对应html中上传file的id
		        contentType:"application/json;charset=UTF-8",
		        success: function(data){
		            var str = $(data).find("body").text();//获取返回的字符串
		            var json = $.parseJSON(str);//把字符串转化为json对象
		            if(json.result=='ok'){
		            	$("#TYPE_IMAGE").val(json.PICTURES_ID);
		                //alert("上传成功"+json.PICTURES_ID);
		            }
		            else{
		                alert("上传失败");
		            }
		        },
		        error: function(){
		            alert("请链接网络");
		        }
		    })
		}
		</script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TYPE_NAME").val()==""){
				$("#TYPE_NAME").tips({
					side:3,
		            msg:'请输入类目名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE_NAME").focus();
			return false;
			}
			if($("#TYPE_IMAGE").val()==""){
				$("#file").tips({
					side:3,
		            msg:'请选择图片，等待图片上传成功',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#file").focus();
			return false;
			} 
			if($("#SEQENCE").val()==""){
				$("#SEQENCE").tips({
					side:3,
		            msg:'请输入类目排序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEQENCE").focus();
			return false;
			}else if(parseInt($("#SEQENCE").val())<=0){
				$("#SEQENCE").tips({
						side:3,
			            msg:'请输入正数类目排序',
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