package com.szjm.controller.zlpapp;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.collection.CollectionManager;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.goodscomment.GoodsCommentManager;
import com.szjm.service.zlp.goodscommentpicture.GoodsCommentPictureManager;
import com.szjm.service.zlp.goodspicture.GoodsPictureManager;
import com.szjm.service.zlp.goodssearch.GoodsSearchManager;
import com.szjm.service.zlp.goodssku.GoodsSkuManager;
import com.szjm.service.zlp.goodsspec.GoodsSpecManager;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
import com.szjm.service.zlp.spec.SpecManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 说明：商品 创建人： 创建时间：2018-07-12
 */
@Controller
@RequestMapping(value = "/lshapp/shop")
public class ShopController extends BaseController {

	// 商品
	@Resource(name = "goodsService")
	private GoodsManager goodsService;
	// 商品类型
	@Resource(name = "goodstypeService")
	private GoodsTypeManager goodstypeService;
	// 规格
	@Resource(name = "specService")
	private SpecManager specService;
	// 商品规格
	@Resource(name = "goodsspecService")
	private GoodsSpecManager goodsspecService;
	// 商品SKU
	@Resource(name = "goodsskuService")
	private GoodsSkuManager goodsskuService;
	// 商品图片
	@Resource(name = "goodspictureService")
	private GoodsPictureManager goodspictureService;
	// 商品热门搜索
	@Resource(name = "goodssearchService")
	private GoodsSearchManager goodssearchService;
	// 购物车
	@Resource(name = "cartService")
	private CartManager cartService;
	// 商品收藏
	@Resource(name = "collectionService")
	private CollectionManager collectionService;
	// 商品评论
	@Resource(name = "goodscommentService")
	private GoodsCommentManager goodscommentService;
	// 商品评论图片
	@Resource(name = "goodscommentpictureService")
	private GoodsCommentPictureManager goodscommentpictureService;

