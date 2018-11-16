package com.szjm.controller.zlpapp;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.address.AddressManager;
import com.szjm.service.zlp.area.AreaManager;
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.collection.CollectionManager;
import com.szjm.service.zlp.expresscompany.ExpressCompanyManager;
import com.szjm.service.zlp.finance.FinanceManager;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.goodscomment.GoodsCommentManager;
import com.szjm.service.zlp.goodscommentpicture.GoodsCommentPictureManager;
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.order.OrderManager;
import com.szjm.service.zlp.smsrecord.SmsRecordManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.service.zlp.tbpictures.TbPicturesManager;
import com.szjm.service.zlp.withdraw.WithdrawManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import com.szjm.util.lsh.BirthdayUtil;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/lshapp/userCenter")
public class UserCenterController extends BaseController {
	@Resource(name = "lshuserService")
	private LshUserManager appuserService;// 用户
	@Resource(name = "addressService")
	private AddressManager addressService;// 收货地址
	@Resource(name = "orderService")
	private OrderManager orderService;// 订单
	@Resource(name = "cartService")
	private CartManager cartService;// 购物车
	@Resource(name = "expresscompanyService")
	private ExpressCompanyManager expresscompanyService;// 快递公司
	@Resource(name = "collectionService")
	private CollectionManager collectionService;// 收藏
	@Resource(name = "areaService")
	private AreaManager areaService;// 地址
	@Resource(name = "smsrecordService")
	private SmsRecordManager smsrecordService;// 短信记录
	@Resource(name = "goodscommentService")
	private GoodsCommentManager goodscommentService;// 商品评论
	@Resource(name = "goodscommentpictureService")
	private GoodsCommentPictureManager goodscommentpictureService;// 商品评论图片保存
	@Resource(name = "tbpicturesService")
	private TbPicturesManager tbpicturesService;// 图片管理
	@Resource(name = "goodsService")
	private GoodsManager goodsService;// 商品
	@Resource(name = "integrationrecordService")
	private IntegrationRecordManager integrationrecordService;// 礼豆明细
	@Resource(name = "financeService")
	private FinanceManager financeService;// 收入支出明细
	@Resource(name = "sysconfigService")
	private SysConfigManager sysconfigService;// 系统参数


	@Resource(name="withdrawService")
	private WithdrawManager withdrawService;//用户提现

	@Resource(name="lshuserService")
	private LshUserManager lshuserService;//用户
	/**
	 * 用户个人中心
	 */
	@RequestMapping(value = "/center_index")
	public ModelAndView center_index(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdUser = appuserService.findById(pd);
		view.addObject("pd", pdUser);
		view.setViewName("lshapp/center/center_index");
		return view;
	}

	/**
	 * 去用户修改个人资料页面
	 */
	@RequestMapping(value = "/user_information")
	public ModelAndView user_information(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdUser = appuserService.findById(pd);
		view.addObject("pd", pdUser);
		view.setViewName("lshapp/center/user_information");
		return view;
	}

