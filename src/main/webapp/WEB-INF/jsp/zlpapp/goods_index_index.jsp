<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
		<form name="ECS_FORMBUY" id="ECS_FORMBUY" method="post">
			
				<div
					class="goods-photo j-show-goods-img goods-banner j-goods-box swiper-container-horizontal swiper-container-android">
					<span class="goods-num" id="goods-num"><span
						id="g-active-num">1</span>/<span id="g-all-num">2</span></span>
					<div class="swiper-wrapper">
						<c:forEach items="${pictureList}" var="var" varStatus="vs">
							<li class="swiper-slide tb-lr-center swiper-slide-active"
								style="width: 400px;"><img
								src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" alt="">
							</li>
						</c:forEach>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>

				<section class="goods-title b-color-f padding-all ">
					<h3>${goods.GOODS_NAME }</h3>

				</section>

				<section class="goods-price padding-all b-color-f">
					<p class="p-price">
						<span class="t-first" id="ECS_SHOPPRICE">¥${goods.CURRENT_PRICE }
							&nbsp;<span
							style="color:gray;font-size: 1.1rem;text-decoration: line-through;">¥${goods.ORIGINAL_PRICE }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销量${goods.SALES_VOLUME }
						</span>
						<!-- <em class="em-promotion"><font id="ECS_DISCOUNT">8.3</font>折</em> -->
					</p>

				</section>
				<section class="b-color-f m-top08 n-goods-box">
					<!--address-start-->
					<div id="editAddressForm">
						<input type="hidden" id="town_id" name="town_region_id" value="">
						<input type="hidden" id="village_id" name="village_region_id" value=""> 
					</div>
					<!--address-end-->
				</section>
				<section
					class="m-top08 b-color-f goods-attr j-goods-attr j-show-div">

					<!--商品属性弹出层star-->
					<div class="mask-filter-div"></div>
					<div class="show-goods-attr j-filter-show-div ts-3 b-color-1">
						<section class="s-g-attr-title b-color-1  product-list-small">
							<div class="product-div" style="overflow: inherit;">
								<div class="product-list-box">
									<img class="product-list-img"
										src="<%=basePath%>uploadFiles/uploadImgs/${goods.PATH}">
								</div>
								<div class="product-text">
									<div class="dis-box position-rel">
										<h5 class="f-04 box-flex onelist-hidden"
											style="margin-right: 2rem;">${goods.GOODS_NAME }</h5>
										<!-- <img style="position: absolute;top: .7rem;right: 0;width: 2.3rem;height: 2.3rem;margin-top: -1.3rem;" src="static/lshapp/images/Close-hdpi.png"/> -->
									</div>
									<div>
										<span class="f-06 t-first" >¥<span id="ECS_GOODS_AMOUNT">${goods.CURRENT_PRICE }</span></span>
									</div>
									<span class="box-flex f-02 col-9">库存:
										<font id="GOODS_INVENTORY" class="goods_attr_num">${goods.GOODS_INVENTORY }</font>
									</span>
								</div>
							</div>
						</section>
						<section
							class="s-g-attr-con swiper-scroll b-color-f padding-all m-top1px swiper-container-vertical swiper-container-free-mode swiper-container-android">
							<div class="swiper-wrapper">
								<div class="swiper-slide swiper-slide-active">
									<h4 class="t-remark">规格</h4>
									<!-- 判断属性是复选还是单选 -->
									<ul class="select-one j-get-one m-top10">
										<!-- pc没属性图片 -->
										<c:forEach items="${skuList}" var="var" varStatus="vs">
											<div class="ect-select dis-flex fl" onclick="skuChange('${var.SKU_ID}','${var.GOODS_PRICE}',${var.GOODS_INVENTORY});" > 
												<c:if test="${not empty skuList}">
													<label id="sku${var.SKU_ID}" class="ts-1" style="padding: .4rem 1.6rem;" for="spec_value_770">${var.SPECVALUE_NAME}</label>
												</c:if>
											</div>
										</c:forEach>
									</ul>
									<input type="hidden" name="spec_list" value="48">


									<h4 class="t-remark">数量</h4>
									<!-- 普通商品可修改数量 -->
									<div class="div-num dis-box m-top08">
										<a class="num-less" onclick="subtract()"></a>  
										<input class="box-flex" type="tel" value="1" onblur="inputPrice()" name="goods_number" id="goods_number">
										<a class="num-plus" onclick="add()"></a>
									</div>
								</div>
							</div>
							<div class="swiper-scrollbar"></div>
						</section>
						<section class="ect-button-more dis-box">
							<input type="hidden" value="6" id="province_id"
								name="province_region_id"> <input type="hidden"
								value="77" id="city_id" name="city_region_id"> <input
								type="hidden" value="0" id="district_id"
								name="district_region_id"> <input type="hidden"
								value="3" id="region_id" name="region_id"> <input
								type="hidden" value="574" id="goods_id" name="good_id">
							<input type="hidden" value="0" id="user_id" name="user_id">
							<input type="hidden" value="689" id="area_id" name="area_id">
							<a class="btn-disab box-flex quehuo" href="javascript:;"
								style="display:none">暂时缺货</a> 
								<div class="btn-cart box-flex add-to-cart" onclick="goShoppingCart('${pd.GOODS_ID}');">立即购买</div>
							<div class="btn-submit box-flex add-to-cart" 
								onclick="addGoods('${pd.GOODS_ID}')">确认</div>
						</section>
					</div>
					<!--商品属性弹出层end-->
				</section>
				<section
					class="m-top1px padding-all b-color-f goods-service j-show-div">
					<div class="dis-box">
						<label class="t-remark g-t-temark">服务</label>
						<div class="box-flex">
							<div class="dis-box">
								<p class="box-flex t-goods1">由礼尚汇发货并提供售后服务。</p>
								<!-- <i class="iconfont icon-102 goods-min-icon"></i> -->
								<!--服务信息star-->
							<div class="show-goods-service j-filter-show-div ts-3 b-color-1">
                                <section class="goods-show-title of-hidden padding-all b-color-f">
                                    <h3 class="fl g-c-title-h3">服务说明</h3>
                                   <!-- <img class="close_image" style="" src="static/lshapp/images/Close-hdpi.png" onclick="closeService();"/> -->
                                </section>
                                <section class="goods-show-con goods-big-service swiper-scroll swiper-container-vertical swiper-container-free-mode swiper-container-android">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide swiper-slide-active">
                                            <ul>

                                                                                                <li class="m-top1px b-color-f padding-all of-hidden">
                                                    <p class="dis-box t-remark3">
                                                        <em >
                                                       		<img class="remark" style="margin-top: 0.2rem;" src="static/lshapp/images/quality_assurance.png">
                                                        </em>
                                                        <span class="box-flex">正品保证</span>
                                                    </p>
                                                </li>
                                                <li class="m-top1px b-color-f padding-all of-hidden">
                                                    <p class="dis-box t-remark3">
                                                        <em >
                                                        <img class="remark" style="margin-top: 0.2rem;" src="static/lshapp/images/flash_delivery.png">
                                                        </em>
                                                        <span class="box-flex">闪速配送</span>
                                                    </p>
                                                </li>
                                                   

                                            </ul>

                                        </div>
                                    </div>

                                </section>
                           </div>

								<!--服务信息end-->
							</div>
							<div class="dis-box m-top08 g-r-rule">
								<p class="box-flex t-remark3">
									<em class="fl">
									<img class="customer" style="margin-top: 0.2rem;" src="static/lshapp/images/quality_assurance.png">
									</em>
									<span class="fl">正品保证</span>
								</p>
								<p class="box-flex t-remark3">
									<em class="fl"><img class="customer" style="margin-top: 0.2rem;" src="static/lshapp/images/flash_delivery.png"></em>
									<span class="fl">闪速配送</span>
								</p>
							</div>
						</div>
					</div>
				</section>


				<section class="m-top08 goods-evaluation">
					<a
						href="file:///C:/Users/Administrator/Desktop/%E5%BE%AE%E5%95%86%E5%9F%8E/%E5%BE%AE%E5%95%86%E5%9F%8E/good_comment.htm">
						<div class="dis-box padding-all b-color-f  g-evaluation-title">
							<label class="t-remark g-t-temark">用户评价</label>
							<div class="box-flex t-goods1">
							</div>
							<div class="t-goods1">
								<em class="t-first">0</em><span class="t-jiantou">条评论
								<img class="right_arrow" src="static/lshapp/images/right_arrow.png" /></span>
							</div>
						</div>
					</a>
				</section>
				<section class="m-top08  goods-shop b-color-f no-shopping-title">
					<div class="goods-shop-pic of-hidden ">
						<h4 class="title-hrbg m-top06">
							<span>关联商品</span>
							<hr>
						</h4>
						<div
							class="g-s-p-con product-one-list of-hidden scrollbar-none j-g-s-p-con padding-all swiper-container-horizontal swiper-container-android">
							<div class="swiper-wrapper ">
								<c:forEach items="${relationList}" var="var" varStatus="vs">
									<li class="swiper-slide swiper-slide-active">
										<div class="product-div" onclick="goGoods('${var.GOODS_ID}');">
											<div>
												<img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">
											</div>
											<div class="product-text m-top06 index-product-text">
												<h4>${var.GOODS_NAME}</h4>
												<p>
													<span class="p-price t-first "> ¥${var.ORIGINAL_PRICE} </span>
												</p>
											</div>
										</div>
									</li>
								</c:forEach>
							</div>
						</div>
					</div>
					<div
						class="ect-button-more n-ect-button-more m-top10 dis-box padding-all">
						<div class="box-flex btn-default-new br-5 min-btn" >
						<img class="customer" src="static/lshapp/images/customer_service.png" /><span style="color:#000;">联系客服</span></div>
					</div>
				</section>
			
			<!--悬浮btn star-->
			<section class="filter-btn dis-box">
				<input type="hidden" name="is_collection" id="is_collection" value="${goods.is_collection}"/>
				<!--飞入购物车位置s-->
				<span class="quick_links" id="shopCart"></span>
				<!--飞入购物车位置e-->
				<div class="filter-btn-kefu heart" >
				<i class="kefu" style="background-size: 1.8rem 1.8rem;"></i><em>客服</em></div>
				<div
					class="filter-btn-flow  heart j-heart " onclick="collect('${pd.GOODS_ID}');"
					id="ECS_COLLECT"> 
					
					<img id="img_collection" class="collection" 
						<c:if test="${goods.is_collection =='1' }">src="static/lshapp/images/already_collected.png"</c:if>
						<c:if test="${goods.is_collection =='0' }">src="static/lshapp/images/not_collection.png"</c:if>
					 />
					<em>收藏</em>
				</div> 
				<div class="filter-btn-flow heart">
					<i class="flow" style="background-size: 1.8rem 1.8rem;"></i>
					<em>购物车</em>
				</div> 
				<div
					class="btn-submit box-flex add-to-cart " 
					onclick="checkAdd();">加入购物车</div>
				<!--<a class="btn-submit box-flex click-show-attr add-to-cart" href="javascript:;" >立即购买</a>-->
			</section>

		</form>