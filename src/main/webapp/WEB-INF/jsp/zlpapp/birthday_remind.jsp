<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<base href="<%=basePath%>">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>设置生日提醒</title>
    <link href="static/lshapp/css/users.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/weui.css" />
	<link rel="stylesheet" type="text/css" href="static/lshapp/css/editbirthdaysytle.css" />
	<script src="static/lshapp/js/goods_type.js"></script>
	<script src="static/lshapp/js/zepto.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>

<style>
	.layermbox{position:absolute;left:0;top:0;width:100%;z-index:19891014}
    	.layermmain,.laymshade{position:fixed;left:0;top:0;width:100%;height:100%}
    	.layermbtn span,.layermchild{display:inline-block;position:relative}
    	.laymshade{background-color:rgba(0,0,0,.5);pointer-events:auto}
    	.layermmain{display:table;font-family:Helvetica,arial,sans-serif;pointer-events:none}
    	.layermmain .section{display:table-cell;vertical-align:middle;text-align:center}
    	.layermcont{padding:20px 15px;line-height:22px;border-radius:5px}
.wenzi{
	width:100%;
	height:10%;
	margin-left:8px;
}
.imgdiv{
	height: 20px;
	width: 30px;
	float: right;
	display:none;
}



.birimgdiv{
	height: 20px;
	width: 30px;
	float: right;
	display:none;
}

.on{
    display:block;
 }
.off{
     display:none;
 }


/* div.checked{ */
/* 	display:block; */
/* } */
div.checkeds{
	display:block;
}
.switchsDiv{
	width: 62px;
	height: 40px;
	margin-left: 20%;
}
.btn_base{
	 color:#FFFFFF;
     font-weight: bold;
     font-size: 1.2em;
     float: left;
     padding: 0.4em 3em;
    	margin-left:5%;
    	margin-top:20px;
     width: 90%;
     height:45px;
     border-radius: .5em;
     text-align: center;
 }
 .btn_color{
     background: #ec5151;
 }


</style>
</head>
<body style="background: #fff;">

<div id="wrapper">

		<!-- header 开始 -->
    	
<!-- header 结束 -->
			<div style="height:25px;width:100%;background:#eeeeee;margin-top:20px;line-height:25px;color:#a0a0a0">
				&nbsp;&nbsp;&nbsp;&nbsp;提醒天数设置
			</div>
	<div class="Newsinfo">
		<ul class="tabslider">
			<li onclick="check(this)"  class="licls">
				<div class="wenzi">
					生日当天  
					
					<div class="birimgdiv <c:if test="${pds.ad0 != null }">on</c:if>" myvalue="0">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
					
			</li>
			<li onclick="check(this)" class="licls">
				<div class="wenzi">
				提前一天				
				<div class="birimgdiv <c:if test="${pds.ad1 != null }">on</c:if>"  myvalue="1">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
				</div>
				
				</div>		
			</li>
			<li onclick="check(this)"  class="licls">
				<div class="wenzi">
				提前三天
				<div class="birimgdiv <c:if test="${pds.ad3 != null }">on</c:if>" myvalue="3">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="check(this)" class="licls">
				<div class="wenzi">
				提前七天
				<div class="birimgdiv <c:if test="${pds.ad7 != null }">on</c:if>"  myvalue="7">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="check(this)"  class="licls">
				<div class="wenzi">
				提前三十天
				<div class="birimgdiv <c:if test="${pds.ad30 != null }">on</c:if>" myvalue="30">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			
		</ul>
		<div style="height:25px;width:100%;background:#eeeeee;line-height:25px;color:#a0a0a0">
				&nbsp;&nbsp;&nbsp;&nbsp;双历提醒
		</div>
    </div>
    <ul class="tabslider">
    <li onclick="remind(this)" myvalue="0">
				<div class="wenzi">
				公历提醒
				<div class="reminddiv imgdiv <c:if test="${pd.REMIND_TYPE == 0 }">checkeds</c:if>" >
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="remind(this)" myvalue="1">
				<div class="wenzi">
				农历提醒
				<div class="reminddiv imgdiv <c:if test="${pd.REMIND_TYPE == 1 }">checkeds</c:if>">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="remind(this)" myvalue="2">
				<div class="wenzi">
				双历提醒
				<div class="reminddiv imgdiv <c:if test="${pd.REMIND_TYPE == 2 }">checkeds</c:if>">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			</ul>
	<%-- <div style="height:50px;width:100%;margin-top:10px;line-height:50px;">	
		<span style="margin-left:20px;color:#a0a0a0;">公历生日和农历生日都将提醒</span>
		<img onclick="switchs(this)" class="switchsDiv" src="static/lshapp/images/<c:if test="${pd.REMIND_TYPE ==1 }">on.png</c:if><c:if test="${pd.REMIND_TYPE == 0}">off.png</c:if>" >
	</div> --%>
