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
    <title>帖子详情</title>
    <link href="static/lshapp/css/articleapp.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="static/lshapp/css/cus.css">
    <link rel="stylesheet" href="static/lshapp/mui/css/mui.min.css">
    
    
    <script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
    


<style>

.card-footer, .card-header {
    min-height: 2.2rem;
    position: relative;
    padding: .5rem .75rem;
    box-sizing: border-box;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    justify-content: space-between;  
    align-items: center;
}

.card {
    background: #fff;
    box-shadow: 0 0.05rem 0.1rem rgba(0,0,0,.3);
    margin: .5rem;
    position: relative;
    border-radius: .1rem;
    font-size: .7rem;
}



.mui-preview-image.mui-fullscreen {
				position: fixed;
				z-index: 20;
				background-color: #000;
			}
			.mui-preview-header,
			.mui-preview-footer {
				position: absolute;
				width: 100%;
				left: 0;
				z-index: 10;
			}
			.mui-preview-header {
				height: 44px;
				top: 0;
			}
			.mui-preview-footer {
				height: 50px;
				bottom: 0px;
			}
			.mui-preview-header .mui-preview-indicator {
				display: block;
				line-height: 25px;
				color: #fff;
				text-align: center;
				margin: 15px auto 4;
				width: 70px;
				background-color: rgba(0, 0, 0, 0.4);
				border-radius: 12px;
				font-size: 16px;
			}
			.mui-preview-image {
				display: none;
				-webkit-animation-duration: 0.5s;
				animation-duration: 0.5s;
				-webkit-animation-fill-mode: both;
				animation-fill-mode: both;
			}
			.mui-preview-image.mui-preview-in {
				-webkit-animation-name: fadeIn;
				animation-name: fadeIn;
			}
			.mui-preview-image.mui-preview-out {
				background: none;
				-webkit-animation-name: fadeOut;
				animation-name: fadeOut;
			}
			.mui-preview-image.mui-preview-out .mui-preview-header,
			.mui-preview-image.mui-preview-out .mui-preview-footer {
				display: none;
			}
			.mui-zoom-scroller {
				position: absolute;
				display: -webkit-box;
				display: -webkit-flex;
				display: flex;
				-webkit-box-align: center;
				-webkit-align-items: center;
				align-items: center;
				-webkit-box-pack: center;
				-webkit-justify-content: center;
				justify-content: center;
				left: 0;
				right: 0;
				bottom: 0;
				top: 0;
				width: 100%;
				height: 100%;
				margin: 0;
				-webkit-backface-visibility: hidden;
			}
			.mui-zoom {
				-webkit-transform-style: preserve-3d;
				transform-style: preserve-3d;
			}
			.mui-slider .mui-slider-group .mui-slider-item img {
				width: auto;
				height: auto;
				max-width: 100%;
				max-height: 100%;
			}
			.mui-android-4-1 .mui-slider .mui-slider-group .mui-slider-item img {
				width: 100%;
			}
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-slider-group .mui-slider-item {
				display: inline-table;
			}
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-zoom-scroller img {
				display: table-cell;
				vertical-align: middle;
			}
			.mui-preview-loading {
				position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				display: none;
			}
			.mui-preview-loading.mui-active {
				display: block;
			}
			.mui-preview-loading .mui-spinner-white {
				position: absolute;
				top: 50%;
				left: 50%;
				margin-left: -25px;
				margin-top: -25px;
				height: 50px;
				width: 50px;
			}
			.mui-preview-image img.mui-transitioning {
				-webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease;
				transition: transform 0.5s ease, opacity 0.5s ease;
			}
			@-webkit-keyframes fadeIn {
				0% {
					opacity: 0;
				}
				100% {
					opacity: 1;
				}
			}
			@keyframes fadeIn {
				0% {
					opacity: 0;
				}
				100% {
					opacity: 1;
				}
			}
			@-webkit-keyframes fadeOut {
				0% {
					opacity: 1;
				}
				100% {
					opacity: 0;
				}
			}
			@keyframes fadeOut {
				0% {
					opacity: 1;
				}
				100% {
					opacity: 0;
				}
			}
			p img {
				max-width: 100%;
				height: auto;
			}


</style>
</head>
<body id="comment" style="background:white;">
<jsp:include page="head_title.jsp">
	<jsp:param value="帖子详情" name="pageTitle"/>
</jsp:include>
<div >
<ul>

