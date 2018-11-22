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

	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
<script type="text/javascript">
var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
</script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<link href="plugins/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="plugins/ueditor/third-party/jquery.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/umeditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/umeditor.min.js"></script>
	<script type="text/javascript" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
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
						<form action="goods/${msg }.do" name="Form" id="Form" method="post">
							<input type="hidden" name="GOODS_ID" id="GOODS_ID" value="${pd.GOODS_ID}"/>
							<input type="hidden" name="CHECKIDS" id="CHECKIDS" value="${pd.CHECKIDS}"/>
						<div id="zhongxin" style="margin-top: 10px;">
						 <div class="span6">
							<div class="tabbable">
						            <ul class="nav nav-tabs" id="myTab">
						              <li class="active"><a data-toggle="tab" href="#home"><i class="green icon-home bigger-110"></i> 商品基本信息</a></li>
						              <li><a data-toggle="tab" href="#profile1"><i class="green icon-cog bigger-110"></i>商品详情</a></li>
						              <li><a data-toggle="tab" href="#profile2"><i class="green icon-cog bigger-110"></i>商品参数</a></li>
						            </ul>
						            <div class="tab-content">
									  <div id="home" class="tab-pane in active">
										<table id="table_report" class="table table-striped table-bordered table-hover">
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品类目:</td>
												<td>
													<select class="chosen-select form-control" name="GOODS_TYPE_ID" id="GOODS_TYPE_ID" data-placeholder="请选择商品类目" style="vertical-align:top;width:53%;">
														<c:forEach items="${typeList}" var="var" varStatus="vs">
															<option value="${var.GOODS_TYPE_ID}" <c:if test="${pd.GOODS_TYPE_ID==var.GOODS_TYPE_ID}">selected="selected"</c:if>>${var.TYPE_NAME}</option>
														</c:forEach>
													</select>
												</td>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品品牌:</td>
												<td>
													<select class="chosen-select form-control" name="BRAND_ID" id="BRAND_ID" data-placeholder="请选择商品品牌" style="vertical-align:top;width:80%;">
														<c:forEach items="${brandList}" var="var" varStatus="vs">
															<option value="${var.BRAND_ID}" <c:if test="${var.BRAND_ID ==pd.BRAND_ID}">selected="selected"</c:if>>${var.BRAND_NAME}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品活动:</td>
												<td colspan="3">
													<select class="chosen-select form-control" name="ACTIVITY_ID" id="ACTIVITY_ID" data-placeholder="请选择商品活动" style="vertical-align:top;width:30%;">
														<c:forEach items="${activityList}" var="var" varStatus="vs">
															<option value="${var.ACTIVITY_ID}" <c:if test="${var.ACTIVITY_ID ==pd.ACTIVITY_ID}">selected="selected"</c:if>>${var.ACTIVITY_NAME}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品名称:</td>
												<td colspan="3"><input type="text" name="GOODS_NAME" id="GOODS_NAME" value="${pd.GOODS_NAME}" maxlength="255" placeholder="这里输入商品名称" title="商品名称" style="width:98%;"/></td>
											</tr>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品管关键词:</td>
												<td colspan="3"><input type="text" name="KEYWORDS" id="KEYWORDS" value="${pd.KEYWORDS}" maxlength="32" placeholder="这里输入关键词（以,结尾）" title="关键词" style="width:98%;"/></td>
											</tr>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品小图:</td>
												<td colspan="3">
													<input  type="file" name="file" id="file" value="${pd.PICTURE_ID}" maxlength="255" placeholder="这里输入类目图片" title="类目图片" style="width:50%;"/>
													<span style="color: red">建议上传图片大小为120x120像素，格式为jpg或png格式</span>
												</td>
											</tr>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品规格:</td>
												<td colspan="3">
													<c:forEach items="${specList}" var="var" varStatus="vs">
														<input style="margin-left: 10px;" type='checkbox' id='GOODS_SPEC' name='GOODS_SPEC'  value="${var.SPEC_ID}" <c:if test="${var.check=='ischeck'}">checked="checked"</c:if>/>&nbsp;&nbsp;${var.SPEC}
													</c:forEach>
												</td>
											</tr>
											<c:if test="${msg=='save' }">
												<tr>
													<td style="width:75px;text-align: right;padding-top: 13px;">商品类型:</td>
													<td colspan="3">
														<select class="chosen-select form-control" name="GOODS_POSITION" id="GOODS_POSITION" data-placeholder="请选择商品类型" style="vertical-align:top;width: 220px;">
															<option value="0" <c:if test="${pd.GOODS_POSITION=='0'}">selected="selected"</c:if>>普通商品</option>
															<option value="1" <c:if test="${pd.GOODS_POSITION=='1'}">selected="selected"</c:if>>积分商品</option>
															<option value="2" <c:if test="${pd.GOODS_POSITION=='2'}">selected="selected"</c:if>>礼品定制</option>
															<option value="3" <c:if test="${pd.GOODS_POSITION=='3'}">selected="selected"</c:if>>特价礼品</option>
														</select>
													</td>
												</tr>
											</c:if>
											<tr id="need_custom" <c:if test="${pd.GOODS_POSITION!='2'}">style="display: none"</c:if>>
												<td style="width:76px;text-align: right;padding-top: 13px;">定制商品起定量:</td>
												<td><input type="number"  name="QUANTITATIVE" id="QUANTITATIVE" value="${pd.QUANTITATIVE }"  style="width:90%" /></td>

												<td style="width:76px;text-align: right;padding-top: 13px;">定制商品周期(天):</td>
												<td><input type="number"  name="CUSTOM_TIME" id="CUSTOM_TIME" value="${pd.CUSTOM_TIME }"  style="width:90%" /></td>
											</tr>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">是否首页展示:</td>
												<td>
													<select class="chosen-select form-control" name="IS_INDEX" id="IS_INDEX" data-placeholder="请选择是否首页展示" style="vertical-align:top;width:53%;">
														<option value="0" <c:if test="${pd.IS_INDEX=='0'}">selected="selected"</c:if>>不展示</option>
														<option value="1" <c:if test="${pd.IS_INDEX=='1'}">selected="selected"</c:if>>展示</option>
													</select>
												</td>
												<td style="width:75px;text-align: right;padding-top: 13px;">是否上架:</td>
												<td>
													<select class="chosen-select form-control" name="IS_SHELVES" id="IS_SHELVES" data-placeholder="请选择是否上架" style="vertical-align:top;width:80%;">
														<option value="0" <c:if test="${pd.IS_SHELVES=='0'}">selected="selected"</c:if>>上架</option>
														<option value="1" <c:if test="${pd.IS_SHELVES=='1'}">selected="selected"</c:if>>不上架</option>
													</select>
												</td>
											</tr>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">商品原价:</td>
												<td colspan="3"><input type="text" name="ORIGINAL_PRICE" id="ORIGINAL_PRICE" value="${pd.ORIGINAL_PRICE}" maxlength="10" placeholder="这里输入商品原价" title="商品原价" style="width:30%;"/></td>
                                            </tr>
                                            <tr id="neet_current" >
                                                <td style="width:75px;text-align: right;padding-top: 13px;">商品现价:</td>
                                                <td colspan="3"><input type="text" name="CURRENT_PRICE" id="CURRENT_PRICE" value="${pd.CURRENT_PRICE}" maxlength="10" placeholder="这里输入商品现价" title="商品现价" style="width:30%;"/></td>
                                            </tr>
                                            <tr id="neet_deduction">
                                                <td style="width:75px;text-align: right;padding-top: 13px;">积分抵扣金额:</td>
                                                <td colspan="3"><input type="text" name="DEDUCTION_MONEY" id="DEDUCTION_MONEY" value="${pd.DEDUCTION_MONEY}" maxlength="10" placeholder="这里输入积分抵扣金额" title="积分抵扣金额" style="width:30%;"/></td>
                                            </tr>
                                            <tr id="neet_integration">
                                                <td style="width:75px;text-align: right;padding-top: 13px;">所需积分:</td>
                                                <td colspan="3"><input type="number" name="INTEGRATION" id="INTEGRATION" value="${pd.INTEGRATION}" maxlength="32" placeholder="这里输入所需积分" title="所需积分" style="width:30%;"/>&nbsp;&nbsp;(仅积分商品展示)</td>
                                            </tr>
												<%-- <tr>
                                                    <td style="width:75px;text-align: right;padding-top: 13px;">销量:</td>
                                                    <td><input type="number" name="SALES_VOLUME" id="SALES_VOLUME" value="${pd.SALES_VOLUME}" maxlength="32" placeholder="这里输入销量" title="销量" style="width:98%;"/></td>
                                                </tr> --%>
											<tr>
												<td style="width:75px;text-align: right;padding-top: 13px;">排序:</td>
												<td colspan="3"><input type="number" name="SEQENCE" id="SEQENCE" value="${pd.SEQENCE}" maxlength="32" placeholder="这里输入排序" title="排序" style="width:30%;"/></td>
											</tr>

										</table>
										  <table class="center" style="width:100%" >
											  <tr>
												  <td style="text-align: center;" colspan="6">
													  <a class="btn btn-mini btn-primary" onclick="saveGoods();">保存</a>
													  <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
												  </td>
											  </tr>
										  </table>
									  </div>
										<!--商品详情-->
									  <div id="profile1" class="tab-pane">
										  <table class="table table-striped table-bordered table-hover" style="margin-top:5px;">
											  <tr>
												  <td style="width:75px;text-align: right;padding-top: 13px;">商品详情:</td>
												  <td>
													  <script id="editor1"  type="text/plain" style="width:640px;height:450px;"></script>
												  </td>
											  </tr>
											  <tr>
												  <td style="text-align: center;" colspan="10">
													  <a class="btn btn-mini btn-primary" onclick="saveGoods();">保存</a>
													  <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
												  </td>
											  </tr>

											</table>
									  </div>
									  <div id="profile2" class="tab-pane">
										  <table  class="table table-striped table-bordered table-hover" style="margin-top:5px;">
											  <tr>
												  <td style="text-align: center;" colspan="10">
													  <a class="btn btn-mini btn-primary" onclick="saveGoods();">保存</a>
													  <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
												  </td>
											  </tr>
											</table>
									  </div>

									  <div style="display: none;" id="fhsmsobjsys"></div>
									  
						            </div>
							</div>
						 </div><!--/span-->
						</div>
		
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
        $("#GOODS_POSITION").change(function(){
            var options=$("#GOODS_POSITION option:selected").val();  //获取选中的项
            if(options==2){    // 免费拿样
                $("#need_custom").show();
            }else{
                $("#need_custom").hide();
			}
        });
	</script>
	<script type="text/javascript">
		$(top.hangge());
		$(document).ready(function(){
			if("${pd.isCheck1 }" == "yes"){
				$("#check1").attr("checked",true);
			}else{
				$("#check1").attr("checked",false);
			}
			if("${pd.isCheck2 }" == "yes"){
				$("#check2").attr("checked",true);
			}else{
				$("#check2").attr("checked",false);
			}
		});
	</script>
	<script type="text/javascript">
		$(top.hangge());
		//保存
		function saveGoods(){
			if($("#GOODS_TYPE_ID").val()==""){
				$("#GOODS_TYPE_ID").tips({
					side:3,
					msg:'请商品类型',
					bg:'#AE81FF',
					time:2
				});
				$("#GOODS_TYPE_ID").focus();
				return false;
			}
			if($("#GOODS_NAME").val()==""){
				$("#GOODS_NAME").tips({
					side:3,
					msg:'请输入商品名称',
					bg:'#AE81FF',
					time:2
				});
				$("#GOODS_NAME").focus();
				return false;
			}
			if($("#PICTURE_ID").val()==""){
				$("#file").tips({
					side:3,
					msg:'请选择图片，等待图片上传成功',
					bg:'#AE81FF',
					time:2
				});
				$("#file").focus();
				return false;
			}
			if($("#ORIGINAL_PRICE").val()==""){
				$("#ORIGINAL_PRICE").tips({
					side:3,
					msg:'请输入商品原价',
					bg:'#AE81FF',
					time:2
				});
				$("#ORIGINAL_PRICE").focus();
				return false;
			}else if(parseInt($("#ORIGINAL_PRICE").val())<=0){
				$("#ORIGINAL_PRICE").tips({
					side:3,
					msg:'请输入正确商品原价',
					bg:'#AE81FF',
					time:2
				});
				$("#ORIGINAL_PRICE").focus();
				return false;
			}
			if($("#CURRENT_PRICE").val()==""){
				$("#CURRENT_PRICE").tips({
					side:3,
					msg:'请输入商品现价',
					bg:'#AE81FF',
					time:2
				});
				$("#CURRENT_PRICE").focus();
				return false;
			}else if(parseInt($("#CURRENT_PRICE").val())<=0){
				$("#CURRENT_PRICE").tips({
					side:3,
					msg:'请输入正确商品现价',
					bg:'#AE81FF',
					time:2
				});
				$("#CURRENT_PRICE").focus();
				return false;
			}
			if($("#DEDUCTION_MONEY").val()==""){
				$("#DEDUCTION_MONEY").tips({
					side:3,
					msg:'请输入积分抵扣金额',
					bg:'#AE81FF',
					time:2
				});
				$("#DEDUCTION_MONEY").focus();
				return false;
			}else if(parseInt($("#DEDUCTION_MONEY").val())<0){
				$("#DEDUCTION_MONEY").tips({
					side:3,
					msg:'请输入正确积分抵扣金额',
					bg:'#AE81FF',
					time:2
				});
				$("#DEDUCTION_MONEY").focus();
				return false;
			}
			if($("#INTEGRATION").val()==""){
				$("#INTEGRATION").tips({
					side:3,
					msg:'请输入所需积分',
					bg:'#AE81FF',
					time:2
				});
				$("#INTEGRATION").focus();
				return false;
			}else if(parseInt($("#INTEGRATION").val())<0){
				$("#INTEGRATION").tips({
					side:3,
					msg:'请输入正确所需积分',
					bg:'#AE81FF',
					time:2
				});
				$("#INTEGRATION").focus();
				return false;
			}
			/* } */
			if($("#GOODS_DETAILS").val()==""){
				$("#GOODS_DETAILS").tips({
					side:3,
					msg:'请输入商品详情',
					bg:'#AE81FF',
					time:2
				});
				$("#GOODS_DETAILS").focus();
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
			var checkID = [];
			$("input[name='GOODS_SPEC']:checked").each(function(i){//把所有被选中的复选框的值存入数组
				checkID[i] =$(this).val();
			});
			$("#CHECKIDS").val(checkID);
			if($("#CHECKIDS").val()==""){
				$("#GOODS_SPEC").tips({
					side:3,
					msg:'请选择商品规格',
					bg:'#AE81FF',
					time:2
				});
				$("#GOODS_SPEC").focus();
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	</script>
	<script type="text/javascript">

        //百度富文本
        function ueditor(){

            var desc2='${pd.GOODS_DETAILS}';

            UM.getEditor('editor1');
            UM.getEditor('editor1').setContent(desc2);
        }

        //start
        jQuery(function($) {

            ueditor();
        });

	</script>
</body>
</html>