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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>收货地址</title>
    <link href="<%=basePath %>static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="<%=basePath %>static/lshapp/js/center/app.js"></script>
	<script src="<%=basePath %>static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">

	</script>
	<style type="text/css">
	.user_icon{
			width: 1.6rem;
			height: 1.6rem;
			border-radius: 0.5rem;
	}
	.user_icon1{
		width: 1.8rem;
		height: 1.8rem;
		margin-top:-0.29rem;
	}
	 .return_image{
			width:1.2rem;
			height:1.8rem;
		}
	</style>

</head>
<body>
<!-- <div style="height: 50px;line-height: 50px;border-bottom: 1px solid #E1E1E1;background-color: white;">
	<div style="width: 12vw;height: 100%;float: left;padding-top: 16px;" onclick="goBack();">
		<img alt="" src="static/lshapp/images/return.png" style="width: 12px;height: 18px;margin: 0 auto;display: block;">
	</div>
	<div style="text-align: center;width: 76vw;float: left;font-size: 20px;color: black;font-weight: bolder;">
	收货地址管理
	</div>
	<div style="width: 12vw;height: 100%;float: right;">
	</div>
</div> -->
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>
			<!-- <section class="search category-search common-search" style="background-color: white;">
		       <div class="text-all dis-box j-text-all text-all-back">
							<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
		                        	<img class="return_image" src="static/lshapp/images/return.png">
		                   </a>
						  <div style="text-align: center;width: 90%;" >
		                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">收货地址管理</span>
						  </div>
				</div>
	  		</section> -->
		<div class="con">

			<div class="flow-consignee-list j-get-consignee-one select-three">
				<input id="type" name="type" value="${type}" type="hidden"/>
				<c:forEach items="${pd}" var="var" varStatus="vs">
					<input id="no" name="no" value="${no}" type="hidden"/>
					<section class="flow-checkout-adr m-top08">
					<div class="flow-have-adr padding-all">
						<div class="f-h-adr-title dis-box">
			                  <div class="box-flex"><label>${var.NAME}</label>
			                  </div>
			                  <div class="box-flex"><div class="fr"><span class="f-05">${var.PHONE_NUMBER}</span></div></div>
			             </div>
			             <p class="f-04  m-top04">${var.PROVINCE}${var.CITY}${var.AREA}${var.DETAILS_ADDESS}</p>
					</div>
					<div class="flow-set-adr of-hidden padding-all ">
						<div class="ect-select fl">
							<label class="dis-box " >
								<c:if test="${var.IS_DEFAULT_ADDRESS==0}">
									<img class="user_icon" src="static/lshapp/images/center/Unchecked5-hdpi.png" id="niming${var.ADDRESS_ID}" onclick="niming('${var.ADDRESS_ID}')">
									<img class="user_icon" src="static/lshapp/images/center/Select5-hdpi.png" id="nimingNo${var.ADDRESS_ID}" style="display:none" onclick="nimingNo('${var.ADDRESS_ID}')">
								</c:if>
								<c:if test="${var.IS_DEFAULT_ADDRESS==1}">
									<img class="user_icon" src="static/lshapp/images/center/Unchecked5-hdpi.png" id="niming${var.ADDRESS_ID}" style="display:none" onclick="niming('${var.ADDRESS_ID}')">
									<img class="user_icon" src="static/lshapp/images/center/Select5-hdpi.png" id="nimingNo${var.ADDRESS_ID}"  onclick="nimingNo('${var.ADDRESS_ID}')">
								</c:if>
								<span class="t-first margin-lr">
									<a class="ml10 ftx-05 " href="javascript:void(0);">设为默认</a>
								</span>
							</label>
						</div>
                        <div class="fr">
	                        <div style="position: static;font-size: 1.4rem;color: #444;margin-left: .4rem;display: inline;" onclick="goEdit('${var.ADDRESS_ID}');">
	                        	<img class="user_icon" src="static/lshapp/images/center/edit1-hdpi.png">&nbsp;编辑
	                        </div>
	                        <div style="position: static;font-size: 1.4rem;color: #444;margin-left: .4rem;display: inline;" onclick="deleAddress('${var.ADDRESS_ID}');">
	                        	<img class="user_icon" src="static/lshapp/images/center/delete1-hdpi.png">&nbsp;删除
	                        </div>
	                   </div>

					</div>
				</section>
				</c:forEach>

				<div class="ect-button-more dis-box filter-btn">
					<div onclick="goAdd();"  class="btn-submit box-flex" style="font-size:1.9rem;">
					<img class="user_icon1" src="static/lshapp/images/center/New address-hdpi.png">&nbsp;新建地址</div>
				</div>
			</div>

		</div>
    <!--快捷导航-->
    <script>

