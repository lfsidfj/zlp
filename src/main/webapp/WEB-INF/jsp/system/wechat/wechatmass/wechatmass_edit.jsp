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
					
					<form action="wechatmass/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="WECHATMASS_ID" id="WECHATMASS_ID" value="${pd.WECHATMASS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消息类型:</td>
								<td>
								<select name="MSGTYPE" onchange="msgTypeChange();" id="MSGTYPE">
									<option value="mpnews">图文消息</option>
									<option value="text">文本消息</option>
									<option value="image">图片消息</option>
									<option value="mpvideo">视频消息</option>
									<option value="voice">语音消息</option>
								</select>
								<%-- <input type="text" name="MSGTYPE" id="MSGTYPE" value="${pd.MSGTYPE}" maxlength="255" placeholder="这里输入消息类型" title="消息类型" style="width:98%;"/> --%>
								</td>
							</tr>
							<tr id="MEDIA_IDTR">
								<td style="width:75px;text-align: right;padding-top: 13px;">媒体编号:</td>
								<td><input type="text" name="MEDIA_ID" id="MEDIA_ID" value="${pd.MEDIA_ID}" maxlength="255" placeholder="这里输入媒体编号" title="媒体编号" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;" id="TEXTCONTENTTR">
								<td style="width:75px;text-align: right;padding-top: 13px;">文本内容:</td>
								<td><input type="text" name="TEXTCONTENT" id="TEXTCONTENT" value="${pd.TEXTCONTENT}" maxlength="21845" placeholder="这里输入文本内容" title="文本内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户群:</td>
								<td>
								<%-- <input type="text" name="IS_TO_ALL" id="IS_TO_ALL" value="${pd.IS_TO_ALL}" maxlength="255" placeholder="这里输入向全部用户发送" title="向全部用户发送" style="width:98%;"/> --%>
								<select name="IS_TO_ALL" onchange="istoallChange();" id="IS_TO_ALL">
									<option value="all">所有用户</option>
									<option value="tag">通过标签</option>
									<option value="openid">通过OPENID列表</option>
								</select>
								</td>
							</tr><%-- 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入状态" title="状态" style="width:98%;"/></td>
							</tr> --%>
							<tr style="display: none;" id="TAG_IDTR">
								<td style="width:75px;text-align: right;padding-top: 13px;">标签:</td>
								<td><input type="text" name="TAG_ID" id="TAG_ID" value="${pd.TAG_ID}" maxlength="32" placeholder="这里输入标签" title="标签" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;" id="OPENIDLISTTR">
								<td style="width:75px;text-align: right;padding-top: 13px;">openid列表:</td>
								<td><input type="text" name="OPENIDLIST" id="OPENIDLIST" value="${pd.OPENIDLIST}" placeholder="这里输入openid列表，逗号隔开" title="openid列表" style="width:98%;"/></td>
							</tr>
							<tr id="TITLETR" style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr id="DESCRIPTIONTR" style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">校验为转发时:</td>
								<td>
								<%-- <input type="text" name="SEND_IGNORE_REPRINT" id="SEND_IGNORE_REPRINT" value="${pd.SEND_IGNORE_REPRINT}" maxlength="255" placeholder="这里输入校验标识" title="校验标识" style="width:98%;"/> --%>
								<select name="SEND_IGNORE_REPRINT" id="SEND_IGNORE_REPRINT">
									<option value="">请选择</option>
									<option value="0">停止群发</option>
									<option value="1">继续群发</option>
								</select>
								</td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">消息编号:</td>
								<td><input type="number" name="MSG_ID" id="MSG_ID" value="${pd.MSG_ID}" maxlength="32" placeholder="这里输入消息编号" title="消息编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">MSG_DATA_ID:</td>
								<td><input type="number" name="MSG_DATA_ID" id="MSG_DATA_ID" value="${pd.MSG_DATA_ID}" maxlength="32" placeholder="这里输入MSG_DATA_ID" title="MSG_DATA_ID" style="width:98%;"/></td>
							</tr> --%>
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
		function save(){
			if($("#MSGTYPE").val()==""){
				$("#MSGTYPE").tips({
					side:3,
		            msg:'请输入消息类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MSGTYPE").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#MEDIA_ID").val()==""&&$("#MEDIA_ID").parent().parent().css("display")!='none'){
				$("#MEDIA_ID").tips({
					side:3,
		            msg:'请输入媒体编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEDIA_ID").focus();
			return false;
			}
			if($("#TAG_ID").val()==""&&$("#TAG_ID").parent().parent().css("display")!='none'){
				$("#TAG_ID").tips({
					side:3,
		            msg:'请输入标签',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TAG_ID").focus();
			return false;
			}
			if($("#IS_TO_ALL").val()==""){
				$("#IS_TO_ALL").tips({
					side:3,
		            msg:'请输入向全部用户发送',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_TO_ALL").focus();
			return false;
			}
			if($("#TITLE").val()==""&&$("#TITLE").parent().parent().css("display")!='none'){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#DESCRIPTION").val()==""&&$("#DESCRIPTION").parent().parent().css("display")!='none'){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
			return false;
			}
			if($("#SEND_IGNORE_REPRINT").val()==""){
				$("#SEND_IGNORE_REPRINT").tips({
					side:3,
		            msg:'请输入校验标识',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEND_IGNORE_REPRINT").focus();
			return false;
			}
			if($("#MSG_ID").val()==""&&$("#MSG_ID").parent().parent().css("display")!='none'){
				$("#MSG_ID").tips({
					side:3,
		            msg:'请输入消息编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MSG_ID").focus();
			return false;
			}
			if($("#MSG_DATA_ID").val()==""){
				$("#MSG_DATA_ID").tips({
					side:3,
		            msg:'请输入MSG_DATA_ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MSG_DATA_ID").focus();
			return false;
			}
			if($("#TEXTCONTENT").val()==""&&$("#TEXTCONTENT").parent().parent().css("display")!='none'){
				$("#TEXTCONTENT").tips({
					side:3,
		            msg:'请输入文本内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEXTCONTENT").focus();
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
		function msgTypeChange(){
			var checkValue=$("#MSGTYPE").val();
			if(checkValue=='mpvideo'){
				$("#DESCRIPTIONTR").css("display","");
				$("#TITLETR").css("display","");
				$("#DESCRIPTIONTR").css("display","");
				$("#TITLETR").css("display","");
			}else{
				$("#DESCRIPTIONTR").css("display","none");
				$("#TITLETR").css("display","none");
			}
			if(checkValue=='text'){
				$("#TEXTCONTENTTR").css("display","");
				$("#MEDIA_IDTR").css("display","none");
			}else{
				$("#TEXTCONTENTTR").css("display","none");
				$("#MEDIA_IDTR").css("display","");
			}
		}
		function istoallChange(){
			var checkValue=$("#IS_TO_ALL").val();
			if(checkValue=='all'){
				$("#TAG_IDTR").css("display","none");
				$("#OPENIDLISTTR").css("display","none");
			}else if(checkValue=='openid'){
				$("#TAG_IDTR").css("display","none");
				$("#OPENIDLISTTR").css("display","");
			}else if(checkValue=='tag'){
				$("#TAG_IDTR").css("display","");
				$("#OPENIDLISTTR").css("display","none");
			}
		}
		</script>
</body>
</html>