	/**
	 * 修改个人图片
	 */
	@RequestMapping(value = "/update_picture")
	@ResponseBody
	public String update_picture(HttpServletRequest request) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		appuserService.edit(pd);
		return "success";
	}

	/**
	 * 修改个人资料，保存信息
	 */
	@RequestMapping(value = "/update_information")
	@ResponseBody
	public String update_information(HttpServletRequest request,HttpServletResponse response) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdUser = appuserService.findById(pd);//查询用户资料
		if( pd.get("SOLAR_BIRTHDAY")!=null && !"".equals(pd.get("SOLAR_BIRTHDAY").toString())){
			String solar_birthday = pd.get("SOLAR_BIRTHDAY").toString();//选择的新历生日
			String lunarBirthday = BirthdayUtil.getLunarBirthday(solar_birthday);//通过新历生日获取农历生日
			System.out.println("农历生日"+lunarBirthday);
			String nextSolarBirthday = BirthdayUtil.getNextSolarBirthday(solar_birthday);//下一次新历日期
			System.out.println("下一次新历日期"+nextSolarBirthday);
			String nextLunarBirthday = BirthdayUtil.getNextLunarBirthday(solar_birthday);//下一次农历新历日期
			System.out.println("下一次农历新历日期"+nextLunarBirthday);
			int solarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextSolarBirthday);//下一次新历生日天数
			System.out.println("下一次新历生日天数"+solarBetween);
			int lunarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextLunarBirthday);//下一次农历生日
			System.out.println("下一次农历历生日天数"+lunarBetween);
			pd.put("LUNAR_BRITHDAY", lunarBirthday);
			pd.put("NEXT_LUNAR_BRITHDAY", nextLunarBirthday);
			pd.put("NEXT_SOLAR_BRITHDAY", nextSolarBirthday);
			pd.put("NEXT_LB_DAYS", lunarBetween);
			pd.put("NEXT_SB_DAYS", solarBetween);
			appuserService.edit(pd);
		}else{
			appuserService.edit(pd);	
		}
		if((pdUser.get("SOLAR_BIRTHDAY") == null || "".equals(pdUser.get("SOLAR_BIRTHDAY").toString())) && (pd.get("SOLAR_BIRTHDAY")!=null && !"".equals(pd.get("SOLAR_BIRTHDAY").toString()))){
			return "2";
		}else {
			return "1";
		}
		
	}

	/**
	 * 购物车
	 */
	@RequestMapping(value = "/cart")
	public ModelAndView cart(HttpServletRequest request) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd.put("DELETE_STATUS", 0);
		List<PageData> cartList = cartService.listAll(pd);
		view.addObject("cartList", cartList);
		view.setViewName("lshapp/center/cart");
		return view;
	}

	/**
	 * 删除购物车单个商品
	 */
	@RequestMapping(value = "/delete_cart")
	public ModelAndView delete_cart(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		// 查询删除编号对应的购物车信息，判断是否为当前用户所拥有
		PageData cart = cartService.findById(pd);
		if (("" + user_id).equals(cart.get("USER_ID").toString())) {
			cartService.delete(pd);
		}
		List<PageData> cartList = cartService.listAll(pd);
		view.addObject("cartList", cartList);
		view.setViewName("lshapp/center/cart");
		return view;
	}
	/**
	 * 订单
	 */
	@RequestMapping(value = "/order")
	public ModelAndView order(Page page) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		Page page0 = new Page();
		Page page1 = new Page();
		Page page2 = new Page();
		Page page3 = new Page();
		Page page4 = new Page();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd.put("DELETE_STATUS", 0);
		List<PageData> orderList = null;
		List<PageData> orderList0 = null;
		List<PageData> orderList1 = null;
		List<PageData> orderList2 = null;
		List<PageData> orderList3 = null;
		List<PageData> orderList4 = null;
		Integer order_status=-1;
		if ("0".equals(pd.get("zww").toString())) {
			pd.put("ORDER_STATUS", null);
			page0.setPd(pd);
			page0.setCurrentPage(1);
			orderList0 = orderService.appOrdersList(page0);
			pd.put("ORDER_STATUS", "0");
			page1.setPd(pd);
			page1.setCurrentPage(1);
			orderList1 = orderService.appOrdersList(page1);
			pd.put("ORDER_STATUS", "1");
			page2.setCurrentPage(1);
			page2.setPd(pd);
			orderList2 = orderService.appOrdersList(page2);
			pd.put("ORDER_STATUS", "2");
			page3.setPd(pd);
			page3.setCurrentPage(1);
			orderList3 = orderService.appOrdersList(page3);
			pd.put("ORDER_STATUS", null);
			pd.put("ORDER_STATUS1", "dkfodfk");
			page4.setPd(pd);
			page4.setCurrentPage(1);
			orderList4 = orderService.appOrdersList(page4);
		} else {
			if(pd.get("ORDER_STATUS")!=null&&!"".equals(pd.get("ORDER_STATUS").toString())){
				order_status=Integer.valueOf(pd.get("ORDER_STATUS").toString());
				if("4".equals(pd.get("ORDER_STATUS"))){
					pd.put("ORDER_STATUS", null);
					pd.put("ORDER_STATUS1", "pppp");
				}else if("0".equals(pd.get("ORDER_STATUS"))){
					pd.put("ORDER_STATUS", null);
				}else{
					pd.put("ORDER_STATUS", Integer.valueOf(pd.get("ORDER_STATUS").toString())-1);
				}
			}
			page.setPd(pd);
			orderList0 = orderService.appOrdersList(page);
		}

		// 查询当前用户订单
		// List<PageData> orderList = orderService.appOrdersList(page);
		if ("1".equals(pd.get("zww").toString())) {
			List<PageData> orderNewList0 = new ArrayList<PageData>();
			orderList = orderList0;
			if (orderList.size() > 0) {
				for (PageData pageData : orderList) {
					// 查询订单对应的购物车
					PageData newpdcART = new PageData();
					newpdcART.put("ORDER_ID", pageData.get("ORDER_ID"));// 订单编号
					newpdcART.put("CREATE_DATE", pageData.get("CREATE_DATE"));// 下班时间
					newpdcART.put("FREIGHT_AMOUNT",
							pageData.get("FREIGHT_AMOUNT"));// 邮费
					newpdcART.put("REAL_PAY_AMOUNT",
							pageData.get("REAL_PAY_AMOUNT"));// 实付金额
					newpdcART.put("ORDER_STATUS", pageData.get("ORDER_STATUS"));// 订单状态
					PageData pdcART = new PageData();
					pdcART.put("USER_ID", user_id);
					pdcART.put("ORDER_ID", pageData.get("ORDER_ID"));
					List<PageData> cartList = cartService.listAllCartAndGoods(pdcART);
					List<PageData> goodsList = new ArrayList<PageData>();
					int AMOUNT = 0;
					if (cartList.size() > 0) {
						for (PageData pageData2 : cartList) {
							PageData goodsNew = new PageData();
							PageData goods = goodsService.findById(pageData2);
							goodsNew.put("GOODS_ID", pageData2.get("GOODS_ID"));// 商品ID
							goodsNew.put("GOODS_NAME", goods.get("GOODS_NAME"));// 商品名称
							goodsNew.put("PATH", goods.get("PATH"));// 商品小图
							goodsNew.put("AMOUNT", pageData2.get("AMOUNT"));// 商品数量
							goodsNew.put("SPEC", pageData2.get("SPEC"));// 商品规格
							goodsNew.put("GOODS_CURRENT_PRICE",
									pageData2.get("GOODS_CURRENT_PRICE"));// 商品现价
							goodsNew.put("GOODS_ORIGINAL_PRICE",
									pageData2.get("GOODS_ORIGINAL_PRICE"));// 商品原价
							goodsNew.put("GOODS_AMOUNT",
									pageData2.get("GOODS_AMOUNT"));// 商品金额
							goodsList.add(goodsNew);
							AMOUNT += Integer.parseInt(pageData2.get("AMOUNT").toString());
							newpdcART.put("goodsList", goodsList);
						}
					}
					newpdcART.put("AMOUNT", AMOUNT);// 邮费
					orderNewList0.add(newpdcART);
				}
			}
			if(pd.get("ORDER_STATUS")!=null&&!"".equals(pd.get("ORDER_STATUS").toString())){
				view.addObject("orderList"+order_status, orderNewList0);
				view.addObject("totalPage"+order_status, page.getTotalPage());
			}else{
				view.addObject("orderList0", orderNewList0);
				view.addObject("totalPage0", page.getTotalPage());

			}

		} else {
			for (int i = 0; i < 5; i++) {
				List<PageData> orderNewList0 = new ArrayList<PageData>();
				if (i == 0) {
					orderList = orderList0;
				}
				if (i == 1) {
					orderList = orderList1;
				}
				if (i == 2) {
					orderList = orderList2;
				}
				if (i == 3) {
					orderList = orderList3;
				}
				if (i == 4) {
					orderList = orderList4;
				}
				if (orderList.size() > 0) {
					for (PageData pageData : orderList) {
						// 查询订单对应的购物车
						PageData newpdcART = new PageData();
						newpdcART.put("ORDER_ID", pageData.get("ORDER_ID"));// 订单编号
						newpdcART.put("CREATE_DATE",
								pageData.get("CREATE_DATE"));// 下班时间
						newpdcART.put("FREIGHT_AMOUNT",
								pageData.get("FREIGHT_AMOUNT"));// 邮费
						newpdcART.put("REAL_PAY_AMOUNT",
								pageData.get("REAL_PAY_AMOUNT"));// 实付金额
						newpdcART.put("ORDER_STATUS",
								pageData.get("ORDER_STATUS"));// 订单状态
						PageData pdcART = new PageData();
						pdcART.put("USER_ID", user_id);
						pdcART.put("ORDER_ID", pageData.get("ORDER_ID"));
						List<PageData> cartList = cartService.listAllCartAndGoods(pdcART);
						List<PageData> goodsList = new ArrayList<PageData>();
						int AMOUNT = 0;
						if (cartList.size() > 0) {
							for (PageData pageData2 : cartList) {
								PageData goodsNew = new PageData();
								PageData goods = goodsService
										.findById(pageData2);
								goodsNew.put("GOODS_ID",
										pageData2.get("GOODS_ID"));// 商品ID
								goodsNew.put("GOODS_NAME",
										goods.get("GOODS_NAME"));// 商品名称
								goodsNew.put("PATH", goods.get("PATH"));// 商品小图
								goodsNew.put("AMOUNT", pageData2.get("AMOUNT"));// 商品数量
								goodsNew.put("SPEC", pageData2.get("SPEC"));// 商品规格
								goodsNew.put("GOODS_CURRENT_PRICE",
										pageData2.get("GOODS_CURRENT_PRICE"));// 商品现价
								goodsNew.put("GOODS_ORIGINAL_PRICE",
										pageData2.get("GOODS_ORIGINAL_PRICE"));// 商品原价
								goodsNew.put("GOODS_AMOUNT",
										pageData2.get("GOODS_AMOUNT"));// 商品金额
								goodsList.add(goodsNew);
								AMOUNT += Integer.parseInt(pageData2.get(
										"AMOUNT").toString());
								newpdcART.put("goodsList", goodsList);
							}
						}
						newpdcART.put("AMOUNT", AMOUNT);// 邮费
						orderNewList0.add(newpdcART);
					}
				}
				if (i == 0) {
					view.addObject("orderList0", orderNewList0);
					view.addObject("totalPage0", page0.getTotalPage());
				}
				if (i == 1) {
					view.addObject("orderList1", orderNewList0);
					view.addObject("totalPage1", page1.getTotalPage());
				}
				if (i == 2) {
					view.addObject("orderList2", orderNewList0);
					view.addObject("totalPage2", page2.getTotalPage());
				}
				if (i == 3) {
					view.addObject("orderList3", orderNewList0);
					view.addObject("totalPage3", page3.getTotalPage());
				}
				if (i == 4) {
					view.addObject("orderList4", orderNewList0);
					view.addObject("totalPage4", page4.getTotalPage());
				}
			}
		}
		if ("1".equals(pd.get("currentPage").toString())) {
			if ("1".equals(pd.get("zww").toString())) {
				view.setViewName("lshapp/center/drop_down_order_more");
			} else {
				view.setViewName("lshapp/center/order");
			}
		} else {
			view.setViewName("lshapp/center/drop_down_order_more");
		}
		return view;
	}

	/**
	 * 取消订单
	 */
	@RequestMapping(value = "/abolish_order")
	public ModelAndView abolish_order(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData order = orderService.findById(pd);
		Integer user_id = Jurisdiction.getAppUserId();
		if ((user_id + "").equals(order.get("USER_ID").toString())) {
			pd.put("DELETE_STATUS", 1);
			orderService.edit(pd);
		}
		PageData pdP = new PageData();
		pdP.put("USER_ID", user_id);
		pdP.put("DELETE_STATUS", 0);
		List<PageData> orderList = orderService.listAll(pdP);
		view.addObject("orderList", orderList);
		if (pd.get("ORDER_STATUS") != null
				&& !"".equals(pd.get("ORDER_STATUS"))) {
			pd.put("ORDER_STATUS", pd.get("ORDER_STATUS"));
		} else {
			pd.put("ORDER_STATUS", -1);
		}
		view.addObject("pd", pd);
		view.setViewName("lshapp/center/order");
		return view;
	}

	/**
	 * 推广码
	 */
	@RequestMapping(value = "/code")
	public ModelAndView code(HttpServletRequest request) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdUser = appuserService.findById(pd);
		view.addObject("pd", pdUser);
		view.setViewName("lshapp/center/code");
		return view;
	}

	/**
	 * 初始化收藏列表 ----> 收藏
	 */
	@RequestMapping(value = "/favorite")
	public ModelAndView favorite(Page page) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Page page1 = new Page();
		Page page2 = new Page();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		String COLLECTION_TYPE = pd.get("COLLECTION_TYPE").toString();
		List<PageData> pdUser1 = new ArrayList<PageData>();
		List<PageData> pdUser2 = new ArrayList<PageData>();
		if ("3".equals(pd.get("COLLECTION_TYPE").toString())) {
			pd.put("COLLECTION_TYPE1", "NIHAI");
			pd.put("COLLECTION_TYPE", "1");
			page1.setPd(pd);
			pdUser1 = collectionService.appCollectionsList(page1);
			pd.put("COLLECTION_TYPE1", "");
			pd.put("COLLECTION_TYPE", "0");
			page2.setPd(pd);
			pdUser2 = collectionService.appCollectionsList(page2);
			view.addObject("goodsList", pdUser2);
			view.addObject("articleList", pdUser1);
			view.addObject("totalPage1", page1.getTotalPage());
			view.addObject("totalPage2", page2.getTotalPage());
		} else {
			if ("1".equals(pd.get("COLLECTION_TYPE").toString())) {
				pd.put("COLLECTION_TYPE1", "NIHAI");
				page.setPd(pd);
				pdUser1 = collectionService.appCollectionsList(page);
				view.addObject("articleList", pdUser1);
				view.addObject("totalPage1", page.getTotalPage());
			} else {
				page.setPd(pd);
				pdUser1 = collectionService.appCollectionsList(page);
				view.addObject("goodsList", pdUser1);
				view.addObject("totalPage2", page.getTotalPage());
			}
		}
		if ("3".equals(COLLECTION_TYPE)) {
			view.setViewName("lshapp/center/favorite");
		} else {
			view.setViewName("lshapp/center/drop_down_favorite_more");
		}
		return view;
	}

	/**
	 * 删除收藏
	 */
	@RequestMapping(value = "/delete_favorite")
	public ModelAndView delete_favorite(HttpServletRequest request, Page page,HttpServletResponse response)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		collectionService.delete(pd);
		List<PageData> pdUser1 = new ArrayList<PageData>();
		if ("1".equals(pd.get("COLLECTION_TYPE").toString())) {
			pd.put("COLLECTION_TYPE1", "NIHAI");
			page.setPd(pd);
			pdUser1 = collectionService.appCollectionsList(page);
			view.addObject("articleList", pdUser1);
			view.addObject("totalPage1", page.getTotalPage());
		} else {
			page.setPd(pd);
			pdUser1 = collectionService.appCollectionsList(page);
			view.addObject("goodsList", pdUser1);
			view.addObject("totalPage2", page.getTotalPage());
		}
		view.setViewName("lshapp/center/drop_down_favorite_more");
		return view;
	}
	/**
	 * 删除收藏
	 */
	/*@RequestMapping(value = "/delete_favorite")
	public void delete_favorite(HttpServletRequest request, Page page,HttpServletResponse response)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		collectionService.delete(pd);
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		response.sendRedirect(basePath + "lshapp/userCenter/favorite.do?COLLECTION_TYPE="+3+"&currentPage=1");
	}*/

	/**
	 * 收货地址列表
	 */
	@RequestMapping(value = "/user_address")
	public ModelAndView address(HttpServletRequest request) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		List<PageData> pdUser = addressService.listAll(pd);
		// 订单提交界面跳转到收货地址列表
		if (pd.get("type") != null && !pd.get("type").toString().equals("")) {
			view.addObject("type", pd.get("type").toString());
		} else {
			view.addObject("type", "");
		}
		view.addObject("pd", pdUser);
		view.addObject("no", pdUser.size());
		view.setViewName("lshapp/center/user_address");
		return view;
	}

	/**
	 * 去新增收货地址页面
	 */
	@RequestMapping(value = "/add_user_address")
	public ModelAndView add_user_address(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 订单提交界面跳转到收货地址列表
		if (pd.get("type") != null && !pd.get("type").toString().equals("")) {
			pd.put("type", pd.get("type").toString());
		} else {
			pd.put("type", "");
		}
		view.addObject("pd", pd);
		view.setViewName("lshapp/center/add_user_address");
		return view;
	}

	/**
	 * 编辑收货地址
	 */
	@RequestMapping(value = "/goEdit_address")
	public ModelAndView goEdit_address(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdUser = addressService.findById(pd);
		// 订单提交界面跳转到收货地址列表
		if (pd.get("type") != null && !pd.get("type").toString().equals("")) {
			pdUser.put("type", pd.get("type").toString());
		} else {
			pdUser.put("type", "");
		}
		view.addObject("user", pd);
		view.addObject("pd", pdUser);
		view.setViewName("lshapp/center/add_user_address");
		return view;
	}

	/**
	 * 删除收货地址
	 */
	@RequestMapping(value = "/delete_address")
	public ModelAndView delete_address(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdQQ = new PageData();
		PageData pdUserDelete = addressService.findById(pd);
		if (!pdUserDelete.isEmpty()) {
			if ("0".equals(pdUserDelete.get("IS_DEFAULT_ADDRESS").toString())) {// 如果当前地址为非默认直接删除
				addressService.delete(pd);
			} else {
				addressService.delete(pd);
				PageData pdP = new PageData();
				pdP.put("IS_DEFAULT_ADDRESS", 0);
				pdP.put("USER_ID", user_id);
				List<PageData> pdUser = addressService.listAll(pdP);
				if (pdUser.size() > 0) {
					for (PageData pageData : pdUser) {
						pdQQ.put("IS_DEFAULT_ADDRESS", "1");
						pdQQ.put("ADDRESS_ID", pageData.get("ADDRESS_ID"));
						addressService.edit(pdQQ);
						break;
					}
				}
			}
		}
		List<PageData> pdUser = addressService.listAll(pd);
		view.addObject("pd", pdUser);
		view.addObject("no", pdUser.size());
		view.setViewName("lshapp/center/user_address");
		return view;
	}

	/**
	 * 保存收货地址
	 */
	@RequestMapping(value = "/save_address")
	@ResponseBody
	public Object save_address(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		if (pd.get("ADDRESS_ID") != null
				&& !"".equals(pd.get("ADDRESS_ID").toString())) {
			try {
				addressService.edit(pd);
				map.put("msg", "ok");
			} catch (Exception e) {
				map.put("msg", "no");
			}
		} else {
			List<PageData> judge = addressService.listAll(pd);
			if (judge.size() == 0) {
				pd.put("IS_DEFAULT_ADDRESS", 1); // 设置为默认地址
			} else {
				pd.put("IS_DEFAULT_ADDRESS", 0); // 添加新地址
			}
			pd.remove("ADDRESS_ID");
			pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
			pd.put("DELETE_STATUS", 0); // 删除状态
			try {
				addressService.save(pd);
				map.put("msg", "ok");
			} catch (Exception e) {
				map.put("msg", "no");
			}
		}
		return map;
	}

	/**
	 * 改变默认收货地址
	 */
	@RequestMapping(value = "/update_default_address")
	@ResponseBody
	public Object update_default_address(HttpServletRequest request)
			throws Exception {
		PageData pd = new PageData();
		PageData pdQ = new PageData();
		PageData pdQQ = new PageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		Object id = "";
		pd = this.getPageData();
		if ("0".equals(pd.get("IS_DEFAULT_ADDRESS"))) {// 当前非默认，修改为默认
			PageData pdN = new PageData();
			pdN.put("USER_ID", user_id);
			pdN.put("IS_DEFAULT_ADDRESS", 1);
			PageData pdUser = addressService.findById(pdN);
			pdQ.put("IS_DEFAULT_ADDRESS", "0");
			pdQ.put("ADDRESS_ID", pdUser.get("ADDRESS_ID"));
			id = pdUser.get("ADDRESS_ID");
			addressService.edit(pdQ);// 修改之前的默认地址为非
			pd.put("IS_DEFAULT_ADDRESS", "1");
			addressService.edit(pd);// 修改当前的地址为默认
		} else {// 当前默认，修改为非默认
			pdQ.put("IS_DEFAULT_ADDRESS", "0");
			pdQ.put("ADDRESS_ID", pd.get("ADDRESS_ID"));
			addressService.edit(pdQ);// 修改当前的默认地址为非
			List<PageData> pdUser = addressService.listAll(pd);
			for (PageData pageData : pdUser) {
				if (0 == (Integer) pageData.get("IS_DEFAULT_ADDRESS")) {
					if (!("" + (Integer) pageData.get("ADDRESS_ID")).equals(pd
							.get("ADDRESS_ID"))) {
						pdQQ.put("IS_DEFAULT_ADDRESS", "1");
						pdQQ.put("ADDRESS_ID", pageData.get("ADDRESS_ID"));
						addressService.edit(pdQQ);
						id = pageData.get("ADDRESS_ID");
						break;
					}
				}
			}
		}
		return id;
	}

	/**
	 * 收货地址地区方法 获取省市区 传对应的参数
	 */
	@RequestMapping(value = "/selelct_area")
	@ResponseBody
	public List<PageData> selelct_area(HttpServletRequest request)
			throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> pdList = areaService.listAll(pd);
		return pdList;
	}

	/**
	 * 去修改密码页面
	 */
	@RequestMapping(value = "/go_update_password")
	public ModelAndView go_update_password(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd = appuserService.findById(pd);
		view.addObject("pd", pd);
		view.setViewName("lshapp/center/update_password");
		return view;
	}
	/**
	 * 判断原密码是否想等
	 */
	@RequestMapping(value="/judge_password")
	@ResponseBody
	public String judge_password(HttpServletRequest request,String PASSWORD)throws Exception{
		PageData pd = new PageData();
		//pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd = appuserService.findById(pd);
		PASSWORD = new SimpleHash("SHA-1",PASSWORD).toString();	//密码加密
		String re="";
		if(PASSWORD.equals(pd.get("PASSWORD").toString()))
			re= "success";
		else
			re= "fail";
		return re;
	}
	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/update_password")
	@ResponseBody
	public String update_password(HttpServletRequest request) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		String PASSWORD = new SimpleHash("SHA-1",pd.get("PASSWORD").toString()).toString();	//密码加密
		pd.put("PASSWORD", PASSWORD);
		appuserService.edit(pd);
		return "success";
	}

	/**
	 * 去商品评论页面 参数订单编号
	 */
	@RequestMapping(value = "/go_goods_comment")
	public ModelAndView go_goods_comment(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd = cartService.findByIdIsNotNull(pd);
		if (pd != null) {
			if ((user_id + "").equals(pd.get("USER_ID").toString())) {// 判断评论订单是否为该用户所有
				view.addObject("pd", pd);
				view.setViewName("lshapp/center/goods_comment");
			} else {// 判断失败跳到登陆界面
				view.setViewName("lshapp/user_login");
			}
		} else {
			view.setViewName("lshapp/user_login");
		}

		return view;
	}

	/**
	 * 保存订单评论
	 */
	@RequestMapping(value = "/save_goods_comment")
	public void save_goods_comment(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData cartPd = cartService.findByIdIsNotNull(pd);
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
		pd.put("DELETE_STATUS", 0); // 删除状态
		pd.put("GOODS_ID", cartPd.get("GOODS_ID")); //
		goodscommentService.save(pd);
		//修改购物车为已经评论
		cartPd.put("IS_COMMENT", 1);
		cartService.editCartIsC(cartPd);
		PageData pdN = new PageData();
		pdN.put("ORDER_ID", cartPd.get("ORDER_ID"));
		List<PageData> updateOrder=cartService.listAllCartAndGoods(pdN);
		int j=0;
		for (PageData pageData : updateOrder) {
			if("0".equals(pageData.get("IS_COMMENT").toString())){
				j=1;
				break;
			}
		}
		if(j==0){
			//修改订单状态为已完成
			pdN.put("ORDER_STATUS", 4);
			orderService.edit(pdN);
		}

		List<PageData> picture = new ArrayList<PageData>();
		if (pd.get("PICTURE_ID") != null && !"".equals(pd.get("PICTURE_ID"))) {
			String picture_id = pd.get("PICTURE_ID").toString();
			String[] split = picture_id.split(",");
			for (int i = 0; i < split.length; i++) {
				PageData ps = new PageData();
				ps.put("PICTURE_ID", split[i]);
				ps.put("GOODSCOMMENT_ID", pd.get("GOODSCOMMENT_ID"));
				picture.add(ps);
			}
			goodscommentpictureService.listPicture(picture);
		}

		view.setViewName("lshapp/center/goods_comment");
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		response.sendRedirect(basePath + "lshapp/order/goOrderDetail.do?orderId="+cartPd.get("ORDER_ID"));
	}

	/**
	 * 去领取抽到的奖品页面
	 *
	 */
	@RequestMapping(value = "/go_get_award")
	public ModelAndView go_get_award(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		view.setViewName("lshapp/center/go_get_award");
		return view;
	}

	/**
	 * 去礼豆详情页面
	 */
	@RequestMapping(value = "/go_integration_details")
	public ModelAndView go_integration_details(Page page) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd.put("showCount", 20);
		PageData pdt = new PageData();
		pdt.put("USER_ID", user_id);
		pdt.put("RECORD_TYPE", 0);
		PageData todayShouRuList = integrationrecordService.listTodayAll(pdt);
		pdt.put("RECORD_TYPE", 1);
		PageData todayZhiChuList = integrationrecordService.listTodayAll(pdt);
		Integer today = 0;
		Integer todayShouRu = 0;
		Integer todayZhiChu = 0;
		if(todayShouRuList!=null){
			if (todayShouRuList.get("AMOUNT") != null
					&& !todayShouRuList.get("AMOUNT").toString().equals("")) {
				todayShouRu = Integer.parseInt(todayShouRuList.get("AMOUNT")
						.toString());
			}
		}
		if(todayZhiChuList!=null){
			if (todayZhiChuList.get("AMOUNT") != null
					&& !todayZhiChuList.get("AMOUNT").toString().equals("")) {
				todayZhiChu = Integer.parseInt(todayZhiChuList.get("AMOUNT")
						.toString());
			}
		}
		today = todayShouRu - todayZhiChu;
		String currentPage = pd.get("currentPage").toString();
		Object lastStart = pd.get("lastStart");
		Object lastEnd = pd.get("lastEnd");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String nowTime1 = "";
		String nowTime2 = "";
		String zww = "";
		if (pd.get("lastStart") != null
				&& !"".equals(pd.get("lastStart").toString())) {
			Date date = format.parse(pd.get("lastStart").toString());
			nowTime1 = format.format(date);
			pd.put("lastStart", nowTime1);
			zww = "0";
		}
		if (pd.get("lastEnd") != null
				&& !"".equals(pd.get("lastEnd").toString())) {
			Date date = format.parse(pd.get("lastEnd").toString());
			nowTime2 = format.format(date);
			pd.put("lastEnd", nowTime2);
			zww = "0";
		}
		page.setPd(pd);
		page.setShowCount(20);

		List<PageData> integrationList = integrationrecordService
				.appIntegrationRecordList(page);
		pd = appuserService.findById(pd);
		if ("0".equals(zww)) {
			pd.put("lastEnd", nowTime2);
			pd.put("lastStart", nowTime1);
		} else {
			pd.put("lastEnd", format.format(new Date()));
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
			c.add(Calendar.MONTH, -1);
			Date m = c.getTime();
			pd.put("lastStart", format.format(m));
		}
		view.addObject("pd", pd);
		view.addObject("totalPage", page.getTotalPage());
		view.addObject("integrationList", integrationList);
		view.addObject("today", today);
		if ("1".equals(currentPage)) {
			if (lastStart != null || lastEnd != null) {
				view.setViewName("lshapp/center/drop_down_integration_more");
			} else {
				view.setViewName("lshapp/center/integration_details");
			}
		} else {
			view.setViewName("lshapp/center/drop_down_integration_more");
		}
		return view;
	}

	/**
	 * 去余额详情页面
	 */
	@RequestMapping(value = "/go_balance")
	public ModelAndView go_balance(Page page) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdt = new PageData();
		pdt.put("USER_ID", user_id);
		pdt.put("FINANCE_TYPE", 0);
		Integer todayShouRu = 0;
		PageData todayShuru = financeService.listTodayAll(pdt);
		if(todayShuru!=null){
			if (todayShuru.get("AMOUNT") != null
					&& !todayShuru.get("AMOUNT").toString().equals("")) {
				todayShouRu = Integer.parseInt(todayShuru.get("AMOUNT").toString());
			}
		}
		String currentPage = pd.get("currentPage").toString();
		Object lastStart = pd.get("lastStart");
		Object lastEnd = pd.get("lastEnd");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String nowTime1 = "";
		String nowTime2 = "";
		String zww = "";
		if (pd.get("lastStart") != null
				&& !"".equals(pd.get("lastStart").toString())) {
			Date date = format.parse(pd.get("lastStart").toString());
			nowTime1 = format.format(date);
			pd.put("lastStart", nowTime1);
			zww = "0";
		}
		if (pd.get("lastEnd") != null
				&& !"".equals(pd.get("lastEnd").toString())) {
			Date date = format.parse(pd.get("lastEnd").toString());
			nowTime2 = format.format(date);
			pd.put("lastEnd", nowTime2);
			zww = "0";
		}
		page.setPd(pd);
		page.setShowCount(20);
		List<PageData> financeList = financeService.appFinanceList(page);
		pd = appuserService.findById(pd);
		if ("0".equals(zww)) {
			pd.put("lastEnd", nowTime2);
			pd.put("lastStart", nowTime1);
		} else {
			pd.put("lastEnd", format.format(new Date()));
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
			c.add(Calendar.MONTH, -1);
			Date m = c.getTime();
			pd.put("lastStart", format.format(m));
		}
		view.addObject("totalPage", page.getTotalPage());
		view.addObject("pd", pd);
		view.addObject("today", todayShouRu);
		view.addObject("financeList", financeList);
		if ("1".equals(currentPage)) {
			if (lastStart != null || lastEnd != null) {
				view.setViewName("lshapp/center/drop_down_balance_more");
			} else {
				view.setViewName("lshapp/center/balance");
			}

		} else {
			view.setViewName("lshapp/center/drop_down_balance_more");
		}
		return view;
	}

	/**
	 * 去转出页面
	 */
	@RequestMapping(value = "/go_roll_out")
	public ModelAndView go_roll_out(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd = appuserService.findById(pd);
		view.addObject("pd", pd);
		view.setViewName("lshapp/center/go_roll_out");
		return view;
	}

	/**
	 * 去绑定支付宝账号页面
	 */
	@RequestMapping(value = "/go_binding")
	public ModelAndView go_binding(HttpServletRequest request) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd = appuserService.findById(pd);
		view.addObject("pd", pd);
		view.setViewName("lshapp/center/go_binding");
		return view;
	}

	/**
	 * 保存绑定支付宝账号
	 */
	@RequestMapping(value = "/save_binding_alipay")
	@ResponseBody
	public String save_binding_alipay(HttpServletRequest request)
			throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		appuserService.edit(pd);
		return "success";
	}

	/**
	 * 保存绑定支付宝账号
	 */
	@RequestMapping(value = "/pullrefresh_with_tab")
	public ModelAndView pullrefresh_with_tab(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		view.setViewName("lshapp/center/pullrefresh_with_tab");
		return view;
	}

	/**
	 * 保存绑定支付宝账号
	 */
	@RequestMapping(value = "/pullrefresh_with_tab1")
	public ModelAndView pullrefresh_with_tab1(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		view.setViewName("lshapp/center/pullrefresh_with_tab1");
		return view;
	}

	/**
	 * 保存绑定支付宝账号
	 */
	@RequestMapping(value = "/pullrefresh_with_tab2")
	public ModelAndView pullrefresh_with_tab2(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		view.setViewName("lshapp/center/pullrefresh_with_tab2");
		return view;
	}

	/**用户提现保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveWithdraw")
	@ResponseBody
	public String saveWithdraw() throws Exception{
		/*Integer appUserId = Jurisdiction.getAppUserId();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pds = new PageData();
		pds.put("USER_ID", appUserId);
		int money = 0;
		List<PageData> queryMoney = withdrawService.listAll(pds);
		if(queryMoney != null){
			for (int i = 0; i < queryMoney.size(); i++) {
				money += Integer.parseInt(queryMoney.get(i).get("AMOUNT").toString());
			}
			if(money > Integer.parseInt(pd.get("AMOUNT").toString())){
				return "defeated";
			}
		}else{
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String format = df.format(new Date());
			int x = (int)((Math.random()*9+1)*1000);
			pd = this.getPageData();
			pd.put("USER_ID", appUserId);
			pd.put("STATUS", 0);
			pd.put("DELETE_STATUS", 0);
			pd.put("WITHDRAW_ID", format+x);
			PageData findById = lshuserService.findById(pd);
			String nick_name = findById.get("NICK_NAME").toString();//用户昵称
			pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
			pd.put("REAL_NAME", nick_name);
			withdrawService.save(pd);
			return "success";
		}*/

		Integer appUserId = Jurisdiction.getAppUserId();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String format = df.format(new Date());
		int x = (int)((Math.random()*9+1)*1000);
		pd = this.getPageData();
		pd.put("USER_ID", appUserId);
		pd.put("STATUS", 0);
		pd.put("DELETE_STATUS", 0);
		pd.put("WITHDRAW_ID", format+x);
		PageData findById = lshuserService.findById(pd);
		String nick_name = findById.get("NICK_NAME").toString();//用户昵称
		pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
		pd.put("REAL_NAME", nick_name);
		withdrawService.save(pd);
		return "success";
	}
	/**
	 * 关于我们
	 */
	@RequestMapping(value = "/about_us")
	public ModelAndView about_us(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData>	varList = sysconfigService.listAll(pd);	//列出SysConfig列表
		for (PageData pageData : varList) {
			view.addObject("pd", pageData);
		}
		view.setViewName("lshapp/center/about_us");
		return view;
	}

}
