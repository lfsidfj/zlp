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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="description" content="">
<meta name="keywords" content="">
<title>购物车</title>
<base href="<%=basePath%>">
<link href="static/lshapp/css/goods_type.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	var ROOT_URL = '/mobile/';
</script>
<script src="static/lshapp/js/goods_type.js"></script>
<style type="text/css">
.navigat_image{
	width:1.8rem;
	height:1.8rem;
	margin-top: -0.3rem;
}
</style>
</head>
<body>
	<p style="text-align:right; display:none;"></p>
	<div id="loading" style="display: none;">
		<img src="%E8%B4%AD%E7%89%A9%E8%BD%A6_files/loading.gif">
	</div>

	<div class="con">
		<c:if test="${not empty cartList}">
		<div class="flow-cart blur-div">
			<!--  -->
			<!-- 按店铺显示商品  start-->
			<!--  -->
			<section class="flow-have-cart select-three j-select-all">
				<!-- num属性用于删除-->
				<section class="j-cart-get-i-more shop0" num="${pd.num }">
					<header class="flow-shop-header padding-all of-hidden dis-box">
						<div class="ect-select box-flex is-shop">
							<label class="dis-box label-this-all"> <i
								class="j-select-btn active-i"></i> <a class="box-flex f-06"
								href="javascript:;"> 
								<i class="iconfont flow-shop-icon"><img class="navigat_image" src="static/lshapp/images/Give_a_gift-Fill.png"/></i> 礼尚汇商城
							</a>
							</label>
						</div>
					</header>

					<div class="product-list-small" style="padding:0">
						<ul>

							<li>
								<c:forEach items="${cartList}" var="var" varStatus="vs">
								<!-- 删除商品后移除此节点 -->
								<div class="dis-box drop${var.CART_ID} com-post-adr">
									<!-- 仅删除用，计算删除后价格 -->
									<input class="total" price="${var.totlePrice }" number="1" type="hidden"> 
									<div class="ect-select">
										<label class="rec-active" goods-id="${var.GOODS_ID}"
											rec-id="${var.CART_ID}"> <i class="j-select-btn active-i"></i>
										</label>
									</div>
									<div class="box-flex">

										<div class="product-div" style="background:none">
											<div class="fl">
												<div class="p-d-img">
														<img class="product-list-img"
														src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">
													</a>
													<!--  -->
												</div>
											</div>
											<div class="product-text index-product-text">
													<h4 class="twolist-hidden f-05">${var.GOODS_NAME }</h4>
												</a>
												<div class="f-02 col-7 onelist-hidden flow-goods-attr" style="height: 1.6rem;">规格:${var.SPEC }
												</div>
												<div class="flow-new-cont">
													<span class="t-first j-item-${var.CART_ID}-price">¥${var.GOODS_CURRENT_PRICE }</span>
													<div class="div-num dis-box">
														<a class="num-up" data-min-num="1"></a> 
														<input class="box-flex cart-number" name="cart_number" readonly="readonly" value="${var.AMOUNT }" id="${var.GOODS_ID}" cart-id="${var.CART_ID }" type="number">
													    <a class="num-next" xiangounum="" data-max-num="999"></a>
													</div>
												</div>
												<i class="iconfont" onclick="DropCart('${var.CART_ID }','0')"><img style="position: absolute;width:2rem;height:2rem;right: -.1rem;bottom:  0.8rem;;" src="static/lshapp/images/delete-hdpi.png"></i>
											</div>
										</div>

									</div>
								</div> 
								</c:forEach>
							</li>
						</ul>
					</div>
				</section>
				<!--  -->
			</section>

		</div>
		</c:if>
		<c:if test="${empty cartList }">
			<div class="flow-cart blur-div" style="margin-top: 28rem;">
		        <!--  -->
		        <section class="flow-no-cart">
		            <p class="t-remark text-center">购物车什么也没有</p>
		            <div class="btn-default-new min-btn br-5" style="color:#555;" onclick="goShopIndex();">去逛逛</div>
				</section>
			</div>
		</c:if>
	</div>
	<c:if test="${not empty cartList }">
	<!--领取优惠券end-->
	<input name="warehouse_id" value="3" id="region_id" type="hidden">
	<input name="area_id" value="30" id="area_id" type="hidden">
	<!--悬浮btn star-->
	<footer class="flow-cart-btn">
		<section class="filter-btn f-cart-filter-btn dis-box n-flow-btn">
			<div class="box-flex select-three j-cart-get-more j-get-more-all pl">
				<div class="ect-select">
					<label class="dis-box label-all"> <i
						class="select-btn active-i"></i> <span class="box-flex">全选</span>
					</label>
				</div>
				<div class="g-cart-filter-price of-hidden" style="margin-top: -1.1rem;">
					<p class="dis-box">
						<em class="dis-block">合计：</em> <span
							class="t-first box-flex onelist-hidden cart-price-show">¥0</span>
						<span class="t-first box-flex onelist-hidden cart-price-hidden"
							style="display:none"></span>
					</p>
				</div>
			</div>
			<div class="g-cart-filter-sb">
				<form id="formid" action="/mobile/index.php?m=flow" class="fl"
					method="post">
					<input name="cart_value" value="" type="hidden"> <input name="store_id" type="hidden"> 
					<a type="button" class="btn-submit fl" onclick="c_value()">结算 
					<span class="cart-number-show f-05"></span></a>
				</form>
			</div>
		</section>
		</footer>
		</c:if>