</script>

    <div class="common-show"></div>
   <script type="text/javascript">
   		<!--设置为默认地址-->
	   function niming(ID){
			 $.ajax({
	      		 	async : false,
				        /* async : false,
				        cache : false, */
				        //cache: false,
				        type : 'POST',
				        url : "<%=basePath%>lshapp/userCenter/update_default_address.do",// 请求的action路径
				        data:{"IS_DEFAULT_ADDRESS":0,"ADDRESS_ID":ID},
				        success: function(data){// 请求失败处理函数
				        	document.getElementById("niming"+ID).style.display="none";
							document.getElementById("nimingNo"+ID).style.display="block";
				        	document.getElementById("niming"+data).style.display="block";
				        	document.getElementById("nimingNo"+data).style.display="none";
				        },
				});
	   }
	   <!--取消默认地址-->
		function nimingNo(ID){
			if(parseInt($("#no").val())<=1){
				return false;
			}
			$.ajax({
      		 	async : false,
			        /* async : false,
			        cache : false, */
			        //cache: false,
			        type : 'POST',
			        url : "<%=basePath%>lshapp/userCenter/update_default_address.do",// 请求的action路径
			        data:{"IS_DEFAULT_ADDRESS":1,"ADDRESS_ID":ID},
			        success: function(data){// 请求失败处理函数
			        	document.getElementById("nimingNo"+ID).style.display="none";
						document.getElementById("niming"+ID).style.display="block";
			        	document.getElementById("nimingNo"+data).style.display="block";
			        	document.getElementById("niming"+data).style.display="none";
			        },
			});
		}
       //设置默认收获地址
       function adderss_user(address_id){
                $.get('/mobile/index.php?m=user&a=ajax_make_address+',{address_id:address_id},function(data){


                },'json') ;

        }
        ///删除地址
        function deleAddress(ADDRESS_ID){
        	window.location.replace("<%=basePath%>lshapp/userCenter/delete_address.do?ADDRESS_ID="+ADDRESS_ID);
        }
        ///新增地址
        function goAdd(){
       		var type = $("#type").val();
        	if(type!=""){ // 订单选择新增地址
        		window.location.replace("<%=basePath%>lshapp/userCenter/add_user_address.do?type="+type);
        	}else{ // 个人中心新增地址
        		window.location.replace("<%=basePath%>lshapp/userCenter/add_user_address.do");
        	}
        }
        // 去修改地址
        function goEdit(Id){
        	var type = $("#type").val();
        	if(type!=""){ // 订单选择修改地址
        		window.location.replace("<%=basePath%>lshapp/userCenter/goEdit_address.do?type="+type+"&ADDRESS_ID="+Id);
        	}else{ // 个人中心修改地址
        		window.location.replace("<%=basePath%>lshapp/userCenter/goEdit_address.do?ADDRESS_ID="+Id);
        	}
        }

        function goBack(){
        	var type = $("#type").val();
        	if(type !=""){
        		window.location.replace("<%=basePath%>lshapp/order/order_address.do?type="+type);
        	}else{
        		window.location.replace("<%=basePath%>lshapp/userCenter/center_index.do");
        	}

        }
    </script>
</body></html>