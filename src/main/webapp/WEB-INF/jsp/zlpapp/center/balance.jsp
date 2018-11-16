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
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>余额</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="static/lshapp/css/center/weui.css" />
    <script src="static/lshapp/js/center/zepto.min.js"></script>
    <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
	<script type="text/javascript">
		function chaxai(){
			var  lastStart=$("#lastStart").val();
			var  lastEnd=$("#lastEnd").val();
			$("#zww").val("0");
			$.ajax({
     		 		async : false,
			        type : 'POST',
			        url : "<%=basePath%>lshapp/userCenter/go_balance.do?lastStart="+lastStart+"&lastEnd="+lastEnd+"&currentPage=1",// 请求的action路径
			        success: function(data){// 请求失败处理函数
			        	$("#balance").html("");
			        	$("#balance").html(data) //将ajxa请求的数据追加到内容里
			        },
			    });
		}
		function go_roll_out(){
				window.location.href="<%=basePath%>lshapp/userCenter/go_roll_out.do";
		}
	</script>
	<script type="text/javascript">

 	var currentPage=2;
 	var isMore=false;//是否正在下拉耍新
          $(document).ready(function(){
            $(window).scroll(function(){
              if($(document).scrollTop()>=$(document).height()-$(window).height()){
            	  var totalPage = $("#totalPage").val();
            	  var zww = $("#zww").val();
            	  var  lastStart=$("#lastStart").val();
      			var  lastEnd=$("#lastEnd").val();
            	  if(parseInt(zww)==1){
            		  lastStart="";
            		  lastEnd="";
            	  }
            	  if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了

            	  }else{

            			  if(!isMore){
                			  isMore = true;
    		                $.ajax({
    		                    type:"post",
    		                    url:"<%=basePath%>lshapp/userCenter/go_balance.do",
    		                    data:{currentPage:currentPage,showCount:20,lastStart:lastStart,lastEnd:lastEnd},
    		                    beforeSend:function(){
    		                    	//d_messages("正在加载中...");//显示加载时候的提示
    		                    	 $('.ajax_loading').show() //显示加载时候的提示
    		                    },
    		                    success:function(ret){
    		                   		$("#balance").after(ret) //将ajxa请求的数据追加到内容里
    		                   		$('.ajax_loading').hide() //请求成功,隐藏加载提示
    		                     	 currentPage ++;s
    		                    }
    		                })
    		                return true;
    		                	  }else{
    		          				return false;
    		          			}
            		  }


              }
            })
          })
        </script>
	<style type="text/css">
		.return_image{
			width:1.2rem;
			height:1.8rem;
		}
	</style>
