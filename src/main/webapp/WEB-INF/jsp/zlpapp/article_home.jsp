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
    <link rel="stylesheet" href="static/lshapp/css/sm.min.css">
<!--     <link rel="stylesheet" href="static/lshapp/css/sm-extend.min.css"> -->
<!--     <link rel="stylesheet" type="text/css" href="static/lshapp/css/font-awesome.css"> -->
    <link rel="stylesheet" type="text/css" href="static/lshapp/css/cus.css">

    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">


    <script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
<title>社区</title>
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
/*! normalize.css v5.0.0 | MIT License | github.com/necolas/normalize.css */html{font-family:sans-serif;line-height:1.15;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}article,aside,footer,header,nav,section{display:block}h1{font-size:2em;margin:.67em 0}figcaption,figure,main{display:block}figure{margin:1em 40px}hr{box-sizing:content-box;height:0;overflow:visible}pre{font-family:monospace,monospace;font-size:1em}a{background-color:transparent;-webkit-text-decoration-skip:objects}a:active,a:hover{outline-width:0}abbr[title]{border-bottom:none;text-decoration:underline;text-decoration:underline dotted}b,strong{font-weight:inherit;font-weight:bolder}code,kbd,samp{font-family:monospace,monospace;font-size:1em}dfn{font-style:italic}mark{background-color:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sub{bottom:-.25em}sup{top:-.5em}audio,video{display:inline-block}audio:not([controls]){display:none;height:0}img{border-style:none}svg:not(:root){overflow:hidden}button,input,optgroup,select,textarea{font-family:sans-serif;font-size:100%;line-height:1.15;margin:0}button,input{overflow:visible}button,select{text-transform:none}[type=reset],[type=submit],button,html [type=button]{-webkit-appearance:button}[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner,button::-moz-focus-inner{border-style:none;padding:0}[type=button]:-moz-focusring,[type=reset]:-moz-focusring,[type=submit]:-moz-focusring,button:-moz-focusring{outline:1px dotted ButtonText}fieldset{border:1px solid silver;margin:0 2px;padding:.35em .625em .75em}legend{box-sizing:border-box;color:inherit;display:table;max-width:100%;padding:0;white-space:normal}progress{display:inline-block;vertical-align:baseline}textarea{overflow:auto}[type=checkbox],[type=radio]{box-sizing:border-box;padding:0}[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}[type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}details,menu{display:block}summary{display:list-item}canvas{display:inline-block}[hidden],template{display:none}em{font-style:normal}*{-webkit-tap-highlight-color:transparent}*,:after,:before{box-sizing:border-box}img{display:block;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}html{font-size:10px;height:100%}@media only screen and (max-width:310px) and (min-width:300px){html{font-size:9px}}@media only screen and (max-width:320px) and (min-width:310px){html{font-size:9px}}@media only screen and (max-width:360px) and (min-width:320px){html{font-size:9px}.filter-menu-list ul li i{margin-top:-.1rem}.filter-menu-list ul li em{margin-top:-.4rem}}@media only screen and (max-width:360px) and (min-width:350px){html{font-size:10px}}@media only screen and (max-width:480px) and (min-width:360px){html{font-size:10px}.filter-menu-list ul li i{margin-top:-.1rem}.filter-menu-list ul li em{margin-top:0}}@media only screen and (max-width:480px) and (min-width:470px){html{font-size:13.33333px}}@media only screen and (max-width:560px) and (min-width:480px){html{font-size:13.33333px}}@media only screen and (max-width:570px) and (min-width:560px){html{font-size:15.83333px}}@media only screen and (max-width:640px) and (min-width:570px){html{font-size:15.83333px}}@media only screen and (max-width:640px) and (min-width:630px){html{font-size:17.77778px}}@media only screen and (max-width:710px) and (min-width:640px){html{font-size:17.77778px}}body{font-family:Helvetica Neue,Helvetica,PingFang SC,Hiragino Sans GB,Microsoft YaHei,\\5FAE\8F6F\96C5\9ED1,Arial,sans-serif;font-size:.86rem;line-height:1.5;color:#333;background-color:#e7ecec;-webkit-font-smoothing:antialiased;font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;min-height:100%}article,aside,blockquote,body,button,dd,details,div,dl,dt,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,hr,input,legend,li,menu,nav,ol,p,section,td,textarea,th,ul{margin:0;padding:0}button,input,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}ol,ul{list-style:none}input::-ms-clear,input::-ms-reveal{display:none}:focus,a{outline:none}a{color:#3eb1fa;background:transparent;text-decoration:none;cursor:pointer;transition:color .2s ease}a:hover{color:#57bbfb}a:active{color:#25a7f9}a:active,a:hover{outline:0;text-decoration:none}a[disabled]{color:#ccc;cursor:not-allowed;pointer-events:none}code,kbd,pre,samp{font-family:Consolas,Menlo,Courier,monospace}.f-left{float:left}.f-right{float:right}.collapse{border:1px solid #e3e8ee}.collapse.close{border-bottom:0}.collapse.close .con{height:0;padding:0}.collapse .title{background:#f3f4f5;overflow:hidden;font-size:1.36rem;height:3.2rem;border-bottom:1px solid #e3e8ee}.collapse .title span{float:left;position:relative}.collapse .title span.rotate-arrow{position:relative}.collapse .title .icon-arrow{font-size:1rem;position:absolute;margin-left:.2rem;transform:rotate(90deg);-ms-transform:rotate(90deg);-moz-transform:rotate(90deg);-webkit-transform:rotate(90deg);-o-transform:rotate(90deg)}.collapse.close .title .icon-arrow{transform:rotate(0);-ms-transform:rotate(0);-moz-transform:rotate(0);-webkit-transform:rotate(0);-o-transform:rotate(0)}.collapse .con{padding:1.8rem 2rem;overflow:hidden}.form-group{margin-bottom:1.2rem;max-width:60rem;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:start;justify-content:flex-start}.form-group:last-child{margin-bottom:0}.form-group .group-l{float:left;margin-right:1.2rem;font-size:1.36rem;min-width:6rem;color:#464c5b;text-align:right;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:end;justify-content:flex-end}.form-group .group-r{-ms-flex:1;flex:1}.color-input{background:none;border:0}.input-date-group{display:-moz-box!important;display:-webkit-box!important;display:box!important;display:-moz-flex!important;display:-ms-flex!important;display:-ms-flexbox!important;display:flex!important}.input-date-group .el-date-editor.el-input,.input-date-group .el-input{width:86%!important;box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important}.input-date-group a{font-size:.82rem;margin-left:.4rem;margin-top:.4rem}.more-link{font-size:1.3rem;margin-left:.8rem;padding-left:.8rem;border-left:1px solid #e3e8ee;color:#464c5b}.more-link i{font-size:1.2rem}.more-link:hover{color:#464c5b}.ec-remark{margin:.4rem 0;line-height:1.4;font-size:1.2rem;color:#ff495e}.seamless-scroll{overflow:hidden;position:absolute;left:0}.seamless-scroll-wrapper{float:left;display:inline-block;white-space:nowrap}.mask{position:absolute;top:0;right:0;bottom:0;left:0;background:rgba(0,0,0,.7);z-index:122}.ec-tabs.el-tabs--border-card>.el-tabs__header{background:#f3f4f5;border:none;height:3.6rem!important}.el-tabs__nav-wrap{width:100%!important}.el-tabs__nav{height:3.6rem;width:100%;display:-moz-box!important;display:-webkit-box!important;display:box!important;display:-moz-flex!important;display:-ms-flex!important;display:-ms-flexbox!important;display:flex!important}.el-tabs__item.is-active{color:#333!important;background:#fff!important}.el-tabs--border-card>.el-tabs__header>.el-tabs__item.is-active:first-child,.el-tabs--border-card>.el-tabs__header>.el-tabs__item.is-active:last-child{border-left-color:none;border-right-color:none}.el-tabs__item{height:3.6rem!important;line-height:3.6rem!important;text-align:center;color:#666;border:0!important;margin-right:0!important;margin-left:0!important;box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important}.pages .el-tabs--border-card>.el-tabs__content{top:3.6rem;overflow-x:hidden;bottom:0;width:100%;position:absolute}.pages .el-tabs--border-card>.el-tabs__content .el-tab-pane{position:absolute;top:5.4rem;left:0;right:0;bottom:0;padding:15px;overflow-y:scroll}.pages .el-tabs--border-card>.el-tabs__content .el-tab-pane.system{top:.8rem}.el-checkbox__inner:after{width:4px!important;height:7px!important;left:4px!important}.el-radio+.el-radio{margin-left:12px!important}.el-checkbox__inner,.el-radio__inner{width:16px!important;height:16px!important}.el-dropdown-menu{border-radius:8px;border:0!important;box-shadow:0 0 8px hsla(0,0%,42%,.3)!important;padding:.7rem 0!important}.el-dropdown-menu__item{font-size:1.3rem;padding:0 16px!important;line-height:30px!important}.el-dropdown-menu__item:hover{color:#3eb1fa!important;background:none!important}.el-input__inner{font-size:13px!important;padding:2px 8px!important;border:1px solid #e3e8ee!important}.color-value .el-input__inner{border-radius:4px 0 0 4px}.el-date-editor.el-input{width:100%!important}.el-loading-mask{background-color:hsla(0,0%,100%,.4)!important}.dialog-ec .el-dialog__header{padding:16px;border-bottom:1px solid #e7ecec;position:relative}.dialog-ec .el-dialog__body{padding-top:16px;padding-bottom:6px;overflow-y:scroll}.dialog-picture .el-dialog__body{position:relative;height:43.6rem}.custom-uploader.zindex-1 .el-upload{z-index:-1}.swiper-lazy-preloader{width:22px!important;height:22px!important;margin-left:-11px;margin-top:-11px}.el-checkbox__inner{z-index:0!important}@media only screen and (max-width:1540px){.dialog-picture .el-dialog__body{height:37rem}}@media only screen and (max-width:1440px){.dialog-picture .el-dialog__body{height:31rem}}</style><style type="text/css"></style><style type="text/css">.commom-nav[data-v-32738571]{position:fixed;right:-82%;top:66%;width:82%;z-index:12;margin-right:4.5rem}.filter-top[data-v-32738571]{width:4.5rem;position:absolute;text-align:center;padding:1.3rem .4rem .6rem;background:rgba(0,0,0,.7);border-radius:.5rem 0 0 .5rem;display:none}.filter-top span[data-v-32738571]{font-size:1rem;display:block;text-align:center;padding-top:.7rem;color:#fff}.filter-top-index img[data-v-32738571]{width:2.4rem;position:absolute;top:0;left:50%;margin-left:-1.2rem}.filter-top .icon-jiantou12[data-v-32738571]{position:absolute;left:0;right:0;top:.2rem;font-size:1.8rem;color:#fff;transform:rotate(90deg)}</style><style type="text/css">.search[data-v-79b83520]{width:100%;height:auto;overflow:hidden;z-index:11;position:fixed}.search header[data-v-79b83520]{left:0;right:0;padding:1rem .8rem;display:-moz-box!important;display:-webkit-box!important;display:box!important;display:-moz-flex!important;display:-ms-flex!important;display:-ms-flexbox!important;display:flex!important}.search a[data-v-79b83520]{color:#fff;text-align:left;font-size:1.2rem;display:-moz-box!important;display:-webkit-box!important;display:box!important;display:-moz-flex!important;display:-ms-flex!important;display:-ms-flexbox!important;display:flex!important;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:center;justify-content:center}.search a span[data-v-79b83520]{margin-left:.1rem}.search a.message[data-v-79b83520]{position:relative;text-align:right}.message span[data-v-79b83520]{background:red;display:block;width:.8rem;height:.8rem;position:absolute;top:.3rem;right:-.2rem;border-radius:9999px;border:1px solid hsla(0,0%,100%,.8)}.search .iconfont[data-v-79b83520]{font-size:1.7rem}.search .icon-down-arrow[data-v-79b83520]{font-size:.9rem;margin-left:.18rem;font-weight:700}.search .input[data-v-79b83520]{font-size:1.3rem;height:2.86rem;line-height:2.86rem;padding:0 1rem;margin:0 .6rem;border-radius:1.43rem;color:#fff;position:relative;background:hsla(0,0%,100%,.4);box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important;display:-moz-box!important;display:-webkit-box!important;display:box!important;display:-moz-flex!important;display:-ms-flex!important;display:-ms-flexbox!important;display:flex!important;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:start;justify-content:flex-start}.search .input .icon-search[data-v-79b83520]{font-size:1.4rem;margin-right:.4rem}.search .input a[data-v-79b83520],.search .mask[data-v-79b83520]{position:absolute;top:0;right:0;bottom:0;left:0}.search .mask[data-v-79b83520]{z-index:-1;background:linear-gradient(180deg,rgba(0,0,0,.8) 0,transparent)}</style><style type="text/css">.slide .swiper[data-v-0dc8b539]{width:100%}.slide .swiper-slide img[data-v-0dc8b539]{width:100%;display:block}.swiper-lazy-preloader[data-v-0dc8b539]{margin-top:1rem;width:1.6rem}.slide .swiper-slide a[data-v-0dc8b539]{position:absolute;top:0;right:0;bottom:0;left:0}.slide .desc[data-v-0dc8b539]{position:absolute;padding:.4rem;left:0;right:0;bottom:0;background:rgba(0,0,0,.5);color:#fff}.swiper-slide[data-v-0dc8b539]{background:#f4f5fa;display:box;display:-moz-box;display:-webkit-box;box-pack:center;-webkit-box-pack:center;box-align:center;-webkit-box-align:center;-moz-box-align:center;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:center;justify-content:center}.slide .swiper-slide.no-swiper-slide img[data-v-0dc8b539],.slide .swiper-slide img.no-img[data-v-0dc8b539]{width:50%;height:auto}</style><style type="text/css">.nav[data-v-7ca19972]{background:#fff;overflow:hidden}.nav .list[data-v-7ca19972]{overflow:hidden;box-sizing:content-box;position:relative}.nav .list img[data-v-7ca19972]{display:block}.nav .con[data-v-7ca19972]{font-size:1.5rem;color:#000;box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important}.list a[data-v-7ca19972]{border-left:0;position:absolute;top:0;right:0;bottom:0;left:0}.list-style1[data-v-7ca19972]{padding-bottom:0;padding:0 .8rem}.list-style1 .list[data-v-7ca19972]{height:4.8rem;border-bottom:1px solid #e3e8ee;display:box;display:-moz-box;display:-webkit-box;box-pack:start;-webkit-box-pack:start;box-align:center;-webkit-box-align:center;-moz-box-align:center;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:initial;justify-content:initial}.list-style1 .list .icon-right-arrow[data-v-7ca19972]{color:#464c5b;font-size:1.2rem}.list-style1 .list[data-v-7ca19972]:last-of-type{border-bottom:0}.list-style1 .list img[data-v-7ca19972]{height:64%;width:auto;margin-right:.5rem}.list-style2 .list[data-v-7ca19972]{width:20%;float:left;text-align:center;overflow:hidden}.list-style2 .list img[data-v-7ca19972]{width:100%;height:auto;margin:0 auto;display:block}.list-style2 .list .con[data-v-7ca19972]{margin-top:.2rem;font-size:1.3rem}.list-style2 .list .icon-right-arrow[data-v-7ca19972]{display:none}.list-style2.whole-margin[data-v-7ca19972]{padding:.8rem 0}.list-style2.all-padding section[data-v-7ca19972]{box-sizing:border-box;padding:.4rem}.list-style2.all-border section[data-v-7ca19972]{box-sizing:border-box;margin-bottom:-1px;border:1px solid #e7ecec;border-right:0}</style><style type="text/css">.announcement[data-v-393930a1]{background:#fff;vertical-align:middle;box-sizing:border-box;overflow:hidden;padding:.7rem .8rem;height:5rem;display:box;display:-moz-box;display:-webkit-box;box-pack:start;-webkit-box-pack:start;box-align:center;-webkit-box-align:center;-moz-box-align:center;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:initial;justify-content:initial}.announcement .icon[data-v-393930a1]{height:86%;margin-right:.8rem;display:block}.swiper[data-v-393930a1]{font-size:1.3rem;height:100%;box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important}.swiper-slide[data-v-393930a1]{overflow:hidden;position:relative;display:box;display:-moz-box;display:-webkit-box;box-pack:start;-webkit-box-pack:start;box-align:center;-webkit-box-align:center;-moz-box-align:center;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:start;justify-content:flex-start}.swiper-slide section[data-v-393930a1]{width:100%}.swiper-slide p[data-v-393930a1]{white-space:nowrap;font-size:1.4rem;font-weight:400;overflow:hidden;text-overflow:ellipsis}.swiper-slide p.last[data-v-393930a1]{font-size:1.2rem;font-weight:400;color:#9ea7b4}.swiper .swiper-slide a[data-v-393930a1]{position:absolute;top:0;right:0;bottom:0;left:0}.announcement.announ[data-v-393930a1],.announcement.date-height[data-v-393930a1]{font-size:1.2rem;height:4rem}.announcement.announ section[data-v-393930a1],.announcement.date-height section[data-v-393930a1]{position:relative;box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important;overflow:hidden;height:2.2rem;line-height:2.2rem}</style><style type="text/css">.count-down[data-v-336030b0]{background:#fff;overflow:hidden;position:relative}.count-down-big[data-v-336030b0]{min-height:12rem}.count-down>header[data-v-336030b0]{font-size:1.5rem;padding:1rem .8rem;color:#ff495e}.count-down>header[data-v-336030b0],.count-down header h4[data-v-336030b0]{display:-moz-box!important;display:-webkit-box!important;display:box!important;display:-moz-flex!important;display:-ms-flex!important;display:-ms-flexbox!important;display:flex!important;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:justify;justify-content:space-between}.count-down header h4[data-v-336030b0]{width:7rem;height:auto}.count-down header h4 img[data-v-336030b0]{width:100%}.count-down header section[data-v-336030b0]{color:#4f4f4f;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:start;justify-content:flex-start;margin-left:.6rem;box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important}.count-down header .date span[data-v-336030b0]{font-size:1.2rem;display:inline-block;height:1.6rem;line-height:1.6rem;text-align:center;min-width:1.8rem;padding:0 .4rem;background:#4f4f4f;color:#fff;margin:0 .2rem;border-radius:9999px}.count-down header .date span[data-v-336030b0]:first-of-type{margin-left:0}.count-down header .icon-bolt[data-v-336030b0]{font-size:1.2rem}.count-down .big[data-v-336030b0]{position:absolute;left:0;top:0;bottom:0;width:50%;padding:1.12rem;float:left;height:100%;border-bottom:1px solid #e7ecec}.count-down .big a[data-v-336030b0]{color:#333}.count-down-big[data-v-336030b0]{position:relative}.count-down .big img[data-v-336030b0]{width:100%;height:auto}.count-down .big header[data-v-336030b0]{padding:0}.count-down .big header h4[data-v-336030b0]{width:8rem}.count-down .big header .date[data-v-336030b0]{margin-left:0;margin-top:.6rem}.count-down .big-desc[data-v-336030b0]{font-size:1.3rem;margin-top:.6rem}.count-down .four-product[data-v-336030b0]{overflow:hidden;border-left:1px solid #e7ecec;margin-left:50%}.count-down .four-product li[data-v-336030b0]{width:50%;float:left;position:relative;border-bottom:1px solid #e7ecec;border-right:1px solid #e7ecec;padding:.56rem}.count-down .four-product li a[data-v-336030b0]{position:absolute;top:0;right:0;bottom:0;left:0}.count-down .four-product li img[data-v-336030b0]{width:100%}.count-down .four-product li .price[data-v-336030b0],.count-down .four-product li del[data-v-336030b0],.spike-swiper-slide .price[data-v-336030b0],.spike-swiper-slide del[data-v-336030b0]{text-align:center;display:block}.count-down .four-product li .price[data-v-336030b0]{font-size:1.3rem;color:#ff495e}.count-down .four-product li del[data-v-336030b0]{color:#9ea7b4;font-size:1.1rem}</style><style type="text/css">.separate-img-list ul li[data-v-0dbb90dc]{width:100%;position:relative;margin-bottom:.6rem;background:#f4f5fa;display:box;display:-moz-box;display:-webkit-box;box-pack:center;-webkit-box-pack:center;box-align:center;-webkit-box-align:center;-moz-box-align:center;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:center;justify-content:center}.separate-img-list ul li.default-img[data-v-0dbb90dc]:last-child,.separate-img-list ul li[data-v-0dbb90dc]:last-child{margin-bottom:0}.separate-img-list ul li a[data-v-0dbb90dc]{position:absolute;top:0;right:0;bottom:0;left:0}.separate-img-list ul li span[data-v-0dbb90dc]{position:absolute;padding:.4rem;left:0;right:0;bottom:0;background:rgba(0,0,0,.5);color:#fff;overflow:hidden;text-overflow:ellipsis}.separate-img-list ul li img[data-v-0dbb90dc]{width:100%;display:block}.separate-img-list ul.mini[data-v-0dbb90dc]{overflow:hidden}.separate-img-list ul.mini li[data-v-0dbb90dc]{width:50%;float:left;padding-bottom:0;margin-bottom:0}.separate-img-list ul.mini li.gap[data-v-0dbb90dc]{padding:.4rem}.separate-img-list ul.mini li.gap[data-v-0dbb90dc]:nth-child(2n-1){padding-right:.2rem}.separate-img-list ul.mini li.gap[data-v-0dbb90dc]:nth-child(2n){padding-left:.2rem}.separate-img-list ul.mini li.gap:nth-child(2n-1) span[data-v-0dbb90dc]{left:.4rem;right:.2rem}.separate-img-list ul.mini li.gap:nth-child(2n) span[data-v-0dbb90dc]{left:.2rem;right:.4rem}.default-img[data-v-0dbb90dc]{min-height:4rem;background:#f4f5fa;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:center;justify-content:center}.separate-img-list li.default-img img[data-v-0dbb90dc]{display:block;width:50%;height:auto}.separate-img-list ul li img.no-img[data-v-0dbb90dc]{width:50%}</style><style type="text/css">.jigsaw[data-v-c25148f2]{overflow:hidden;background:#fff}.all-padding ul>li ul li[data-v-c25148f2],.jigsaw.all-padding ul>li.big-img[data-v-c25148f2]{box-sizing:border-box;padding:.4rem}.jigsaw.all-border .big-img[data-v-c25148f2]{border-top:1px solid #e7ecec}.jigsaw.all-border ul>li ul li[data-v-c25148f2]{border-left:1px solid #e7ecec;border-top:1px solid #e7ecec}.jigsaw ul>li[data-v-c25148f2]{overflow:hidden}.jigsaw ul>li.w100deg[data-v-c25148f2],.jigsaw ul>li img[data-v-c25148f2]{width:100%}.jigsaw ul>.w50deg[data-v-c25148f2]{width:50%}.jigsaw ul>li ul li[data-v-c25148f2],.jigsaw ul>li ul li img[data-v-c25148f2]{width:100%}.jigsaw ul>li ul li[data-v-c25148f2]{border-right:0;border-bottom:0;float:left}.jigsaw ul li[data-v-c25148f2]{position:relative}.jigsaw ul li span[data-v-c25148f2]{color:#fff;font-size:1.3rem;position:absolute;width:100%;bottom:0;padding:.4rem .6rem;background:rgba(0,0,0,.6)}.jigsaw ul li a[data-v-c25148f2]{position:absolute;top:0;right:0;bottom:0;left:0}</style><style type="text/css">.product-list[data-v-dcddab0a]{overflow:hidden}.product-list.big h4[data-v-dcddab0a],.product-list.small.preview h4[data-v-dcddab0a]{height:inherit}.product-list li[data-v-dcddab0a]{width:50%;padding-top:1px;padding-right:1px;float:left;position:relative}.product-list li a[data-v-dcddab0a]{position:absolute;left:0;top:0;right:0;bottom:0;z-index:2}.product-list li .product-cart[data-v-dcddab0a]{position:absolute;right:.7rem;bottom:.7rem;width:2.2rem;height:2.2rem;line-height:2.2rem;background:#ec5151;text-align:center;border-radius:100%;color:#fff;z-index:3}.product-list li .product-cart i[data-v-dcddab0a]{font-size:1.5rem}.product-list figure[data-v-dcddab0a]{background:#fff;padding:.8rem;box-sizing:border-box}.product-list figure img[data-v-dcddab0a]{width:100%;height:auto}.product-list figure h4[data-v-dcddab0a]{font-size:1.4rem;height:3.9rem;font-weight:400;overflow:hidden;text-overflow:ellipsis}.product-list figcaption[data-v-dcddab0a]{margin-top:.8rem}.product-list figure p[data-v-dcddab0a]{margin-top:.4rem}.product-list figure .price em[data-v-dcddab0a]{color:#ec5151;font-size:1.7rem;display:block}.product-list figure .remark em[data-v-dcddab0a]{font-size:1.3rem;color:#888}.product-list.big li[data-v-dcddab0a],.product-list.small li[data-v-dcddab0a]{width:100%;overflow:hidden}.product-list.small li figure[data-v-dcddab0a]{width:100%;display:box;display:-moz-box;display:-webkit-box;box-pack:start;-webkit-box-pack:start;box-align:center;-webkit-box-align:center;-moz-box-align:center;display:-ms-flexbox;display:flex;display:-webkit-flex;-ms-flex-align:center;align-items:center;-ms-flex-pack:start;justify-content:flex-start}.product-list.small li figure figcaption[data-v-dcddab0a]{width:60%}.product-list.small li h4[data-v-dcddab0a]{width:100%;height:inherit;white-space:nowrap}.product-list.small li img[data-v-dcddab0a]{width:9.2rem;padding:.2rem;border:1px solid #eee;margin-right:.8rem;height:auto}.product-list.small li figcaption[data-v-dcddab0a]{margin-top:0;box-flex:1;-ms-flex:1!important;flex:1!important;-webkit-flex:1!important}</style><style type="text/css">.scroll-prolist[data-v-5d2ea972]{background:#fff}.spike-swiper-slide[data-v-5d2ea972]{min-height:4rem}.spike-swiper-slide .price[data-v-5d2ea972],.spike-swiper-slide del[data-v-5d2ea972]{text-align:center;display:block}.scroll-prolist[data-v-5d2ea972]{padding:0 .4rem}.spike-swiper[data-v-5d2ea972]{margin-top:-1px;border-top:1px solid #e7ecec}.spike-swiper-slide[data-v-5d2ea972]{text-align:center;padding:1rem .4rem}.spike-swiper-slide a[data-v-5d2ea972]{position:absolute;top:0;right:0;bottom:0;left:0}.spike-swiper-slide[data-v-5d2ea972]:last-child{padding-right:.4rem}.spike-swiper-slide img[data-v-5d2ea972]{display:block;width:100%}.spike-swiper-slide h4[data-v-5d2ea972]{font-size:1.4rem;margin-top:.2rem;font-weight:400;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.spike-swiper-slide .price[data-v-5d2ea972]{color:#ff495e;font-size:1.4rem}.spike-swiper-slide del[data-v-5d2ea972]{color:#9ea7b4;font-size:1.1rem}</style>
<style type="text/css">
.facebook-avatar img{
	  width: 40px;
	  height: 40px;
	  display: flex;
	  border-radius: 50%;
	  align-items: center;
	  justify-content: center;
	  overflow: hidden;
}
.isNoMore{
	text-align: center;
	font-size: 1.3rem;
	font-style: initial;
	color: gray;
	font-weight: bold;
	padding: 0.5rem;
}
.hidden_noMore{
	display:none;
}
</style>
	<body id="ssc">
        <div class="page page-current" id="index" style="z-index: 3;">
		
            <!-- content应该拥有"pull-to-refresh-content"类,表示启用下拉刷新 -->
            <div class="content pull-to-refresh-content infinite-scroll infinite-scroll-bottom native-scroll" data-ptr-distance="55" data-distance="100">

          <div >
    	  <div class="zixuntext" style="font-size:18px;margin-top:30px;">
    	  	<div style="width: 50px;margin-left: 45%">社区</div>
    	 	 <img style="float: right;width: 30px;height: 32px;margin-top: -32px;margin-right:10px;" src="static/lshapp/images/fatie.png"onclick="goSendArticle()">
    	  </div>

			<hr style="height:1px;border:none;border-top:3px solid #f5f5f5;"></hr>
		  </div>
                <div class="content-block">
                    <div class="tabs">
                        <div id="tab1" class="tab active">
                            <div class="content-block bcolor">
                                <div class="list-content">
                                    <div class="list-container" style="list-style-type:none;">
                                    <input type="hidden" name="totalPage" id="totalPage" value="${totalPage}"/>
                                		<ul id="articles">
                                		<c:forEach items="${varList}" var="var" varStatus="vs">
                                		<c:if test="${var.DELETE_STATUS == 0 }">
											<li class="card facebook-card">
											<div >
                                            <div class="card-header no-border">

                                                <div class="facebook-avatar"><img src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" width="44" height="44"></div>
                                                <div class="facebook-name">${var.CREATE_USER }</div>
                                                <div class="facebook-date" style="font-size:12px">${var.CREATE_DATE }</div>
                                            </div>
                                            <%-- <div style="height: 25px;width: 100%;text-align: center;font-size:16px;font-weight:bold">${var.TITLE }</div> --%>
                                            <div class="text-c" style="text-align: left!important; font-size:14px;" onclick="goArticleDetail(${var.ARTICLE_ID})">${var.CONTENT }</div>
                                            <%-- <div class="card-content">
                                            	<c:forEach items="${var.articlePathList}" var="var1" varStatus="vs">
                                            	<img class="img-c" src="<%=basePath%>uploadFiles/uploadImgs/${var1.ARTICLE_PATH}">
                                                </c:forEach>
                                           	</div> --%>
                                           	<section style="margin-bottom: 15px" class="product-list j-product-list product-list-medium new-flow-bottom">
								                <ul>
								                	<c:forEach items="${var.articlePathList}" var="var1" varStatus="vs">
								                    <li style="height: 100ox;width: 100px;">
								                        <div class="product-div" id="product-div">
								                           	<div class="shop-list-width" >
								                                <img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${var1.ARTICLE_PATH}">
								                            </div>
								                        </div>
								                    </li>
								                    </c:forEach>
								                </ul>
								            </section>
                                         	</div>
                                            <div  style="background-color:#fff;height:25px;width:100%;">
	                                                <div style="font-size:16px;height: 40px;float: right" onclick="goArticleDetail(${var.ARTICLE_ID})">

		                                            	<img  style="height: 20px;width: 24px;display: inline" src="static/lshapp/images/comment-xhdpi.png"> <span> ${var.COMMENT_COUNT }</span>

	                                            	</div>

	                                            	  <div style="font-size:16px;height: 40px;float: right;margin-right: 10px;">
		                                            	<img   style="height: 20px;width: 20px;display: inline"
			                                            	<c:if test="${var.COLLID == 1 }">src='<%=basePath%>static/lshapp/images/already_collected.png' name='1' </c:if><c:if test="${var.COLLID == 0 }">src='<%=basePath%>static/lshapp/images/not_collection.png' name='0'</c:if> onclick="articleCollection('${var.ARTICLE_ID}',this)"><span > ${var.COLLECTION_VOLUME}</span>
		                                            </div>

	                                            	<div onclick="articlePraise('${var.ARTICLE_ID }',this)" style="font-size:16px;height: 40px;float: right;margin-right: 10px;">
		                                            	<img   style="height: 20px;width: 20px;display: inline"
		                                            	<c:if test="${var.PRAISEID == 1 }">src='static/lshapp/images/A_little_praise1.png' </c:if><c:if test="${var.PRAISEID == 0 }">src='static/lshapp/images/No_praise1.png'</c:if>>
		                                            	<span > ${var.PRAISE_VOLUME }</span>
		                                            </div>


	                                            	<div style="font-size:16px;height: 40px;float: right;margin-right: 10px;">
		                                            	<img  style="height: 20px;width: 20px;display: inline" src="static/lshapp/images/browse-hdpi.png"><span> ${var.VISITOR_VOLUME }</span>
		                                            </div>






                                               </div>

                                        </li>
                                        </c:if>
                                      </c:forEach>
                                      </ul>
                                       <div class="float_left ma_l14" id="listMore" style="text-align: center;color: #fbc800;float: none;border-radius: 10px;width: 50%;margin-left: 25%;margin-top: 13px;margin-bottom: 20px;">
											上拉加载更多	
		  								</div>
                                </div>
                            </div>
                        </div>

                        <!--  -->
                    </div>
                </div>

            </div>
        </div>
    </div>
    <footer class="footer-nav dis-box">
    <a href="<%=basePath%>lshapp/userbrithday/list.do" class="box-flex nav-list">
        <i class="nav-box i-home1" style="background: url('<%=basePath%>static/lshapp/images/Birthday-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>生日</span>
    </a>
    <a href="<%=basePath%>lshapp/shop/index.do" class="box-flex nav-list">
        <i class="nav-box i-home2" style="background: url('<%=basePath%>static/lshapp/images/Give_a_gift-Silhouett.png') no-repeat;background-size:100% 100%;"></i><span>送礼</span>
    </a>
    <a href="<%=basePath%>lshapp/article/list.do" class="box-flex nav-list active">
        <i class="nav-box i-home3" style="background: url('<%=basePath%>static/lshapp/images/Community-Fill-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>社区</span>
    </a>
    <a href="<%=basePath%>lshapp/userCenter/center_index.do" class="box-flex position-rel nav-list">
        <i class="nav-box i-home4" style="background: url('<%=basePath%>static/lshapp/images/Personal_Center-Silhouette.png') no-repeat;background-size:100% 100%;"></i><span>个人中心</span>
    </a>
    </footer>
    <%-- <footer class="footer-nav dis-box">
    <a href="javascript:parent.window.switchpage(1);" class="box-flex nav-list">
        <i class="nav-box i-home1" style="background: url('<%=basePath%>static/lshapp/images/Birthday-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>生日</span>
    </a>
    <a href="javascript:parent.window.switchpage(2);" class="box-flex nav-list">
        <i class="nav-box i-home2" style="background: url('<%=basePath%>static/lshapp/images/Give_a_gift-Silhouett.png') no-repeat;background-size:100% 100%;"></i><span>送礼</span>
    </a>
    <a href="javascript:parent.window.switchpage(3);" class="box-flex nav-list active">
        <i class="nav-box i-home3" style="background: url('<%=basePath%>static/lshapp/images/Community-Fill-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>社区</span>
    </a>
    <a href="javascript:parent.window.switchpage(4);" class="box-flex position-rel nav-list">
        <i class="nav-box i-home4" style="background: url('<%=basePath%>static/lshapp/images/Personal_Center-Silhouette.png') no-repeat;background-size:100% 100%;"></i><span>个人中心</span>
    </a>
    </footer> --%>
    <script type="text/javascript">
    	function articlePraise(Id,th){

			 $.ajax({
				type: "POST",
				url: '<%=basePath%>lshapp/article/articlePraise.do?',
		    	data: {ARTICLE_ID:Id},
				dataType:'json',
				//cache: false,
				success: function(data){

					$(th).find("img").attr("src","static/lshapp/images/A_little_praise1.png");
					$(th).find("span").text(" "+data);
				}
			});
	    }

    	function articleCollection(Id,th){
    		var vlu=$(th).attr("name");
    		 $.ajax({
 				type: "POST",
 				url: '<%=basePath%>lshapp/article/articleCollection.do?',
 		    	data: {ARTICLE_ID:Id,SIGN:vlu},
 				dataType:'json',
 				//cache: false,
 				success: function(data){
 					if(vlu == 0){
 						$(th).attr("src","static/lshapp/images/already_collected.png");
 						$(th).attr("name","1");
 					}else{
 						$(th).attr("src","static/lshapp/images/not_collection.png");
 						$(th).attr("name","0");
 					}

 					$(th).parent().find("span").text(" "+data);
 				}
 			});
    	}

    </script>
    <script type="text/javascript">
 	// 帖子详情
	function goArticleDetail(Id){
		window.location.href='<%=basePath%>lshapp/article/articleDetail.do?ARTICLE_ID='+Id;
		//window.event.returnValue=false;

	}
 	//去发帖页面
	function goSendArticle(){
		window.location.href="<%=basePath%>lshapp/article/goSendArticle.do";
		//window.event.returnValue=false;

	}


    $(document).ready(function() {
        $(".text-c").each(function() {
            height = $(this).height();
            if (height > 72) {
                $(this).addClass("height-a");
                $(this).after("<p class=\"morecon\" style=\"font-size:14px\">点开更多内容&nbsp&nbsp&or;</p>");
            }
        });


        $(".morecon").click(function() {
            $(this).parent().children(".text-c").removeClass("height-a");
            $(this).parent().children(".text-c").addClass("dong");
            //$(this).parent().children(".text-c").css("height","auto");


            $(this).css("display", "none");

        });
    });
</script>


<script type="text/javascript">



   
   
    var isMore = false;
  	page=2;
	totalPage=${totalPage};
      $(document).ready(function(){
        $(window).scroll(function(){
        	
          if($(document).scrollTop()>=$(document).height()-$(window).height()){
      			if(page<=totalPage){
      				 if(!isMore){
           			  isMore = true;
      				$.ajax({
      					type: "POST",
      					url: '<%=basePath%>lshapp/article/ajaxList.do',
      			    	data: {currentPage:page},
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
        </script>
</body>
</html>