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
    <link rel="stylesheet" href="static/lshapp/css/new_file.css" type="text/css"/>
   
    <script src="static/lshapp/js/goods_type.js"></script>
    <script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
    <script src="static/lshapp/js/jquery.form.js"></script>
    
   
<title>发帖</title>
		

	
    <style>
    	.layermbox{position:absolute;left:0;top:0;width:100%;z-index:19891014}
    	.layermmain,.laymshade{position:fixed;left:0;top:0;width:100%;height:100%}
    	.layermbtn span,.layermchild{display:inline-block;position:relative}
    	.laymshade{background-color:rgba(0,0,0,.5);pointer-events:auto}
    	.layermmain{display:table;font-family:Helvetica,arial,sans-serif;pointer-events:none}
    	.layermmain .section{display:table-cell;vertical-align:middle;text-align:center}
    	.layermcont{padding:20px 15px;line-height:22px;border-radius:5px}
    	
    	
    
    
    
    
    
        * {
            margin: 0;
            padding: 0;
        }
        /*图片上传*/
       
        
        .container {
            width: 97%;
            height: 80%;
            overflow: auto;
            clear: both;
        }
        
        .z_photo {
            width: 90%;
            height: 8rem;
            padding: 0.3rem;
            overflow: auto;
            clear: both;
            margin: 1rem auto;
            border: 1px solid #555;
        }
        
        .z_photo img {
            width: 3.7rem;
            height: 3.5rem;
        }
        
        .z_addImg {
            float: left;
            margin-right: 0.3rem;
        }
        
        .z_file {
            width: 3.5rem;
            height: 3.5rem;
            background: url(static/lshapp/images/z_add.png) no-repeat;
            background-size: 100% 100%;
            float: left;
            margin-right: 0.2rem;
        }
        
        .z_file input::-webkit-file-upload-button {
            width: 4rem;
            height: 4rem;
            border: none;
            position: absolute;
            outline: 0;
            opacity: 0;
        }
        
        .z_file input#file {
            display: block;
            width: auto;
            border: 0;
            vertical-align: middle;
        }
        /*遮罩层*/
        
        .z_mask {
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .5);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
           display: none;
        }
        
        .z_alert {
            width: 200px;
            height: 150px;
            border-radius: .3rem;
            background: #fff;
            font-size: 14px;
            text-align: center;
            position: absolute;
            left: 31%;
            top: 50%;
            margin-left: -1.5rem;
            margin-top: -2rem;
        }
        
        .z_alert p:nth-child(1) {
            line-height: 4rem;
        }
        
        .z_alert p:nth-child(2) span {
            display: inline-block;
            width: 49%;
           
            float: left;
            
        }
        
        .z_cancel {
   			 width: 67px;
            border-radius:10px;
             background: #eeeeee;
             float: left;
        }
        
       .z_sure{
       	 width:20px;
            border-radius:10px;
            background: #ec4c44;
          float: right;
       }
		
		.input{
			width: 80%;
			height: 20px;
			font-family: "Microsoft Yahei", "Calibri";
			border: 0;
			float: left;
			text-indent: 5px;
			font-size: 16px;
		}
		   
    .btndl input{ 
     	 width: 88%; 
	     height: 42px; 
	     color: #fff; 
	     border: 0; 
	     font-family: "Microsoft Yahei", "Calibri"; 
	     cursor: pointer; 
	     font-size: 16px; 
	     background: #ec5151; 
	     border-radius: 5px; 
	     margin-left: 6%;
	 }
	 
	 .zmask {
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .5);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
           display: none;
        }
        .zalert {
            width: 80px;
            height: 50px;
            font-size: 16px;
            text-align: center;
            position: absolute;
            left:40%;
            top: 50%;
            margin-top: -5rem;
        }
</style>
</head>
	
