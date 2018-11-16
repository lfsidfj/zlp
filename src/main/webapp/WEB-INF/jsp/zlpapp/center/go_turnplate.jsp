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
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
		<meta content="Discover the rich set of features in CanvasFlip. Explore everything about rapid prototyping, sharing and analyzing the UX of prototypes on the tool. Know more." name="description">
		 <meta name="apple-mobile-web-app-capable" content="yes">
    	<meta name="apple-mobile-web-app-status-bar-style" content="black">
    	<meta name="format-detection" content="telephone=no">
    	 <link href="static/lshapp/css/center/sytle.css" rel="stylesheet" type="text/css">
    	 <link rel="stylesheet" href="static/lshapp/css/center/common.css"/>
    	  <title>大抽奖</title>
    	 <link href="static/lshapp/css/center/layer.css" rel="stylesheet" type="text/css">
     	<script src="static/lshapp/js/center/jquery-2.2.0.min.js"></script>
     	 <link href="static/lshapp/css/app.min.css" rel="stylesheet" type="text/css">
     	 <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
     	<script src="static/lshapp/js/center/layer.js"></script>
     	<script type="text/javascript">
			var w,h,className;
			function getSrceenWH(){
				w = $(window).width();
				h = $(window).height();
				$('#dialogBg').width(w).height(h);
			}

			window.onresize = function(){
				getSrceenWH();
			}
			$(window).resize();

			$(function(){
				getSrceenWH();

				//显示弹框
				$('.adduser').click(function(){
					className = $(this).attr('class');
					$('#dialogBg').fadeIn(300);
					$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
				});

				//关闭弹窗
				$('.claseDialogBtn').click(function(){
					$('#dialogBg').fadeOut(300,function(){
						$('#dialog').addClass('bounceOutUp').fadeOut();
					});
				});
			});
		</script>
		<style>
			*, :after, :before {
			    margin: 0;
			    padding: 0;
			    box-sizing: border-box;
			}
			* {
				margin: 0;
				padding: 0;
			}
			main{padding-top: 3em;}
			table {
				border-spacing: 0;
				border-collapse: collapse;
				text-align: center;
				margin-left: 13vw;
				margin-right: 13vw;
				margin-bottom: 13vw;
			}

			.draw {
				width: 100%;
				height: auto;
				margin: 0 auto;
				padding:0vw;
				background-image: url(static/lshapp/images/center/bg.png);
				background-repeat: no-repeat;
				background-size: 100%;
				top:10%;
				position: absolute;
			}

			.draw .item {
				width: 20vw;
				height: 27.5vw;
				background-image: url(static/lshapp/images/center/bg1.png);
				background-repeat: no-repeat;
				background-size: 99%;
			}

			.draw .item.active {
				background-image: url(static/lshapp/images/center/bg2.png);
				background-repeat: no-repeat;
				background-size: 100%;
			}

			.draw .img {
				display: table-cell;
				width: 30vw;
				height: 5vw;
				vertical-align: middle;
				text-align: center;
			}

			.draw .img img {
				vertical-align: top;
			}

			.draw .gap {
				width: 0.5vw;
			}

			.draw .gap-2 {
				height: 0.5vw;
			}

			.draw .name {
				display: block;
				margin-top: 2vw;
				font-size:3.2vw;
			}

			.draw .draw-btn {
				display: block;
				height: 28vw;
				line-height: 28vw;
				border-radius: 2vw;
				font-size: 3vw;
				font-weight: 700;
				text-decoration: none;
				background-image: url(static/lshapp/images/center/bg3.png);
				background-repeat: no-repeat;
				background-size: 98%;
			}
			.submint {
				height: 38px;
				width: 60%;
				/* border: 1.3px solid #00AEED; */
				border-radius: 20px;
				margin-left: 20%;
				margin-top: 44px;
				text-align: center;
				font-size: 1.1rem;
				background-color:#ED4C44;
				color: white;
				line-height:38px;
			}
			.award_icon{
			width: 2.5rem;
			height: 2.5rem;
			border-radius: 0.5rem;
		}
			 .rule{
				width: 70%;
				margin-left: 14%;
				top: 73%;
				font-size: 1.6rem;
				color: white;
				 position: absolute;
		}
		</style>
	</head>

	<body  style="background-image: url(static/lshapp/images/center/background-hdpi.jpg);background-repeat: no-repeat;background-size: 100%;">
			<div class="draw" id="lottery">
				 <table style="width: 82%;margin-left: 9%;margin-top: 7.8%;">
				 <input type="hidden" id="is_k" name="is_k" value="${is_k}"/>
				 <input type="hidden" id="is_w" name="is_w" value="${is_w}"/>
				 <input type="hidden" id="IS_LOGIN" name="IS_LOGIN" value="${IS_LOGIN}"/>
					 <tr>
						<td class="item lottery-unit lottery-unit-0">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path0}" alt="">
							</div>
							<span class="name">${goods.name0}</span>
							<input type="hidden" id="TYPE-0" name="TYPE-0" value="${goods.TYPE0}"/>
							<input type="hidden" id="Location" name="Location" value=""/>
							<input type="hidden" id="CHANCE-0" name="CHANCE-0" value="${goods.CHANCE0}"/>
							<input type="hidden" id="AWARD_ID-0" name="AWARD_ID-0" value="${goods.AWARD_ID0}"/>
							<input type="hidden" id="url0" name="url0" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path0}"/>
							<c:if test="${goods.TYPE0=='0'}">
								<input type="hidden" id="unit-0" name="unit-0" value="${goods.goods_id0}"/>
							</c:if>
						</td>
						<td class="gap"></td>
						<td class="item lottery-unit lottery-unit-1">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path1}" alt="">
							</div>
							<span class="name">${goods.name1}</span>
							<input type="hidden" id="TYPE-1" name="TYPE-1" value="${goods.TYPE1}"/>
							<input type="hidden" id="CHANCE-1" name="CHANCE-1" value="${goods.CHANCE1}"/>
							<input type="hidden" id="AWARD_ID-1" name="AWARD_ID-1" value="${goods.AWARD_ID1}"/>
							<input type="hidden" id="url1" name="url1" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path1}"/>
							<c:if test="${goods.TYPE1=='0'}">
								<input type="hidden" id="unit-1" name="unit-1" value="${goods.goods_id1}"/>
							</c:if>
						</td>
						<td class="gap"></td>
						<td class="item lottery-unit lottery-unit-2">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path2}" alt="">
							</div>
							<span class="name">${goods.name2}</span>
							<input type="hidden" id="TYPE-2" name="TYPE-2" value="${goods.TYPE2}"/>
							<input type="hidden" id="CHANCE-2" name="CHANCE-2" value="${goods.CHANCE2}"/>
							<input type="hidden" id="AWARD_ID-2" name="AWARD_ID-2" value="${goods.AWARD_ID2}"/>
							<input type="hidden" id="url2" name="url2" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path2}"/>
							<c:if test="${goods.TYPE2=='0'}">
								<input type="hidden" id="unit-2" name="unit-2" value="${goods.goods_id2}"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="gap-2" colspan="5">
							<input type="hidden" id="cart_id" name="cart_id" value="${cart_id}"/>
						</td>
					</tr>
					<tr>
						<td class="item lottery-unit lottery-unit-7">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path7}" alt="">
							</div>
							<span class="name">${goods.name7}</span>
							<input type="hidden" id="TYPE-7" name="TYPE-7" value="${goods.TYPE7}"/>
							<input type="hidden" id="CHANCE-7" name="CHANCE-7" value="${goods.CHANCE7}"/>
							<input type="hidden" id="AWARD_ID-7" name="AWARD_ID-7" value="${goods.AWARD_ID7}"/>
							<input type="hidden" id="url7" name="url7" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path7}"/>
							<c:if test="${goods.TYPE7=='0'}">
								<input type="hidden" id="unit-7" name="unit-7" value="${goods.goods_id7}"/>
							</c:if>
						</td>
						<td class="gap"></td>
						<td class="">
							<a class="draw-btn" href="javascript:"></a>
						</td>
						<td class="gap"></td>
						<td class="item lottery-unit lottery-unit-3">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path3}" alt="">
							</div>
							<span class="name">${goods.name3}</span>
							<input type="hidden" id="TYPE-3" name="TYPE-3" value="${goods.TYPE3}"/>
							<input type="hidden" id="CHANCE-3" name="CHANCE-3" value="${goods.CHANCE3}"/>
							<input type="hidden" id="AWARD_ID-3" name="AWARD_ID-3" value="${goods.AWARD_ID3}"/>
							<input type="hidden" id="url3" name="url3" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path3}"/>
							<c:if test="${goods.TYPE3=='0'}">
								<input type="hidden" id="unit-3" name="unit-3" value="${goods.goods_id3}"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="gap-2" colspan="5"></td>
					</tr>
					<tr>
						<td class="item lottery-unit lottery-unit-6">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path6}" alt="">
							</div>
							<span class="name">${goods.name6}</span>
							<input type="hidden" id="TYPE-6" name="TYPE-6" value="${goods.TYPE6}"/>
							<input type="hidden" id="CHANCE-6" name="CHANCE-6" value="${goods.CHANCE6}"/>
							<input type="hidden" id="AWARD_ID-6" name="AWARD_ID-6" value="${goods.AWARD_ID6}"/>
							<input type="hidden" id="url6" name="url6" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path6}"/>
							<c:if test="${goods.TYPE6=='0'}">
								<input type="hidden" id="unit-6" name="unit-6" value="${goods.goods_id6}"/>
							</c:if>
						</td>
						<td class="gap"></td>
						<td class="item lottery-unit lottery-unit-5">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path5}" alt="">
							</div>
							<span class="name">${goods.name5}</span>
							<input type="hidden" id="TYPE-5" name="TYPE-5" value="${goods.TYPE5}"/>
							<input type="hidden" id="CHANCE-5" name="CHANCE-5" value="${goods.CHANCE5}"/>
							<input type="hidden" id="AWARD_ID-5" name="AWARD_ID-5" value="${goods.AWARD_ID5}"/>
							<input type="hidden" id="url5" name="url5" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path5}"/>
							<c:if test="${goods.TYPE5=='0'}">
								<input type="hidden" id="unit-5" name="unit-5" value="${goods.goods_id5}"/>
							</c:if>
						</td>
						<td class="gap"></td>
						<td class="item lottery-unit lottery-unit-4">
							<div class="img">
								<img class="award_icon" src="<%=basePath%>uploadFiles/uploadImgs/${goods.path4}" alt="">
							</div>
							<span class="name">${goods.name4}</span>
							<input type="hidden" id="TYPE-4" name="TYPE-4" value="${goods.TYPE4}"/>
							<input type="hidden" id="CHANCE-4" name="CHANCE-4" value="${goods.CHANCE4}"/>
							<input type="hidden" id="AWARD_ID-4" name="AWARD_ID-4" value="${goods.AWARD_ID4}"/>
							<input type="hidden" id="url4" name="url4" value="<%=basePath%>uploadFiles/uploadImgs/${goods.path4}"/>
							<c:if test="${goods.TYPE=='0'}">
								<input type="hidden" id="unit-4" name="unit-4" value="${goods.goods_id4}"/>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div class="rule" >
				<div style="text-align: center;font-size: 2.1rem;">抽奖规则</div>
				<div style="text-align: left: ;">1.注册的新用户，可获得抽奖机会(如果对第一次抽到的奖品不满意,可以第二次抽奖)</div>
				<div style="text-align: left: ;">2.当天过生日的用户，可以获得一次抽奖的机会</div>



			</div>
		<script type="text/javascript">
			var lottery = {
				index: -1, //当前转动到哪个位置，起点位置
				count: 0, //总共有多少个位置
				timer: 0, //setTimeout的ID，用clearTimeout清除
				speed: 20, //初始转动速度
				times: 0, //转动次数
				cycle: 25, //转动基本次数：即至少需要转动多少次再进入抽奖环节
				prize: -1, //中奖位置
				init: function(id) {
					if($('#' + id).find('.lottery-unit').length > 0) {
						$lottery = $('#' + id);
						$units = $lottery.find('.lottery-unit');
						this.obj = $lottery;
						this.count = $units.length;
						$lottery.find('.lottery-unit.lottery-unit-' + this.index).addClass('active');
					};
				},
				roll: function() {
					var index = this.index;
					var count = this.count;
					var lottery = this.obj;
					$(lottery).find('.lottery-unit.lottery-unit-' + index).removeClass('active');
					index += 1;
					if(index > count - 1) {
						index = 0;
					};
					$(lottery).find('.lottery-unit.lottery-unit-' + index).addClass('active');
					this.index = index;
					return false;
				},
				stop: function(index) {
					this.prize = index;
					return false;
				}
			};

			function roll() {
				lottery.times += 1;
				lottery.roll(); //转动过程调用的是lottery的roll方法，这里是第一次调用初始化

				if(lottery.times > lottery.cycle + 10 && lottery.prize == lottery.index) {
					clearTimeout(lottery.timer);
					var inddd=lottery.index;
					var awardDDD=$('.lottery-unit.lottery-unit-'+inddd).text();
				    var h1 = document.getElementById('awardAD');
				    h1.innerHTML = ''+awardDDD;
				    $("#Location").val(inddd);
				    var IS_LOGIN=$("#IS_LOGIN").val();
				    var AWARD_ID=$("#AWARD_ID-"+inddd).val();
				    var url=$("#url"+inddd).val();
				    $("#awUrl").attr("src",url);
					//保存抽奖纪录
					$.ajax({
	  		        type:"post",//请求方式get/post
	  		        url:'<%=basePath%>lshapp/userCenter/save_award_record.do?AWARD_ID='+AWARD_ID+'&IS_LOGIN='+IS_LOGIN,//请求对应的地址
		  		        success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
		  		        	className = $(this).attr('class');
							$('#dialogBg').fadeIn(300);
							$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
		  		        }
		   	 		});

				} else {
					if(lottery.times < lottery.cycle) {
						lottery.speed -= 10;
					} else if(lottery.times == lottery.cycle) {
						var index = Math.random() * (lottery.count) | 0; //静态演示，随机产生一个奖品序号，实际需请求接口产生
						lottery.prize = ${number};
					} else {
						if(lottery.times > lottery.cycle + 10 && ((lottery.prize == 0 && lottery.index == 7) || lottery.prize == lottery.index + 1)) {
							lottery.speed += 110;
						} else {
							lottery.speed += 20;
						}
					}
					if(lottery.speed < 40) {
						lottery.speed = 40;
					};
					lottery.timer = setTimeout(roll, lottery.speed); //循环调用
				}
				return false;
			}
			var click = false;
			var is_k=$("#is_k").val();
			if(parseInt(is_k)==1){
				click = true;
			}
			window.onload = function() {
				lottery.init('lottery');
				$('.draw-btn').click(function() {
					if(click) { //click控制一次抽奖过程中不能重复点击抽奖按钮，后面的点击不响应
						if($("#is_w").val()!=""){
							d_messages("完善生日信息才能抽奖!");
							return false;
						}else{
							d_messages("抽奖活动只能是新注册的用户，或者当天过生日的用户才有机会!");
							return false;
						}


					} else {
						lottery.speed = 100;
						roll(); //转圈过程不响应click事件，会将click置为false
						click = true; //一次抽奖完成后，设置click为true，可继续抽奖
						return false;
					}
				});
			};
			function getAward(){
				var id=$("#Location").val();
				var ty=$("#TYPE-"+id).val();
			    var IS_LOGIN=$("#IS_LOGIN").val();
			    var AWARD_ID=$("#AWARD_ID-"+id).val();

				$.ajax({
	  		        type:"post",//请求方式get/post
	  		        url:'<%=basePath%>lshapp/userCenter/get_award_record.do?AWARD_ID='+AWARD_ID+'&IS_LOGIN='+IS_LOGIN+'&TYPE='+ty,//请求对应的地址

		  		        success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
		  		  	      	$("#cart_id").val(data);
			  		  		if(parseInt(ty)==1){
								window.location.replace("<%=basePath%>lshapp/userCenter/go_turnplate.do");
							}else{
								var num=${number};
								var id=$("#unit-"+num).val();
								var cart_id=$("#cart_id").val();
								window.location.replace("<%=basePath%>lshapp/shop/goods.do?GOODS_ID="+id+"&CART_ID="+cart_id);
							}
		  		        }
		   	 	});
			}
			function award(){
				className = $(this).attr('class');
				$('#dialogNBg').fadeIn(300);
				$('#dialogN').removeAttr('class').addClass('animatedN '+className+'').fadeIn();
			}
			function quxiao(){
				window.location.replace("<%=basePath%>lshapp/userCenter/go_turnplate.do");
			}
		</script>
	</body>
	<div id="dialogBg"></div>
	<div id="dialog" class="animated">
		<div class="dialogTop" >


			<a  class="claseDialogBtn" onclick="quxiao()">
				<img src="static/lshapp/images/Close-hdpi.png" style="height:25px;width:25px;"></img>
			</a>
		</div>
		<ul class="editInfos">
			<li>
				<img src="static/lshapp/images/Cake-hdpi.png" style="width:60px;height:60px;" id="awUrl"></img>
			</li>
			<li id="awardAD"></li>
			<li>
			<div class="submint" onclick="getAward()">
        			立即领取
			</div>
			</li>
		</ul>
	</div>
</html>