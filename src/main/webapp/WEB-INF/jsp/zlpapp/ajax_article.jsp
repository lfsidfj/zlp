<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:forEach items="${varList}" var="var" varStatus="vs">
	<li class="card facebook-card" >
<div >
                                 <div class="card-header no-border">

                                     <div class="facebook-avatar"><img src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" width="44" height="44"></div>
           <div class="facebook-name">${var.CREATE_USER }</div>
           <div class="facebook-date" style="font-size:12px">${var.CREATE_DATE }</div>
       </div>
       <%-- <div style="height: 25px;width: 100%;text-align: center;font-size:16px;font-weight:bold">${var.TITLE }</div> --%>
       <div class="text-c" style="text-align:left; font-size:14px;" onclick="goArticleDetail(${var.ARTICLE_ID})">${var.CONTENT }</div>
       <%-- <div class="card-content">
       	<c:forEach items="${var.articlePathList}" var="var1" varStatus="vs">
       	<img class="img-c" src="<%=basePath%>uploadFiles/uploadImgs/${var1.ARTICLE_PATH}">
           </c:forEach>
      	</div> --%>
      	<section style="margin-bottom: 0px" class="product-list j-product-list product-list-medium new-flow-bottom">
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
                        <div  style="background-color:#fff;height:40px;width:100%;">
            <div style="font-size:16px;height: 40px;float: right" onclick="goArticleDetail(${var.ARTICLE_ID})">
         	
         	<img  style="height: 20px;width: 24px;display: inline" src="static/lshapp/images/comment-xhdpi.png"> ${var.COMMENT_COUNT }
         	
        	</div>
        	
        	  <div style="font-size:16px;height: 40px;float: right;margin-right: 10px;">
         	<img   style="height: 20px;width: 20px;display: inline"
          	<c:if test="${var.COLLID == 1 }">src='static/lshapp/images/Already_collected.png' name='1' </c:if><c:if test="${var.COLLID == 0 }">src='static/lshapp/images/Not_collection.png' name='0'</c:if> onclick="articleCollection('${var.ARTICLE_ID}',this)"><span > ${var.COLLECTION_VOLUME}</span>
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
         <input type="hidden" value="${totalPage }" class="totalPage">
</c:forEach>