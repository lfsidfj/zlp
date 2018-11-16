<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="static/lshapp/mui/js/mui.min.js"></script>
<c:forEach items="${goodsList}" var="var" varStatus="vs">
	<li class="mui-table-view-cell">
		<div style="padding: 15px;background-color: white;margin-top: 10px;">
			<div class="goodsXQ">
				<img style="width: 20vw;height: 20vw;border: 1px solid #DCDCDC;float: left;" myvalue="${var.GOODS_ID}"  alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">

			</div>
			<div style="width: 67vw;height: 20vw;float: left;margin-left: 10px;">
				<div style="height: 12vw;" class="goodsNM">
													<div myvalue="${var.GOODS_ID}">${var.GOODS_NAME}</div>
												</div>
				<div style="height: 4vw;color: #989898;">${var.FAVORITE_NUMBER}人收藏</div>
				<div style="height: 4vw;" class="deleteGoods">
					<div style="float: left;color: red;">￥${var.CURRENT_PRICE}</div>
					<img alt=""  style="width: 15px;height: 15px;float: right;"  myvalue="${var.COLLECTION_ID}"  src="static/lshapp/images/center/delete1-hdpi.png">
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</li>
</c:forEach>


<c:forEach items="${articleList}" var="var" varStatus="vs">
									<li class="mui-table-view-cell">
										<div style="padding: 15px;background-color: white;margin-top: 10px;">
											<div style="margin-bottom: 10px;">
												<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${var.USER_PATH}" style="float: left;width: 45px;height: 45px;border-radius:100px; ">
												<div style="float: left;margin-left: 15px;">
													${var.NICK_NAME}&nbsp;&nbsp;<img style="width: 15px;height: 15px;vertical-align: middle;" alt="" src="
														<c:if test="${var.SEX=='1'}">static/lshapp/images/Girl_student-hdpi.png</c:if>
														<c:if test="${var.SEX=='2'}">static/lshapp/images/Schoolboy-hdpi.png</c:if>
													"><br/><font style="color: #989898;">${var.CREATE_DATE}</font>
												</div>
												<div style="clear: both;"></div>
											</div>
											<div style="font-size: 16px;" class="conntent"  >
												<div myvalue="${var.ARTICLE_ID}">${var.CONTENT}</div>
											</div>
											<div style="margin-top: 15px;">
												<div style="float: left;margin-left: 15px;">
													<img style="width: 15px;height: 15px;vertical-align: middle;" alt="" src="static/lshapp/images/browse-hdpi.png">
													<font style="color: #989898;">${var.VISITOR_VOLUME}</font>
												</div>
												<%-- <div style="float: right;margin-left: 15px;" class="deleteGoodsNew"  >
													<img style="width: 15px;height: 15px;vertical-align: middle;" myvalue="${var.COLLECTION_ID}" alt="" src="static/lshapp/images/center/delete1-hdpi.png">
													<font style="color: #989898;">${var.VISITOR_VOLUME}</font>
												</div> --%>
												<div style="float: right;margin-left: 15px;" class="articleXQN"  >
													<img style="width: 15px;height: 15px;vertical-align: middle;" myvalue="${var.COLLECTION_ID}" alt="" src="static/lshapp/images/center/delete1-hdpi.png">
													<font style="color: #989898;"></font>
												</div>
												<div style="float: right;margin-left: 15px;" class="articleXQ"  >
													<img style="width: 15px;height: 15px;vertical-align: middle;" myvalue="${var.ARTICLE_ID}" alt="" src="static/lshapp/images/comment-xhdpi.png">
													<font style="color: #989898;">${var.COMMENT_COUNT}</font>
												</div>

												<div style="float: right;margin-left: 15px;" class="dianza"   >
													<!-- <img style="width: 15px;height: 15px;vertical-align: middle;" alt="" src="http://img-cdn-qiniu.dcloud.net.cn/code-m.png">
													 --><img id="img${var.ARTICLE_ID}" myvalue="${var.ARTICLE_ID}" style="width: 15px;height: 15px;vertical-align: middle;" src="
													 <c:if test="${var.A_ID != null }">static/lshapp/images/A_little_praise1.png</c:if>
													 <c:if test="${var.A_ID == null }">static/lshapp/images/No_praise1.png</c:if>">
													<font style="color: #989898;" id="font${var.ARTICLE_ID}">${var.PRAISE_VOLUME}</font>
												</div>

												<div style="clear: both;"></div>
											</div>
										</div>
									</li>
									</c:forEach>
<div id="scriptNew">
			<script type="text/javascript">
			mui(".goodsXQ").on("tap","img",function(){
				var Id = $(this).attr("myvalue");
	 			window.location.replace("<%=basePath%>lshapp/shop/goods.do?GOODS_ID="+Id);
			});
			mui(".goodsNM").on("tap","div",function(){
				var Id = $(this).attr("myvalue");
	 			window.location.replace("<%=basePath%>lshapp/shop/goods.do?GOODS_ID="+Id);
			});
			mui(".deleteGoods").on("tap","img",function(){
				var Id = $(this).attr("myvalue");
				var btnArray = ['否', '是'];
				mui.confirm('删除收藏商品，确认？', '', btnArray, function(e) {
	                if (e.index == 1) {
	                	$.ajax({
	        				type: "POST",
	        				url: '<%=basePath%>lshapp/userCenter/delete_favorite.do',
	        		    	data: {COLLECTION_ID:Id,"COLLECTION_TYPE":0},
	        				//cache: false,
	        				success: function(data){
	        					$("#goodsList").html(data);
	        				}
	        			});
	                } else {

	                }
	            })

			});
		mui(".articleXQ").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
			window.location.href='<%=basePath%>lshapp/article/articleDetail.do?ARTICLE_ID='+Id;
		});
		mui(".articleXQN").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
			var btnArray = ['否', '是'];
			 mui.confirm('删除收藏的帖子，确认？', '', btnArray, function(e) {
                 if (e.index == 1) {
                	 $.ajax({
         				type: "POST",
         				url: '<%=basePath%>lshapp/userCenter/delete_favorite.do',
         		    	data: {COLLECTION_ID:Id,"COLLECTION_TYPE":1},
         				//cache: false,
         				success: function(data){
         					$("#artList").html(data);
         				}
         			});
                 } else {

                 }
             })
		});
		mui(".conntent").on("tap","div",function(){
			var Id = $(this).attr("myvalue");
			window.location.href='<%=basePath%>lshapp/article/articleDetail.do?ARTICLE_ID='+Id;
		});
		mui(".dianza").on("tap","img",function(){
			var Id = $(this).attr("myvalue");
 			$.ajax({
				type: "POST",
				url: '<%=basePath%>lshapp/article/articlePraise.do?',
		    	data: {ARTICLE_ID:Id},
				dataType:'json',
				//cache: false,
				success: function(data){
					$("#img"+Id).attr("src","static/lshapp/images/A_little_praise1.png");
					//$(th).find("img").attr("src","static/lshapp/images/A_little_praise1.png");
					//$(th).find("span").text(" "+data);
					$("#font"+Id).text(" "+data);
				}
			});
		});
		</script>
		</div>