</div>

	<div class="btn_base btn_color" onclick="editRemind()">
       					保存
    </div>
	<input type="hidden" id="REMIND_TYPE" name="REMIND_TYPE" value="${pd.REMIND_TYPE }">
	<input type="hidden" id="ADVANCE_DATE_COUNT" name="ADVANCE_DATE_COUNT" value="${pd.ADVANCE_DATE_COUNT }">
	<input type="hidden" id="BIRTHDAY_ID" name="BIRTHDAY_ID" value="${pd.BIRTHDAY_ID }">
	<input type="hidden" id="USER_ID" name="USER_ID" value="${pd.USER_ID }">
	
	
	
<script type="text/javascript">
//var k=${pd.REMIND_TYPE};
//var myvalue=${pd.ADVANCE_DATE_COUNT};
function check(obj){
	var $v = $(obj);
	if($v.find(".birimgdiv").hasClass("on")){
		$v.find(".birimgdiv").removeClass("on");
	}else{
 		$v.find(".birimgdiv").addClass("on");
	}
	
	$("#ADVANCE_DATE_COUNT").val("");
    $(".Newsinfo .birimgdiv").each(function(){
	if($(this).hasClass("on")){
	    var temp=$("#ADVANCE_DATE_COUNT").val();
	    myvalue=$(this).attr("myvalue");
	    $("#ADVANCE_DATE_COUNT").val(temp+myvalue+",");
	}
  });
  
    
    
    
    
    
    
    
// 	$(".birimgdiv").each(function(){
// 		if($v.find(".birimgdiv").hasClass("on")){
// 			 var temp=$("#SPORT_GOAL").val();
// 			 myvalue=$v.attr("myvalue");
// 			    $("#SPORT_GOAL").val(temp+myvalue+",");
// 		}
		
		
		

//  	  });
	
	
	
	
	
	
	
// 	$(obj).toggleClass('on');
// 	alert();
	
// 	$(".imgdiv").each(function(){
// 		//$(this).removeClass("checked");
// 	  });
// 	var $v = $(obj);
// 	$v.find(".imgdiv").addClass("checked");
// 	myvalue=$v.attr("myvalue");
// 	$("#ADVANCE_DATE_COUNT").val(myvalue);
}
// $(".Newsinfo ul li").click(function(){
	 
    
//  })


function remind(obj){
	$(".reminddiv").each(function(){
		$(this).removeClass("checkeds");
	  });
	var $v = $(obj);
	$v.find(".reminddiv").addClass("checkeds");
	myvalue=$v.attr("myvalue");
	$("#REMIND_TYPE").val(myvalue);
}
/* function switchs(obj){
	var $v = $(obj);
	if(k==0){
		$v.attr("src","static/lshapp/images/on.png");
		k=1;
	}else{
		$v.attr("src","static/lshapp/images/off.png");
		k=0;
	}
	$("#REMIND_TYPE").val(k);
} */

function editRemind(){
	var SOLAR = $("#REMIND_TYPE").val();
	var COUNT = $("#ADVANCE_DATE_COUNT").val();
	var Id = $("#BIRTHDAY_ID").val();
	var USER_ID = $("#USER_ID").val();
	if(COUNT == "" || COUNT == null){
		d_messages("请至少选择一个提醒天数 !");
		return;		
	}
	$.ajax({
		type: "POST",
		url: '<%=basePath%>lshapp/userbrithday/editRemind.do',
    	data: {ADVANCE_DATE_COUNT:COUNT,REMIND_TYPE:SOLAR,BIRTHDAY_ID:Id,USER_ID:USER_ID},
		dataType:'json',
		cache: false,
		success: function(data){
			 window.history.go(-1);
		}
	});
};

</script>
</body>
</html>
