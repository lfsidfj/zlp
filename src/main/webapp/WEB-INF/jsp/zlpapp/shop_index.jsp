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
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=0">
<title>乐兴商城</title>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/lshapp/css/font_u366719ytlat6gvi.css" />
	<link rel="stylesheet" href="static/lshapp/css/font_lkv63qpdlo8khuxr.css" />
	<link rel="stylesheet" href="static/lshapp/css/app.css" />
	<link rel="stylesheet" href="static/lshapp/dist/css/swiper.min.css">
<script>
	window.ROOT_URL = '/mobile/';
	window.PC_URL = '/';
	//首页app下载连接
	window.APP_DOWNLOAD_URL = '';
	/*window.shopInfo = {ru_id :0,authority:1};*/
</script>
<style>
/*display盒子*/
.dis-box {
	display: -webkit-box;
	display: -moz-box;
	display: -ms-box;
	display: box;
}

.box-flex {
	box-flex: 1;
	-webkit-box-flex: 1;
	display: block;
	width: 100%;
}
/*footer*/
.footer-nav {
	background-color: rgba(254, 253, 252, 1);
	left: 0;
	right: 0;
	position: fixed;
	margin: 0 auto;
	bottom: 0;
	z-index: 11;
	box-shadow: 1px 5px 15px rgba(50, 50, 50, 0.3);
	border-top: 1px solid #f6f6f9;
	padding: 0.3rem 0
}

.footer-nav .nav-list {
	font-size: 1.1rem;
	display: block;
	text-align: center;
	padding-top: 0rem;
	color: #595959
}

.footer-nav .nav-list .nav-box {
	background: url(../mobile/public/img/ec-icon.png) no-repeat;
	width: 2.7rem;
	height: 2.7rem;
	display: block;
	margin: 0 auto;
	background-size: 32.1rem;
}

.footer-nav .nav-list .i-home {
	background-position: -.02rem 0rem;
}

.footer-nav .nav-list .i-cate {
	background-position: -2.701rem 0rem;
}

.footer-nav .nav-list .i-zhongchou {
	background-position: -16.7rem 0.1rem;
}

.footer-nav .nav-list .i-zhongchou_user {
	background-position: -19.5rem 0.1rem;
}

.footer-nav .nav-list .i-zhongchou-order {
	background-position: -22.25rem 0.1rem;
}

.footer-nav .nav-list .i-shop {
	background-position: -13.9rem 0rem;
}

.footer-nav .nav-list .i-flow {
	background-position: -5.78rem 0rem;
}

.footer-nav .nav-list .i-user {
	background-position: -8.38rem 0rem;
}

.footer-nav .nav-list .i-pintuan {
	background-position: -28.6rem 0rem;
}

.footer-nav .nav-list .i-ranking {
	background-position: -25.4rem 0.1rem;
}

.footer-nav .nav-list.active {
	color: #ec5151
}

.footer-nav .nav-list.active .i-home {
	background-position: .02rem -3rem;
}

.footer-nav .nav-list.active .i-cate {
	background-position: -2.701rem -3rem;
}

.footer-nav .nav-list.active .i-zhongchou {
	background-position: -16.7rem -3rem;
}

.footer-nav .nav-list.active .i-zhongchou_user {
	background-position: -19.5rem -2.9rem;
}

.footer-nav .nav-list.active .i-zhongchou-order {
	background-position: -22.25rem -2.9rem;
}

.footer-nav .nav-list.active .i-shop {
	background-position: -13.9rem -3rem;
}

.footer-nav .nav-list.active .i-flow {
	background-position: -5.78rem -3rem;
}

.footer-nav .nav-list.active .i-user {
	background-position: -8.38rem -3rem;
}

.footer-nav .nav-list.active .i-pintuan {
	background-position: -28.6rem -2.9rem;
}

.footer-nav .nav-list.active .i-ranking {
	background-position: -25.4rem -2.8rem;
}
</style>
<style type="text/css">
/*! normalize.css v5.0.0 | MIT License | github.com/necolas/normalize.css */
html {
	font-family: sans-serif;
	line-height: 1.15;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%
}

body {
	margin: 0
}

article,aside,footer,header,nav,section {
	display: block
}

h1 {
	font-size: 2em;
	margin: .67em 0
}

figcaption,figure,main {
	display: block
}

figure {
	margin: 1em 40px
}

hr {
	box-sizing: content-box;
	height: 0;
	overflow: visible
}

pre {
	font-family: monospace, monospace;
	font-size: 1em
}

a {
	background-color: transparent;
	-webkit-text-decoration-skip: objects
}

a:active,a:hover {
	outline-width: 0
}

