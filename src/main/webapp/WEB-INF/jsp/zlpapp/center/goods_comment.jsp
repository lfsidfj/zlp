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
    <title>发表评论</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
    <link href="static/lshapp/mui/css/mui.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app.js"></script>
      <script src="<%=basePath%>static/lshapp/js/app.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
	function niming(){
		document.getElementById("nimingQ").style.display="none";
		document.getElementById("nimingNoQ").style.display="block";
	}
	function nimingNo(){
		document.getElementById("nimingNoQ").style.display="none";
		document.getElementById("nimingQ").style.display="block";
	}
	</script>
    <style>
		.submint {
		height: 40px;
		width: 60%;
		/* border: 1.3px solid #00AEED; */
		border-radius: 20px;
		margin-left: 19%;
		margin-top: 35px;
		text-align: center;
		font-size: 1.8rem;
		background-color:#ED4C44;
		color: white;
		line-height:40px;
		}
		.uploading {
		height: 10rem;
		width: 10rem;
		 border: 1px solid #DCDCDC;
		 border-style:dashed;
		border-radius: 0.1px;
		margin-left: 5%;
		text-align: center;
		font-size: 1.3rem;
		color: #DCDCDC;
		}
		.user_icon{
			width: 1.8rem;
			height: 1.6rem;
			border-radius: 0.5rem;
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
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>
<div class="con">
	<!-- <section class="search category-search common-search" style="background-color: white;">
		       <div class="text-all dis-box j-text-all text-all-back">
							<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
		                        	<img class="return_image" src="static/lshapp/images/return.png">
		                   </a>
						  <div style="text-align: center;width: 85%;" >
		                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">商品评论</span>
						  </div>
				</div>
	  </section>
	  <hr style="height:1px;border:none;border-top:1px solid #E1E1E1;width: 100%;margin-top: -2.4rem;" />
	 --><form action="<%=basePath%>lshapp/userCenter/save_goods_comment.do" method="post" name="Form" id="Form">
    <div class="goods-info user-order of-hidden ts-3" style="padding-top:0.1rem">

        <section class="store_info">
                  <section class="flow-checkout-pro  m-top08">
						<section class="flow-checkout-pro j-flow-checkout-pro  active" >
                        <div class="product-list-small m-top1px b-color-f dis-box">
						   <ul class="box-flex flow-checkout-bigpic">
								<li>
										<div class="product-div">
											<a class="product-div-link" href="/mobile/index.php?m=goods&amp;id=573&amp;u=25165"></a>
											<img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${pd.PATH} ">
											<div class="product-text">
												<h4>${pd.GOODS_NAME}</h4>
												<p><span class="p-price t-first " style="color:black;">¥${pd.ORIGINAL_PRICE} <small class="fr t-remark" style="color:#F04055;margin-right:1rem;">x${pd.AMOUNT}</small></span></p>
												<p class="dis-box p-t-remark">规格:${pd.SPEC} <br>
													</p>
											</div>
										</div>
									</li>
						   </ul>
                        </div>
                    </section>

							<div class="padding-all f-05 user-order-money b-color-f" style="background-color:#f2f2f2">
								<label class="t-remark" style="float:left;font-size:1.32rem;color:#DCDCDC">订单号：${pd.ORDER_ID}</label>
								<em class="t-first" style="color:#9A9A9A;font-size:1.32rem;">实支付：${pd.REAL_PAY_AMOUNT}</em>
							</div>

               </section>


				<section class="padding-all b-color-f com-textarea">
					<div class="f-c-select-msg" style="width:100%;">
						<div class="text-area1 text-area2 m-top04">
							<textarea name="CONTENT" id="CONTENT" class="text-area1" maxlength="300" placeholder="宝贝满足你的要求吗？分享给想买的他们吧"></textarea>
							<span>300</span>
						</div>
					</div>

					<div style="background-color:white;height:11rem;" id="commentP">
						<div class="uploading" style="float:left;background-color:white;margin:0.5rem;" id="uploadPicture">
							<span class="span-file">
							<label><img src="static/lshapp/images/center/Photo release review-hdpi.png"   style="width:66%;height:66%;margin-left:18%;margin-top:40%;"/></label>
							<label style="margin-top:10%;">添加图片</label>
							<input id="file" name="file"  accept="image/*" type="file"/>
							</span>
						</div>

					</div>

				</section>
				<div class="flow-consignee-list j-get-consignee-one select-three">
				<section class="flow-checkout-adr m-top08" style="background-color:#F2F2F2">

					<div class="flow-set-adr of-hidden padding-all " style="background-color:#F2F2F2">
						<div class="ect-select fl">
							<label class="dis-box " >
								 <input id="PICTURE_ID" name="PICTURE_ID" value=""  type="hidden"/>
						         <input id="number" name="number"  value="0"  type="hidden"/>
						         <input id="GOODS_ID" name="GOODS_ID"  value="6"  type="hidden"/>
						         <input id="CART_ID" name="CART_ID"  value="${pd.CART_ID}"  type="hidden"/>
								<img class="user_icon" src="static/lshapp/images/center/Select5-hdpi.png" id="nimingQ" onclick="niming()">
								<img class="user_icon" src="static/lshapp/images/center/Unchecked5-hdpi.png" id="nimingNoQ" style="display:none" onclick="nimingNo()">
								<span class="t-first margin-lr" style="color:#EA4D46;">
									匿名
								</span>
							</label>
						</div>
						<div class="fr" style="font-size:1.5rem;color:#DCDCDC;left:0.9rem;">
	                        你的评论能帮助其他小伙伴哦
                        </div>

					</div>
				</section>
				</div>
        </section>

        </div>
		<div class="submint" onclick="save()">发 表 评 论</div>
	</form>
    </div>

    <!--快捷导航-->
    <script src="static/lshapp/js/center/ajaxfileupload.js"></script>

    <script>
   		 $("body").delegate('#file', 'change', function(){
   			upPhoto();
   		 });
    	/* $("#file").change(function(){
    		  var str=$(this).val();
    		  d_messages(str);
    		upPhoto();
		}); */
    	function upPhoto(){
    	    var url = "<%=basePath%>lshapp/uploading/pictures/saveForUrl.do?token=1";//这里填请求的地址
    	    $('.wwww').show() //显示加载时候的提示
    	    $.ajaxFileUpload({
    	        url : url,
    	        type : 'POST',
    	        fileElementId : 'file',  //这里对应html中上传file的id
    	        contentType:"application/json;charset=UTF-8",

    	        success: function(data){
    	        	$('.wwww').hide() //请求成功,隐藏加载提示
    	            var str = $(data).find("body").text();//获取返回的字符串
    	            var json = $.parseJSON(str);//把字符串转化为json对象
    	           if(json.result=='ok'){
    	            	var nummm= $("#number").val();
    	        		$("#number").val(parseInt(nummm)+1);
    	            	var num= $("#number").val();
    	            	if(parseInt(num)<=2 ){
    	            	}else{
    	            		var hi=parseInt(parseInt(num)/3+1)*11+"rem" ;
    	            		 $("#commentP").height( hi);
    	            	}
    	            	var p_idd= $("#PICTURE_ID").val();
    	            	$("#PICTURE_ID").val(json.PICTURES_ID+","+p_idd);
    	            	var p=json.PATH;
    	            	var path="<%=basePath%>"+"uploadFiles/uploadImgs/"+p;
    	                //d_messages("上传成功"+json.PICTURES_ID);
    	                //修改用户图片编号
    	            	var div=document.getElementById("uploadPicture");
    	        		var ndiv=document.createElement("div");
    	        		ndiv.id = json.PICTURES_ID;
    	        	//	ndiv.name='PICTURE_ID';
    	        		ndiv.className = 'uploading';
    	        		ndiv.style.margin =  '0.5rem';
    	        		ndiv.style.float =  'left';
    	        		//替换原来的file
    	        		var html = "";
    	        		var idd="'"+json.PICTURES_ID+"'";
    	        		html += '<input id="PICTURESS_ID" name="PICTURESS_ID" type="hidden" value="';
    	        		html+=json.PICTURES_ID;
    	        		html+='"/>';
    	        		html += '<img src="';
    	        		html+=path;
    	        		html+='" style="height:10rem;width:10rem;"';
    	        		html+='onclick="qu(';
    	        		html+=idd;
    	        		html+=')" />';
    	        		ndiv.innerHTML=html;
    	        		if(div.nextSibling){
    	        		div.parentNode.insertBefore(ndiv,div.nextSibling);
    	        		}else{
    	        		div.parentNode.appendChild(ndiv);
    	        		}

    	            }
    	            else{
    	                d_messages("上传失败");
    	            }
    	        },
    	        error: function(){
    	            d_messages("请链接网络");
    	        }
    	    })
    	}
    	function qu(obj){
    		document.getElementById("ceshi1").style.display="block";
    		document.getElementById("ceshi").style.display="block";
    		$("#shanchu").val(obj);


    		/* layer.open({
                content: '删除该图片吗？',
                btn: ['确定', '取消'],
                shadeClose: false,
                yes: function () {
                	var box = document.getElementById(obj);
       			 	var number= $("#number").val();
       			 	var numm=parseInt(number)-1;
       			 	$("#number").val(parseInt(number)-1);
       			 	if(parseInt(number/3)==parseInt(numm/3)){

       			 	}else{
	       				 var hi=parseInt(parseInt(numm)/3+1)*11+"rem" ;
	               		 $("#commentP").height( hi);
       			 	}
       				box.parentNode.removeChild(box);
                },
                no: function () {
                }
            }); */
			//setTimeout(insertEle,"1000");
    	}
    	function fou(){
    		document.getElementById("ceshi1").style.display="none";
    		document.getElementById("ceshi").style.display="none";
    	}
    	function shi(){
    		document.getElementById("ceshi1").style.display="none";
    		document.getElementById("ceshi").style.display="none";
    		document.getElementById("ceshi1").style.display="none";
    		document.getElementById("ceshi").style.display="none";
    		var box = document.getElementById($("#shanchu").val());
		 	var number= $("#number").val();
		 	var numm=parseInt(number)-1;
		 	$("#number").val(parseInt(number)-1);
		 	if(parseInt(number/3)==parseInt(numm/3)){

		 	}else{
				 var hi=parseInt(parseInt(numm)/3+1)*11+"rem" ;
       		 $("#commentP").height( hi);
		 	}
			box.parentNode.removeChild(box);
    	}


    	function save(){
    		if($("#CONTENT").val()==""&&$("#PICTURE_ID").val()==""){
    				d_messages("评论内容和评论图片不能同时为空!");
    				return false;
    		}else{
    			var str = '';
    			for(var i=0;i < document.getElementsByName('PICTURESS_ID').length;i++){
    				if(str=='')str += document.getElementsByName('PICTURESS_ID')[i].value;
    				else str += ',' + document.getElementsByName('PICTURESS_ID')[i].value;
    			}
    			$("#PICTURE_ID").val(str);
    			$("#Form").submit();
			}
    	}


	</script>
	<div class="wwww">正在上传... </div>
    <div class="common-show"></div>
    <div class="mui-popup mui-popup-in" style="display: none;" id="ceshi1">
    	<div class="mui-popup-inner">
    		<!-- <div class="mui-popup-title">Hello MUI</div> -->
    		<div class="mui-popup-text">删除该图片，确认？</div>
    		<input type="hidden" id="shanchu" name="shanchu"/>
    	</div>
    	<div class="mui-popup-buttons">
    		<span class="mui-popup-button" onclick="fou()">否</span>
    		<span class="mui-popup-button mui-popup-button-bold" onclick="shi()">是</span>
    	</div>
    </div>
    <div class="mui-popup-backdrop mui-active" style="display: none;" id="ceshi"></div>
    <script type="text/javascript">

    </script>

</body></html>