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
    <title>购物车</title>
    <link href="static/lshapp/css/center/app_cart.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/center/app_cart.js"></script>
	<script src="cart/app.js"></script>
         <style type="text/css">

		.user_icon{
			width: 1.0rem;
			height: 1.0rem;
			border-radius: 0.5rem;
		}
		.user_icon1{
			width: 2.0rem;
			height: 2.0rem;
			margin-bottom: .5rem;
		}
	</style>
</head>
<body>
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>

<div class="con">
    <div class="flow-cart blur-div">
        <!--  -->
    <!-- 按店铺显示商品  start-->
    <!--  -->
    <section class="flow-have-cart select-three j-select-all">
        <section class="j-cart-get-i-more shop0" num="2">
            <header class="flow-shop-header padding-all of-hidden dis-box">
                <div class="ect-select box-flex is-shop">
                    <label class="dis-box label-this-all active">
                        <i class="j-select-btn active-i"></i>
                            <a class="box-flex f-06" href="javascript:;">
                                <img class="user_icon1" src="static/lshapp/images/center/Shopping Cart2-hdpi.png">
                                    礼尚汇商城                                                             </a>
                    </label>
                </div>
                            </header>

            <div class="product-list-small" style="padding:0">
                <ul>
                    <li>
						<c:forEach items="${cartList}" var="var" varStatus="vs">
                        <div class="dis-box drop36320 com-post-adr">
                            <input class="total" price="12.5" number="1" type="hidden">
                            <div class="ect-select">
                                <label class="active rec-active" goods-id="3206" rec-id="36320">
                                <i class="j-select-btn active-i"></i>
                                </label>
                            </div>
                            <div class="box-flex">
                                <div class="product-div" style="background:none">
                                    <div class="fl">
                                        <div class="p-d-img">
                                            <a href="#">
                                                <img class="product-list-img" src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}">
                                                </a>
                                                <!--  -->
                                        </div>
                                    </div>
                                    <div class="product-text index-product-text">
                                         <a href="#">
                                            <h4 class="twolist-hidden f-05"> ${var.GOODS_NAME} </h4>
                                          </a>
                                        <div class="f-02 col-7 onelist-hidden flow-goods-attr">规格:${var.SPEC}
									</div>
                                          <div class="flow-new-cont m-top04">
                                                <span class="t-first j-item-36320-price">¥${var.GOODS_CURRENT_PRICE}</span>
                                                <div class="div-num dis-box">
                                                    <a class="num-up" data-min-num="1"></a>
                                                    <input class="box-flex cart-number active" name="cart_number" readonly="readonly" value="1" id="${var.CART_ID}" is_gift="" cart-id="${var.CART_ID}" type="number">
                                                    <a class="num-next" xiangounum="" data-max-num="999"></a>
                                                </div>
                                        </div>
                                        <div style="position: absolute;font-size: 1.5rem;right: .1rem;top: 50%;margin-top: 2.5rem;" onclick="deleteCart('${var.CART_ID}')">
											<img src="static/lshapp/images/center/delete1-hdpi.png" style="width:60%;height:60%;"></img>
										</div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        </c:forEach>
                        <!--  -->
                    </li>
                </ul>
            </div>
        </section>
        <!--  -->
        <!-- 按店铺显示商品  end-->
        <section>
            <section class="padding-all text-center t-remark2 ">
                <p class="j-goodsinfo-div">推荐商品</p>
            </section>
            <section class="product-list j-product-list product-list-medium new-flow-bottom">
                <ul>
                    <!--  -->

                    <li>
                        <div class="product-div" id="product-div">
                            <a href="http://www.lxshopping.cn/mobile/index.php?m=goods&amp;id=877&amp;u=25024">
                           <div class="shop-list-width" style="height: 205px;">
                                <img class="product-list-img" src="%E8%B4%AD%E7%89%A9%E8%BD%A6_files/877_thumb_G_1487405938719.jpg">
                            </div>
                            </a>
                            <div class="product-text index-product-text">
                                <a href="http://www.lxshopping.cn/mobile/index.php?m=goods&amp;id=877&amp;u=25024">
                                    <h4>五花肉</h4></a>
                                <p class="dis-box p-t-remark"><span class="box-flex">库存:50</span><span class="box-flex">销量:211</span></p>
                                <p class="cart-price-height"><span class="p-price t-first ">

                  ¥7.65
                                            <small>
                                                    <del>¥9.18</del>
                                                </small></span></p>
                                <a onclick="addToCart(877, 0)" class="icon-flow-cart j-goods-attr fr"><i class="iconfont icon-gouwuche"></i></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
        </section>
    </section>

