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

					<form action="order/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ORDER_ID" id="ORDER_ID" value="${pd.ORDER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:110px;text-align:center;padding-top: 13px;" colspan="4">收货人信息:</td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">收货人名称:</td>
								<td>${pd.RECEIVER}</td>
								<td style="width:110px;text-align: right;padding-top: 13px;">收货人手机号:</td>
								<td>${pd.PHONE_NUMBER}</td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">收货人地址:</td>
								<td >${pd.PROVINCE}${pd.CITY}${pd.AREA}${pd.DETAILS_ADDRESS}</td>
								<td style="width:110px;text-align: right;padding-top: 13px;"></td>
								<td></td>
							</tr>
							<tr>
								<td style="width:110px;text-align:center;padding-top: 13px;" colspan="4">订单状态:</td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">订单编号:</td>
								<td>${pd.ORDER_ID}</td>
								<td style="width:110px;text-align: right;padding-top: 13px;">下单时间:</td>
								<td>${pd.PAY_TIME}</td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">订单状态:</td>
								<td>
									<c:if test="${pd.ORDER_STATUS=='0'}">待支付</c:if>
									<c:if test="${pd.ORDER_STATUS=='1'}">待发货</c:if>
									<c:if test="${pd.ORDER_STATUS=='2'}">待收货</c:if>
									<c:if test="${pd.ORDER_STATUS=='3'}">待评价</c:if>
									<c:if test="${pd.ORDER_STATUS=='4'}">已完成</c:if>
								</td>
								<td style="width:110px;text-align: right;padding-top: 13px;">支付方式:</td>
								<td>
									<c:if test="${pd.PAY_WAY=='0'}">未支付</c:if>
									<c:if test="${pd.PAY_WAY=='1'}">支付宝</c:if>
									<c:if test="${pd.PAY_WAY=='2'}">微信</c:if>
									<c:if test="${pd.PAY_WAY=='3'}">积分</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:110px;text-align:center;padding-top: 13px;" colspan="4">订单商品:</td>
							</tr>
							<c:forEach items="${cartList}" var="var" varStatus="vs">
								<tr>
									<td style="width:110px;text-align: right;padding-top: 13px;">商品名称:</td>
									<td>${var.GOODS_NAME}</td>
									<td colspan="2"><img src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}"></img></td>
								</tr>
								<tr>
									<td style="width:110px;text-align: right;padding-top: 13px;">单价:</td>
									<td>${var.CURRENT_PRICE}</td>
									<td style="width:110px;text-align: right;padding-top: 13px;">规格:</td>
									<td>${var.SPEC}</td>
								</tr>
								<tr>
									<td style="width:110px;text-align: right;padding-top: 13px;">数量:</td>
									<td>${var.AMOUNT }</td>
									<td><!-- 商品类别: --></td>
									<td>
										<%-- <c:if test="${var.GOODS_POSITION=='0'}">普通商品</c:if>
										<c:if test="${var.GOODS_POSITION=='1'}">积分商品</c:if>
										<c:if test="${var.GOODS_POSITION=='2'}">生日那天免费送蛋糕商品</c:if>
										<c:if test="${var.GOODS_POSITION=='3'}">抽奖商品</c:if> --%>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td style="width:110px;text-align:center;padding-top: 13px;" colspan="4">订单金额:</td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">订单总金额:</td>
								<td style="color: red;">${pd.TOTAL_AMOUNT}</td>
								<td style="width:110px;text-align: right;padding-top: 13px;">积分抵扣金额:</td>
								<td style="color: red;">${pd.DEDUCTION_AMOUNT}</td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">邮费:</td>
								<td style="color: red;">${pd.FREIGHT_AMOUNT}</td>
								<td style="width:110px;text-align: right;padding-top: 13px;"></td>
								<td style="color: red;"></td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;" colspan="2"></td>

								<td style="width:110px;text-align: right;padding-top: 13px;">实付金额:</td>
								<td style="color: red;text-align: center;">${pd.REAL_PAY_AMOUNT}</td>

							</tr>
							<tr>
								<td style="width:110px;text-align:center;padding-top: 13px;" colspan="4">物流信息:</td>
							</tr>
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">快递公司:</td>
								<td>${pd.COMPANY_NAME}</td>
								<td style="width:110px;text-align: right;padding-top: 13px;">物流编号:</td>
								<td>${pd.EXPRESS_NO}</td>
							</tr>


							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="logistics('${pd.ORDER_ID}');">查看物流</a>
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

		//物流查看
		function logistics(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看物流";
			 diag.URL = '<%=basePath%>order/goLogistics.do?ORDER_ID='+Id;
			 diag.Width = 650;
			 diag.Height = 555;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>