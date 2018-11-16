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

					<form action="sysconfig/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CONFIG_ID" id="CONFIG_ID" value="${pd.CONFIG_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:180px;text-align: right;padding-top: 13px;">代理商一级分润:</td>
								<td><input type="text" name="AGENT_ONE_INCOME" id="AGENT_ONE_INCOME" value="${pd.AGENT_ONE_INCOME}" maxlength="10" placeholder="这里输入代理商一级分润" title="代理商一级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">代理商二级分润:</td>
								<td><input type="text" name="AGENT_TWO_INCOME" id="AGENT_TWO_INCOME" value="${pd.AGENT_TWO_INCOME}" maxlength="10" placeholder="这里输入代理商二级分润" title="代理商二级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人一级分润:</td>
								<td><input type="text" name="PARTNER_ONE_INCOME" id="PARTNER_ONE_INCOME" value="${pd.PARTNER_ONE_INCOME}" maxlength="10" placeholder="这里输入合伙人一级分润" title="合伙人一级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人二级分润:</td>
								<td><input type="text" name="PARTNER_TWO_INCOME" id="PARTNER_TWO_INCOME" value="${pd.PARTNER_TWO_INCOME}" maxlength="10" placeholder="这里输入合伙人二级分润" title="合伙人二级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">VIP一级分润:</td>
								<td><input type="text" name="VIP_ONE_INCOME" id="VIP_ONE_INCOME" value="${pd.VIP_ONE_INCOME}" maxlength="10" placeholder="这里输入VIP一级分润" title="VIP一级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">VIP二级分润:</td>
								<td><input type="text" name="VIP_TWO_INCOME" id="VIP_TWO_INCOME" value="${pd.VIP_TWO_INCOME}" maxlength="10" placeholder="这里输入VIP二级分润" title="VIP二级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">付费会员一级分润:</td>
								<td><input type="text" name="MEMBERS_ONE_INCOME" id="MEMBERS_ONE_INCOME" value="${pd.MEMBERS_ONE_INCOME}" maxlength="10" placeholder="这里输入付费会员一级分润" title="付费会员一级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">付费会员二级分润:</td>
								<td><input type="text" name="MEMBERS_TWO_INCOME" id="MEMBERS_TWO_INCOME" value="${pd.MEMBERS_TWO_INCOME}" maxlength="10" placeholder="这里输入付费会员二级分润" title="付费会员二级分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">收入最底金额:</td>
								<td><input type="text" name="MINIMUM_INCOME" id="MINIMUM_INCOME" value="${pd.MINIMUM_INCOME}" maxlength="10" placeholder="这里输入收入最底金额" title="收入最底金额" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消费一元返还礼豆数量:</td>
								<td><input type="text" name="INTEGRATION_RETURN_RATE" id="INTEGRATION_RETURN_RATE" value="${pd.INTEGRATION_RETURN_RATE}" maxlength="10" placeholder="这里输入消费一元返还礼豆数量" title="消费一元返还礼豆数量" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">一元对应礼豆数量:</td>
								<td><input type="number" name="INTEGRATION_RATE" id="INTEGRATION_RATE" value="${pd.INTEGRATION_RATE}" maxlength="32" placeholder="这里输入一元对应礼豆数量" title="一元对应礼豆数量" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">免邮金额(等于或大于此金额时免邮费):</td>
								<td><input type="number" name="FREE_SHIPPING_AMOUNT" id="FREE_SHIPPING_AMOUNT" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人每天礼豆自增率:</td>
								<td><input type="number" name="PARTNER_INCOME_RATE" id="PARTNER_INCOME_RATE" value="${pd.PARTNER_INCOME_RATE}" maxlength="32" placeholder="合伙人每天礼豆自增率" title="合伙人每天礼豆自增率" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经销商每天礼豆自增率:</td>
								<td><input type="number" name="AGENT_INCOME_RATE" id="AGENT_INCOME_RATE" value="${pd.AGENT_INCOME_RATE}" maxlength="32" placeholder="经销商每天礼豆自增率" title="经销商每天礼豆自增率" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">一年免费领蛋糕次数:</td>
								<td><input type="number" name="FREE_CAKE_COUNT" id="FREE_CAKE_COUNT" value="${pd.FREE_CAKE_COUNT}" maxlength="32" placeholder="一年免费领蛋糕次数" title="一年免费领蛋糕次数" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人推广自增率:</td>
								<td><input type="number" name="PARTNER_INVITE_RATE" id="PARTNER_INVITE_RATE" value="${pd.PARTNER_INVITE_RATE}" maxlength="32" placeholder="合伙人推广自增率" title="合伙人推广自增率" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经销商推广自增率:</td>
								<td><input type="number" name="AGENT_INVITE_RATE" id="AGENT_INVITE_RATE" value="${pd.AGENT_INVITE_RATE}" maxlength="32" placeholder="经销商推广自增率" title="经销商推广自增率" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">购买合伙人礼包赠送礼豆数:</td>
								<td><input type="number" name="PARTNER_GIVE_INTE" id="PARTNER_GIVE_INTE" value="${pd.PARTNER_GIVE_INTE}" maxlength="32" placeholder="购买合伙人礼包赠送礼豆数" title="购买合伙人礼包赠送礼豆数" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">购买经销商礼包赠送礼豆数:</td>
								<td><input type="number" name="AGENT_GIVE_INTE" id="AGENT_GIVE_INTE" value="${pd.AGENT_GIVE_INTE}" maxlength="32" placeholder="购买经销商礼包赠送礼豆数" title="购买经销商礼包赠送礼豆数" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人第三级及以下分润:</td>
								<td><input type="number" name="PARTNER_THREE_INCOME" id="PARTNER_THREE_INCOME" value="${pd.PARTNER_THREE_INCOME}" maxlength="32" placeholder="合伙人第三级及以下分润" title="合伙人第三级及以下分润" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人拿下一代新增加收入的百分比:</td>
								<td><input type="number" name="PARTNER_CHILDREN_INCOME" id="PARTNER_CHILDREN_INCOME" value="${pd.PARTNER_CHILDREN_INCOME}" maxlength="32" placeholder="合伙人拿下一代新增加收入的百分比" title="合伙人拿下一代新增加收入的百分比" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">购买VIP礼包赠送礼豆数:</td>
								<td><input type="number" name="VIP_GIVE_INTE" id="VIP_GIVE_INTE" value="${pd.VIP_GIVE_INTE}" maxlength="32" placeholder="购买VIP礼包赠送礼豆数" title="购买VIP礼包赠送礼豆数" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">购买付费会员礼包赠送礼豆数:</td>
								<td><input type="number" name="MEMBERS_GIVE_INTE" id="MEMBERS_GIVE_INTE" value="${pd.MEMBERS_GIVE_INTE}" maxlength="32" placeholder="购买付费会员礼包赠送礼豆数" title="购买付费会员礼包赠送礼豆数" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮费:</td>
								<td><input type="number" name="POSTAGE" id="POSTAGE" value="${pd.POSTAGE}" maxlength="32" placeholder="邮费" title="邮费" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">抽奖商品领取邮费:</td>
								<td><input type="number" name="AWARD_POSTAGE" id="AWARD_POSTAGE" value="${pd.AWARD_POSTAGE}" maxlength="32" placeholder="抽奖商品领取邮费" title="抽奖商品领取邮费" style="width:10%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
								</td>
							</tr>
						</table>
						</div>

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
			if($("#AGENT_ONE_INCOME").val()==""){
				$("#AGENT_ONE_INCOME").tips({
					side:3,
		            msg:'请输入代理商一级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGENT_ONE_INCOME").focus();
			return false;
			}
			if($("#AGENT_TWO_INCOME").val()==""){
				$("#AGENT_TWO_INCOME").tips({
					side:3,
		            msg:'请输入代理商二级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGENT_TWO_INCOME").focus();
			return false;
			}
			if($("#PARTNER_ONE_INCOME").val()==""){
				$("#PARTNER_ONE_INCOME").tips({
					side:3,
		            msg:'请输入合伙人一级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNER_ONE_INCOME").focus();
			return false;
			}
			if($("#PARTNER_TWO_INCOME").val()==""){
				$("#PARTNER_TWO_INCOME").tips({
					side:3,
		            msg:'请输入合伙人二级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNER_TWO_INCOME").focus();
			return false;
			}
			if($("#VIP_ONE_INCOME").val()==""){
				$("#VIP_ONE_INCOME").tips({
					side:3,
		            msg:'请输入VIP一级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VIP_ONE_INCOME").focus();
			return false;
			}
			if($("#VIP_TWO_INCOME").val()==""){
				$("#VIP_TWO_INCOME").tips({
					side:3,
		            msg:'请输入VIP二级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VIP_TWO_INCOME").focus();
			return false;
			}
			if($("#MEMBERS_ONE_INCOME").val()==""){
				$("#MEMBERS_ONE_INCOME").tips({
					side:3,
		            msg:'请输入付费会员一级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBERS_ONE_INCOME").focus();
			return false;
			}
			if($("#MEMBERS_TWO_INCOME").val()==""){
				$("#MEMBERS_TWO_INCOME").tips({
					side:3,
		            msg:'请输入付费会员二级分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBERS_TWO_INCOME").focus();
			return false;
			}
			if($("#MINIMUM_INCOME").val()==""){
				$("#MINIMUM_INCOME").tips({
					side:3,
		            msg:'请输入收入最底金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MINIMUM_INCOME").focus();
			return false;
			}
			if($("#INTEGRATION_RETURN_RATE").val()==""){
				$("#INTEGRATION_RETURN_RATE").tips({
					side:3,
		            msg:'请输入消费一元返还礼豆数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTEGRATION_RETURN_RATE").focus();
			return false;
			}
			if($("#INTEGRATION_RATE").val()==""){
				$("#INTEGRATION_RATE").tips({
					side:3,
		            msg:'请输入一元对应礼豆数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTEGRATION_RATE").focus();
			return false;
			}
			if($("#FREE_SHIPPING_AMOUNT").val()==""){
				$("#FREE_SHIPPING_AMOUNT").tips({
					side:3,
		            msg:'请输入免邮金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FREE_SHIPPING_AMOUNT").focus();
			return false;
			}

			if($("#PARTNER_INCOME_RATE").val()==""){
				$("#PARTNER_INCOME_RATE").tips({
					side:3,
		            msg:'请输入合伙人每天礼豆自增率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNER_INCOME_RATE").focus();
			return false;
			}
			if($("#AGENT_INCOME_RATE").val()==""){
				$("#AGENT_INCOME_RATE").tips({
					side:3,
		            msg:'请输入经销商每天礼豆自增率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("AGENT_INCOME_RATE").focus();
			return false;
			}
			if($("#FREE_CAKE_COUNT").val()==""){
				$("#FREE_CAKE_COUNT").tips({
					side:3,
		            msg:'请输入一年免费领蛋糕次数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FREE_CAKE_COUNT").focus();
			return false;
			}
			if($("#PARTNER_INVITE_RATE").val()==""){
				$("#PARTNER_INVITE_RATE").tips({
					side:3,
		            msg:'请输入合伙人推广自增率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNER_INVITE_RATE").focus();
			return false;
			}
			if($("#AGENT_INVITE_RATE").val()==""){
				$("#AGENT_INVITE_RATE").tips({
					side:3,
		            msg:'请输入经销商推广自增率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGENT_INVITE_RATE").focus();
			return false;
			}
			if($("#PARTNER_GIVE_INTE").val()==""){
				$("#PARTNER_GIVE_INTE").tips({
					side:3,
		            msg:'购买合伙人礼包赠送礼豆数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#购买合伙人礼包赠送礼豆数").focus();
			return false;
			}
			if($("#AGENT_GIVE_INTE").val()==""){
				$("#AGENT_GIVE_INTE").tips({
					side:3,
		            msg:'请输入购买经销商礼包赠送礼豆数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNER_GIVE_INTE").focus();
			return false;
			}
			if($("#MEMBERS_GIVE_INTE").val()==""){
				$("#MEMBERS_GIVE_INTE").tips({
					side:3,
		            msg:'请输入购买付费会员礼包赠送礼豆数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBERS_GIVE_INTE").focus();
			return false;
			}
			if($("#PARTNER_THREE_INCOME").val()==""){
				$("#PARTNER_THREE_INCOME").tips({
					side:3,
		            msg:'请输入合伙人第三级及以下分润',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNER_THREE_INCOME").focus();
			return false;
			}
			if($("#PARTNER_CHILDREN_INCOME").val()==""){
				$("#PARTNER_CHILDREN_INCOME").tips({
					side:3,
		            msg:'请输入合伙人拿下一代新增加收入的百分比',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNER_CHILDREN_INCOME").focus();
			return false;
			}
			if($("#VIP_GIVE_INTE").val()==""){
				$("#VIP_GIVE_INTE").tips({
					side:3,
		            msg:'请输入购买VIP礼包赠送礼豆数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VIP_GIVE_INTE").focus();
			return false;
			}
			if($("#POSTAGE").val()==""){
				$("#POSTAGE").tips({
					side:3,
		            msg:'请输入邮费',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POSTAGE").focus();
			return false;
			}
			if($("#AWARD_POSTAGE").val()==""){
				$("#AWARD_POSTAGE").tips({
					side:3,
		            msg:'请输入抽奖商品领取邮费',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AWARD_POSTAGE").focus();
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