</div>
</div>

<div class="mask-filter-div"></div>
<!--领取优惠券end-->
<input name="warehouse_id" value="3" id="region_id" type="hidden">
<input name="area_id" value="30" id="area_id" type="hidden">
<!--悬浮btn star-->
<footer class="flow-cart-btn">
    <section class="filter-btn f-cart-filter-btn dis-box n-flow-btn">
        <div class="box-flex select-three j-cart-get-more j-get-more-all pl">
            <div class="ect-select">
                <label class="dis-box label-all active">
                    <i class="select-btn active-i"></i>
                    <span class="box-flex">全选</span>
                </label>
            </div>
            <div class="g-cart-filter-price of-hidden" style="margin-top:-1.1rem;">
                <p class="dis-box"><em class="dis-block">合计：</em>
                    <span class="t-first box-flex onelist-hidden cart-price-show">¥52.30</span>
                    <span class="t-first box-flex onelist-hidden cart-price-hidden" style="display:none"></span>
                </p>
            </div>
        </div>
        <div class="g-cart-filter-sb">
            <form id="formid" action="/mobile/index.php?m=flow" class="fl" method="post">
                <input name="cart_value" value="" type="hidden">
                <a type="button" class="btn-submit fl" onclick="c_value()">结算</a>
            </form>
        </div>
    </section>
    <footer class="footer-nav dis-box p-s">
        <a href="<%=basePath%>lshapp/userbrithday/list.do"class="box-flex nav-list">
			<i class="nav-box i-cate">
			<img alt="" src="static/lshapp/images/Birthday-Silhouett-hdpi.png" style="width: 27px;height: 27px;margin-left: 2px">
			</i><span>生日</span>
		</a>
        <a href="http://www.lxshopping.cn/mobile/index.php"class="box-flex nav-list active">
		<i class="nav-box i-home">
		<img alt="" src="static/lshapp/images/Give_a_gift-Silhouett.png" style="width: 25px;height: 25px;margin-left: 2px">
		</i>
		<span>送礼</span>
		</a>
       <a href="http://www.lxshopping.cn/mobile/index.php?m=search"class="box-flex nav-list">
		 <i class="nav-box i-shop">
		 <img alt="" src="static/lshapp/images/Community-Silhouett-hdpi.png" style="width: 27px;height: 27px;margin-left: 2px">
		 </i>
		 <span>社区</span>
		</a>
        <a href="<%=basePath%>lshapp/userCenter/center_index.do" class="box-flex position-rel nav-list">
		 <i class="nav-box i-flow">
		 <img alt="" src="static/lshapp/images/Personal_Center-Fill.png" style="width: 25px;height: 25px;margin-left: 2px">
		 </i>
		 <span>个人中心</span>
		</a>
       </footer>
</footer>
<!--  -->

<!--悬浮btn star-->



