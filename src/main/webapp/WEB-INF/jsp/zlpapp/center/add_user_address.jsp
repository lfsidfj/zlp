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
    <title>新增收货地址</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
    <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
    <script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
     <script type="text/javascript">
			var status=true;
            //获取所有省
       		function allP(){
       		 document.getElementById("checkPage").style.display="none";
 				document.getElementById("chooseAddressPage").style.display="block";
       		   $.ajax({
	  		        type:"post",//请求方式get/post
	  		        url:'<%=basePath%>lshapp/userCenter/selelct_area.do?LEVEL='+0,//请求对应的地址

	  		        success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
	  		        	 for ( var i = 0; i < data.length; i++) {
	  		        			$("#sheng").append("<li id="+data[i].AREA_ID+" onclick=shiQ('"+data[i].AREA_ID+"')"+">"+data[i].FULL_NAME+"</li>");

	                      }
	  		        }
  		   	 	})
            }
            //获取所对应的市
       		function shiQ(ID){
            	var ppp=document.getElementById(ID).innerHTML;
            	document.getElementById("province").innerHTML=ppp;
            	document.getElementById("dizhi").value=ppp;
            	document.getElementById("Zsheng").value=ppp;
            	document.getElementById("province_id").value=ID;
            	document.getElementById("city").innerHTML="请选择";

				$("#province").removeClass("head-address-li");
				$("#city").addClass("head-address-li");
				$.ajax({
	  		        type:"post",//请求方式get/post
	  		        url:'<%=basePath%>lshapp/userCenter/selelct_area.do?AREA_ID='+ID,//请求对应的地址

	  		        success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
	  		        	 for ( var i = 0; i < data.length; i++) {
	  		        			$("#shi").append("<li id="+data[i].AREA_ID+" onclick=quQ('"+data[i].AREA_ID+"')"+">"+data[i].FULL_NAME+"</li>");

	                      }
	  		        	document.getElementById("sheng").style.display="none";
	  		        }
  		   	 	})
  		   	document.getElementById("shi").style.display="block";
            }
            function quQ(ID){
            	var ppp=document.getElementById(ID).innerHTML;
            	document.getElementById("city").innerHTML=ppp;
            	document.getElementById("area").innerHTML="请选择";
            	var dizhi=document.getElementById("dizhi").value;
            	document.getElementById("dizhi").value=dizhi+ppp;
            	document.getElementById("Zshi").value=ppp;
            	document.getElementById("city_id").value=ID;
            	$("#city").removeClass("head-address-li");
				$("#area").addClass("head-address-li");
				$.ajax({
	  		        type:"post",//请求方式get/post
	  		        url:'<%=basePath%>lshapp/userCenter/selelct_area.do?AREA_ID='+ID,//请求对应的地址

	  		        success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
	  		        	 for ( var i = 0; i < data.length; i++) {
	  		        			$("#qu").append("<li id="+data[i].AREA_ID+" onclick=okQ('"+data[i].AREA_ID+"')"+">"+data[i].FULL_NAME+"</li>");

	                      }
	  		        	document.getElementById("shi").style.display="none";
	  		        }
  		   	 	})
  		   	document.getElementById("qu").style.display="block";
            }
            function okQ(ID){
            	var ppp=document.getElementById(ID).innerHTML;
            	var dizhi=document.getElementById("dizhi").value;
            	document.getElementById("dizhi").value=dizhi+ppp;
            	var Zsheng= document.getElementById("Zsheng").value;
            	var Zshi=document.getElementById("Zshi").value;
            	document.getElementById("Zqu").value=ppp;
            	document.getElementById("addressLabelId").innerHTML=Zsheng+Zshi+ppp;
            	document.getElementById("AREA_ID").value=ID;
            	document.getElementById("checkPage").style.display="block";
 				document.getElementById("chooseAddressPage").style.display="none";
            }
            if(status){
            	 function save(){
     				if($("#NAME").val()==""){
     					d_messages("收货人不能为空!");
     					return false;
     				}else if($("#PHONE_NUMBER").val()==""){
     					d_messages("手机号不能为空!");
     					return false;
     				}else{
     					 var phonenum = $("#PHONE_NUMBER").val();
     					  var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
     					    if(!myreg.test(phonenum)){
     					        d_messages('请输入有效的手机号码！');
     					        return false;
     					    }else if($("#DETAILS_ADDESS").val()==""){
     							d_messages("详细地址不能为空!");
     							return false;
     						}else {
     							status=false;
     							 $('.wwww').show() //显示加载时候的提示
     							var type = $("#type").val();
     							var AREA_ID = $("#AREA_ID").val();
     							var DETAILS_ADDESS = $("#DETAILS_ADDESS").val();
     							/* var dizhi = $("#dizhi").val(); */
     							var Zsheng = $("#Zsheng").val();
     							var Zshi = $("#Zshi").val();
     							var Zqu = $("#Zqu").val();
     							var dizhi=Zsheng+Zshi+Zqu;
     							var city_region_id = $("#city_region_id").val();
     							var province_region_id = $("#province_region_id").val();
     							var NAME = $("#NAME").val();
     							var ADDRESS_ID = $("#ADDRESS_ID").val();
     							 $.ajax({
     				                    type: "POST",
     				                    url: '<%=basePath%>lshapp/userCenter/save_address.do',
     				                    data: {
     				                        "AREA_ID": AREA_ID,"DETAILS_ADDESS": DETAILS_ADDESS,"dizhi": dizhi,
     				                        "city_region_id": city_region_id,"province_region_id": province_region_id,
     				                        "NAME": NAME,"ADDRESS_ID": ADDRESS_ID,"PHONE_NUMBER": phonenum
     				                    },
     				                    dataType: "json",
     				                    success: function (data) {
     				                    	$('.wwww').hide() //请求成功,隐藏加载提示
     				                   		 if(data.msg =="ok"){
     				                   			window.location.replace("<%=basePath%>lshapp/userCenter/user_address.do?type="+type);
     				                   		 }else{
     				                   			 return;
     				                   		 }
     				                    }
     				                });
     						}
     				}
                 }
            }

            //重新选择省市区
            function again_province(obj){
            	var $v = $(obj);
            	if($v.hasClass("head-address-li")){

            	}else{
            		document.getElementById("city").innerHTML="";
                	document.getElementById("area").innerHTML="";
                	document.getElementById("province").innerHTML="请选择";
                	$('#city').html("");
                	$('#area').html("");
                	$("#city").removeClass("head-address-li");
                	$("#area").removeClass("head-address-li");
                	$("#province").addClass("head-address-li");
                	document.getElementById("sheng").style.display="block";
                	document.getElementById("shi").innerHTML="";
                	document.getElementById("qu").innerHTML="";
                	document.getElementById("shi").style.display="none";
                	document.getElementById("qu").style.display="none";
            	}

            }
            //重新选择省市区
            function again_city(obj){
            	var $v = $(obj);
            	if($v.hasClass("head-address-li")){

            	}else{
	            	document.getElementById("area").innerHTML="";
	            	document.getElementById("city").innerHTML="请选择";
	            	$('#area').html("");
	            	$("#area").removeClass("head-address-li");
	            	$("#city").addClass("head-address-li");
	            	document.getElementById("shi").style.display="block";
	            	document.getElementById("qu").innerHTML="";
	            	document.getElementById("qu").style.display="none";
            	}
            }
            function goBack(){
            	var type = $("#type").val();
            	window.location.replace("<%=basePath%>lshapp/userCenter/user_address.do?type="+type);
            }
    </script>
    <style type="text/css">
	.user_icon{
			width: 1.3rem;
			height: 1.3rem;
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
		.wwww{
			height: 65px;
			width: 30%;
			/* border: 1.3px solid #00AEED; */
			border-radius: 10px;
			margin-left: 34%;
			top: 200px;
			text-align: center;
			font-size: 1.7rem;
			background-color:#484848;
			color: white;
			line-height:65px;
			font-family: Helvetica,arial,sans-serif;
			position: fixed;
			display: none;
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
						  <div style="text-align: center;width: 85%;" >
		                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">收货地址管理</span>
						  </div>
				</div>
	  		</section>
	  		 <hr style="height:1px;border:none;border-top:1px solid #E1E1E1;width: 100%;margin-top: -1.2rem;" /> -->
  <form action="<%=basePath%>lshapp/userCenter/save_address.do" method="post" name="Form" id="Form">
    <input type="hidden" name="type" id="type" value="${pd.type}"/>
    <div class="con b-color-f" id="checkPage" style="display: block;">
        <div class="flow-consignee margin-lr">
            <div class="text-all dis-box j-text-all">
                <label>收货人:</label>
                <div class="box-flex input-text">
                    <input  class="j-input-text" placeholder="请输入收货人姓名" datatype="*" nullmsg="请输入收货人姓名" value="${pd.NAME}" id="NAME" name="NAME" type="text">
                    <i class="iconfont icon-guanbi1 close-common j-is-null"></i>
                </div>
            </div>
            <div class="text-all dis-box j-text-all">
                <label>手机号:</label>
                <div class="box-flex input-text">
                    <input class="j-input-text" name="PHONE_NUMBER" placeholder="请输入联系电话" errormsg="手机号码格式不正确" datatype="*" nullmsg="请输入联系电话" value="${pd.PHONE_NUMBER}" id="PHONE_NUMBER" type="tel">
                    <i class="iconfont icon-guanbi1 close-common j-is-null"></i>
                </div>
            </div>
            <!--address-start-->
            <div class="text-all" id="editAddressForm">
                <input id="province_id" name="province_region_id" value="" type="hidden">
                <input id="city_id" name="city_region_id" value="" type="hidden">
                <input id="AREA_ID" name="AREA_ID" value="${pd.AREA_ID}" type="hidden">
                <input id="ADDRESS_ID" name="ADDRESS_ID" value="${pd.ADDRESS_ID}" type="hidden">
                <input id="dizhi" name="dizhi" value="" type="hidden">
                <input id="Zsheng" name="Zsheng" value="" type="hidden">
                <input id="Zshi" name="Zshi" value="" type="hidden">
                <input id="Zqu" name="Zqu" value="" type="hidden">
                <div class="address-box" id="selectAddressBtn" onclick="allP()">
                        <label class="fl">所在地区</label>
                        <span class="fl text-all-span addressdetail" id="addressLabelId" style="color:#979797">${pd.PROVINCE }${pd.CITY }${pd.AREA }</span>
                        <span class="t-jiantou fr"><img class="user_icon" src="static/lshapp/images/center/Arrow3-hdpi.png"></span>
                </div>
            </div>
            <!--address-end-->
            <div class="text-all ">
                <label>详细地址: </label>
                <div class="box-flex input-text">
                    <input class="j-input-text wx-location" name="DETAILS_ADDESS"  placeholder="详细地址" datatype="*" nullmsg="请输入详细地址" value="${pd.DETAILS_ADDESS}" id="DETAILS_ADDESS" type="text">
                    <i class="iconfont icon-guanbi1 close-common j-is-null"></i>
                </div>
            </div>
            </div>
			<div class="ect-button-more dis-box filter-btn" onclick="save()">
					<a  class="btn-submit box-flex">保存地址</a>
			</div>
    </div>

    <!--地区选择 s-->
    <div class="choose-address-page" id="chooseAddressPage" style="display: none;">
	<div class="head-fix">
		<header>
			<div class="jd-index-header">
				<div class="jd-index-header-icon-back">
					<span id="goBack"></span>
				</div>
				<div class="jd-index-header-title"></div>
			</div>

		</header>
		<ul class="head-address-ul" id="headAddressUl">
			<li mytitle="0" class="head-address-li" id="province" onclick="again_province(this)">请选择</li>
			<li mytitle="1" class="" id="city" onclick="again_city(this)"></li>
			<li mytitle="2" class="" id="area"></li>
			<li mytitle="3"></li>
			<li mytitle="4"></li>
		</ul>
	</div>
	<div class="address-container" id="addressContainer">
		<div class="address-content" id="addressContentDiv" style="transform: translate(0px, 0px) translateZ(0px); height: 528px;">
			<ul class="address-ul" id="sheng"></ul>
			<ul class="address-ul" id="shi"></ul>
			<ul class="address-ul" id="qu"></ul>
			<ul class="address-ul"></ul>
			<ul class="address-ul"></ul>
		</div>
	</div>
</div>
    <!--地区选择 e-->
</form>
    <!--快捷导航-->
<div class="wwww">正在保存... </div>

    <div class="common-show"></div>



</body></html>