<body>
	 
	<form action="<%=basePath%>lshapp/article/save.do" name="Form" id="Form" method="post">
	<div class="contaniner fixed-cont">
			<!--1-->
		<section class="assess">
			<p>
			 <input type="text" placeholder="标题" class="input" id="TITLE" name="TITLE" >
			</p>
			<hr style="height:1px;border:none;border-top:1.5px solid #f5f5f5; width:90%;margin-left: 5%"></hr>
			<p>
				<textarea id="CONTENT" name="CONTENT" rows="5" placeholder="请输入内容（大于20字！）" style="font-size: 16px;text-indent: 5px;"></textarea>
			</p>
			
		</section>
			<!--2-->
		<section class="main">
		<div class="main-wrap">
			<div class="container">
			       <!--    照片添加    -->
			      <div class="z_photo" style="border: none;">
			          <div class="z_file">
			              <input type="file" name="file" id="file" value="" accept="image/*" onchange="imgChange('z_photo','z_file');" />
			          	  <input id="PICTURE_ID" name="PICTURE_ID" value=""  type="hidden"/>
			          </div>
			      </div>
			<div class="btndl"  onclick="save()"><input type="button" value="发布" style="margin-bottom: 30px;-webkit-appearance: none"></div>
			      <!--遮罩层-->
			      <div class="z_mask">
			          <!--弹出框-->
			          <div class="z_alert">
			              <p>确定要删除这张图片吗？</p>
			              <p>
			                  <span class="z_cancel" style="width: 65px;margin-left: 20px;">取消</span>
			                  <span class="z_sure"style="width: 65px;float: right;margin-right: 20px;">确定</span>
			              </p>
			          </div>
			      </div>
			      
			      <div class="zmask">
			          <!--弹出框-->
			          <div class="zalert">
			              <p ><img src="static/lshapp/images/jiazais.gif"/></p>	
			              <p style="color: white;padding-top: 5px;" id="wenzi">图片加载中</p>			  		          
			          </div>
			      </div>
			      
			      
			  </div>
			</div>
		</section>
	</div>