<script>

	<!--	删除单个购物车，改变delete_status状态-->
	function deleteCart(CART_ID){
		window.location.href="<%=basePath%>lshapp/userCenter/delete_cart.do?CART_ID="+CART_ID;
	}
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
        $.get(ROOT_URL + 'index.php?m=goods&a=price', {
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

    function show(html) {
        $(".mask-filter-div").addClass("show");
        $(".j-show-goods-attr" + html).addClass("show");
    }

    function c_value() {
        var id = '';
        var store_id = new Array();
        $("input[name=store_id]").val('');
        $("input[name=cart_value]").val('');
        $("label").each(function () {
            if ($(this).hasClass("rec-active")) {
                if ($(this).hasClass("active")) {
                    id += $(this).attr("rec-id") + ',';
                    //门店ID
                    if ($(this).attr('store_id') != undefined) {
                        store_id.push($(this).attr('store_id'));
                    }
                }
            }
        });
        if (id == '') {
            d_messages('至少选中一个商品', 2);
            return false;
        }
        id = id.substr(0, id.length - 1);
        $("input[name=cart_value]").val(id);
        //门店ID
        if (store_id.length == 1 == $('.rec-active.active').length && $('.rec-active.active').attr('store_id') == store_id[0]) {
            $("input[name=store_id]").val(store_id[0]);
        }
        //门店ID   END
        document.getElementById("formid").submit();
    }
    //加载
    var price = 52.3;
    var k = 0;
//    $(".total").each(function () {
//        console.log($(this).attr("price"));
//        price += $(this).attr("price") * 1;
//
//    })

    $(".cart-price-show").text(currency_format + price.toFixed(2));
    //删除
    function DropCart(id, sid) {
        var shopnum = $(".shop" + sid).attr("num");
        $.ajax({
            type: "post",
            url: ROOT_URL + 'index.php?m=cart&a=delete_cart',
            data: {
                id: id
            },
            dataType: "json",
            success: function (data) {
                if (data.error == 0) {
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
    var heartstatus = 1;
    $(".heart").click(function () {
        var id = '';
        $(".com-post-adr label.active").each(function () {
            id += $(this).attr("goods-id") + ',';
        })
        $.get(ROOT_URL + 'index.php?m=cart&a=heart', {
            id: id,
            status: heartstatus
        }, function (data) {
            heartstatus++;
            if (data.error == 1) {
                $(".heart").addClass("active");
            } else if (data.error == 2) {
                $(".heart").removeClass("active");
            }
            if (data.error > 0) {
                d_messages(data.msg);
            } else {
                layer.open({
                    content: '请登录后关注',
                    btn: ['立即登录', '取消'],
                    shadeClose: false,
                    yes: function () {
                        window.location.href = ROOT_URL + 'index.php?m=user&c=login';
                    },
                    no: function () {
                    }
                });
            }
        }, 'json')
    })
    $(".delete").click(function () {
        var id = '';
        $("label").each(function () {
            if ($(this).hasClass("rec-active")) {
                if ($(this).hasClass("active")) {
                    id += $(this).attr("rec-id") + ',';
                }
            }
        })
        if (id == '') {
            d_messages('至少选中一个商品', 2);
            return false;
        }
        $.get(ROOT_URL + 'index.php?m=cart&a=drop_goods', {
            id: id
        }, function (data) {

        }, 'json')
        window.location.href = ROOT_URL + "index.php?m=cart";
    })
    //弹出优惠券
    /*-*/
    $(".j-goods-coupon").click(function () {
        document.addEventListener("touchmove", handler, false);
        var ru_id = $(this).attr("ru-id");
        $.ajax({
            type: "POST",
            url: ROOT_URL + "index.php?m=cart&a=cart_bonus",
            data: {
                ru_id: ru_id
            },
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.data != 0) {
                    $(".cart-bonus").html(data.data);
                    $(".bonus-number").text(data.number);
                    $(".mask-filter-div").addClass("show");
                    $(".show-goods-coupon").addClass("show");
                }
            }
        });
        swiper_scroll();
    });
    /*-*/
    $(".div-num a").click(function () {
        if (!$(this).parent(".div-num").hasClass("div-num-disabled")) {
            var t = $(this);
            var is_gift = parseInt($(this).siblings("input").attr("is_gift"));

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
                        url: ROOT_URL + "index.php?m=cart&a=cart_goods_number",
                        dataType: "json",
                        data: {
                            id: rec,
                            number: num,
                            act_id: is_gift,
                            arr: arr,
                            none: none
                        },
                        success: function (data) {
                            if (data.none > 0) {
                                return;
                            }
                            if (data.error) {
                                d_messages(data.msg);
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
                            })
                            if (number > data.max_number) {
                                number = data.max_number;
                            }
                            $(".cart-number-show").html('(' + number.toString() + ')');
                            $(".j-item-" + rec + "-price").html(data.shop_price);
                            $(".cart-price-show").html(data.content);
                            $(".cart-price-hidden").html(data.content);

                        }
                    });

                } else {
                    d_messages("不能小于最小数量");
                }
                return false;
            }
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
                        url: ROOT_URL + "index.php?m=cart&a=cart_goods_number",
                        dataType: "json",
                        data: {
                            id: rec,
                            number: num,
                            act_id: is_gift,
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
                            })
                            if (number > data.max_number) {
                                number = data.max_number;
                            }
                            $(".cart-number-show").html('(' + number.toString() + ')');
                            $(".j-item-" + rec + "-price").html(data.shop_price);
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
                    url: ROOT_URL + "index.php?m=cart&a=cart_label_count",
                    data: {
                        id: rec_id
                    },
                    dataType: "json",
                    success: function (data) {
                        $(".cart-number-show").text('(' + data.cart_number + ')');
                        $(".cart-price-show").html(data.content);

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
            url: ROOT_URL + "index.php?m=cart&a=cart_label_count",
            data: {
                id: rec_id
            },
            dataType: "json",
            success: function (data) {
                $(".cart-number-show").text('(' + data.cart_number + ')');
                $(".cart-price-show").html(data.content);
                $(".cart-price-hidden").text(data.content);
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


</body></html>