</head>
<body style="background-color: white;">
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>
		<!-- <section class="search category-search common-search" style="background-color: #ec5151;">
	       <div class="text-all dis-box j-text-all text-all-back">
						<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
	                        	<img class="return_image" src="static/lshapp/images/return.png">
	                   </a>
					  <div style="text-align: center;width: 86%;" >
	                        <span style="text-align: center;font-size: 1.8rem;color: white;">余额</span>
					  </div>
			</div>
	 	 </section> -->
	 	 <input type="hidden" name="totalPage" id="totalPage" value="${totalPage}"/>
		<section class="purse-header-box text-center purse-f">
			<p style="color: white;">今日收益(元)</p>
			<h2 style="color: white;">${today}</h2>
			<h5 >总金额：${pd.MONEY}</h5>
		 	<img src="static/lshapp/images/center/pur-bg.png">
			<div class="user-pur-box">
			</div>
		</section>

		<section class="b-color-f my-nav-box m-top10">
			<div style="height: 30px;margin-top: -0.5rem;">
				<div style="float: left;font-size: 1.3rem;margin-left: 1.2%;margin-top: 0.6rem;width: 40%;text-align: center;line-height: 30px;color: #999;">
					开始时间:<label id="showDatePickerBegin" style="color: black;">${pd.lastStart}</label>
					<input type="hidden" id="lastStart" name="lastStart" value="${pd.lastStart}"/>
					<input type="hidden" name="zww" id="zww" value="1"/>
				</div>
				<div style="float: left;font-size: 1.3rem;margin-top: 0.6rem;margin-left: 0.2%;width: 40%;text-align: center;line-height: 30px;color: #999;">
					结束时间:<label id="showDatePickerEnd" style="color: black;">${pd.lastEnd}</label>
					<input type="hidden" id="lastEnd" name="lastEnd" value="${pd.lastEnd}"/>
				</div>
				<div style="float: left;font-weight: 400;margin-left: 1.5%;margin-top: 0.35rem;height: 30px;width: 15%;color: white;text-align: center;line-height:30px;font-size: 1.4rem;border-radius: 10px;background-color: #ED4C44" onclick="chaxai()">
				确定</div>
			</div>
			<div style="margin-top: 1.2rem;">
				<div style="float: left;font-size: 1.3rem;color: black;width: 43%;text-align: center; margin-top: 0.3rem;">时间</div>
				<div style="float: left;font-size: 1.3rem;color: black;width: 28%;text-align: center; margin-top: 0.3rem;">获取途径</div>
				<div style="float: left;font-size: 1.3rem;color: black;width: 28%;text-align: center; margin-top: 0.3rem;">明细</div>
			</div>
			<hr style="height:1px;border:none;border-top:1px solid #E1E1E1;width: 90%;margin-top: 0.1rem;margin-left: 5%;" />
			<div style="margin-top: -1.0rem;" id="balance">
				<c:forEach items="${financeList}" var="var" varStatus="vs">
					<div style="float: left;font-size: 1.3rem;color:#999;width: 43%;text-align: center; margin-top: 0.3rem;">${var.CREATE_DATE}</div>
					<div style="float: left;font-size: 1.3rem;color:#999;width: 28%;text-align: center;margin-top: 0.3rem;">
						<c:if test="${var.INCOME_REASON=='1' }">订单收入</c:if>
						<c:if test="${var.INCOME_REASON=='2' }">后台增加</c:if>
						<c:if test="${var.INCOME_REASON=='3' }">提现</c:if>
						<c:if test="${var.INCOME_REASON=='4' }">后台减少</c:if>
					</div>
					<c:if test="${var.FINANCE_TYPE=='0' }">
						<div style="float: left;font-size: 1.3rem;width: 28%;text-align: center;margin-top: 0.3rem;">
							${var.AMOUNT}
						</div>
					</c:if>
					<c:if test="${var.FINANCE_TYPE=='1' }">
						<div style="float: left;font-size: 1.3rem;width: 28%;text-align: center;margin-top: 0.3rem;">
							-${var.AMOUNT}
						</div>
					</c:if>
				</c:forEach>
			</div>
		</section>
		<div class="ect-button-more dis-box filter-btn" onclick="go_roll_out()">
						<a  class="btn-submit box-flex">转出</a>
		</div>
	<div class='ajax_loading' style='background:#F0F0F0;height:60px;width:100%;text-align:center;line-height:60px;font-size:18px;display:none;position:fixed;bottom:0px'><img style="width: 4.0rem;height: 4.0rem;" src="static/lshapp/images/center/loading.gif"> 数据加载中</div>

    <div class="common-show"></div>

<script type="text/javascript" class="picker js_show">
	 $('#showDatePickerBegin').on('click', function () {
	    	//var birthday=document.getElementById("birthday").value;
	    	//var BB=birthday.toString().replace(",","-").replace(",","-");
	        weui.datePicker({
	            start: 1970,
	            end: new Date().getFullYear(),
	           // defaultValue: [BB],
	            onChange: function (result) {
	            },
	            onConfirm: function (result) {
	            	  var re=result.toString().replace(",","-").replace(",","-");
	            	  document.getElementById("showDatePickerBegin").innerHTML = re;
	            	  document.getElementById("lastStart").value = re;
	            }
	        });
	    });
	 $('#showDatePickerEnd').on('click', function () {
	    	//var birthday=document.getElementById("birthday").value;
	    	//var BB=birthday.toString().replace(",","-").replace(",","-");
	        weui.datePicker({
	            start: 1970,
	            end: new Date().getFullYear(),
	           // defaultValue: [BB],
	            onChange: function (result) {
	            },
	            onConfirm: function (result) {
	            	  var re=result.toString().replace(",","-").replace(",","-");
	            	  document.getElementById("showDatePickerEnd").innerHTML = re;
	            	  document.getElementById("lastEnd").value = re;
	            }
	        });
	    });
	</script>
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>

</body></html>