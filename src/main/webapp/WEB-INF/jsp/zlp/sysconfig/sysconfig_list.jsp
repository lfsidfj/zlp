<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

						<!-- 检索  -->
						<form action="sysconfig/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CONFIG_ID" id="CONFIG_ID" value="${pd.CONFIG_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">代理商一级分润:</td>
								<td><input type="text" name="AGENT_ONE_INCOME" id="AGENT_ONE_INCOME" value="${pd.AGENT_ONE_INCOME}" maxlength="10" placeholder="这里输入代理商一级分润" title="代理商一级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">代理商二级分润:</td>
								<td><input type="text" name="AGENT_TWO_INCOME" id="AGENT_TWO_INCOME" value="${pd.AGENT_TWO_INCOME}" maxlength="10" placeholder="这里输入代理商二级分润" title="代理商二级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人一级分润:</td>
								<td><input type="text" name="PARTNER_ONE_INCOME" id="PARTNER_ONE_INCOME" value="${pd.PARTNER_ONE_INCOME}" maxlength="10" placeholder="这里输入合伙人一级分润" title="合伙人一级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人二级分润:</td>
								<td><input type="text" name="PARTNER_TWO_INCOME" id="PARTNER_TWO_INCOME" value="${pd.PARTNER_TWO_INCOME}" maxlength="10" placeholder="这里输入合伙人二级分润" title="合伙人二级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">VIP一级分润:</td>
								<td><input type="text" name="VIP_ONE_INCOME" id="VIP_ONE_INCOME" value="${pd.VIP_ONE_INCOME}" maxlength="10" placeholder="这里输入VIP一级分润" title="VIP一级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">VIP二级分润:</td>
								<td><input type="text" name="VIP_TWO_INCOME" id="VIP_TWO_INCOME" value="${pd.VIP_TWO_INCOME}" maxlength="10" placeholder="这里输入VIP二级分润" title="VIP二级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">付费会员一级分润:</td>
								<td><input type="text" name="MEMBERS_ONE_INCOME" id="MEMBERS_ONE_INCOME" value="${pd.MEMBERS_ONE_INCOME}" maxlength="10" placeholder="这里输入付费会员一级分润" title="付费会员一级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">付费会员一级分润:</td>
								<td><input type="text" name="MEMBERS_TWO_INCOME" id="MEMBERS_TWO_INCOME" value="${pd.MEMBERS_TWO_INCOME}" maxlength="10" placeholder="这里输入付费会员一级分润" title="付费会员一级分润" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">收入最底金额:</td>
								<td><input type="text" name="MINIMUM_INCOME" id="MINIMUM_INCOME" value="${pd.MINIMUM_INCOME}" maxlength="10" placeholder="这里输入收入最底金额" title="收入最底金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消费一元返还礼豆数量:</td>
								<td><input type="text" name="INTEGRATION_RETURN_RATE" id="INTEGRATION_RETURN_RATE" value="${pd.INTEGRATION_RETURN_RATE}" maxlength="10" placeholder="这里输入消费一元返还礼豆数量" title="消费一元返还礼豆数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">一元对应礼豆数量:</td>
								<td><input type="number" name="INTEGRATION_RATE" id="INTEGRATION_RATE" value="${pd.INTEGRATION_RATE}" maxlength="32" placeholder="这里输入一元对应礼豆数量" title="一元对应礼豆数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">免邮金额(等于或大于此金额时免邮费):</td>
								<td><input type="number" name="FREE_SHIPPING_AMOUNT" id="FREE_SHIPPING_AMOUNT" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>

							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人每天礼豆自增率:</td>
								<td><input type="number" name="PARTNER_INCOME_RATE" id="PARTNER_INCOME_RATE" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经销商每天礼豆自增率:</td>
								<td><input type="number" name="AGENT_INCOME_RATE" id="AGENT_INCOME_RATE" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">一年免费领蛋糕次数:</td>
								<td><input type="number" name="FREE_CAKE_COUNT" id="FREE_CAKE_COUNT" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合伙人推广自增率:</td>
								<td><input type="number" name="PARTNER_INVITE_RATE" id="PARTNER_INVITE_RATE" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经销商推广自增率:</td>
								<td><input type="number" name="AGENT_INVITE_RATE" id="AGENT_INVITE_RATE" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">购买合伙人礼包赠送礼豆数:</td>
								<td><input type="number" name="PARTNER_GIVE_INTE" id="PARTNER_GIVE_INTE" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">购买经销商礼包赠送礼豆数:</td>
								<td><input type="number" name="AGENT_GIVE_INTE" id="AGENT_GIVE_INTE" value="${pd.FREE_SHIPPING_AMOUNT}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">购买付费会员礼包赠送礼豆数:</td>
								<td><input type="number" name="MEMBERS_GIVE_INTE" id="MEMBERS_GIVE_INTE" value="${pd.MEMBERS_GIVE_INTE}" maxlength="32" placeholder="免邮金额" title="免邮金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">抽奖商品领取邮费:</td>
								<td><input type="number" name="AWARD_POSTAGE" id="AWARD_POSTAGE" value="${pd.AWARD_POSTAGE}" maxlength="32" placeholder="抽奖商品领取邮费" title="抽奖商品领取邮费" style="width:98%;"/></td>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {

			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});

			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true});
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}


			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});

		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>sysconfig/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}



		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>sysconfig/goEdit.do?CONFIG_ID='+Id;
			 diag.Width = 450;
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

		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons:
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>sysconfig/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};

		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>sysconfig/excel.do';
		}
	</script>


</body>
</html>