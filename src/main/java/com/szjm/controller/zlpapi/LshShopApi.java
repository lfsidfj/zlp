package com.szjm.controller.zlpapi;

import com.szjm.controller.zlpapp.BaseAppController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.giftarea.GiftAreaManager;
import com.szjm.service.zlp.giftareatype.GiftAreaTypeManager;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.goodspicture.GoodsPictureManager;
import com.szjm.service.zlp.goodssearch.GoodsSearchManager;
import com.szjm.service.zlp.goodssku.GoodsSkuManager;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * API接口类
 * 
 * @author
 * 
 */
@Controller
@RequestMapping(value = "app/Api")
public class LshShopApi extends BaseAppController {
	@Resource(name = "sysconfigService")
	private SysConfigManager sysconfigService;// 系统参数
	@Resource(name = "goodsService")
	private GoodsManager goodsService; // 商品
	@Resource(name = "goodstypeService")
	private GoodsTypeManager goodstypeService; // 商品类型
	@Resource(name = "goodsskuService")
	private GoodsSkuManager goodsskuService;// 商品SKU
	@Resource(name = "goodspictureService")
	private GoodsPictureManager goodspictureService;// 商品图片
	// 商品热门搜索
	@Resource(name = "goodssearchService")
	private GoodsSearchManager goodssearchService;
	// 购物车
	@Resource(name = "cartService")
	private CartManager cartService;
	// 用户
	@Resource(name = "lshuserService")
	private LshUserManager lshuserService;
	// 专区
	@Resource(name = "giftareaService")
	private GiftAreaManager giftareaService;
	// 区域关联表
	@Resource(name = "giftareatypeService")
	private GiftAreaTypeManager giftareatypeService;

	
	/**
	 * 送礼专区
	 */
	@RequestMapping(value = "/indexGiftArea")
	public void indexGiftArea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> content = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> areaList = giftareaService.listAll(pd); // 商品类型
		List<Object> listT = new ArrayList<Object>();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		// 商品类型

