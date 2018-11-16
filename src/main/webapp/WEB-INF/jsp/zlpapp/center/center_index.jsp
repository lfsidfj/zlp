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
    <title>个人中心</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
    	<script type="text/javascript">
		function update_information(){
			window.location.href="<%=basePath%>lshapp/userCenter/user_information.do";
		}
		function myinvitation(obj){
			document.getElementById("myGoods").style.display="none";
			document.getElementById("myInvitation").style.display="block";
			var id=document.getElementById("back");
			if($("#invitation").hasClass("active")){
			//alert("checked");
			}else{
				$("#invitation").addClass("active");
				$("#goods").removeClass("active");
				//alert("notchecked");
			}
		}
	</script>
	<style>
    /*display盒子*/
.dis-box {display: -webkit-box;display: -moz-box;display: -ms-box; display: box;}
.box-flex{ box-flex: 1; -webkit-box-flex: 1; display: block; width: 100%;}
/*footer*/
.footer-nav{ background-color: rgba(254, 253, 252, 1);   left: 0;right: 0;position: fixed;margin: 0 auto;bottom: 0; z-index: 11;box-shadow: 1px 5px 15px rgba(50,50,50,0.3);border-top:1px solid #f6f6f9;padding:0.3rem 0}
.footer-nav .nav-list{font-size:1.1rem;display:block;text-align:center;padding-top:0rem;color:#595959}
.footer-nav .nav-list .nav-box{background:url(../mobile/public/img/ec-icon.png) no-repeat;width:2.7rem;height:2.7rem;display: block;margin: 0 auto; background-size: 32.1rem;}
.footer-nav .nav-list .i-home{background-position: -.02rem 0rem;}
.footer-nav .nav-list .i-cate{background-position: -2.701rem 0rem;}
.footer-nav .nav-list .i-zhongchou{background-position: -16.7rem 0.1rem;}
.footer-nav .nav-list .i-zhongchou_user{background-position: -19.5rem 0.1rem;}
.footer-nav .nav-list .i-zhongchou-order{background-position: -22.25rem  0.1rem;}
.footer-nav .nav-list .i-shop{background-position: -13.9rem 0rem;}
.footer-nav .nav-list .i-flow{background-position: -5.78rem 0rem;}
.footer-nav .nav-list .i-user{background-position: -8.38rem 0rem;}
.footer-nav .nav-list .i-pintuan{background-position: -28.6rem 0rem;}
.footer-nav .nav-list .i-ranking{background-position: -25.4rem 0.1rem;}
.footer-nav .nav-list.active{color:#ec5151}
.footer-nav .nav-list.active .i-home{background-position: .02rem -3rem;}
.footer-nav .nav-list.active .i-cate{background-position: -2.701rem -3rem;}
.footer-nav .nav-list.active .i-zhongchou{background-position: -16.7rem -3rem;}
.footer-nav .nav-list.active .i-zhongchou_user{background-position: -19.5rem -2.9rem;}
.footer-nav .nav-list.active .i-zhongchou-order{background-position: -22.25rem -2.9rem;}
.footer-nav .nav-list.active .i-shop{background-position: -13.9rem -3rem;}
.footer-nav .nav-list.active .i-flow{background-position: -5.78rem -3rem;}
.footer-nav .nav-list.active .i-user{background-position: -8.38rem -3rem;}
.footer-nav .nav-list.active .i-pintuan{background-position: -28.6rem -2.9rem;}
.footer-nav .nav-list.active .i-ranking{background-position: -25.4rem -2.8rem;}
</style>
<style type="text/css">
/*! normalize.css v5.0.0 | MIT License | github.com/necolas/normalize.css */


@media only screen and (max-width:310px) and (min-width:300px) {
	html {
		font-size: 9px
	}
}

@media only screen and (max-width:320px) and (min-width:310px) {
	html {
		font-size: 9px
	}
}

@media only screen and (max-width:360px) and (min-width:320px) {
	html {
		font-size: 9px
	}

	.filter-menu-list ul li i {
		margin-top: -.1rem
	}

	.filter-menu-list ul li em {
		margin-top: -.4rem
	}
}

@media only screen and (max-width:360px) and (min-width:350px) {
	html {
		font-size: 10px
	}
}

@media only screen and (max-width:480px) and (min-width:360px) {
	html {
		font-size: 10px
	}

	.filter-menu-list ul li i {
		margin-top: -.1rem
	}

	.filter-menu-list ul li em {
		margin-top: 0
	}
}

@media only screen and (max-width:480px) and (min-width:470px) {
	html {
		font-size: 13.33333px
	}
}

@media only screen and (max-width:560px) and (min-width:480px) {
	html {
		font-size: 13.33333px
	}
}

@media only screen and (max-width:570px) and (min-width:560px) {
	html {
		font-size: 15.83333px
	}
}

@media only screen and (max-width:640px) and (min-width:570px) {
	html {
		font-size: 15.83333px
	}
}

@media only screen and (max-width:640px) and (min-width:630px) {
	html {
		font-size: 17.77778px
	}
}

@media only screen and (max-width:710px) and (min-width:640px) {
	html {
		font-size: 17.77778px
	}
}

body {
	font-family: Helvetica Neue,Helvetica,PingFang SC,Hiragino Sans GB,Microsoft YaHei,\\5FAE\8F6F\96C5\9ED1,Arial,sans-serif;
	font-size: .86rem;
	line-height: 1.5;
	color: #333;
	background-color: #e7ecec;
	-webkit-font-smoothing: antialiased;
	font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	min-height: 100%
}

article,aside,blockquote,body,button,dd,details,div,dl,dt,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,hr,input,legend,li,menu,nav,ol,p,section,td,textarea,th,ul {
	margin: 0;
	padding: 0
}



</style>
<style>
<style type="text/css">

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
			width: 1.2rem;
			height: 1.2rem;
			border-radius: 0.5rem;
		}
		.user_icon1{
			width: 1.0rem;
			height: 1.0rem;
			margin-bottom: .5rem;
		}
		.user_icon2{
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
		font-size: 1.7rem;
		background-color:#ED4C44;
		color: white;
		line-height:40px;
		}
	</style>
</head>
<body>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>

<div class="con mb-7">
	<div onclick="update_information()">
		<div class="s-user-top" style="background:#fff;margin-bottom:0.8rem;" >
			<div class="user_profile_box p-r">
				<div class="dis-box t-goods1 onelist-hidden jian-top" for="logo" style="padding-top:2.5rem;padding-bottom:2.0rem;">
					<div class="user-img " style="width: 7.5rem;height: 7.5rem;">
    					<div class="user-head-img-box-1" style="width: 7.5rem;height: 7.5rem;border-radius: 4.5rem;">
							<c:if test="${pd.PATH != null}"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.PATH}" style="width: 100%;height: 100%;"></c:if>
							<c:if test="${pd.PATH == null}"><img src="static/lshapp/images/logo.png"style="width: 100%;height: 100%;"></img></c:if>
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
		</div>
	<section class="b-color-f user-function-list">
		<ul class="user-order-list dis-box text-center ">
			<a href="<%=basePath%>lshapp/shop/goCart.do" class="box-flex">

				<li>
					<img class="user_icon2" src="static/lshapp/images/center/Shopping Cart2-hdpi.png">
					<p class="t-remark3">购物车</p>
				</li>
			</a>
			<a href="<%=basePath%>lshapp/userCenter/order.do?currentPage=1&zww=0" class="box-flex">
				<li>
					<img class="user_icon2" src="static/lshapp/images/center/Order1-hdpi.png">
					<p class="t-remark3">订单</p>
				</li>
			</a>
			<a href="<%=basePath%>lshapp/userCenter/code.do" class="box-flex">
				<li>
					<img class="user_icon2" src="static/lshapp/images/center/Recommendation code-hdpi.png">
					<p class="t-remark3">推广码</p>
				</li>
			</a>
			<a href="<%=basePath%>lshapp/userCenter/favorite.do?COLLECTION_TYPE=3&currentPage=1" class="box-flex">
				<li>
					<img class="user_icon2" src="static/lshapp/images/center/Collection-hdpi.png">
					<p class="t-remark3">收藏</p>
				</li>
			</a>
		</ul>
	</section>
	<a href="<%=basePath%>lshapp/userCenter/go_integration_details.do?currentPage=1">
	<div class="s-user-top onclik-nick_name" style="background:#fff;margin-top:.8rem;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">礼豆</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top" style="color:#F9D936">${pd.INTEGRATION} &nbsp;&nbsp;&nbsp; <img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/userCenter/go_balance.do?currentPage=1">
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">余额</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top" style="color:red">${pd.MONEY} &nbsp;&nbsp;&nbsp; <img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/userCenter/user_address.do">
		<div class="s-user-top onclik-nick_name" style="background:#fff;">
			<div class="dis-box s-xian-box s-user-top-1">
				<h3 class="box-flex text-all-span my-u-title-size">收货管理</h3>
				<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
			</div>
		</div>
	</a>
	<a href="<%=basePath%>lshapp/userCenter/go_update_password.do">
		<div class="s-user-top onclik-nick_name" style="background:#fff;">
			<div class="dis-box s-xian-box s-user-top-1">
				<h3 class="box-flex text-all-span my-u-title-size">修改密码</h3>
				<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
			</div>
		</div>
	</a>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">清除缓存</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top">100M</div>
		</div>
	</div>

	<a href="<%=basePath%>lshapp/userCenter/my_invitation.do">
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">我的帖子</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/userCenter/go_turnplate.do">
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">测试抽奖</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/userCenter/award.do?currentPage=1">
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">我的抽奖</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/userCenter/go_goods_comment.do?CART_ID=52">
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">测试商品评论</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/userbrithday/go_get_cake.do">
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">测试领蛋糕</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/userCenter/about_us.do">
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">关于我们</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><img class="user_icon1" src="static/lshapp/images/right_arrow.png"></div>
		</div>
	</div>
	</a>
	<a href="<%=basePath%>lshapp/appLogin/go_user_login.do">
	 <div class="submint">
        	退出当前登录
	 </div>
	 </a>

</div>
<!-- <footer class="footer-nav dis-box">
	<a href="http://www.lxshopping.cn/mobile/index.php" class="box-flex nav-list">
		<i class="nav-box i-home"></i><span>生日</span>
	</a>
	<a href="http://www.lxshopping.cn/mobile/index.php?m=category" class="box-flex nav-list">
		<i class="nav-box i-cate"></i><span>送礼</span>
	</a>
	<a href="http://www.lxshopping.cn/mobile/index.php?m=search" class="box-flex nav-list">
		<i class="nav-box i-shop"></i><span>社区</span>
	</a>

	<a href="http://www.lxshopping.cn/mobile/index.php?m=user" class="box-flex nav-list active">
		<i class="nav-box i-user"></i><span>个人中心</span>
	</a>
	</footer> -->
	<footer class="footer-nav dis-box">
    <a href="<%=basePath%>lshapp/userbrithday/list.do" class="box-flex nav-list">
        <i class="nav-box i-home1" style="background: url('<%=basePath%>static/lshapp/images/Birthday-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>生日</span>
    </a>
    <a href="<%=basePath%>lshapp/shop/index.do" class="box-flex nav-list">
        <i class="nav-box i-home2" style="background: url('<%=basePath%>static/lshapp/images/Give_a_gift-Silhouett.png') no-repeat;background-size:100% 100%;"></i><span>送礼</span>
    </a>
    <a href="<%=basePath%>lshapp/article/list.do" class="box-flex nav-list">
        <i class="nav-box i-home3" style="background: url('<%=basePath%>static/lshapp/images/Community-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>社区</span>
    </a>
    <a href="<%=basePath%>lshapp/userCenter/center_index.do" class="box-flex position-rel nav-list active">
        <i class="nav-box i-home4" style="background: url('<%=basePath%>static/lshapp/images/Personal_Center-Fill.png') no-repeat;background-size:100% 100%;"></i><span>个人中心</span>
    </a>
    </footer>
	<%-- <footer class="footer-nav dis-box">
    <a href="javascript:parent.window.switchpage(1);" class="box-flex nav-list">
        <i class="nav-box i-home1" style="background: url('<%=basePath%>static/lshapp/images/Birthday-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>生日</span>
    </a>
    <a href="javascript:parent.window.switchpage(2);" class="box-flex nav-list">
        <i class="nav-box i-home2" style="background: url('<%=basePath%>static/lshapp/images/Give_a_gift-Silhouett.png') no-repeat;background-size:100% 100%;"></i><span>送礼</span>
    </a>
    <a href="javascript:parent.window.switchpage(3);" class="box-flex nav-list">
        <i class="nav-box i-home3" style="background: url('<%=basePath%>static/lshapp/images/Community-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>社区</span>
    </a>
    <a href="javascript:parent.window.switchpage(4);" class="box-flex position-rel nav-list active">
        <i class="nav-box i-home4" style="background: url('<%=basePath%>static/lshapp/images/Personal_Center-Fill.png') no-repeat;background-size:100% 100%;"></i><span>个人中心</span>
    </a>
    </footer> --%>
<!--悬浮菜单e-->
		<script>
			/*店铺信息商品滚动*/
			var swiper = new Swiper('.j-g-s-p-con', {
				scrollbarHide: true,
				slidesPerView: 'auto',
				centeredSlides: false,
				grabCursor: true
			});
			var mySwiper = new Swiper('.banner-second', {
            autoplay: 5000,
            pagination: '.banner-second-pagination'
        });

       $(function(){
        //清除搜索记录
        var history = Array;
        $(".clear_history").click(function(){
            if(history){
	            $.get("/mobile/index.php?m=user&a=clear_history", '', function(data){
	        		if(data.status == 1){
			            $(".clearHistory").remove();
	                }
	            }, 'json');
            }
        });
    })
</script>


</body></html>