<script>
	function goShopIndex(){ // 购物车为空时去首页
		var data='{"index":"1"}';
           window.WebViewJavascriptBridge.callHandler(
               'openPage'
               ,data
               , function(responseData) {
               }
           );
	};

    var currency_format = '¥';

    function attrprice(id) {
        var attr = '';
        $("label.ts-1" + id).each(function () {
            if ($(this).hasClass("active")) {
                attr += $(this).attr("attr-id") + ',';
            }
        })
        attr = attr.substr(0, attr.length - 1);
        var number = $("input[name=number" + id + "]").val();
        var warehouse_id = $("input[name=warehouse_id]").val();
        var area_id = $("input[name=area_id]").val();
        $.get('', {
            id: id,
            warehouse_id: warehouse_id,
            area_id: area_id,
            number: number,
            attr: attr
        }, function (data) {
            $(".goods_attr_num" + id).text(data.attr_number);
            $("#ECS_GOODS_AMOUNT" + id).text(data.result);
            if (data.attr_number < 1) {
                $(".add-to-cart" + id).hide();
                $(".quehuo" + id).show();
            } else {
                $(".add-to-cart" + id).show();
                $(".quehuo" + id).hide();
            }
        }, 'json')

    }

   /*  function show(html) {
        $(".mask-filter-div").addClass("show");
        $(".j-show-goods-attr" + html).addClass("show");
    } */

    function c_value() {
        var id = '';
        $("input[name=cart_value]").val('');
        $("label").each(function () {
            if ($(this).hasClass("rec-active")) {
                if ($(this).hasClass("active")) {
                    id += $(this).attr("rec-id") + ',';  
                }
            }
        });
        if (id == '') {
            d_messages('至少选中一个商品', 2);
            return false;
        }
        id = id.substr(0, id.length - 1);
       	window.location.replace("<%=basePath%>lshapp/order/submit.do?ids="+id);
    }
    //加载