		try {
			for (PageData pageData : areaList) {
				PageData type = new PageData();
				type.put("AREA_NAME", pageData.get("AREA_NAME"));
				type.put("PATH", basePath + "uploadFiles/uploadImgs/"
						+ pageData.get("PATH"));
				type.put("GIFTAREA_ID", pageData.get("GIFTAREA_ID"));
				listT.add(type);
			}
			content.put("areaList", listT); // 区域
			WriteClientMessage(response, "0", "成功", content);
		} catch (Exception e) {
			WriteClientMessage(response, "1", "失败", content);
		}
	}
	
	
	/**
	 * 专区包含商品类目
	 */
	@RequestMapping(value = "/indexAreaGoodsType")
	public void indexAreaGoodsType(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> content = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> typeList = giftareatypeService.listAllByArea(pd); // 商品类型
		List<Object> listT = new ArrayList<Object>();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		// 商品类型

		try {
			for (PageData pageData : typeList) {
				PageData type = new PageData();
				type.put("TYPE_NAME", pageData.get("TYPE_NAME"));
				type.put("PATH", basePath + "uploadFiles/uploadImgs/"
						+ pageData.get("PATH"));
				type.put("GOODSTYPE_ID", pageData.get("GOODSTYPE_ID"));
				listT.add(type);
			}
			content.put("typeList", listT); // 区域
			WriteClientMessage(response, "0", "成功", content);
		} catch (Exception e) {
			WriteClientMessage(response, "1", "失败", content);
		}
	}
	
	
	/**
	 * 类目
	 */
	@RequestMapping(value = "/indexGoodsType")
	public void shop_index(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> content = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> typeList = goodstypeService.listAll(pd); // 商品类型
		List<Object> listT = new ArrayList<Object>();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		// 商品类型

		try {
			for (PageData pageData : typeList) {
				PageData type = new PageData();
				type.put("TYPE_NAME", pageData.get("TYPE_NAME"));
				type.put("PATH", basePath + "uploadFiles/uploadImgs/"
						+ pageData.get("PATH"));
				type.put("GOODSTYPE_ID", pageData.get("GOODSTYPE_ID"));
				listT.add(type);
			}
			content.put("typeList", listT); // 类目
			WriteClientMessage(response, "0", "成功", content);
		} catch (Exception e) {
			WriteClientMessage(response, "1", "失败", content);
		}
	}

	/**
	 * 送礼首页轮播图
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/indexBroadcast")
	@ResponseBody
	public void indexBroadcast(HttpServletRequest request,
			HttpServletResponse response, Page page) throws Exception {
		Map<String, Object> content = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		pd.put("USER_ID", Jurisdiction.getAppUserId());
		PageData userPd = lshuserService.findById(pd); // 当前用户
		pd.put(userPd.get("ROLE").toString(), userPd.get("ROLE").toString()); // 当前用户角色
		List<PageData> listBroadcast = goodsService.listBroadcast(pd);
		try {
			for (PageData pageData : listBroadcast) {
				PageData pictureGoods = goodspictureService
						.findByGoodsId(pageData);
				if (pictureGoods != null && pictureGoods.get("PATH") != null
						&& !pictureGoods.get("PATH").toString().equals("")) {

					pageData.put("PATH", basePath + "uploadFiles/uploadImgs/"
							+ pictureGoods.get("PATH").toString());

				} else {
					pageData.put("PATH", "");
				}
			}
			content.put("broadcastList", listBroadcast);
			WriteClientMessage(response, "0", "成功", content);
		} catch (Exception e) {
			WriteClientMessage(response, "1", "失败", content);
		}
	}

	/**
	 * 送礼首页商品下拉加载更多
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/indexGoods")
	@ResponseBody
	public void indexGoodsMore(HttpServletRequest request,
			HttpServletResponse response, Page page) throws Exception {
		Map<String, Object> content = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		pd.put("USER_ID", Jurisdiction.getAppUserId());
		PageData userPd = lshuserService.findById(pd); // 当前用户
		pd.put(userPd.get("ROLE").toString(), userPd.get("ROLE").toString()); // 当前用户角色
		if (pd.get("GOODSTYPE_ID") != null
				&& !pd.get("GOODSTYPE_ID").toString().equals("")) {
		} else {
			pd.put("IS_INDEX", 1); // 首页展示
		}
		page.setPd(pd);
		try {
			List<PageData> goodsList = goodsService.appGoodsList(page); // 列出Goods列表
			for (PageData pageData : goodsList) {
				List<PageData> listGoods = goodsskuService
						.listByGoodsId(pageData);
				// 库存
				int stock = 0;
				for (PageData goods : listGoods) {
					stock = stock
							+ Integer.parseInt(goods.get("GOODS_INVENTORY")
									.toString());
				}
				pageData.put("GOODS_INVENTORY", stock);
				if (pageData != null && pageData.get("PATH") != null
						&& !pageData.get("PATH").toString().equals("")) {

					pageData.put("PATH", basePath + "uploadFiles/uploadImgs/"
							+ pageData.get("PATH").toString());

				} else {
					pageData.put("PATH", "");
				}
				pageData.remove("GOODS_DETAILS");
			}
			if (pd.get("currentPage") != null
					&& !pd.get("currentPage").toString().equals("")) {
				content.put("currentPage", pd.get("currentPage").toString()); // 当前页数
			} else {
				content.put("currentPage", 1); // 当前页数
			}
			content.put("goodsList", goodsList); // 商品列表
			content.put("pages", page.getTotalPage()); // 总页数
			content.put("pageSize", page.getShowCount()); // 当前显示条目数
			WriteClientMessage(response, "0", "成功", content);
		} catch (Exception e) {
			e.printStackTrace();
			WriteClientMessage(response, "1", "失败", content);
		}
	}

	/**
	 * 送礼商品类目排序
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/sort")
	@ResponseBody
	public void sort(HttpServletRequest request, HttpServletResponse response,
			Page page) throws Exception {
		Map<String, Object> content = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_ID", Jurisdiction.getAppUserId());
		PageData userPd = lshuserService.findById(pd); // 当前用户
		String appUserRole = Jurisdiction.getAppUserRole();
		pd.put(appUserRole, appUserRole); // 当前用户角色
		page.setPd(pd);
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		List<PageData> goodsList = goodsService.appGoodsList(page); // 列出排序商品列表
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
			if (pageData != null && pageData.get("PATH") != null
					&& !pageData.get("PATH").toString().equals("")) {

				pageData.put("PATH", basePath + "uploadFiles/uploadImgs/"
						+ pageData.get("PATH").toString());

			} else {
				pageData.put("PATH", "");
			}
		}

		content.put("totalPage", page.getTotalPage());
		content.put("GOODSTYPE_ID", pd.get("GOODSTYPE_ID").toString());
		content.put("currentPage", pd.get("currentPage").toString()); // 当前页数
		content.put("goodsList", goodsList);
		WriteClientMessage(response, "0", "成功", content);
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

}