</form>
		
       <!--底部  end-->
        <script src="static/lshapp/js/center/ajaxfileupload.js"></script>
        
        
        
        
		<script type="text/javascript">
		function save(){
    		if($("#TITLE").val()==""){
    			d_messages("标题不能为空!");
    				return false;
    		}
    		if($.trim($("#CONTENT").val()).length < 20){
    			d_messages("请输入20字 以上");
				return false;
    		};

    		if($("#CONTENT").val()==""){
    			d_messages("内容不能为空!");
				return false;
			}
   			$("#Form").submit();
   			$("#wenzi").html("正在发布...");
   		  	$(".zmask").css("display","block") ;
    	}
		
		
		
        //px转换为rem
           function imgChange(obj1){
   			upPhoto(obj1);
   		 };
    	/* $("#file").change(function(){
    		  var str=$(this).val();
    		  alert(str);
    		upPhoto();
		}); */
    	function upPhoto(obj1){
			$(".zmask").css("display","block") ;
    	    var url = "<%=basePath%>lshapp/uploading/pictures/saveForUrl.do";//这里填请求的地址
    	    $.ajaxFileUpload({
    	        url : url,
    	        type : 'POST',
    	        fileElementId : 'file',  //这里对应html中上传file的id
    	        contentType:"application/json;charset=UTF-8",
    	        success: function(data){
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
    	            	
    	            	 //获取点击的文本框
    	               // var file = document.getElementById("file");
    	                //存放图片的父级元素
    	                var imgContainer = document.getElementsByClassName(obj1)[0];
    	                //获取的图片文件
    	                //var fileList = file.files;
    	                //文本框的父级元素
    	                
    	               // var imgArr = [];
    	                //遍历获取到得图片文件
    	                //for (var i = 0; i < fileList.length; i++) {
    	                    //var imgUrl = window.URL.createObjectURL(file.files[i]);
    	                   // imgArr.push(imgUrl);
    	                    var img = document.createElement("img");
    	                    img.setAttribute("src", path);
    	                    var imgAdd = document.createElement("div");
    	                    imgAdd.setAttribute("class", "z_addImg");
    	                    imgAdd.appendChild(img);
    	                    imgContainer.appendChild(imgAdd);
    	                    imgRemove();
    	                    $(".zmask").css("display","none") ;
    	                    $("#file").val("");
    	               // };
    	                //alert("上传成功"+json.PICTURES_ID);
    	                //修改用户图片编号
    	            	//var div=document.getElementById("uploadPicture");
    	        		//var ndiv=document.createElement("div");
    	        		//ndiv.id = json.PICTURES_ID;
    	        	//	ndiv.name='PICTURE_ID';
    	        		//ndiv.className = 'uploading';
    	        		//ndiv.style.margin =  '0.5rem';
    	        		//ndiv.style.float =  'left';
    	        		//替换原来的file
    	        		/* var html1="";
    	        		html1+='<span class="span-file"> <label><img src="static/lshapp/images/center/Photo release review-hdpi.png"   style="width:66%;height:66%;margin-left:18%;margin-top:40%;"/></label>';
    	        		html1+='<label style="margin-top:10%;">添加图片</label> <input id="file" name="file"  accept="image/*" type="file"/> </span>';
    	        		//$('#uploadPicture').replaceWith(html1);
    	        		$('#uploadPicture').html(html1);

    	        		 <input id="PICTURE_ID" name="PICTURE_ID" value=""  type="hidden"/>
    	        		*/
    	        		/* var html = "";
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
    	        		} */

    	            }
    	            else{
    	                alert("上传失败");
    	            }
    	        },
    	        error: function(){
    	            alert("请链接网络");
    	        }
    	    })
    	}  
        
        /*   function imgChange(obj1, obj2) {
            //获取点击的文本框
            var file = document.getElementById("file");

            //存放图片的父级元素
            var imgContainer = document.getElementsByClassName(obj1)[0];
            //获取的图片文件
           
            var fileList = file.files;
          
            //文本框的父级元素
            var input = document.getElementsByClassName(obj2)[0];
            var imgArr = [];
            //遍历获取到得图片文件
            for (var i = 0; i < fileList.length; i++) {
                var imgUrl = window.URL.createObjectURL(file.files[i]);
               
                imgArr.push(imgUrl);
                var img = document.createElement("img");
                img.setAttribute("src", imgArr[i]);
                var imgAdd = document.createElement("div");
                imgAdd.setAttribute("class", "z_addImg");
                imgAdd.appendChild(img);
                imgContainer.appendChild(imgAdd);
               
            };
            imgRemove();
        };  
 */
        function imgRemove() {
            var imgList = document.getElementsByClassName("z_addImg");
            var mask = document.getElementsByClassName("z_mask")[0];
            var cancel = document.getElementsByClassName("z_cancel")[0];
            var sure = document.getElementsByClassName("z_sure")[0];
            for (var j = 0; j < imgList.length; j++) {
                imgList[j].index = j;
                imgList[j].onclick = function() {
                    var t = this;
                    mask.style.display = "block";
                    cancel.onclick = function() {
                        mask.style.display = "none";
                    };
                    sure.onclick = function() {
                        mask.style.display = "none";
                        t.style.display = "none";
                    };

                }
            };
        };

    </script>
    <script type="text/javascript">
    $(function(){	
		var options = { 
			type: 'POST',
	        success:showResponse, 
			error : function(xhr, status, err) {			
				alert("操作失败");
			}
	    }; 
	    $("#Form").submit(function(){
	        $(this).ajaxSubmit(options); 
	        return false;   //防止表单自动提交
	    });
	});
    /**
     * 保存操作
     */
    function toSave(){ 
    	$("#Form").submit();
    }
     
    /**
     * 保存后，执行回调
     * @param responseText
     * @param statusText
     * @param xhr
     * @param $form
     */
    function showResponse(responseText, statusText, xhr, $form){ 	
    	/* if(responseText.status == "0"){
    	} else {
    	}	 */
    	openPage();
    	$(".zmask").css("display","none") ;
    }
    function openPage() {
        var data='{"index":"3","refresh":"1"}';
        window.WebViewJavascriptBridge.callHandler(
            'openPage'
            ,data
            , function(responseData) {
            }
        );
    }
    </script>
	</body>

</html>