<div class="con mb-7" style="min-height:0px;" >
    <!--晒单列表-->
   <div class="content-block">
                    <div class="tabs">
                        <div id="tab1" class="tab active">
                            <div class="content-block bcolor">
                                <div class="list-content">
                                    <div class="list-container" style="list-style-type:none;">
                                    
										<li class="card facebook-card" onclick="comment2(3)" >
                                            <div class="card-header no-border">
                                                
                                                <%-- <div class="facebook-avatar"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.USERPATH}" width="44" height="44"></div> --%>
                                               
                								<div class="com-left-box" style="margin-left:0px;margin-right: 0px;">
                								<img src="<%=basePath%>uploadFiles/uploadImgs/${pd.USERPATH}" data-bd-imgshare-binded="1" style="border-radius: 0%;">
                								</div>
         
                                                <div style="font-size:16px;margin-left: -30px;">${pd.ARTICLENAME }</div>
                                                <div style="font-size:14px;">${pd.CREATE_DATE }</div>
                                            </div>
                                            <div style="height: 25px;width: 100%;text-align: center;font-size:16px;font-weight:bold">${pd.TITLE }</div>
                                            
                                            <div class="text-c" style="font-size:14px;text-align: left!important;">${pd.CONTENT }</div>
                                            <%-- <div class="card-content">
                                            
                                            <c:forEach items="${pList}" var="var" varStatus="vs">
                                            	<img class="img-c" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">
                                                
                                             </c:forEach>  --%>
                                             <section style="margin-bottom: 0px" class="product-list j-product-list product-list-medium new-flow-bottom">
								                <ul>
								                	<c:forEach items="${pList}" var="var1" varStatus="vs">
												<c:if test="${(vs.index+1) % 3 == 0 }">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-bottom: 3vw;" alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var1.PATH}" data-preview-src="">
												</c:if>
												<c:if test="${(vs.index+1) % 3 != 0 }">
												<img style="display: block;float: left;width: 28vw;height: 28vw;margin-right: 3vw;margin-bottom: 3vw;" alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var1.PATH}" data-preview-src="">
												</c:if>
												</c:forEach>
								                
								                
								                	<%-- <c:forEach items="${pList}" var="var" varStatus="vs">
								                    <li style="height: 100ox;width: 100px;">
								                        <div class="product-div" id="product-div" style="height: 100ox;width: 100px;">
								                           	<div class="shop-list-width" >
								                                <img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" style="height: 100ox;width: 100px;">
								                            </div>
								                        </div>
								                    </li>
								                    </c:forEach> --%>
								                </ul>
								            </section>
                                                </div>
                                          
												<!-- <div class="card-footer no-border" style="    width: 220px;padding-left:5px;background-color:#fff"><a style="color:#6d6d72" href="http://yanshi.sucaihuo.com/details.html">
                                                </a> -->
                                                </div>
											
                                            
                                        </li>
                                   
                                   
                                </div>
                            </div>
                        </div>                 
                       
                        <!--  -->
                    </div>
                </div>
                <!-- <div class="card-container">
                    <div class="card">
                        <div class="card-header">card</div>
                        <div class="card-content">
                            <div class="card-content-inner">
                                这里是第1个card，下拉刷新会出现第2个card。
                            </div>
                        </div>
                    </div>
                </div> 
            </div>-->
        <section style="margin-bottom: 5px;" >

        <!--评论列表-->
               <div class="dis-box padding-all my-bottom b-color-f my-nav-box m-top06">
            <h3 class="box-flex text-all-span my-u-title-size-1">评论列表</h3>
        </div>
        <div id="comments" style="padding-bottom: 50px;">
         <c:forEach items="${commentList}" var="var" varStatus="vs">
         <div id="ccc">
            <ul class="padding-all b-color-f my-com-max-box" >
            <li class="com-img-left">
                <div class="com-left-box"><img src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" data-bd-imgshare-binded="1"></div>
            </li>
            <li class="com-con-right">
            	
                <ul class="dis-box">
                    <li class="box-flex">
                        <div class="com-adm-box">
                            <h4 style="margin-top: -4px;" id="${var.ARTICLECOMMENT_ID}"  onclick="comment2(1,${var.ARTICLECOMMENT_ID})">${var.NICK_NAME }</h4>
                            <!-- <p>1231</p> -->
                        </div>
                    </li>
                    <li class="not">
                        <div class="com-data-right  com-list-1">
						<span class="oncle-color" >
							<span class="my-right1" >${var.CREATE_DATE }</span>
						</span>
                        </div>
                    </li>
                </ul>
                <p class="com-con-m" id="${var.ARTICLECOMMENT_ID}"  onclick="comment2(1,${var.ARTICLECOMMENT_ID})">${var.CONTENT }</p>
          
                
                                <!--评论回复-->
              	<c:if test="${not empty var.replyLists }">
                 <ul class="comments-reply-box b-color-f">
                 	<c:forEach items="${var.replyLists}" var="var1" varStatus="vs1">
                    <li onclick="comment2(2,${var1.ARTICLECOMMENT_ID},${var1.TOP_PARENT_ID })">
                       <c:if test="${var1.OTHERNICK ==null }"> <span><a style="color: #607fa6" id="${var1.ARTICLECOMMENT_ID}">${var1.MUNICK }</a>:</span>${var1.CONTENT }</c:if>
                       <c:if test="${var1.OTHERNICK !=null }"> <span><a style="color: #607fa6" id="${var1.ARTICLECOMMENT_ID}">${var1.MUNICK }</a> <a>回复 </a>${var1.OTHERNICK}:</span>${var1.CONTENT }</c:if>
                   </li>
                   </c:forEach> 
                </ul> 
                </c:if>
                
          </ul>
          </div>
        </c:forEach>
        <c:if test="${commentList.size() >5}">
          <div class="float_left ma_l14" id="listMore" style="text-align: center;color: #fbc800;float: none;border-radius: 10px;width: 50%;margin-left: 25%;margin-top: 13px;margin-bottom: 20px;">
					上拉加载更多	
		  </div>
		  </c:if> 
		  <c:if test="${commentList.size() <=5}">
          <div class="float_left ma_l14" id="listMore" style="text-align: center;color: #fbc800;float: none;border-radius: 10px;width: 50%;margin-left: 25%;margin-top: 13px;margin-bottom: 20px;">
					暂无更多评论	
		  </div>
		  </c:if> 
        </div>    
        
    </section>
   <!--  <section class="article-comments-btn  b-color-f">
        <a href="http://www.lxshopping.cn/mobile/index.php?m=article&amp;a=comments&amp;id=131" class="f-05 col-4 text-c padding-all">查看更多</a>
    </section> -->
    </ul>