/*     var price = 1.0+1;
    var k = 0;
//    $(".total").each(function () {
//        console.log($(this).attr("price"));
//        price += $(this).attr("price") * 1;
//
//    })

    $(".cart-price-show").text(currency_format + price.toFixed(2)); */
    //删除
    function DropCart(id, sid) {
        var shopnum = $(".shop" + sid).attr("num");
        $.ajax({
            type: "post",
            url: '<%=basePath%>lshapp/shop/deleteCart.do',
            data: {
                id: id
            },
            dataType: "json",
            success: function (data) {
                if (data.msg == "ok") {
                    if (shopnum - 1 < 1) {
                        $(".shop" + sid).html("");
                        window.location.href = ROOT_URL + "index.php?m=cart";
                    } else {
                        shopnum = shopnum - 1;
                        $(".shop" + sid).attr("num", shopnum);
                    }
                    $(".drop" + id).html("");
                    var price = 0;
                    var k = 0;
                    $(".total").each(function () {
                        price += $(this).attr("price") * 1;
                    })
                    $(".cart-number").each(function () {
                        k += $(this).val() * 1;
                    })
                    $(".cart-number-show").text('(' + k + ')');
                    $(".cart-price-show").text(currency_format + price.toFixed(2));
                    d_messages('已删除');
                }
            }
        });
    }
    /*-*/
    $(".div-num a").click(function () {
        if (!$(this).parent(".div-num").hasClass("div-num-disabled")) {
            var t = $(this);
			/*减少当前数量*/
            if ($(this).hasClass("num-up")) {
                num = parseInt($(this).siblings("input").val());
                min_num = parseInt($(this).attr("data-min-num"));
                rec = parseInt($(this).siblings("input").attr("cart-id"));
                if (num > min_num) {
                    num -= 1;
                    $(this).siblings("input").val(num);
                    if ($(this).siblings("input").hasClass("active")) {
                        none = 0;
                    } else {
                        none = 1;
                    }
                    var arr = '';
                    $(".rec-active").each(function () {
                        if ($(this).hasClass("active")) {
                            arr += $(this).attr("rec-id") + ',';
                        }
                    })
                    $.ajax({
                        type: "POST",
                        url: "<%=basePath%>lshapp/shop/editCart.do",
                        dataType: "json",
                        data: {
                            id: rec,
                            number: num,
                            arr: arr,
                            none: none
                        },
                        success: function (data) {
                            if (data.none > 0) {
                                return;
                            }
                            if (data.error) {
                                d_messages("加入购物车失败");
                                return;
                            }
                            if(data.is_show_favourable==1) {
                                $('.j-show-favourable').css('display', 'block');
                            }else if(data.is_show_favourable==0) {
                                $('.j-show-favourable').css('display', 'none');
                                if(data.remove_rec_id != ''){
                                    for(var i in data.remove_rec_id){
                                        $('.drop' + data.remove_rec_id[i]).remove();
                                    }
                                }
                            }
                            var number = 0;
                            $(".cart-number").each(function () {
                                if ($(this).hasClass("active")) {
                                    number += $(this).val() * 1;
                                }
                            });
                            if (number > data.max_number) {
                                number = data.max_number;
                            }
                            $(".cart-number-show").html('('+data.cart_number+')');
                            $(".cart-price-show").html(data.content);
                            $(".cart-price-hidden").html(data.content);

                        }
                    });

                } else {
                    d_messages("不能小于最小数量");
                }
                return false;
            }
            /*增加当前数量*/
            if ($(this).hasClass("num-next")) {
                num = parseInt($(this).siblings("input").val());
                max_num = parseInt($(this).attr("data-max-num"));
                max_num = parseInt($(this).attr("data-max-num"));
                xiangounum = parseInt($(this).attr("xiangounum"));
                if (xiangounum) {
                    if (num >= xiangounum) {
                        d_messages('不能超过限购');
                        return;
                    }
                }
                rec = parseInt($(this).siblings("input").attr("cart-id"));
                //限购
                if (num < max_num) {
                    num += 1;
                    $(this).siblings("input").val(num);
                    $(this).siblings("input").val(num);
                    if ($(this).siblings("input").hasClass("active")) {
                        none = 0;
                    } else {
                        none = 1;
                    }
                    var arr = '';
                    $(".rec-active").each(function () {
                        if ($(this).hasClass("active")) {
                            arr += $(this).attr("rec-id") + ',';
                        }
                    })
                    $.ajax({
                        type: "POST",
                       	url: "<%=basePath%>lshapp/shop/editCart.do",
                        dataType: "json",
                        data: {
                            id: rec,
                            number: num,
                            arr: arr,
                            none: none
                        },
                        success: function (data) {
                            if (data.none > 0) {
                                return;
                            }
                            if (data.error) {
                                d_messages(data.msg);
                                t.siblings("input").val(data.num);
                                return;
                            }
                            if(data.is_show_favourable==1) {
                                $('.j-show-favourable').css('display', 'block');
                            }else if(data.is_show_favourable==0) {
                                $('.j-show-favourable').css('display', 'none');
                            }

                            t.attr("data-max-num", data.max_number);
                            var number = 0;
                            $(".cart-number").each(function () {
                                if ($(this).hasClass("active")) {
                                    number += $(this).val() * 1;
                                }
                            });
                            if (number > data.max_number) {
                                number = data.max_number;
                            }
                            $(".cart-number-show").html('('+data.cart_number+')');
                            $(".cart-price-show").html(data.content);
                            $(".cart-price-hidden").html(data.content);
                        }
                    });

                } else {
                    d_messages("不能超过最大数量");
                }
                return false;
            }
        } else {
            d_messages("该商品不能增减");
        }
    });
    $(".div-num a").click(function () {
        if (!$(this).parent(".div-num").hasClass("div-num-disabled")) {
            if ($(this).hasClass("num-less")) {
                num = parseInt($(this).siblings("input").val());
                min_num = parseInt($(this).attr("data-min-num"));
                if (num > min_num) {
                    num -= 1;
                    $(this).siblings("input").val(num);
                } else {
                    d_messages("不能小于最小数量");
                }
                return false;
            }
            if ($(this).hasClass("num-plus")) {
                num = parseInt($(this).siblings("input").val());
                max_num = parseInt($(this).attr("data-max-num"));
                if (num < max_num) {
                    num += 1;
                    $(this).siblings("input").val(num);
                } else {
                    d_messages("不能超过最大数量");
                }
                return false;
            }
        } else {
            d_messages("该商品不能增减");
        }
    });
    $(".div-num input").bind("change", function () {
        num = parseInt($(this).val());
        max_num = parseInt($(this).siblings(".num-plus").attr("data-max-num"));
        min_num = parseInt($(this).siblings(".num-less").attr("data-min-num"));
        if (num > max_num) {
            $(this).val(max_num);
            d_messages("不能超过最大数量");
            return false;
        }
        if (num < min_num) {
            $(this).val(min_num);
            d_messages("不能小于最小数量");
            return false;
        }
    });
    /*多选*/
    $(".j-cart-get-more .ect-select").click(function () {
        if (!$(this).find("label").hasClass("active")) {
            $(this).find("label").addClass("active");
            $("input[name=cart_number]").addClass("active");
            if ($(this).find("label").hasClass("label-all")) {
                $(".j-select-all").find(".ect-select label").addClass("active");
                /*hu*/
                var rec_id = '';
                $(".rec-active").each(function () {
                    var goods_id = $(this).attr("goods-id");
                    if ($(this).hasClass("active")) {

                        if ($(this).attr("rec-id") != undefined && $(this).attr("rec-id") > 0) {
                            rec_id += $(this).attr("rec-id") + ',';
                            $("#" + goods_id + "").addClass("active");
                        }
                    }
                });
                  $.ajax({
                    type: "POST",
                    url: '<%=basePath%>lshapp/shop/cartChick.do',
                    data: {
                        id: rec_id
                    },
                    dataType: "json",
                    success: function (data) {
                   		 if(data.msg =="ok"){
                   		  	$(".cart-number-show").text('(' + data.cart_number + ')');
                      	  	$(".cart-price-show").html(data.content);
                   		 }
                    }
                });
                /*hu*/

            }
        } else {
            $(this).find("label").removeClass("active");
            $("input[name=cart_number]").removeClass("active");
            if ($(this).find("label").hasClass("label-all")) {
                /*hu*/
                $(".cart-price-show").html("￥0.00");
                $(".cart-number-show").text(0);
                /*hu*/
                $(".j-select-all").find(".ect-select label").removeClass("active");
            }
        }
    });
    /*多选只点击单选按钮 - 全选，全不选*/
    $(".j-cart-get-i-more .j-select-btn").click(function () {
        if ($(this).parents(".ect-select").hasClass("j-flowcoupon-select-disab")) {
            d_messages("同商家只能选择一个", 2);
        } else {
            is_select_all = true;
            if ($(this).parent("label").hasClass("label-this-all")) {
                if (!$(this).parent("label").hasClass("active")) {
                    $(this).parents(".j-cart-get-i-more").find(".ect-select label").addClass("active");
                } else {
                    $(this).parents(".j-cart-get-i-more").find(".ect-select label").removeClass("active");
                }
            }

            if (!$(this).parent("label").hasClass("label-this-all") && !$(this).parent("label").hasClass("label-all")) {
                $(this).parent("label").toggleClass("active");
                is_select_this_all = true;
                select_this_all = $(this).parents(".j-cart-get-i-more").find(".ect-select label").not(".label-this-all");

                select_this_all.each(function () {
                    if (!$(this).hasClass("active")) {
                        is_select_this_all = false;
                        return false;
                    }
                })
                if (is_select_this_all) {
                    $(this).parents(".j-cart-get-i-more").find(".label-this-all").addClass("active");
                } else {
                    $(this).parents(".j-cart-get-i-more").find(".label-this-all").removeClass("active");
                }
            }

            var select_all = $(".j-select-all").find(".ect-select label");
            select_all.each(function () {
                if (!$(this).hasClass("active")) {
                    is_select_all = false;
                    return false;
                }
            });
            if (is_select_all) {
                $(".label-all").addClass("active");
            } else {
                $(".label-all").removeClass("active");
            }
        }
        /*hu*/
        var rec_id = '';
        $(".rec-active").each(function () {
            var goods_id = $(this).attr("goods-id");
  
            if ($(this).hasClass("active")) {
                if ($(this).attr("rec-id") != undefined && $(this).attr("rec-id") > 0) {
                    rec_id += $(this).attr("rec-id") + ',';
                    $("#" + goods_id + "").addClass("active");
                }
            } else {
                $("#" + goods_id + "").removeClass("active");
            }
        });
         $.ajax({
            type: "POST",
            url: '<%=basePath%>lshapp/shop/cartChick.do',
            data: {
                id: rec_id
            },
            dataType: "json",
            success: function (data) {
            	if(data.msg =="ok"){
	                $(".cart-number-show").text('(' + data.cart_number + ')');
	                $(".cart-price-show").html(data.content);
	                $(".cart-price-hidden").text(data.content);
                }
            }
        });
        /*hu*/
    });
    /*店铺信息商品滚动*/
    var swiper = new Swiper('.j-f-n-c-prolist', {
        scrollbarHide: true,
        slidesPerView: 'auto',
        centeredSlides: false,
        grabCursor: true
    });
    $(function($){
        commonShopList()
    })
</script>
</body>
</html>