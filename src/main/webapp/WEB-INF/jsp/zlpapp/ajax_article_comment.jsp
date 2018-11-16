<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:forEach items="${commentList}" var="var" varStatus="vs">
<ul class="padding-all b-color-f my-com-max-box">
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
          <input type="hidden" value="${totalPage }" class="totalPage">
</c:forEach>