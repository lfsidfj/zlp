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
					
					<form action="goodssku/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SKU_ID" id="SKU_ID" value="${pd.SKU_ID}"/>
						<input type="hidden" name="GOODS_ID" id="GOODS_ID" value="${pd.GOODS_ID}"/>
						<input type="hidden" name="SELECTIDS" id="SELECTIDS" value="${pd.SELECTIDS}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<td style="width:75px;text-align: right;padding-top: 13px;">请选择商品规格:</td>
							<td>
								<c:forEach items="${specValueList}" var="vars" varStatus="vss">
									<select class="chosen-select form-control" name="SPECVALUE_ID" id="SPECVALUE_ID" data-placeholder="请选择商品类目" style="display: inline-block;vertical-align:top;width: 120px;">
										<c:forEach items="${vars}" var="var" varStatus="vs">
											<option value="${var.SPECVALUE_ID}" <c:if test="${var.check==var.SPECVALUE_ID}">selected="selected"</c:if>>${var.SPEC_VALUE}</option>
										</c:forEach>
									 </select>
								</c:forEach>
							</td>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品价格:</td>
								<td><input type="text" name="GOODS_PRICE" id="GOODS_PRICE" value="${pd.GOODS_PRICE}" maxlength="10" placeholder="这里输入商品价格" title="商品价格" style="width:30%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品库存:</td>
								<td><input type="number" name="GOODS_INVENTORY" id="GOODS_INVENTORY" value="${pd.GOODS_INVENTORY}" maxlength="32" placeholder="这里输入商品库存" title="商品库存" style="width:30%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所需礼豆:</td>
								<td><input type="number" name="INTEGRATION" id="INTEGRATION" value="${pd.INTEGRATION}" maxlength="32" placeholder="这里输入所需礼豆" title="所需礼豆" style="width:30%;"/>&nbsp;&nbsp;(仅积分商品展示)</td>
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
			if($("#GOODS_PRICE").val()==""){
				$("#GOODS_PRICE").tips({
					side:3,
		            msg:'请输入商品价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOODS_PRICE").focus();
			return false;
			}else if(parseInt($("#GOODS_PRICE").val())<=0){
				$("#GOODS_PRICE").tips({
						side:3,
			            msg:'请输入正确商品价格',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#GOODS_PRICE").focus();
				return false;
			}
			if($("#GOODS_INVENTORY").val()==""){
				$("#GOODS_INVENTORY").tips({
					side:3,
		            msg:'请输入商品库存',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOODS_INVENTORY").focus();
			return false;
			}else if(parseInt($("#GOODS_INVENTORY").val())<=0){
				$("#GOODS_INVENTORY").tips({
						side:3,
			            msg:'请输入正确商品库存',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#GOODS_INVENTORY").focus();
				return false;
			}
			if($("#INTEGRATION").val()==""){
				$("#INTEGRATION").tips({
					side:3,
		            msg:'请输入所需礼豆',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTEGRATION").focus();
			return false;
			}else if(parseInt($("#INTEGRATION").val())<0){
				$("#INTEGRATION").tips({
						side:3,
			            msg:'请输入正确所需礼豆',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#INTEGRATION").focus();
				return false;
			}
			
			var checkID = [];
	        $("select :selected").each(function(i){//把所有被选中的值存入数组
	            checkID[i] =$(this).val();
	        });
	        $("#SELECTIDS").val(checkID);

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