</div>
<section class="filter-btn consult-filter-btn">
    <div class="dis-box">
        <div class="box-flex text-all">
            <input style="margin-bottom: 0px; width: 61%;padding: 10px 3%!important;" class="j-input-text" name="CONTENT" id="CONTENT" placeholder="快来发表下评论吧！~" type="text">
        	<button type="button" style="width: 32%;float: right;height: 62px;background: #ec5151;text-align: center;  font-size: 1.6rem;
    color: #fff;" id="btn-submit">发送</button>
        </div>
        
    </div>
</section>

<input name="oneComment" value="" type="hidden">
<input name="replyComment" value="" type="hidden">
<input name="lable" value="" type="hidden">
<input name="TOP_PARENT_ID" value="" type="hidden">
<input name="ARTICLE_ID" id="ARTICLE_ID" value="${pd.ARTICLE_ID }" type="hidden">
<div class="mask-filter-div"></div>

<%--< script type="text/javascript">
var page=2;
var totalPage=${totalPage};	
function more(){
var article_id = $("#ARTICLE_ID").val();
 alert(page+"==="+totalPage)
	if(page<=totalPage){
		$.ajax({
			type: "POST",
			url: '<%=basePath%>lshapp/article/ajaxcomment.do',
	    	data: {currentPage:page,ARTICLE_ID:article_id},
			//dataType:'json',
			cache: false,
			success: function(data){
				if(data!=""){
					$("#listMore").before(data);
					totalPage=$(".totalPage:first").val();
					page++;
				}
			}
		});
	}else{
		$("#listMore").html("没有更多数据了");
	}
}
</script>  --%>
<script src="static/lshapp/js/mui.min.js" type="text/javascript" charset="utf-8"></script>
<%-- <script type="text/javascript">
//动态添加的Input组件需要重新进行初始化
//mui('.mui-input-row input').input();