abbr[title] {
	border-bottom: none;
	text-decoration: underline;
	text-decoration: underline dotted
}

b,strong {
	font-weight: inherit;
	font-weight: bolder
}

code,kbd,samp {
	font-family: monospace, monospace;
	font-size: 1em
}

dfn {
	font-style: italic
}

mark {
	background-color: #ff0;
	color: #000
}

small {
	font-size: 80%
}

sub,sup {
	font-size: 75%;
	line-height: 0;
	position: relative;
	vertical-align: baseline
}

sub {
	bottom: -.25em
}

sup {
	top: -.5em
}

audio,video {
	display: inline-block
}

audio:not ([controls] ){
	display: none;
	height: 0
}

img {
	border-style: none
}

svg:not (:root ){
	overflow: hidden
}

button,input,optgroup,select,textarea {
	font-family: sans-serif;
	font-size: 100%;
	line-height: 1.15;
	margin: 0
}

button,input {
	overflow: visible
}

button,select {
	text-transform: none
}

[type=reset],[type=submit],button,html [type=button] {
	-webkit-appearance: button
}

[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner,button::-moz-focus-inner
	{
	border-style: none;
	padding: 0
}

[type=button]:-moz-focusring,[type=reset]:-moz-focusring,[type=submit]:-moz-focusring,button:-moz-focusring
	{
	outline: 1px dotted ButtonText
}

fieldset {
	border: 1px solid silver;
	margin: 0 2px;
	padding: .35em .625em .75em
}

legend {
	box-sizing: border-box;
	color: inherit;
	display: table;
	max-width: 100%;
	padding: 0;
	white-space: normal
}

progress {
	display: inline-block;
	vertical-align: baseline
}

textarea {
	overflow: auto
}

[type=checkbox],[type=radio] {
	box-sizing: border-box;
	padding: 0
}

[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button
	{
	height: auto
}

[type=search] {
	-webkit-appearance: textfield;
	outline-offset: -2px
}

[type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration
	{
	-webkit-appearance: none
}

::-webkit-file-upload-button {
	-webkit-appearance: button;
	font: inherit
}

details,menu {
	display: block
}

summary {
	display: list-item
}

canvas {
	display: inline-block
}

[hidden],template {
	display: none
}

em {
	font-style: normal
}

* {
	-webkit-tap-highlight-color: transparent
}

*,:after,:before {
	box-sizing: border-box
}

img {
	display: block;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

html {
	font-size: 10px;
	height: 100%
}

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
	font-family: Helvetica Neue, Helvetica, PingFang SC, Hiragino Sans GB,
		Microsoft YaHei, \\5FAE\8F6F\96C5\9ED1, Arial, sans-serif;
	font-size: .86rem;
	line-height: 1.5;
	color: #333;
	background-color: #e7ecec;
	-webkit-font-smoothing: antialiased;
	font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	min-height: 100%
}

article,aside,blockquote,body,button,dd,details,div,dl,dt,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,hr,input,legend,li,menu,nav,ol,p,section,td,textarea,th,ul
	{
	margin: 0;
	padding: 0
}

button,input,select,textarea {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit
}

ol,ul {
	list-style: none
}

input::-ms-clear,input::-ms-reveal {
	display: none
}

:focus,a {
	outline: none
}

a {
	color: #3eb1fa;
	background: transparent;
	text-decoration: none;
	cursor: pointer;
	transition: color .2s ease
}

a:hover {
	color: #57bbfb
}

a:active {
	color: #25a7f9
}

a:active,a:hover {
	outline: 0;
	text-decoration: none
}

a[disabled] {
	color: #ccc;
	cursor: not-allowed;
	pointer-events: none
}

code,kbd,pre,samp {
	font-family: Consolas, Menlo, Courier, monospace
}

.f-left {
	float: left
}

.f-right {
	float: right
}

.collapse {
	border: 1px solid #e3e8ee
}

.collapse.close {
	border-bottom: 0
}

.collapse.close .con {
	height: 0;
	padding: 0
}

.collapse .title {
	background: #f3f4f5;
	overflow: hidden;
	font-size: 1.36rem;
	height: 3.2rem;
	border-bottom: 1px solid #e3e8ee
}

.collapse .title span {
	float: left;
	position: relative
}

.collapse .title span.rotate-arrow {
	position: relative
}

.collapse .title .icon-arrow {
	font-size: 1rem;
	position: absolute;
	margin-left: .2rem;
	transform: rotate(90deg);
	-ms-transform: rotate(90deg);
	-moz-transform: rotate(90deg);
	-webkit-transform: rotate(90deg);
	-o-transform: rotate(90deg)
}

.collapse.close .title .icon-arrow {
	transform: rotate(0);
	-ms-transform: rotate(0);
	-moz-transform: rotate(0);
	-webkit-transform: rotate(0);
	-o-transform: rotate(0)
}

.collapse .con {
	padding: 1.8rem 2rem;
	overflow: hidden
}

.form-group {
	margin-bottom: 1.2rem;
	max-width: 60rem;
	display: -ms-flexbox;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: start;
	justify-content: flex-start
}

.form-group:last-child {
	margin-bottom: 0
}

.form-group .group-l {
	float: left;
	margin-right: 1.2rem;
	font-size: 1.36rem;
	min-width: 6rem;
	color: #464c5b;
	text-align: right;
	display: -ms-flexbox;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: end;
	justify-content: flex-end
}

.form-group .group-r {
	-ms-flex: 1;
	flex: 1
}

.color-input {
	background: none;
	border: 0
}

.input-date-group {
	display: -moz-box !important;
	display: -webkit-box !important;
	display: box !important;
	display: -moz-flex !important;
	display: -ms-flex !important;
	display: -ms-flexbox !important;
	display: flex !important
}

.input-date-group .el-date-editor.el-input,.input-date-group .el-input {
	width: 86% !important;
	box-flex: 1;
	-ms-flex: 1 !important;
	flex: 1 !important;
	-webkit-flex: 1 !important
}

.input-date-group a {
	font-size: .82rem;
	margin-left: .4rem;
	margin-top: .4rem
}

.more-link {
	font-size: 1.3rem;
	margin-left: .8rem;
	padding-left: .8rem;
	border-left: 1px solid #e3e8ee;
	color: #464c5b
}

.more-link i {
	font-size: 1.2rem
}

.more-link:hover {
	color: #464c5b
}

.ec-remark {
	margin: .4rem 0;
	line-height: 1.4;
	font-size: 1.2rem;
	color: #ff495e
}

.seamless-scroll {
	overflow: hidden;
	position: absolute;
	left: 0
}

.seamless-scroll-wrapper {
	float: left;
	display: inline-block;
	white-space: nowrap
}

.mask {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, .7);
	z-index: 122
}

.ec-tabs.el-tabs--border-card>.el-tabs__header {
	background: #f3f4f5;
	border: none;
	height: 3.6rem !important
}

.el-tabs__nav-wrap {
	width: 100% !important
}

.el-tabs__nav {
	height: 3.6rem;
	width: 100%;
	display: -moz-box !important;
	display: -webkit-box !important;
	display: box !important;
	display: -moz-flex !important;
	display: -ms-flex !important;
	display: -ms-flexbox !important;
	display: flex !important
}

.el-tabs__item.is-active {
	color: #333 !important;
	background: #fff !important
}

.el-tabs--border-card>.el-tabs__header>.el-tabs__item.is-active:first-child,.el-tabs--border-card>.el-tabs__header>.el-tabs__item.is-active:last-child
	{
	border-left-color: none;
	border-right-color: none
}

.el-tabs__item {
	height: 3.6rem !important;
	line-height: 3.6rem !important;
	text-align: center;
	color: #666;
	border: 0 !important;
	margin-right: 0 !important;
	margin-left: 0 !important;
	box-flex: 1;
	-ms-flex: 1 !important;
	flex: 1 !important;
	-webkit-flex: 1 !important
}

.pages .el-tabs--border-card>.el-tabs__content {
	top: 3.6rem;
	overflow-x: hidden;
	bottom: 0;
	width: 100%;
	position: absolute
}

.pages .el-tabs--border-card>.el-tabs__content .el-tab-pane {
	position: absolute;
	top: 5.4rem;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 15px;
	overflow-y: scroll
}

.pages .el-tabs--border-card>.el-tabs__content .el-tab-pane.system {
	top: .8rem
}

.el-checkbox__inner:after {
	width: 4px !important;
	height: 7px !important;
	left: 4px !important
}

.el-radio+.el-radio {
	margin-left: 12px !important
}

.el-checkbox__inner,.el-radio__inner {
	width: 16px !important;
	height: 16px !important
}

.el-dropdown-menu {
	border-radius: 8px;
	border: 0 !important;
	box-shadow: 0 0 8px hsla(0, 0%, 42%, .3) !important;
	padding: .7rem 0 !important
}

.el-dropdown-menu__item {
	font-size: 1.3rem;
	padding: 0 16px !important;
	line-height: 30px !important
}

.el-dropdown-menu__item:hover {
	color: #3eb1fa !important;
	background: none !important
}

.el-input__inner {
	font-size: 13px !important;
	padding: 2px 8px !important;
	border: 1px solid #e3e8ee !important
}

.color-value .el-input__inner {
	border-radius: 4px 0 0 4px
}

.el-date-editor.el-input {
	width: 100% !important
}

.el-loading-mask {
	background-color: hsla(0, 0%, 100%, .4) !important
}

.dialog-ec .el-dialog__header {
	padding: 16px;
	border-bottom: 1px solid #e7ecec;
	position: relative
}

.dialog-ec .el-dialog__body {
	padding-top: 16px;
	padding-bottom: 6px;
	overflow-y: scroll
}

.dialog-picture .el-dialog__body {
	position: relative;
	height: 43.6rem
}

.custom-uploader.zindex-1 .el-upload {
	z-index: -1
}

.swiper-lazy-preloader {
	width: 22px !important;
	height: 22px !important;
	margin-left: -11px;
	margin-top: -11px
}

.el-checkbox__inner {
	z-index: 0 !important
}

@media only screen and (max-width:1540px) {
	.dialog-picture .el-dialog__body {
		height: 37rem
	}
}

@media only screen and (max-width:1440px) {
	.dialog-picture .el-dialog__body {
		height: 31rem
	}
}
</style>
<style type="text/css"></style>
<style type="text/css">
.commom-nav[data-v-32738571] {
	position: fixed;
	right: -82%;
	top: 66%;
	width: 82%;
	z-index: 12;
	margin-right: 4.5rem
}

.filter-top[data-v-32738571] {
	width: 4.5rem;
	position: absolute;
	text-align: center;
	padding: 1.3rem .4rem .6rem;
	background: rgba(0, 0, 0, .7);
	border-radius: .5rem 0 0 .5rem;
	display: none
}

.filter-top span[data-v-32738571] {
	font-size: 1rem;
	display: block;
	text-align: center;
	padding-top: .7rem;
	color: #fff
}

.filter-top-index img[data-v-32738571] {
	width: 2.4rem;
	position: absolute;
	top: 0;
	left: 50%;
	margin-left: -1.2rem
}

.filter-top .icon-jiantou12[data-v-32738571] {
	position: absolute;
	left: 0;
	right: 0;
	top: .2rem;
	font-size: 1.8rem;
	color: #fff;
	transform: rotate(90deg)
}
</style>
<style type="text/css">
.search[data-v-79b83520] {
	width: 100%;
	height: auto;
	overflow: hidden;
	z-index: 11;
	position: fixed
}

.search header[data-v-79b83520] {
	left: 0;
	right: 0;
	padding: 1rem .8rem;
	display: -moz-box !important;
	display: -webkit-box !important;
	display: box !important;
	display: -moz-flex !important;
	display: -ms-flex !important;
	display: -ms-flexbox !important;
	display: flex !important
}

.search a[data-v-79b83520] {
	color: #fff;
	text-align: left;
	font-size: 1.2rem;
	display: -moz-box !important;
	display: -webkit-box !important;
	display: box !important;
	display: -moz-flex !important;
	display: -ms-flex !important;
	display: -ms-flexbox !important;
	display: flex !important;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: center;
	justify-content: center
}

.search a span[data-v-79b83520] {
	margin-left: .1rem
}

.search a.message[data-v-79b83520] {
	position: relative;
	text-align: right
}

.message span[data-v-79b83520] {
	background: red;
	display: block;
	width: .8rem;
	height: .8rem;
	position: absolute;
	top: .3rem;
	right: -.2rem;
	border-radius: 9999px;
	border: 1px solid hsla(0, 0%, 100%, .8)
}

.search .iconfont[data-v-79b83520] {
	font-size: 1.7rem
}

.search .icon-down-arrow[data-v-79b83520] {
	font-size: .9rem;
	margin-left: .18rem;
	font-weight: 700
}

.search .input[data-v-79b83520] {
	font-size: 1.3rem;
	height: 2.86rem;
	line-height: 2.86rem;
	padding: 0 1rem;
	margin: 0 .6rem;
	border-radius: 1.43rem;
	color: #fff;
	position: relative;
	background: hsla(0, 0%, 100%, .4);
	box-flex: 1;
	-ms-flex: 1 !important;
	flex: 1 !important;
	-webkit-flex: 1 !important;
	display: -moz-box !important;
	display: -webkit-box !important;
	display: box !important;
	display: -moz-flex !important;
	display: -ms-flex !important;
	display: -ms-flexbox !important;
	display: flex !important;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: start;
	justify-content: flex-start
}

.search .input .icon-search[data-v-79b83520] {
	font-size: 1.4rem;
	margin-right: .4rem
}

.search .input a[data-v-79b83520],.search .mask[data-v-79b83520] {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.search .mask[data-v-79b83520] {
	z-index: -1;
	background: linear-gradient(180deg, rgba(0, 0, 0, .8) 0, transparent)
}
</style>
<style type="text/css">
.slide .swiper[data-v-0dc8b539] {
	width: 100%
}

.slide .swiper-slide img[data-v-0dc8b539] {
	width: 100%;
	display: block
}

.swiper-lazy-preloader[data-v-0dc8b539] {
	margin-top: 1rem;
	width: 1.6rem
}

.slide .swiper-slide a[data-v-0dc8b539] {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.slide .desc[data-v-0dc8b539] {
	position: absolute;
	padding: .4rem;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	color: #fff
}

.swiper-slide[data-v-0dc8b539] {
	background: #f4f5fa;
	display: box;
	display: -moz-box;
	display: -webkit-box;
	box-pack: center;
	-webkit-box-pack: center;
	box-align: center;
	-webkit-box-align: center;
	-moz-box-align: center;
	display: -ms-flexbox;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: center;
	justify-content: center
}

.slide .swiper-slide.no-swiper-slide img[data-v-0dc8b539],.slide .swiper-slide img.no-img[data-v-0dc8b539]
	{
	width: 50%;
	height: auto
}
</style>
<style type="text/css">
.separate-img-list ul li[data-v-0dbb90dc] {
	width: 100%;
	position: relative;
	margin-bottom: .6rem;
	background: #f4f5fa;
	display: box;
	display: -moz-box;
	display: -webkit-box;
	box-pack: center;
	-webkit-box-pack: center;
	box-align: center;
	-webkit-box-align: center;
	-moz-box-align: center;
	display: -ms-flexbox;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: center;
	justify-content: center
}

.separate-img-list ul li.default-img[data-v-0dbb90dc]:last-child,.separate-img-list ul li[data-v-0dbb90dc]:last-child
	{
	margin-bottom: 0
}

.separate-img-list ul li a[data-v-0dbb90dc] {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.separate-img-list ul li span[data-v-0dbb90dc] {
	position: absolute;
	padding: .4rem;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	color: #fff;
	overflow: hidden;
	text-overflow: ellipsis
}

.separate-img-list ul li img[data-v-0dbb90dc] {
	width: 100%;
	display: block
}

.separate-img-list ul.mini[data-v-0dbb90dc] {
	overflow: hidden
}

.separate-img-list ul.mini li[data-v-0dbb90dc] {
	width: 50%;
	float: left;
	padding-bottom: 0;
	margin-bottom: 0
}

.separate-img-list ul.mini li.gap[data-v-0dbb90dc] {
	padding: .4rem
}

.separate-img-list ul.mini li.gap[data-v-0dbb90dc]:nth-child(2n-1) {
	padding-right: .2rem
}

.separate-img-list ul.mini li.gap[data-v-0dbb90dc]:nth-child(2n) {
	padding-left: .2rem
}

.separate-img-list ul.mini li.gap:nth-child(2n-1) span[data-v-0dbb90dc]
	{
	left: .4rem;
	right: .2rem
}

.separate-img-list ul.mini li.gap:nth-child(2n) span[data-v-0dbb90dc] {
	left: .2rem;
	right: .4rem
}

.default-img[data-v-0dbb90dc] {
	min-height: 4rem;
	background: #f4f5fa;
	display: -ms-flexbox;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: center;
	justify-content: center
}

.separate-img-list li.default-img img[data-v-0dbb90dc] {
	display: block;
	width: 50%;
	height: auto
}

.separate-img-list ul li img.no-img[data-v-0dbb90dc] {
	width: 50%
}
</style>
<style type="text/css">
.product-list[data-v-dcddab0a] {
	overflow: hidden
}

.product-list.big h4[data-v-dcddab0a],.product-list.small.preview h4[data-v-dcddab0a]
	{
	height: inherit
}

.product-list li[data-v-dcddab0a] {
	width: 50%;
	padding-top: 1px;
	padding-right: 1px;
	float: left;
	position: relative
}

.product-list li a[data-v-dcddab0a] {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	z-index: 2
}

.product-list li .product-cart[data-v-dcddab0a] {
	position: absolute;
	right: .7rem;
	bottom: .7rem;
	width: 2.2rem;
	height: 2.2rem;
	line-height: 2.2rem;
	background: #ec5151;
	text-align: center;
	border-radius: 100%;
	color: #fff;
	z-index: 3
}

.product-list li .product-cart i[data-v-dcddab0a] {
	font-size: 1.5rem
}

.product-list figure[data-v-dcddab0a] {
	background: #fff;
	padding: .8rem;
	box-sizing: border-box
}

.product-list figure img[data-v-dcddab0a] {
	width: 100%;
	height: auto
}

.product-list figure h4[data-v-dcddab0a] {
	font-size: 1.4rem;
	height: 3.9rem;
	font-weight: 400;
	overflow: hidden;
	text-overflow: ellipsis
}

.product-list figcaption[data-v-dcddab0a] {
	margin-top: .8rem
}

.product-list figure p[data-v-dcddab0a] {
	margin-top: .4rem
}

.product-list figure .price em[data-v-dcddab0a] {
	color: #ec5151;
	font-size: 1.7rem;
	display: block
}

.product-list figure .remark em[data-v-dcddab0a] {
	font-size: 1.3rem;
	color: #888
}

.product-list.big li[data-v-dcddab0a],.product-list.small li[data-v-dcddab0a]
	{
	width: 100%;
	overflow: hidden
}

.product-list.small li figure[data-v-dcddab0a] {
	width: 100%;
	display: box;
	display: -moz-box;
	display: -webkit-box;
	box-pack: start;
	-webkit-box-pack: start;
	box-align: center;
	-webkit-box-align: center;
	-moz-box-align: center;
	display: -ms-flexbox;
	display: flex;
	display: -webkit-flex;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: start;
	justify-content: flex-start
}

.product-list.small li figure figcaption[data-v-dcddab0a] {
	width: 60%
}

.product-list.small li h4[data-v-dcddab0a] {
	width: 100%;
	height: inherit;
	white-space: nowrap
}

.product-list.small li img[data-v-dcddab0a] {
	width: 9.2rem;
	padding: .2rem;
	border: 1px solid #eee;
	margin-right: .8rem;
	height: auto
}

.product-list.small li figcaption[data-v-dcddab0a] {
	margin-top: 0;
	box-flex: 1;
	-ms-flex: 1 !important;
	flex: 1 !important;
	-webkit-flex: 1 !important
}
</style>
<style type="text/css">
.goods_type{
	margin:0.4rem 0.6rem;
	float: left;
	font-size: 1.4rem;
	border-radius: 2px;
	color: #1b242c;
	text-align: center;
}
.goods_image{
	margin:0 auto;
	width:4.6rem;
	height:4.6rem;
}
.goods_type1{
	float:left;
	margin-right:0.5rem;
	margin-top:0.5rem
}
.goods_iamge1{
	width:3rem;
	height:3rem;
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
.swiper-container {
        width: 100%;
        height: 35rem;
        margin-left: auto;
        margin-right: auto;
    }
.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}
.broad_goods_image{
    margin: 0 auto;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body style="margin-bottom: 5.2rem;">
	<div id="app">
		<div data-v-33d37b60="" class="home">
			<!---->
			<div data-v-79b83520="" data-v-33d37b60="" class="search"
				style="position: fixed;" modules-index="0">
				<header data-v-79b83520=""
					style="background-color: rgba(242, 242, 242, 0);">
					<!-- <a data-v-79b83520="" class="position"
						style="color: rgb(255, 255, 255);"
						href="http://www.lxshopping.cn/mobile/index.php?m=location"><i
						data-v-79b83520="" class="iconfont icon-position"></i> <span
						data-v-79b83520="">深圳</span> <i data-v-79b83520=""
						class="iconfont icon-down-arrow"></i></a> -->
					<section data-v-79b83520="" class="input"
						style="color: rgb(255, 255, 255);">
						<a data-v-79b83520="" href="<%=basePath%>lshapp/shop/search.do"></a> <i
							data-v-79b83520="" class="iconfont icon-search"></i>搜索商品或图片
					</section>
					<!-- 去购物车界面 -->
					<div data-v-79b83520="" class="message" style="color: rgb(255, 255, 255);width: 3rem;" onclick="goCart();" >
						 <img style="width: 1.8rem;height: 1.8rem;margin: 0.4rem auto;border:0;" src="static/lshapp/images/shopping_cart.png" />
					</div> 
				</header>
				<div data-v-79b83520="" class="mask"></div>
			</div>


			<!--轮播图-->
			<section modules-index="1">
				<div class="swiper-container">
			        <div class="swiper-wrapper">
			        	<c:forEach items="${broadcastList}" var="var" varStatus="vs">
				            <div class="swiper-slide" onclick="swiperGoods('${var.GOODS_ID}')">
				           	 <img  class="broad_goods_image" alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" lazy="loaded">
				            </div>
			            </c:forEach>
			        </div>
			        <!-- Add Pagination -->
			        <div class="swiper-pagination"></div>
			    </div>
			</section>


			<!--商品类目-->
			<section data-v-0dc8b539="" data-v-33d37b60="" class="slide" modules-index="20" style="background:#fff;overflow: hidden;">
				<div>
					<c:forEach items="${typeList}" var="var" varStatus="vs">
						<div class="goods_type" onclick="gootsType('${var.GOODSTYPE_ID}');">
							<%-- <input type="hidden" name="GOODSTYPE_ID" id="GOODSTYPE_ID" value="${var.GOODSTYPE_ID}"/> --%>
							<img  class="goods_image" alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" lazy="loaded">
							<span >${var.TYPE_NAME}</span>
						</div>
					</c:forEach>
				</div>
			</section>

			<div  style="overflow: hidden;position: relative;width: 100%;height: 15rem;">
				<img style="width: 100%;height: 20rem;" src="static/lshapp/5b304feb1c7cd.jpg">
			</div>

			<!--抽奖入口-->
			<section data-v-0dc8b539="" data-v-33d37b60="" class="slide"
				modules-index="21">
				<div data-v-0dc8b539="" class="separat-show">
					<div data-v-0dbb90dc="" data-v-0dc8b539=""
						class="separate-img-list">
						<ul data-v-0dbb90dc="" class="">
							<li data-v-0dbb90dc=""><a data-v-0dbb90dc=""
								href="javascript:;"></a> <span data-v-0dbb90dc="" class="desc"
								style="display: none;"></span> <img data-v-0dbb90dc="" alt=""
								src="static/lshapp/5951cff0cb5fd.png"
								lazy="loaded"></li>
							<!---->
						</ul>
					</div>
				</div>
			</section>
			<section data-v-dcddab0a="" data-v-33d37b60="" modules-index="22">
				<input type="hidden" name="totalPage" id="totalPage" value="${totalPage}"/>
				<ul data-v-dcddab0a="" class="product-list" id="index_goods">
					<c:forEach items="${goodsList}" var="var" varStatus="vs">
						<li data-v-dcddab0a="" onclick="goGoods('${var.GOODS_ID}');">
							<!---->
							<figure data-v-dcddab0a="">
								<div data-v-dcddab0a="" class="img-box"
									style="height: 150px; line-height: 150px;">
									<img data-v-dcddab0a=""
										src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}"
										lazy="loaded" style="height: 100%;">
								</div>
								<figcaption data-v-dcddab0a="">
									<div >
										<c:choose>
										  <c:when test="${var.GOODS_POSITION =='0'}">
											   <div class="goods_type1">
													<img   class="goods_iamge1"  src="static/lshapp/images/commodity_discount.png" lazy="loaded">
												</div>
										  </c:when>
										  <c:when test="${var.GOODS_POSITION =='1'}">
										    	<div class="goods_type1">
													<img   class="goods_iamge1"  src="static/lshapp/images/commodity_exchange.png" lazy="loaded">
												</div>
										  </c:when>
										  <c:otherwise>
										  </c:otherwise>
										</c:choose>

										<div style="">
											<h4 data-v-dcddab0a="" >${var.GOODS_NAME} </h4>
										</div>
									</div>
									<p data-v-dcddab0a="" class="remark">
										<em data-v-dcddab0a="">库存：${var.GOODS_INVENTORY}</em>
										<em data-v-dcddab0a="" style="margin-left:1rem">销量：${var.SALES_VOLUME}</em>
									</p>
									<p data-v-dcddab0a="" class="price">
										<em data-v-dcddab0a="">¥${var.CURRENT_PRICE}</em>
									</p>
								</figcaption>
							</figure>
						</li>
					</c:forEach>
				</ul>
				<div id="isNoMore" class="isNoMore hidden_noMore"><p id="tv_more">没有更多了</p></div>
			</section>
			<!---->
			<nav data-v-32738571="" data-v-33d37b60="" id="commom-nav"
				class="commom-nav dis-box ts-5" style="top: 76%;">
				<div data-v-32738571="" class="left-icon">
					<div data-v-32738571="" id="scrollUp"
						class="filter-top filter-top-index" style="display: none;">
						<i data-v-32738571="" class="iconfont icon-jiantou12"></i> <span
							data-v-32738571="">顶部</span>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<footer class="footer-nav dis-box">
    <a href="<%=basePath%>lshapp/userbrithday/list.do" class="box-flex nav-list">
        <i class="nav-box i-home1" style="background: url('<%=basePath%>static/lshapp/images/Birthday-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>生日</span>
    </a>
    <a href="<%=basePath%>lshapp/shop/index.do" class="box-flex nav-list active">
        <i class="nav-box i-home2" style="background: url('<%=basePath%>static/lshapp/images/Give_a_gift-Fill.png') no-repeat;background-size:100% 100%;"></i><span>送礼</span>
    </a>
    <a href="<%=basePath%>lshapp/article/list.do" class="box-flex nav-list">
        <i class="nav-box i-home3" style="background: url('<%=basePath%>static/lshapp/images/Community-Silhouett-hdpi.png') no-repeat;background-size:100% 100%;"></i><span>社区</span>
    </a>
    <a href="<%=basePath%>lshapp/userCenter/center_index.do" class="box-flex position-rel nav-list">
        <i class="nav-box i-home4" style="background: url('<%=basePath%>static/lshapp/images/Personal_Center-Silhouette.png') no-repeat;background-size:100% 100%;"></i><span>个人中心</span>
    </a>
    </footer>
	<script src="static/lshapp/js/app.js"></script>
	<script src="static/lshapp/js/geolocation.js"></script>
	<script src="static/lshapp/js/manifest.js"></script>
	<script src="static/lshapp/js/vendor.js"></script>
	<script src="static/lshapp/js/api"></script>
	<script src="static/lshapp/js/getscript"></script>
	<script src="static/lshapp/js/GeoUtils_min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/lshapp/dist/js/swiper.min.js"></script>
	<script>
	    var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev',
	        slidesPerView: 1,
	        paginationClickable: true,
	        spaceBetween: 30,
	        loop: true
	    });
    </script>
	<script type="text/javascript">
		//商品类目
		function gootsType(Id){
			window.location.href="<%=basePath%>lshapp/shop/sort.do?SEQENCE=SEQENCE&GOODSTYPE_ID="+Id;
		}
		//去购物车
		function goCart(){
			window.location.href="<%=basePath%>lshapp/shop/goCart.do";
		}
		function goGoods(Id){ // 商品详情
			window.location.href="<%=basePath%>lshapp/shop/goods.do?index=index&GOODS_ID="+Id;
		}
		
		function swiperGoods(Id){ // 轮播商品详情
			window.location.href="<%=basePath%>lshapp/shop/goods.do?index=index&GOODS_ID="+Id;
		}
	</script>
	<script type="text/javascript">
    var totalPage = $("#totalPage").val();
    var isMore=false;//是否正在下拉耍新
	// 下拉加载更多     
	var currentPage=2;
          $(document).ready(function(){
            $(window).scroll(function(){
              if($(document).scrollTop()>=$(document).height()-$(window).height()){
            	  if(parseInt(totalPage)<parseInt(currentPage)){ // 没有更多了
            		  $("#tv_more").val("没有更多了");
            		  $("#isNoMore").removeClass("hidden_noMore");
            		  return;
            	  }else{
            		  if(!isMore){
            			  isMore = true;
            			  $.ajax({ // 加载更多数据
                              type:"POST",
                              url:'<%=basePath%>lshapp/shop/indexGoodsMore.do',
                              //dataType:'json',
                              cache: false,
                              data: {currentPage:currentPage,showCount:10},
                              beforeSend:function(){
                                $("#tv_more").val("正在加载更多..."); //显示加载时候的提示
                              },
                              success:function(ret){
                               $("#index_goods").append(ret); //将ajxa请求的数据追加到内容里面
                               currentPage ++;
                               $("#isNoMore").addClass("hidden_noMore");
                               $("#tv_more").val("没有更多了");
                               isMore =false;
                              }
                          }); 
            			  return true;
          			}else{
          				return false; 
          			}
            	  };
              };
            });
          });
        </script> 
	<script>
		window.onload = function() {

			/*页面向上滚动js*/
			$(".filter-top").click(function() {
				$("html,body").animate({
					scrollTop : 0
				}, 200);
			});

			$(window).scroll(function() {
				var prevTop = 0, currTop = 0;
				currTop = $(window).scrollTop();
				win_height = $(window).height() * 2;
				if (currTop >= win_height) {
					$(".filter-top").stop(true, true).fadeIn(200);
				} else {
					$(".filter-top").stop(true, true).fadeOut(200);
				}
				//prevTop = currTop; //IE下有BUG，所以用以下方式
				setTimeout(function() {
					prevTop = currTop
				}, 0);
			});

			/*点击关闭顶部层*/
			$(".ect-header-banner i.icon-guanbi").click(function() {
				$(".app-down").hide();
			});

			function showPosition(position) {
				// var info = JSON.stringify(position, null, 4);
				// 查询城市信息
				$.post('/mobile/index.php?m=index&c=location&a=info&force=1', {
					lbs_position : position,
					city_name : position.city
				}, function(data) {
					$('.j-current_location_city').attr('data-city',
							data.region_id).html(data.region_name);
				}, 'json')
			}
			;

			function showErr() {
				//alert('定位失败，请启用位置服务。');

			}
			;
		}
	</script>

</body>
</html>