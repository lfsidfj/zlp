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

					<form action="order/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ORDER_ID" id="ORDER_ID" value="${pd.ORDER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单编号:</td>
								<td><input type="text" name="ORDER_ID" id="ORDER_ID" value="${pd.ORDER_ID}" maxlength="255" placeholder="这里输入订单编号" title="订单编号" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单总金额:</td>
								<td><input type="text" name="TOTAL_AMOUNT" id="TOTAL_AMOUNT" value="${pd.TOTAL_AMOUNT}" maxlength="10" placeholder="这里输入订单总金额" title="订单总金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品金额:</td>
								<td><input type="text" name="GOODS_AMOUNT" id="GOODS_AMOUNT" value="${pd.GOODS_AMOUNT}" maxlength="10" placeholder="这里输入商品金额" title="商品金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮费:</td>
								<td><input type="text" name="FREIGHT_AMOUNT" id="FREIGHT_AMOUNT" value="${pd.FREIGHT_AMOUNT}" maxlength="10" placeholder="这里输入邮费" title="邮费" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">礼豆抵扣金额:</td>
								<td><input type="text" name="DEDUCTION_AMOUNT" id="DEDUCTION_AMOUNT" value="${pd.DEDUCTION_AMOUNT}" maxlength="10" placeholder="这里输入礼豆抵扣金额" title="礼豆抵扣金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">使用礼豆数量(只记录非积分商品):</td>
								<td><input type="number" name="INTEGRATION_AMOUNT" id="INTEGRATION_AMOUNT" value="${pd.INTEGRATION_AMOUNT}" maxlength="32" placeholder="这里输入使用礼豆数量(只记录非积分商品)" title="使用礼豆数量(只记录非积分商品)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">实付金额:</td>
								<td><input type="text" name="REAL_PAY_AMOUNT" id="REAL_PAY_AMOUNT" value="${pd.REAL_PAY_AMOUNT}" maxlength="10" placeholder="这里输入实付金额" title="实付金额" style="width:98%;"/></td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="255" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人:</td>
								<td><input type="text" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}" maxlength="255" placeholder="这里输入创建人" title="创建人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input type="text" name="UPDATE_DATE" id="UPDATE_DATE" value="${pd.UPDATE_DATE}" maxlength="255" placeholder="这里输入修改时间" title="修改时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改人:</td>
								<td><input type="text" name="UPDATE_USER" id="UPDATE_USER" value="${pd.UPDATE_USER}" maxlength="255" placeholder="这里输入修改人" title="修改人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">删除状态:</td>
								<td><input type="number" name="DELETE_STATUS" id="DELETE_STATUS" value="${pd.DELETE_STATUS}" maxlength="32" placeholder="这里输入删除状态" title="删除状态" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地区编号:</td>
								<td><input type="number" name="AREA_ID" id="AREA_ID" value="${pd.AREA_ID}" maxlength="32" placeholder="这里输入地区编号" title="地区编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">详细地址:</td>
								<td><input type="text" name="DETAILS_ADDRESS" id="DETAILS_ADDRESS" value="${pd.DETAILS_ADDRESS}" maxlength="255" placeholder="这里输入详细地址" title="详细地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单状态:</td>
								<td><input type="number" name="ORDER_STATUS" id="ORDER_STATUS" value="${pd.ORDER_STATUS}" maxlength="32" placeholder="这里输入订单状态" title="订单状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付编号:</td>
								<td><input type="text" name="OUT_ORDER_ID" id="OUT_ORDER_ID" value="${pd.OUT_ORDER_ID}" maxlength="255" placeholder="这里输入支付编号" title="支付编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户编号:</td>
								<td><input type="number" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入用户编号" title="用户编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物流编号:</td>
								<td><input type="text" name="EXPRESS_NO" id="EXPRESS_NO" value="${pd.EXPRESS_NO}" maxlength="255" placeholder="这里输入物流编号" title="物流编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">快递公司编号:</td>
								<td><input type="number" name="EXPRESSCOMPANY_ID" id="EXPRESSCOMPANY_ID" value="${pd.EXPRESSCOMPANY_ID}" maxlength="32" placeholder="这里输入快递公司编号" title="快递公司编号" style="width:98%;"/></td>
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
			/* if($("#ORDER_ID").val()==""){
				$("#ORDER_ID").tips({
					side:3,
		            msg:'请输入订单编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_ID").focus();
			return false;
			} */
			if($("#TOTAL_AMOUNT").val()==""){
				$("#TOTAL_AMOUNT").tips({
					side:3,
		            msg:'请输入订单总金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TOTAL_AMOUNT").focus();
			return false;
			}
			if($("#GOODS_AMOUNT").val()==""){
				$("#GOODS_AMOUNT").tips({
					side:3,
		            msg:'请输入商品金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOODS_AMOUNT").focus();
			return false;
			}
			if($("#FREIGHT_AMOUNT").val()==""){
				$("#FREIGHT_AMOUNT").tips({
					side:3,
		            msg:'请输入邮费',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FREIGHT_AMOUNT").focus();
			return false;
			}
			if($("#DEDUCTION_AMOUNT").val()==""){
				$("#DEDUCTION_AMOUNT").tips({
					side:3,
		            msg:'请输入礼豆抵扣金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEDUCTION_AMOUNT").focus();
			return false;
			}
			if($("#INTEGRATION_AMOUNT").val()==""){
				$("#INTEGRATION_AMOUNT").tips({
					side:3,
		            msg:'请输入使用礼豆数量(只记录非积分商品)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTEGRATION_AMOUNT").focus();
			return false;
			}
			if($("#REAL_PAY_AMOUNT").val()==""){
				$("#REAL_PAY_AMOUNT").tips({
					side:3,
		            msg:'请输入实付金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REAL_PAY_AMOUNT").focus();
			return false;
			}
			/* if($("#CREATE_DATE").val()==""){
				$("#CREATE_DATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_DATE").focus();
			return false;
			}
			if($("#CREATE_USER").val()==""){
				$("#CREATE_USER").tips({
					side:3,
		            msg:'请输入创建人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_USER").focus();
			return false;
			}
			if($("#UPDATE_DATE").val()==""){
				$("#UPDATE_DATE").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_DATE").focus();
			return false;
			}
			if($("#UPDATE_USER").val()==""){
				$("#UPDATE_USER").tips({
					side:3,
		            msg:'请输入修改人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_USER").focus();
			return false;
			}
			if($("#DELETE_STATUS").val()==""){
				$("#DELETE_STATUS").tips({
					side:3,
		            msg:'请输入删除状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DELETE_STATUS").focus();
			return false;
			} */
			if($("#AREA_ID").val()==""){
				$("#AREA_ID").tips({
					side:3,
		            msg:'请输入地区编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AREA_ID").focus();
			return false;
			}
			if($("#DETAILS_ADDRESS").val()==""){
				$("#DETAILS_ADDRESS").tips({
					side:3,
		            msg:'请输入详细地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DETAILS_ADDRESS").focus();
			return false;
			}
			if($("#ORDER_STATUS").val()==""){
				$("#ORDER_STATUS").tips({
					side:3,
		            msg:'请输入订单状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_STATUS").focus();
			return false;
			}
			if($("#OUT_ORDER_ID").val()==""){
				$("#OUT_ORDER_ID").tips({
					side:3,
		            msg:'请输入支付编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OUT_ORDER_ID").focus();
			return false;
			}
			if($("#USER_ID").val()==""){
				$("#USER_ID").tips({
					side:3,
		            msg:'请输入用户编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_ID").focus();
			return false;
			}
			if($("#EXPRESS_NO").val()==""){
				$("#EXPRESS_NO").tips({
					side:3,
		            msg:'请输入物流编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPRESS_NO").focus();
			return false;
			}
			if($("#EXPRESSCOMPANY_ID").val()==""){
				$("#EXPRESSCOMPANY_ID").tips({
					side:3,
		            msg:'请输入快递公司编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPRESSCOMPANY_ID").focus();
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