//获取列表全部数据
(function(){
	var page=2;
	var totalPage=${totalPage};	
	var Flag = false;
	var article_id = $("#ARTICLE_ID").val();
	function getAllGoodslist(pageStart,pageSize){
    var result="";
    if(page<=totalPage){
                  $.ajax({
                	  type: "POST",
	          		url: '<%=basePath%>lshapp/article/ajaxcomment.do',
	          	    data: {currentPage:page,ARTICLE_ID:article_id},
	          			//dataType:'json',
	          			cache: false,
                      error:function(data){
                          alert("error");
                      },
                      success:function(data){
                         
                           
                                      $("#listMore").before(data);                                                         
                                      page++; 
                      }
                       
            })   
    }else{
    	$("#listMore").html("没有更多数据了");
    }
}
//上拉加载数据
mui.init({
      pullRefresh : {
        container:"#comment",//待刷新区域标识，querySelector能定位的css选择器均可，比如：id、.class等
        up : {
          height:50,//可选.默认50.触发上拉加载拖动距离
          auto:false,//可选,默认false.自动上拉加载一次
         // contentrefresh : "正在加载...",//可选，正在加载状态时，上拉加载控件上显示的标题内容
         // contentnomore:'没有更多数据了',//可选，请求完毕若没有更多数据时显示的提醒内容；
          callback : pullupRefresh //必选，刷新函数，根据具体业务来编写，比如通过ajax从服务器获取新数据；
        }
      }
});

function pullupRefresh() {
    setTimeout(function () {
          mui('#comment').pullRefresh().endPullupToRefresh((Flag)); //参数为true代表没有更多数据了。
          getAllGoodslist();
         }, 500);
        }
})();
</script> --%>




   <script type="text/javascript">
  
   
   
   
   var isMore = false;
  	page=2;
	totalPage=${totalPage};
      $(document).ready(function(){
        $(window).scroll(function(){
        	
          if($(document).scrollTop()>=$(document).height()-$(window).height()){
      			var article_id = $("#ARTICLE_ID").val();
      			if(page<=totalPage){
      				 if(!isMore){
           			  isMore = true;
      				$.ajax({
      					type: "POST",
      					url: '<%=basePath%>lshapp/article/ajaxcomment.do',
      			    	data: {currentPage:page,ARTICLE_ID:article_id},
      					//dataType:'json',
      					cache: false,
      				  beforeSend:function(){
                          $("#listMore").html("正在加载更多..."); //显示加载时候的提示
                      },
      					success: function(data){
      						if(data!=""){
      							$("#listMore").before(data);
      							totalPage=$(".totalPage:first").val();
      							page++;
      							 isMore =false;
      						}
      					}
      				});
      				return true;
      				}else{
          			  return false;
          		  }
      			}else{
      				$("#listMore").html("没有更多数据了");
      			}
        		
          };
        });
      });
      
      
      
      function comment2(sign,cid,top_id) {
      	if(sign == 1){
      		c_id = cid;     
              cname = document.getElementById(cid).innerHTML;       
              $(".j-input-text").attr('placeholder', '回复' + cname + ':');
              $("input[name='oneComment']").val(c_id);
              $("input[name='lable']").val(1);
              $("#CONTENT").focus();
      	}else if(sign == 2){
      		c_id = cid;     
              cname = document.getElementById(cid).innerHTML;       
              $(".j-input-text").attr('placeholder', '回复' + cname + ':');
              $("input[name='replyComment']").val(c_id);
              $("input[name='lable']").val(2);
              $("input[name='TOP_PARENT_ID']").val(top_id);
              $("#CONTENT").focus();
      	}else if(sign == 3){
      		 $(".j-input-text").attr('placeholder', '快来发表下评论吧！~');
      		 $("input[name='lable']").val(3);
      		$("#CONTENT").focus();
      	}
          
      }

      $('#btn-submit').click(function () {
      	var oneComment = $("input[name='oneComment']").val(); //回复一级
      	var replyComment = $("input[name='replyComment']").val();//回复回复
      	var lable = $("input[name='lable']").val();
      	var article_id = $("input[name='ARTICLE_ID']").val();
      	var content = $("input[name='CONTENT']").val();
      	var top_id = $("input[name='TOP_PARENT_ID']").val();
      	if(lable == 1){
      		$.ajax({
          		type: "POST",
          		url: '<%=basePath%>lshapp/article/comment.do',
              	data: {PARENT_ID:oneComment,TOP_PARENT_ID:oneComment,ARTICLE_ID:article_id,CONTENT:content},
          		dataType:'json',
          		cache: false,
          		success: function(data){
          			window.location.reload();
          		}
          	});
      	}else if(lable == 2){
      		$.ajax({
          		type: "POST",
          		url: '<%=basePath%>lshapp/article/comment.do',
              	data: {PARENT_ID:replyComment,TOP_PARENT_ID:top_id,ARTICLE_ID:article_id,CONTENT:content},
          		dataType:'json',
          		cache: false,
          		success: function(data){
          			window.location.reload();
          		}
          	});
      	}else {
      		$.ajax({
          		type: "POST",
          		url: '<%=basePath%>lshapp/article/comment.do',
              	data: {ARTICLE_ID:article_id,CONTENT:content},
          		dataType:'json',
          		cache: false,
          		success: function(data){
          			window.location.reload();
          			
          		}
          	});
      	}
      	
      	
         
          function status(json) {
              window.location.href = json;
          }

      });


    
    </script>  
    


	<script src="static/lshapp/mui/js/mui.min.js"></script>
	<script src="static/lshapp/mui/js/mui.zoom.js"></script>
	<script src="static/lshapp/mui/js/mui.previewimage.js"></script>
	<script>
		mui.previewImage();
	</script>
</body>
</html>
