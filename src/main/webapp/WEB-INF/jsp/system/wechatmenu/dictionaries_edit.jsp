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
		<!-- jsp文件头和头部 -->
		<%@ include file="../../system/index/top.jsp"%>
		
	
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
					
					<form action="wechatMenu/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DICTIONARIES_ID" id="DICTIONARIES_ID" value="${pd.DICTIONARIES_ID}"/>
						<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${null == pd.PARENT_ID ? DICTIONARIES_ID:pd.PARENT_ID}"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-top:15px;">
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">上级:</td>
								<td>
									<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
										<b>${null == pds.NAME ?'(无) 此项为顶级':pds.NAME}</b>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">类型:</td>
								<td>
									<select name="TYPE">
										<option value="click" <c:if test="${pd.TYPE=='click' }"> selected='selected'</c:if>>click</option>
										<option value="view" <c:if test="${pd.TYPE=='view' }"> selected='selected'</c:if>>view</option>
										<option value="scancode_push" <c:if test="${pd.TYPE=='scancode_push' }"> selected='selected'</c:if>>scancode_push</option>
										<option value="scancode_waitmsg" <c:if test="${pd.TYPE=='scancode_waitmsg' }"> selected='selected'</c:if>>scancode_waitmsg</option>
										<option value="pic_sysphoto" <c:if test="${pd.TYPE=='pic_sysphoto' }"> selected='selected'</c:if>>pic_sysphoto</option>
										<option value="pic_photo_or_album" <c:if test="${pd.TYPE=='pic_photo_or_album' }"> selected='selected'</c:if>>pic_photo_or_album</option>
										<option value="pic_weixin" <c:if test="${pd.TYPE=='pic_weixin' }"> selected='selected'</c:if>>pic_weixin</option>
										<option value="location_select" <c:if test="${pd.TYPE=='location_select' }"> selected='selected'</c:if>>location_select</option>
										<option value="media_id" <c:if test="${pd.TYPE=='media_id' }"> selected='selected'</c:if>>media_id</option>
										<option value="view_limited" <c:if test="${pd.TYPE=='view_limited' }"> selected='selected'</c:if>>view_limited</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">键值:</td>
								<td><input type="text" name="KEE" id="KEE" value="${pd.KEE}" maxlength="500" placeholder="这里输入键值" title="键值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">网页地址:</td>
								<td><input type="text" name="URL" id="URL" value="${pd.URL}" maxlength="500" placeholder="这里输入网页地址" title="网页地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">多媒体编号:</td>
								<td><input type="text" name="MEDIA_ID" id="MEDIA_ID" value="${pd.MEDIA_ID}" maxlength="500" placeholder="这里输入多媒体编号" title="多媒体编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">小程序的appid:</td>
								<td><input type="text" name="APPID" id="APPID" value="${pd.APPID}" maxlength="500" placeholder="这里输入小程序的appid" title="小程序的appid" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">小程序的页面路径:</td>
								<td><input type="text" name="PAGEPATH" id="PAGEPATH" value="${pd.PAGEPATH}" maxlength="500" placeholder="这里输入小程序的页面路径" title="小程序的页面路径" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
								<td><input type="number" name="ORDER_BY" id="ORDER_BY" value="${pd.ORDER_BY}" maxlength="32" placeholder="这里输入排序" title="排序"/></td>
							</tr>
							<tr>
								<td class="center" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
		}
			if($("#NAME_EN").val()==""){
				$("#NAME_EN").tips({
					side:3,
		            msg:'请输入英文',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME_EN").focus();
			return false;
		}
			if($("#BIANMA").val()==""){
				$("#BIANMA").tips({
					side:3,
		            msg:'请输入编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BIANMA").focus();
			return false;
		}
			if($("#ORDER_BY").val()==""){
				$("#ORDER_BY").tips({
					side:3,
		            msg:'请输入数字',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_BY").focus();
			return false;
		}
			<c:if test="${msg=='save' }">
				addable();
			</c:if>
			<c:if test="${msg!='save' }">
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			</c:if>
			
		}
		
		//判断编码是否存在
		function hasBianma(){
			var BIANMA = $.trim($("#BIANMA").val());
			if("" == BIANMA)return;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>wechatMenu/hasBianma.do',
		    	data: {BIANMA:BIANMA,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
					 }else{
						$("#BIANMA").tips({
							side:1,
				            msg:'编码'+BIANMA+'已存在,重新输入',
				            bg:'#AE81FF',
				            time:5
				        });
						$('#BIANMA').val('');
					 }
				}
			});
		}
		
		function addable(){
			data='parentId=${null == pd.PARENT_ID ? DICTIONARIES_ID:pd.PARENT_ID}';
			$.ajax(
					{
						type:'post',//这里改为get也可以正常执行
						url:'${pageContext.request.contextPath}/wechatMenu/checkAddable.do',
						//ContentType没指定将默认为：application/x-www-form-urlencoded
						data:data,
						success:function(data){
							if(data.status=='1'){
								$("#Form").submit();
								$("#zhongxin").hide();
								$("#zhongxin2").show();
							}else{
								$(".col-xs-4").tips({
									side:3,
						            msg:data.message,
						            bg:'#AE81FF',
						            time:2
						        });
							}
						}
						
					}	
				)
		}
		</script>
</body>
</html>