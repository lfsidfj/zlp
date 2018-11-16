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
					
					<form action="brand/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="BRAND_ID" id="BRAND_ID" value="${pd.BRAND_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">品牌名称:</td>
								<td><input type="text" name="BRAND_NAME" id="BRAND_NAME" value="${pd.BRAND_NAME}" maxlength="255" placeholder="这里输入品牌名称" title="品牌名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">品牌网址:</td>
								<td><input type="text" name="BRAND_URL" id="BRAND_URL" value="${pd.BRAND_URL}" maxlength="255" placeholder="这里输入品牌网址" title="品牌网址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">品牌Logo:</td>
								<td>
									<img id="xmTanImg" style="width: 120px;height: 120px;border: 1px solid gray;border-radius:3px;" src="${pd.BRAND_LOGO}"/>
									<div id="xmTanDiv"></div>
									<input  type="file" name="BRAND_LOGO" id="BRAND_LOGO" value="${pd.BRAND_LOGO}" onchange="xmTanUploadImg(this)" maxlength="255" placeholder="这里输入品牌Logo" title="品牌Logo" style="width:50%;"/>
									<span style="color: red">建议上传图片大小为80x80像素，格式为jpg或png格式</span>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">品牌排序:</td>
								<td><input type="number" name="SEQENCE" id="SEQENCE" value="${pd.SEQENCE}" maxlength="32" placeholder="这里输入品牌排序" title="品牌排序" style="width:98%;"/></td>
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
			if($("#BRAND_NAME").val()==""){
				$("#BRAND_NAME").tips({
					side:3,
		            msg:'请输入品牌名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BRAND_NAME").focus();
			return false;
			}
			if($("#BRAND_URL").val()==""){
				$("#BRAND_URL").tips({
					side:3,
		            msg:'请输入品牌网址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BRAND_URL").focus();
			return false;
			}
			if($("#SEQENCE").val()==""){
				$("#SEQENCE").tips({
					side:3,
		            msg:'请输入品牌排序',
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
	<script type="text/javascript">
		//判断浏览器是否支持FileReader接口
		if (typeof FileReader == 'undefined') {
			document.getElementById("xmTanDiv").InnerHTML = "<h1>当前浏览器不支持FileReader接口</h1>";
			//使选择控件不可操作
			document.getElementById("xdaTanFileImg").setAttribute("disabled", "disabled");
		}

		//选择图片，马上预览
		function xmTanUploadImg(obj) {
			var file = obj.files[0];

			console.log(obj);console.log(file);
			console.log("file.size = " + file.size);  //file.size 单位为byte

			var reader = new FileReader();

			//读取文件过程方法
			reader.onloadstart = function (e) {
				console.log("开始读取....");
			}
			reader.onprogress = function (e) {
				console.log("正在读取中....");
			}
			reader.onabort = function (e) {
				console.log("中断读取....");
			}
			reader.onerror = function (e) {
				console.log("读取异常....");
			}
			reader.onload = function (e) {
				console.log("成功读取....");

				var img = document.getElementById("xmTanImg");
				img.src = e.target.result;
				//或者 img.src = this.result;  //e.target == this
			}

			reader.readAsDataURL(file);
		}
	</script>
</body>
</html>