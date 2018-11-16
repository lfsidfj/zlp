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
    <title>我的帖子</title>
    <link href="static/lshapp/css/center/app_cart.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
    <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		/* function myinvitation(obj){
			document.getElementById("myBack").style.display="none";
			document.getElementById("myInvitation").style.display="block";
			if($("#invitation").hasClass("head-address-liN")){
			//?currentPage=1
			//alert("checked");
			}else{
				$("#invitation").addClass("head-address-liN");
				$("#back").removeClass("head-address-liN");
				document.getElementById("back").style.color="#9A9A9A";
				document.getElementById("invitation").style.color="red";
				//alert("notchecked");
			}
		}
		function myback(obj){
			document.getElementById("myInvitation").style.display="none";
			document.getElementById("myBack").style.display="block";
			var id=document.getElementById("back");
			if($("#back").hasClass("head-address-liN")){
			//alert("checked");
			}else{
				$("#back").addClass("head-address-liN");
				$("#invitation").removeClass("head-address-liN");
				document.getElementById("back").style.color="red";
				document.getElementById("invitation").style.color="#9A9A9A";
				//alert("notchecked");
			}
		} */
	</script>
	 <script type="text/javascript">

	 	var currentPage=2;
	 	var isMore=false;//是否正在下拉耍新
          $(document).ready(function(){
            $(window).scroll(function(){
              if($(document).scrollTop()>=$(document).height()-$(window).height()){
            	  var totalPage = $("#totalPage").val();
            	  if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了

            	  }else{
            		  if(!isMore){
            			  isMore = true;
            			  $.ajax({
                              type:"post",
                              url:"<%=basePath%>lshapp/userCenter/my_invitation.do",
                              data:{currentPage:currentPage,showCount:10},
                              beforeSend:function(){
                            	  d_messages("正在加载中...");//显示加载时候的提示
                              },
                              success:function(ret){
                               $("#myInvitation").after(ret) //将ajxa请求的数据追加到内容里面
                               currentPage ++;
                              }
                          })
                           isMore = false;
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
		.inlin{
			display:inline-block;
		}
		.user_name{
			display:inline-block;
			margin-right:0.5rem;
			padding-top: .3rem;
			font-size: 1.6rem;
			color: #333;
			line-height: normal;
			list-style: none;
			font-weight: 450;
			box-sizing: border-box;
			font-family: inherit;
		}
		.user_icon{
			width: 1.4rem;
			height: 1.4rem;
			border-radius: 0.5rem;
		}
		.user_icon1{
			width: 2.0rem;
			height: 2.0rem;
			margin-bottom: .5rem;
		}
		.user_list{
			background:#fff;
			padding-top: 1rem;
			padding-bottom:1rem;
			border-bottom: 1px solid #f6f6f9;
		}
		.s-user-top {
			padding: 0 1.5rem;
			position: relative;
		}
		.submint {
		height: 40px;
		width: 60%;
		/* border: 1.3px solid #00AEED; */
		border-radius: 20px;
		margin-left: 20%;
		margin-top: 44px;
		text-align: center;
		font-size: 20px;
		background-color:red;
		color: white;
		line-height:40px;
		}
		.tabbb{
		font-size:1.5rem ;
		margin-left:1.3rem;
		color:#9A9A9A;
		}
		.new-flow-bottom{
		margin-bottom:3rem;
		}
		.return_image{
			width:1.2rem;
			height:1.8rem;
		}
		 .head-address-liN:after{width:80%;height:1px;border-bottom:2px solid #f23030;position:absolute;bottom:1px;left:39%;content:'';margin-left:-30%;color: red;}
	</style>
</head>
<body>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>

<div class="con mb-7">
	<%-- <div onclick="update_information()">
		<div class="s-user-top" style="background:#fff;margin-bottom:0.8rem;" >
			<div class="user_profile_box p-r">
				<div class="dis-box t-goods1 onelist-hidden jian-top" for="logo" style="padding-top:2.5rem;padding-bottom:2.0rem;">
					<div class="user-img " style="width: 7.5rem;height: 7.5rem;">
    					<div class="user-head-img-box-1" style="width: 7.5rem;height: 7.5rem;border-radius: 4.5rem;">
							<img src="<%=basePath%>uploadFiles/uploadImgs/${pd.PATH}">
							 	 <input type="hidden" name="totalPage" id="totalPage" value="${totalPage}"/>
						</div>
                    </div>
                    <div class="box-flex profile-index-top" style="padding-top:2.0rem;">
                        <div><h3 class="user_name">${pd.NICK_NAME}</h3><img class="user_icon" src="<%=basePath%>static/lshapp/images/center/Girl student-hdpi.png"> </div>
                         <div>
	                         <img class="user_icon" src="<%=basePath%>static/lshapp/images/center/Grade-hdpi.png">
	                         <p class="text-all-span f-02" style="display:inline-block;">
	                         	<c:if test="${pd.ROLE=='common'}">普通用户</c:if>
	                         	<c:if test="${pd.ROLE=='agent'}">代理商</c:if>
	                         	<c:if test="${pd.ROLE=='partner'}">合伙人</c:if>
	                         	<c:if test="${pd.ROLE=='vip'}">VIP会员</c:if>
	                         </p>
                          </div>
                    </div>
				</div>
				<div style="position: absolute;font-size: 1.5rem;right: .25rem;top: 50%;margin-top: -1.2rem;" >
					<img src="static/lshapp/images/center/right arrow1-hdpi.png" style="width:70%;height:70%;"></img>
				</div>
			</div>
			</div>
		</div> --%>
	<!-- <div style="margin-top=.5rem;background-color:#fff;height:35px;">
		<ul class="head-address-ul" id="headAddressUl" >
			<li mytitle="0" id="invitation" class="tabbb head-address-liN" onclick="myinvitation(this)" style="color:red;">我的帖子</li>
			<li mytitle="1" id="back" class="tabbb" onclick="myback(this)">我的回复</li>
		</ul>
	</div> -->
	<section class="search category-search common-search" style="background-color: white;">
	       <div class="text-all dis-box j-text-all text-all-back">
						<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
	                        	<img class="return_image" src="static/lshapp/images/return.png">
	                   </a>
					  <div style="text-align: center;width: 90%;" >
	                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">我的帖子</span>
					  </div>
			</div>
	  </section>
	  <hr style="height:1px;border:none;border-top:1px solid #E1E1E1;width: 100%;margin-top: 0.1rem;" />
	<div id="myInvitation" style="display:show;margin-top:-1.1rem;">
		<c:forEach items="${articleList}" var="var" varStatus="vs">
		<section class="com-nav" style="margin-top:0.2rem;">
			<ul class="dis-box padding-all" style="margin-left: -0.7rem;">
				<li class="box-flex">
					<div class="com-adm-box new-t">
						<h4 style="color:#9A9A9A;font-size:1.6rem;">已发布</h4>
					</div>
				</li>
				<li>
					<div class="t-time"><img class="user_icon" src="static/lshapp/images/center/time-hdpi.png"><span style="font-size:1.6rem;">${var.CREATE_DATE }</span>
					</div>
				</li>
			</ul>
			<div class="margin-lr com-min-tit" style="margin-left: 0.8rem;">
							<span style="font-size:1.9rem;">${var.TITLE }</span>
			</div>
			<div class="margin-lr com-min-tit position-rel" style="margin-left: 0.8rem;">
					<span style="color:#989898"> ${var.CONTENT }</span>
			</div>
			 <section class="product-list j-product-list product-list-medium new-flow-bottom">
                <ul>
                	<c:forEach items="${var.PATH }" var="pp" varStatus="vss">
                    <li>
                        <div class="product-div" id="product-div">
                           	<div class="shop-list-width" style="height: 150px;">
                                <img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${pp.PATH}">
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </section>
		</section>
		</c:forEach>
	</div>
<!-- 	<div id="myBack" style="display:none;">
		<section class="com-nav" style="margin-top:0.8rem;">
			<ul class="dis-box padding-all">

				<li class="box-flex">
					<div class="com-adm-box new-t">
						<h4 style="color:#989898;font-size:1.8rem;">已回复</h4>
					</div>
				</li>
				<li>
					<div class="t-time"><img class="user_icon" src="static/lshapp/images/center/time-hdpi.png"><span style="font-size:1.6rem;">3秒前</span>
					</div>
				</li>
			</ul>
			<div class="margin-lr com-min-tit position-rel">
					<span style="color:#989898"> 第二行政督察区。民国三十三年（1944年），陕西省第三行政督察专员公署驻洛川，初领洛川、甘泉、宜川、富县、中部、宜君6县，后领洛川、黄陵（1944年由中部县改称）3县及黄龙设治局。民国三十七年（1948年）3月至4月，人民解放军相继解放第三行政督察区所辖各县。</span>
			</div>


		</section>
		<section class="com-nav" style="margin-top:0.8rem;">
			<ul class="dis-box padding-all">

				<li class="box-flex">
					<div class="com-adm-box new-t">
					   <h4 style="color:#989898;font-size:1.8rem;">已回复</h4>
					</div>
				</li>
				<li>
					<div class="t-time"><img class="user_icon" src="static/lshapp/images/center/time-hdpi.png"><span style="font-size:1.6rem;">3秒前</span>
					</div>
				</li>
			</ul>
		   <div class="margin-lr com-min-tit position-rel">
					<span style="color:#989898"> 第二行政督察区。民国三十三年（1944年），陕西省第三行政督察专员公署驻洛川，初领洛川、甘泉、宜川、富县、中部、宜君6县，后领洛川、黄陵（1944年由中部县改称）3县及黄龙设治局。民国三十七年（1948年）3月至4月，人民解放军相继解放第三行政督察区所辖各县。</span>
			</div>


		</section>
	</div>
 -->
</div>
<div class='ajax_loading' style='background:#F0F0F0;height:60px;width:100%;text-align:center;line-height:60px;font-size:18px;display:none;position:fixed;bottom:0px'><img style="width: 4.0rem;height: 4.0rem;" src="static/lshapp/images/center/loading.gif"> 数据加载中</div>
<!--悬浮菜单e-->
	<script>

	</script>


</body></html>