	/**
	 * 送礼首页
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put(Jurisdiction.getAppUserRole(), Jurisdiction.getAppUserRole()); // 当前用户角色
		pd.put("IS_INDEX", 1); // 首页展示
		page.setPd(pd);
		List<PageData> typeList = goodstypeService.listAll(pd); // 商品类型
		List<PageData> goodsList = goodsService.appGoodsList(page); // 列出Goods列表
		List<PageData> broadcastList = new ArrayList<PageData>(); // 轮播商品

		for (PageData pageData : goodsList) {
			List<PageData> listGoods = goodsskuService.listByGoodsId(pageData);
			// 轮播的商品
			if (pageData.get("IS_BROADCAST") != null
					&& pageData.get("IS_BROADCAST").toString().equals("1")) {
				PageData broadPd = new PageData();
				broadPd.put("GOODS_ID", pageData.get("GOODS_ID"));
				broadcastList.add(broadPd);
			}
			// 库存
			int stock = 0;
			for (PageData goods : listGoods) {
				stock = stock
						+ Integer.parseInt(goods.get("GOODS_INVENTORY")
								.toString());
			}
			pageData.put("GOODS_INVENTORY", stock);
		}
		// 首页轮播图
		for (PageData pageData : broadcastList) {
			PageData pictureGoods = goodspictureService.findByGoodsId(pageData);
			if (pictureGoods != null && pictureGoods.get("PATH") != null
					&& !pictureGoods.get("PATH").toString().equals("")) {
				pageData.put("PATH", pictureGoods.get("PATH").toString());
			}
		}
		mv.setViewName("lshapp/shop_index");
		mv.addObject("pd", pd);
		mv.addObject("typeList", typeList); // 商品类型
		mv.addObject("broadcastList", broadcastList); // 轮播商品
		mv.addObject("goodsList", goodsList); // 商品列表
		mv.addObject("totalPage", page.getTotalPage());
		return mv;
	}

	/**
	 * 送礼首页商品下拉加载更多
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/indexGoodsMore")
	public ModelAndView indexGoodsMore(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put(Jurisdiction.getAppUserRole(), Jurisdiction.getAppUserRole()); // 当前用户角色
		pd.put("IS_INDEX", 1); // 首页展示
		page.setPd(pd);
		List<PageData> goodsList = goodsService.appGoodsList(page); // 列出Goods列表

		for (PageData pageData : goodsList) {
			List<PageData> listGoods = goodsskuService.listByGoodsId(pageData);
			// 库存
			int stock = 0;
			for (PageData goods : listGoods) {
				stock = stock
						+ Integer.parseInt(goods.get("GOODS_INVENTORY")
								.toString());
			}
			pageData.put("GOODS_INVENTORY", stock);
		}

		mv.setViewName("lshapp/index_goods_add");
		mv.addObject("pd", pd);
		mv.addObject("goodsList", goodsList); // 商品列表
		return mv;
	}

	/**
	 * 送礼商品类目排序
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/sort")
	public ModelAndView sort(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String appUserRole = Jurisdiction.getAppUserRole();
		pd.put(appUserRole, appUserRole); // 当前用户角色
		page.setPd(pd);
		List<PageData> goodsList = goodsService.listByType(page); // 列出排序商品列表
		// 库存
		for (PageData pageData : goodsList) {
			List<PageData> listGoods = goodsskuService.listByGoodsId(pageData);
			int stock = 0;
			for (PageData goods : listGoods) {
				stock = stock
						+ Integer.parseInt(goods.get("GOODS_INVENTORY")
								.toString());
			}
			pageData.put("GOODS_INVENTORY", stock);
		}

		mv.setViewName("lshapp/synthesize");
		mv.addObject("totalPage", page.getTotalPage());
		mv.addObject("pd", pd);
		mv.addObject("goodsList", goodsList);
		return mv;
	}

	/**
	 * 商品排序切换
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/typeGoods")
	public ModelAndView typeGoods(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String appUserRole = Jurisdiction.getAppUserRole();
		pd.put(appUserRole, appUserRole); // 当前用户角色
		page.setPd(pd);
		List<PageData> goodsList = goodsService.listByType(page); // 列出排序商品列表
		// 库存
		for (PageData pageData : goodsList) {
			List<PageData> listGoods = goodsskuService.listByGoodsId(pageData);
			int stock = 0;
			for (PageData goods : listGoods) {
				stock = stock
						+ Integer.parseInt(goods.get("GOODS_INVENTORY")
								.toString());
			}
			pageData.put("GOODS_INVENTORY", stock);
		}
		mv.addObject("totalPage", page.getTotalPage());
		mv.setViewName("lshapp/type_goods_more");
		mv.addObject("pd", pd);
		mv.addObject("goodsList", goodsList); // 商品列表
		return mv;
	}

	/**
	 * 商品类目排序下拉加载更多
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/typeGoodsMore")
	public ModelAndView typeGoodsMore(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String appUserRole = Jurisdiction.getAppUserRole();
		pd.put(appUserRole, appUserRole); // 当前用户角色
		page.setPd(pd);
		List<PageData> goodsList = goodsService.listByType(page); // 列出排序商品列表
		// 库存
		for (PageData pageData : goodsList) {
			List<PageData> listGoods = goodsskuService.listByGoodsId(pageData);
			int stock = 0;
			for (PageData goods : listGoods) {
				stock = stock
						+ Integer.parseInt(goods.get("GOODS_INVENTORY")
								.toString());
			}
			pageData.put("GOODS_INVENTORY", stock);
		}
		mv.setViewName("lshapp/type_goods_more");
		mv.addObject("pd", pd);
		mv.addObject("goodsList", goodsList); // 商品列表
		return mv;
	}

	/**
	 * 商品详情
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/goods")
	public ModelAndView goods(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 商品
		PageData goods = goodsService.findById(pd);
		// 商品评论
		PageData comment = goodscommentService.findCountById(pd);
		// 商品SKU
		List<PageData> skuList = goodsskuService.listByGoodsId(pd);
		// 商品轮播图
		List<PageData> pictureList = goodspictureService.listByGoodsId(pd);
		pd.put("USER_ID", Jurisdiction.getAppUserId());
		PageData collectionPd = collectionService.findByGoodsId(pd); // 商品收藏
		if (collectionPd != null) {
			goods.put("is_collection", 1); // 商品被该用户收藏
		} else {
			goods.put("is_collection", 0); // 商品没有被该用户收藏
		}
		int stock = 0;
		for (PageData goodsSku : skuList) {
			stock = stock
					+ Integer.parseInt(goodsSku.get("GOODS_INVENTORY")
							.toString());
		}
		goods.put("GOODS_INVENTORY", stock); // 库存
		pd.put("keywords", goods.get("GOODS_NAME").toString());
		if(goods.get("GOODS_POSITION").toString().equals("1")){
			mv.setViewName("lshapp/exchange_goods_index");
		}else if(goods.get("GOODS_POSITION").toString().equals("3")){
			mv.setViewName("lshapp/award_goods_index");
		}else{
			page.setPd(pd);
			List<PageData> relationList = goodsService.listByType(page); // 关联商品
			mv.addObject("relationList", relationList);
			mv.setViewName("lshapp/goods_index");
		}
		mv.addObject("pd", pd);
		mv.addObject("goods", goods); // 商品
		mv.addObject("comment", comment); // 商品评论
		mv.addObject("pictureList", pictureList);// 商品轮播图
		mv.addObject("skuList", skuList);// 商品SKU
		return mv;
	}

	/**
	 * 商品详情商品评论
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodsComment")
	public ModelAndView goodsComment(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> commentList = goodscommentService.listByGoods(page);
		// 商品评论图片
		for (PageData goods : commentList) {
			List<PageData> pictureList = goodscommentpictureService
					.findByIdComment(goods);
			goods.put("pictureList", pictureList);
		}

		mv.setViewName("lshapp/goods_comment");
		mv.addObject("pd", pd);
		mv.addObject("totalPage", page.getTotalPage());
		mv.addObject("commentList", commentList); // 商品评论
		return mv;
	}
	
	/**
	 * 商品详情商品评论上拉加载更多
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodsCommentMore")
	public ModelAndView goodsCommentMore(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> commentList = goodscommentService.listByGoods(page);
		// 商品评论图片
		for (PageData goods : commentList) {
			List<PageData> pictureList = goodscommentpictureService
					.findByIdComment(goods);
			goods.put("pictureList", pictureList);
		}

		mv.setViewName("lshapp/goods_comment_more");
		mv.addObject("pd", pd);
		mv.addObject("commentList", commentList); // 商品评论
		return mv;
	}

	/**
	 * 商品详情详情图片
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodsDetailPicture")
	public ModelAndView goodsDetailPicture(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 商品
		PageData goods = goodsService.findById(pd);
		mv.setViewName("lshapp/goods_details");
		mv.addObject("goods", goods);
		return mv;
	}

	/**
	 * 商品收藏/取消收藏 不跳转界面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodsCollection")
	@ResponseBody
	public Object goodsCollection() throws Exception {
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		if (pd.get("coType") != null && !pd.get("coType").toString().equals("")) {
			if (pd.get("coType").toString().equals("0")) { // 当前商品未收藏，改为收藏状态
				pd.put("COLLECTION_TYPE", 0);
				pd.put("USER_ID", Jurisdiction.getAppUserId());
				pd.put("DELETE_STATUS", 0);
				pd.put("CREATE_DATE", Tools.date2Str(new Date()));
				try {
					collectionService.save(pd);
					map.put("msg", "ok");
					map.put("collect", "collect");
				} catch (Exception e) {
					map.put("error", "error");
					map.put("msg", "no");
				}
			} else if (pd.get("coType").toString().equals("1")) { // 当前商品已收藏，改为未收藏状态
				pd.put("USER_ID", Jurisdiction.getAppUserId());
				try {
					collectionService.deleteGoodsId(pd);
					map.put("msg", "ok");
					map.put("collect", "cancle");
				} catch (Exception e) {
					map.put("error", "error");
					map.put("msg", "no");
				}
			}
		}
		return map;
	}

	/**
	 * 商品搜索界面
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public ModelAndView search() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> searchList = goodssearchService.listAll(pd);
		mv.setViewName("lshapp/goods_search");
		mv.addObject("pd", pd);
		mv.addObject("searchList", searchList);
		return mv;
	}

	/**
	 * 商城首页直接进入购物车购物车
	 */
	@RequestMapping(value = "/goCart")
	public ModelAndView goCart(HttpServletRequest request) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		List<PageData> cartList = cartService.listAll(pd);
		for (PageData pageData : cartList) { // 添加总价用于删除
			int number = Integer.parseInt(pageData.get("AMOUNT").toString());
			double price = Double.parseDouble(pageData.get(
					"GOODS_CURRENT_PRICE").toString());
			pageData.put("totlePrice", String.format("%.2f", price * number));
		}
		pd.put("num", cartList.size());
		view.addObject("cartList", cartList);
		view.addObject("pd", pd);
		view.setViewName("lshapp/shopping_cart");
		return view;
	}

	/**
	 * 加入购物车 商品ID SKUID 数量 并跳转到购物车界面
	 */
	@RequestMapping(value = "/addCart")
	public ModelAndView addCart(HttpServletRequest request) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId(); // 当前用户
		PageData goods = goodsService.findById(pd); // 当前选中商品
		PageData sku = goodsskuService.findById(pd); // 当前选中SKU

		int number = Integer.parseInt(pd.get("number").toString()); // 当前选择数量
		double price = Double.parseDouble(sku.get("GOODS_PRICE").toString()); // 当前SKU价格

		pd.put("USER_ID", user_id);
		List<PageData> cartList = cartService.listAll(pd);

		boolean isEditAdd = false; // 是否新增已选商品
		String addId = ""; // 当前购物车ID
		for (PageData pageData : cartList) {
			if (pageData.get("SPEC").toString()
					.equals(sku.get("SPECVALUE_NAME").toString())
					&& pageData.get("GOODS_ID").toString()
							.equals(goods.get("GOODS_ID").toString())) { // 新增的是当前已有的商品
				addId = pageData.get("CART_ID").toString();
				pageData.put("AMOUNT", Integer.parseInt(pageData.get("AMOUNT").toString())+Integer.parseInt(pd.get("number").toString()));
				isEditAdd = true;
				break;
			}
		}
		if (isEditAdd) { // 增加原有商品数量
			PageData epd = new PageData(); // 购物车
			epd.put("CART_ID", addId);
			epd.put("AMOUNT", pd.get("number").toString()); // 数量
			cartService.editAddCart(epd);
		} else { // 新增原有商品
			PageData cpd = new PageData(); // 购物车
			cpd.put("USER_ID", user_id);
			cpd.put("TYPE", 0); // 商品类型
			cpd.put("IS_COMMENT", 0); // 评论状态
			cpd.put("GOODS_ID", goods.get("GOODS_ID").toString()); // 商品ID
			cpd.put("SPEC", sku.get("SPECVALUE_NAME").toString()); // 规格值名称
			cpd.put("SKU_ID", sku.get("SKU_ID").toString()); // 规格ID
			cpd.put("GOODS_CURRENT_PRICE", sku.get("GOODS_PRICE").toString()); // 当前规格单价
			cpd.put("AMOUNT", pd.get("number").toString()); // 数量
			cpd.put("DELETE_STATUS", 0); // 删除状态
			cpd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
			/*
			 * cpd.put("CREATE_USER", Jurisdiction.getUsername()); //创建人
			 */cpd.put("GOODS_ORIGINAL_PRICE", goods.get("ORIGINAL_PRICE")
					.toString()); // 商品原单价
			cpd.put("GOODS_POSITION", goods.get("GOODS_POSITION").toString()); // 商品类型
			cpd.put("GOODS_AMOUNT", String.format("%.2f", number * price)); // 商品金额
			if (Jurisdiction.getAppUserRole().equals("partner")) { // 合伙人
				cpd.put("INTEGRATION_AMOUNT", 0); // 当前sku可使用礼豆数量
				cpd.put("DEDUCTION_MONEY", 0); // 礼豆抵扣金额
			} else if (Jurisdiction.getAppUserRole().equals("vip")) { // VIP
				cpd.put("INTEGRATION_AMOUNT", 0); // 当前sku可使用礼豆数量
				cpd.put("DEDUCTION_MONEY", 0); // 礼豆抵扣金额
			} else if (Jurisdiction.getAppUserRole().equals("agent")) { // 代理商
				cpd.put("INTEGRATION_AMOUNT", 0); // 加入购物车时，默认为0
				cpd.put("DEDUCTION_MONEY", 0); // 加入购物车时，默认为0
			} else if (Jurisdiction.getAppUserRole().equals("common")) { // 普通用户
				cpd.put("INTEGRATION_AMOUNT", 0); // 加入购物车时，默认为0
				cpd.put("DEDUCTION_MONEY", 0); // 加入购物车时，默认为0
			}else if (Jurisdiction.getAppUserRole().equals("members")) { // 付费会员
				cpd.put("INTEGRATION_AMOUNT", 0); // 加入购物车时，默认为0
				cpd.put("DEDUCTION_MONEY", 0); // 加入购物车时，默认为0
			}

			cartService.addCart(cpd);
			// 新增的数据加入列表中
			PageData npd = new PageData();
			npd.put("CART_ID", cpd.get("cid"));
			PageData nData = cartService.findById(npd);
			cartList.add(nData);
		}
		// 用于删除
		pd.put("num", cartList.size());
		for (PageData pageData : cartList) { // 添加总价用于删除
			int numbers = Integer.parseInt(pageData.get("AMOUNT").toString());
			double prices = Double.parseDouble(pageData.get(
					"GOODS_CURRENT_PRICE").toString());
			pageData.put("totlePrice", String.format("%.2f", prices * numbers));
		}

		view.addObject("pd", pd);
		view.addObject("cartList", cartList);
		view.setViewName("lshapp/shopping_cart");
		return view;
	}

	/**
	 * 删除购物车单个商品
	 */
	@RequestMapping(value = "/deleteCart")
	@ResponseBody
	public Object delete_cart(HttpServletRequest request) throws Exception {
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("CART_ID", pd.get("id"));
		PageData cart = cartService.findById(pd);
		try {
			// 查询删除编号对应的购物车信息，判断是否为当前用户所拥有
			if ((user_id + "").equals(cart.get("USER_ID").toString())) {
				cartService.delete(pd);
			}
			map.put("msg", "ok");
		} catch (Exception e) {
			map.put("msg", "no");
		}
		return map;
	}

	/**
	 * 添加到购物车不跳转页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/addGoods")
	@ResponseBody
	public Object addGoods() throws Exception {
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId(); // 当前用户
		PageData goods = goodsService.findById(pd); // 当前选中商品
		PageData sku = goodsskuService.findById(pd); // 当前选中SKU

		int number = Integer.parseInt(pd.get("number").toString()); // 当前选择数量
		double price = Double.parseDouble(sku.get("GOODS_PRICE").toString()); // 当前SKU价格

		pd.put("USER_ID", user_id);
		List<PageData> cartList = cartService.listAll(pd);
		boolean isEditAdd = false; // 是否新增已选商品
		String addId = ""; // 当前购物车ID
		for (PageData pageData : cartList) {
			if (pageData.get("SPEC").toString()
					.equals(sku.get("SPECVALUE_NAME").toString())
					&& pageData.get("GOODS_ID").toString()
							.equals(goods.get("GOODS_ID").toString())) { // 新增的是当前已有的商品
				addId = pageData.get("CART_ID").toString();
				isEditAdd = true;
				break;
			}
		}

		if (isEditAdd) { // 增加原有商品数量
			PageData epd = new PageData(); // 购物车
			epd.put("CART_ID", addId);
			epd.put("AMOUNT", pd.get("number").toString()); // 数量
			try {
				cartService.editAddCart(epd);
				map.put("msg", "ok");
			} catch (Exception e) {
				map.put("msg", "no");
			}
		} else { // 新增原有商品
			PageData cpd = new PageData(); // 购物车
			cpd.put("USER_ID", user_id);
			cpd.put("TYPE", 0);
			cpd.put("IS_COMMENT", 0); // 评论状态
			cpd.put("GOODS_ID", goods.get("GOODS_ID").toString()); // 商品ID
			cpd.put("SPEC", sku.get("SPECVALUE_NAME").toString()); // 规格值名称
			cpd.put("SKU_ID", sku.get("SKU_ID").toString()); // 规格ID
			cpd.put("GOODS_CURRENT_PRICE", sku.get("GOODS_PRICE").toString()); // 当前规格单价
			cpd.put("AMOUNT", pd.get("number").toString()); // 数量
			cpd.put("DELETE_STATUS", 0); // 删除状态
			cpd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
			/*
			 * cpd.put("CREATE_USER", Jurisdiction.getUsername()); //创建人
			 */
			cpd.put("GOODS_ORIGINAL_PRICE", goods.get("ORIGINAL_PRICE")
					.toString()); // 商品原单价
			cpd.put("GOODS_POSITION", goods.get("GOODS_POSITION").toString()); // 商品类型
			cpd.put("GOODS_AMOUNT", String.format("%.2f", number * price)); // 商品金额
			if (Jurisdiction.getAppUserRole().equals("partner")) { // 合伙人
				cpd.put("INTEGRATION_AMOUNT", 0); // 当前sku可使用礼豆数量
				cpd.put("DEDUCTION_MONEY", 0); // 礼豆抵扣金额
			} else if (Jurisdiction.getAppUserRole().equals("vip")) { // VIP
				cpd.put("INTEGRATION_AMOUNT", 0); // 当前sku可使用礼豆数量
				cpd.put("DEDUCTION_MONEY", 0); // 礼豆抵扣金额
			} else if (Jurisdiction.getAppUserRole().equals("agent")) { // 代理商
				cpd.put("INTEGRATION_AMOUNT", sku.get("INTEGRATION").toString()); // 当前sku可使用礼豆数量
				cpd.put("DEDUCTION_MONEY", 0); // 礼豆抵扣金额
			} else if (Jurisdiction.getAppUserRole().equals("common")) { // 普通用户
				cpd.put("INTEGRATION_AMOUNT", sku.get("INTEGRATION").toString()); // 当前sku可使用礼豆数量
				cpd.put("DEDUCTION_MONEY", 0); // 礼豆抵扣金额
			}else if (Jurisdiction.getAppUserRole().equals("members")) { // 付费会员
				cpd.put("INTEGRATION_AMOUNT", sku.get("INTEGRATION").toString()); // 加入购物车时，默认为0
				cpd.put("DEDUCTION_MONEY", 0); // 加入购物车时，默认为0
			}

			try {
				cartService.addCart(cpd);
				map.put("msg", "ok");
			} catch (Exception e) {
				map.put("msg", "no");
			}
		}
		return map;
	}

	/**
	 * 修改购物车数量不跳转界面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/editCart")
	@ResponseBody
	public Object editCart() throws Exception {
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		PageData epd = new PageData();
		int number = Integer.parseInt(pd.get("number").toString()); // 当前选择数量
		epd.put("CART_ID", pd.get("id"));
		epd.put("AMOUNT", number); // 数量
		try {
			cartService.editCart(epd);
			map.put("msg", "ok");
		} catch (Exception e) {
			map.put("error", "error");
			map.put("msg", "no");
		}

		int cart_number = 0; // 商品数量
		double content = 0; // 商品总价
		// 展示选中的数量与价格
		String[] chickIds = pd.get("arr").toString().split(",");
		try {
			for (String id : chickIds) {
				if (!id.equals("")) {
					pd.put("CART_ID", (Object) id);
					PageData cpd = cartService.findById(pd);
					content = content
							+ Double.parseDouble(cpd.get("GOODS_CURRENT_PRICE")
									.toString())
							* Integer.parseInt(cpd.get("AMOUNT").toString());
					cart_number = cart_number
							+ Integer.parseInt(cpd.get("AMOUNT").toString());
				}
			}
			map.put("msg", "ok");
			map.put("content", String.format("%.2f", content));
			map.put("cart_number", cart_number);
		} catch (Exception e) {
			map.put("msg", "no");
		}

		return map;
	}

	/**
	 * 购物车勾选数量不跳转界面 仅展示数量与价格
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/cartChick")
	@ResponseBody
	public Object cartChick() throws Exception {
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		int cart_number = 0; // 商品数量
		double content = 0; // 商品总价
		// 展示选中的数量与价格
		String[] chickIds = pd.get("id").toString().split(",");
		try {
			for (String id : chickIds) {
				if (!id.equals("")) {
					pd.put("CART_ID", (Object) id);
					PageData cpd = cartService.findById(pd);
					content = content
							+ Double.parseDouble(cpd.get("GOODS_CURRENT_PRICE")
									.toString())
							* Integer.parseInt(cpd.get("AMOUNT").toString());
					cart_number = cart_number
							+ Integer.parseInt(cpd.get("AMOUNT").toString());
				}
			}
			map.put("msg", "ok");
			map.put("content", String.format("%.2f", content));
			map.put("cart_number", cart_number);
		} catch (Exception e) {
			map.put("msg", "no");
		}
		return map;
	}
	
	/**
	 * 联系客服界面
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/customerService")
	public ModelAndView customerService() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("lshapp/contact_number");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}
