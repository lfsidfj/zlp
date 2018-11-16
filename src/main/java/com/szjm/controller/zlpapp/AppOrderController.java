package com.szjm.controller.zlpapp;

import com.szjm.service.zlp.address.AddressManager;
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.expresscompany.ExpressCompanyManager;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.goodssku.GoodsSkuManager;
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.order.OrderManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import spiderman.util.base.BaseUtil;
import spiderman.util.base.KdniaoTrackQueryAPI;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 说明：商品 创建人： 创建时间：2018-07-12
 */
@Controller
@RequestMapping(value = "/lshapp/order")
public class AppOrderController extends BaseAppController {

	// 收货地址
	@Resource(name = "addressService")
	private AddressManager addressService;
	// 商品SKU
	@Resource(name = "goodsskuService")
	private GoodsSkuManager goodsskuService;
	// 购物车
	@Resource(name = "cartService")
	private CartManager cartService;
	// 创建订单
	@Resource(name = "orderService")
	private OrderManager orderService;
	// 用户
	@Resource(name = "lshuserService")
	private LshUserManager lshuserService;
	// 系统参数
	@Resource(name = "sysconfigService")
	private SysConfigManager sysconfigService;
	// 商品
	@Resource(name = "goodsService")
	private GoodsManager goodsService;
	@Resource(name = "expresscompanyService")
	private ExpressCompanyManager expresscompanyService;// 快递公司
	// 礼豆明细
	@Resource(name = "integrationrecordService")
	private IntegrationRecordManager integrationrecordService;

	/**
	 * 订单提交界面
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@RequestMapping(value = "/submit")
	public ModelAndView search() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		// 当前选择不为空，保存在session中
		if (pd.get("ids") != null && !pd.get("ids").toString().equals("")) {
			SecurityUtils.getSubject().getSession()
					.setAttribute(user_id + "CART", pd);
		} else if (SecurityUtils.getSubject().getSession()
				.getAttribute(user_id + "CART") != null) { // 为空，获取session中的数据
			PageData cartData = (PageData) SecurityUtils.getSubject()
					.getSession().getAttribute(user_id + "CART");
			if (cartData != null && cartData.get("ids") != null) {
				if (pd.get("ids") != null
						&& !pd.get("ids").toString().equals("")) {
					pd.put("ids", pd.get("ids"));
				} else {
					pd.put("ids", cartData.get("ids"));
				}
			}
		}
		pd.put("USER_ID", user_id);
		String role = Jurisdiction.getAppUserRole(); // 当前用户角色
		if (pd.get("ADDRESS_ID") != null
				&& !pd.get("ADDRESS_ID").toString().equals("")) {
			pd.put("ADDRESS_ID", pd.get("ADDRESS_ID")); // 从地址列表选取的地址
		} else {
			pd.put("IS_DEFAULT_ADDRESS", 1); // 读取默认地址
		}
		PageData address = null; // 当前购物地址
		try {
			address = addressService.findById(pd);
		} catch (Exception e) {
			address = null; // 当前购物地址
		}

		// 普通用户、代理商、付费会员可以通过礼豆抵扣部分金额
		int integration = 0;// 当前用户所有礼豆
		int integration_rate = 0;// 1元对应的礼豆数量
		if (role.equals("common") || role.equals("agent")|| role.equals("members")) {
			PageData userPd = lshuserService.findById(pd); // 当前用户
			PageData config = sysconfigService.findById(pd); // 当前系统参数

			integration = Integer
					.parseInt(userPd.get("INTEGRATION").toString()); // 当前用户所有礼豆
			integration_rate = Integer.parseInt(config.get("INTEGRATION_RATE")
					.toString()); // 1元对应的礼豆数量
		}

		String[] chickIds = pd.get("ids").toString().split(","); // 购物车选中的子订单
		List<PageData> carList = new ArrayList<PageData>(); // 购物车数据
		double content = 0; // 购物车总价
		double discount = 0; // 购物车优惠价
		for (String id : chickIds) {
			if (id != null && !id.equals("")) {
				PageData cpd = new PageData();
				cpd.put("CART_ID", id);
				cpd.put("USER_ID", user_id);
				PageData cartData = cartService.findByIdOrder(cpd); // 查询购物车子订单
				PageData goods = goodsService.findById(cartData); // 当前购物车选择的商品
				carList.add(cartData); // 加入展示列表
				// 单个商品SKU价格
				double current_price;
				try {
					current_price = Double.parseDouble(cartData.get(
							"GOODS_CURRENT_PRICE").toString());
				} catch (Exception e) {
					current_price = 0.00;
				}
				// 购物车数量
				int amount = 0;
				try {
					amount = Integer
							.parseInt(cartData.get("AMOUNT").toString());
				} catch (Exception e) {
					amount = 0;
				}
				// 单个商品礼豆可抵扣金额
				double goods_dedection_money = Double.parseDouble(cartData.get(
						"GOODS_DEDUCTION_MONEY").toString());
				// 商品总原价（商品SKU价格*购物车数量）
				content = content + current_price * amount;

				if (role.equals("partner") || role.equals("vip")) { // 合伙人、VIP
					// 购买商品进行折扣价（商品SKU价格*（商品设置的折扣/100）*购物车商品数量）
					discount = discount
							+ current_price
							* (Double.parseDouble(cartData.get("DISCOUNT")
									.toString()) / 100) * amount;
				} else if (role.equals("common") || role.equals("agent")|| role.equals("members")) { // 普通用户、代理商可以通过礼豆抵扣部分金额
					// 当前子订单所需礼豆（单个商品礼豆可抵扣金额*1元对应的礼豆数量*购物车数量）
					int single = (int) ((goods_dedection_money * integration_rate) * amount);
					PageData edcPd = new PageData(); // 修改购物车礼豆折扣价
					edcPd.put("CART_ID", id);
					// 购物车实际支付金额（当前子订单总金额-当前子订单礼豆折扣金额）
					double real_pay = current_price * amount
							- goods_dedection_money * amount;
					if (integration - single >= 0) { // 用户礼豆充足
						// 总优惠价 = 总优惠价 + 当前子订单礼豆折扣金额
						discount = discount + goods_dedection_money * amount;
						// 用户当前礼豆 = 用户当前礼豆 - 减去当前子订单消耗的礼豆
						integration = integration - single;
						edcPd.put("INTEGRATION_AMOUNT", single); // 礼豆抵扣数量
						edcPd.put("DEDUCTION_MONEY", goods_dedection_money
								* amount); // 礼豆折扣金额
						edcPd.put("REAL_PAY_AMOUNT", real_pay); // 当前子订单实付金额
						cartService.editCartDeduction(edcPd);
					} else if (integration - single < 0 && integration >= 0) { // 用户礼豆不充足
						// 总优惠价 = 总优惠价 + (用户当前剩余礼豆/1元对应的礼豆数量)
						discount = discount + integration / integration_rate;
						edcPd.put("INTEGRATION_AMOUNT", integration); // 礼豆抵扣数量
						edcPd.put("DEDUCTION_MONEY", integration
								/ integration_rate); // 礼豆折扣金额
						edcPd.put("REAL_PAY_AMOUNT", real_pay); // 当前子订单实付金额
						cartService.editCartDeduction(edcPd);
						// 用户当前礼豆
						integration = 0;
					} else { // 无礼豆
						edcPd.put("INTEGRATION_AMOUNT", 0); // 礼豆抵扣数量
						edcPd.put("DEDUCTION_MONEY", 0); // 礼豆折扣金额
						edcPd.put("REAL_PAY_AMOUNT", real_pay); // 当前子订单实付金额
						cartService.editCartDeduction(edcPd);
					}

				}
				if (goods.get("GOODS_POSITION").toString().equals("3")) {
					discount = 0;
				}

			}
		}
		pd.put("goodsSize", carList.size()); // 商品数量
		pd.put("content", String.format("%.2f", content)); // 商品总价
		pd.put("discount", String.format("%.2f", discount)); // 商品优惠价格
		pd.put("real_pay_amount", String.format("%.2f", content - discount)); // 商品优惠价格
		mv.setViewName("lshapp/order_submit");
		mv.addObject("pd", pd);
		mv.addObject("address", address);// 默认地址
		mv.addObject("chickList", carList);// 购物车选中的子订单商品
		return mv;
	}

	/**
	 * 创建订单，返回支付信息，进行支付
	 * 
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value = "/createOrder")
	@ResponseBody
	public Object createOrder(HttpServletRequest request) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId(); // 当前用户ID
		String role = Jurisdiction.getAppUserRole(); // 当前用户角色
		pd.put("USER_ID", user_id);

		PageData config = sysconfigService.findById(pd); // 当前系统参数
		PageData userPd = lshuserService.findById(pd); // 当前用户
		PageData address = addressService.findById(pd); // 当前选择用户地址
		String[] chickIds = pd.get("ids").toString().split(","); // 购物车选中的子订单
		List<PageData> carList = new ArrayList<PageData>();
		double content = 0; // 商品总价
		double discount = 0; // 购物车优惠价
		int integration_amount = 0; // 使用礼豆数量
		for (String id : chickIds) {
			if (id != null && !id.equals("")) {
				PageData cpd = new PageData();
				cpd.put("CART_ID", id);
				cpd.put("USER_ID", user_id);
				PageData cartData = cartService.findByIdOrder(cpd); // 查询购物车子订单
				PageData goods = goodsService.findById(cartData); // 当前购物车选择的商品
				carList.add(cartData); // 购物车选中的子订单
				// 商品总原价（商品SKU价格*购物车数量）
				content = content
						+ Double.parseDouble(cartData
								.get("GOODS_CURRENT_PRICE").toString())
						* Integer.parseInt(cartData.get("AMOUNT").toString());

				// 单个商品SKU价格
				double current_price = Double.parseDouble(cartData.get(
						"GOODS_CURRENT_PRICE").toString());
				// 购物车数量
				int amount = Integer
						.parseInt(cartData.get("AMOUNT").toString());
				if (role.equals("partner") || role.equals("vip")) { // 合伙人、VIP
					// 购买商品进行折扣价（商品SKU价格*（商品设置的折扣/100）*购物车商品数量）
					discount = discount
							+ current_price
							* (Double.parseDouble(cartData.get("DISCOUNT")
									.toString()) / 100) * amount;
				} else if (role.equals("common") || role.equals("agent")|| role.equals("members")) { // 普通用户、代理商、付费会员可以通过礼豆抵扣部分金额
					// 礼豆抵扣部分金额
					discount = discount
							+ Double.parseDouble(cartData
									.get("DEDUCTION_MONEY").toString());
					integration_amount = integration_amount
							+ Integer.parseInt(cartData.get(
									"INTEGRATION_AMOUNT").toString());
				}
				if (goods.get("GOODS_POSITION").toString().equals("3")) {
					discount = 0;
				}
			}
		}
		long orderId = Long.parseLong(getOrderId()); // 产生订单Id
		long OUT_ORDER_ID = System.currentTimeMillis(); // 支付编号
		// 订单
		PageData orderPd = new PageData();
		orderPd.put("ORDER_ID", orderId);
		orderPd.put("GOODS_AMOUNT", content); // 商品总金额
		if (role.equals("partner") || role.equals("vip")) { // 合伙人、VIP
			orderPd.put("DEDUCTION_AMOUNT", 0); // 礼豆抵扣金额
			orderPd.put("INTEGRATION_AMOUNT", 0); // 使用礼豆数量
		} else if (role.equals("common") || role.equals("agent")|| role.equals("members")) { // 普通用户、代理商、付费会员可以通过礼豆抵扣部分金额
			orderPd.put("DEDUCTION_AMOUNT", discount); // 礼豆抵扣金额
			orderPd.put("INTEGRATION_AMOUNT", integration_amount); // 使用礼豆数量
		}
		orderPd.put("REAL_PAY_AMOUNT", content - discount); // 实付金额
		// 实付金额大于免邮金额
		if ((content - discount) > Double.parseDouble(config.get(
				"FREE_SHIPPING_AMOUNT").toString())) {
			orderPd.put("TOTAL_AMOUNT", content); // 订单总金额
			orderPd.put("FREIGHT_AMOUNT", 0); // 邮费
		} else {
			orderPd.put(
					"TOTAL_AMOUNT",
					Double.parseDouble(content
							+ config.get("POSTAGE").toString())); // 订单总金额(实付金额+邮费)
			orderPd.put("FREIGHT_AMOUNT", content); // 邮费
		}
		orderPd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
		orderPd.put("CREATE_USER", userPd.get("NICK_NAME").toString()); // 创建人
		orderPd.put("DELETE_STATUS", 0); // 删除状态
		orderPd.put("AREA_ID", address.get("AREA_ID")); // 收货地址
		orderPd.put("DETAILS_ADDRESS", address.get("DETAILS_ADDESS").toString()); // 详细地址
		orderPd.put("RECEIVER", address.get("NAME").toString()); // 收货人姓名
		orderPd.put("PHONE_NUMBER", address.get("PHONE_NUMBER").toString()); // 收货人联系电话
		orderPd.put("ORDER_STATUS", 0); // 订单状态
		orderPd.put("PAY_STATUS", 0); // 支付状态
		orderPd.put("OUT_ORDER_ID", OUT_ORDER_ID); // 支付编号
		orderPd.put("USER_ID", user_id); // 用户编号
		// 支付方式
		if (pd.get("payment").toString().equals("alipay")) {
			orderPd.put("PAY_WAY", 1); // 支付方式
		} else if (pd.get("payment").toString().equals("wxpay")) {
			orderPd.put("PAY_WAY", 2); // 支付方式
		}
		orderPd.put("PAY_TIME", Tools.date2Str(new Date())); // 支付时间

		orderService.createOrder(orderPd); // 产生订单
		// 修改购物车ID
		for (PageData cart : carList) {
			PageData editCPd = new PageData();
			editCPd.put("CART_ID", cart.get("CART_ID"));
			editCPd.put("ORDER_ID", orderId + "");
			cartService.editCartOrderId(editCPd);
		}
		// String.format("%.2f", (content - discount))
		Map<String, Object> result;
		try {
			result = (Map<String, Object>) orderService.getPayInfo(String.format("%.2f", (content - discount)),
					OUT_ORDER_ID + "", pd.get("payment").toString(),
					request.getRemoteAddr(), orderId);
			return WriteClientMessage("0", "成功", result);

		} catch (Exception e) {
			return WriteClientMessage("1", "失败", "");
		}
	}

	/**
	 * 支付成功去订单详情
	 */
	@RequestMapping(value = "/goOrderDetail")
	public ModelAndView goOrderDetail(HttpServletRequest request)
			throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId(); // 当前用户ID
		String role = Jurisdiction.getAppUserRole(); // 当前用户角色
		PageData config = sysconfigService.findById(pd); // 当前系统参数
		pd.put("USER_ID", user_id);
		pd.put("ORDER_ID", pd.get("orderId"));
		pd = orderService.orderDetail(pd); // 订单详情
		try {
			double real_pay = Double.parseDouble(pd.get("REAL_PAY_AMOUNT")
					.toString()); // 实付金额
			int return_tate = 0; // 消费1元所返回的礼豆数量
			try {
				return_tate = Integer.parseInt(config.get(
						"INTEGRATION_RETURN_RATE").toString());
			} catch (Exception e) {
				return_tate = 0;
			}
			if (role.equals("partner") || role.equals("vip")) { // 合伙人、VIP
				pd.put("order_tate", 0); // 返回礼豆数量
			} else if (role.equals("common") || role.equals("agent")|| role.equals("members")) { // 普通用户、代理商、付费会员可以通过礼豆抵扣部分金额
				pd.put("order_tate", (int) real_pay * return_tate); // 返回礼豆数量
			}
			pd.put("discount", String.format(
					"%.2f",
					Double.parseDouble(pd.get("TOTAL_AMOUNT").toString())
							- Double.parseDouble(pd.get("REAL_PAY_AMOUNT")
									.toString())));
			PageData pdC = new PageData();
			pdC.put("ORDER_ID", pd.get("ORDER_ID"));
			List<PageData> cartList = cartService.listAllCartAndGoods(pdC); // 订单购物车
			view.addObject("cartList", cartList);
			view.addObject("pd", pd);
			view.setViewName("lshapp/order_success");
		} catch (Exception e) {
		}
		return view;
	}

	/**
	 * 订单支付失败继续支付
	 *
	 * @throws Exception
	 */
	@RequestMapping(value = "/orderContinuePay")
	@ResponseBody
	public Object orderContinuePay(HttpServletRequest request) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId(); // 当前用户ID
		pd.put("USER_ID", user_id);
		pd.put("ORDER_ID", pd.get("orderId"));
		PageData orderPd = orderService.orderDetail(pd); // 订单详情
		String real_pay = orderPd.get("REAL_PAY_AMOUNT").toString(); // 实付金额
		long OUT_ORDER_ID = System.currentTimeMillis(); // 支付编号
		pd.put("OUT_ORDER_ID", OUT_ORDER_ID); // 支付编号
		Map<String, Object> result;
		try {
			result = (Map<String, Object>) orderService.getPayInfo(real_pay,
					OUT_ORDER_ID + "", pd.get("payment").toString(),
					request.getRemoteAddr(),
					Long.parseLong(orderPd.get("ORDER_ID").toString()));
			orderService.updadeOutOrderId(pd); // 订单取消或支付失败时再次支付更新支付编号
			// 移除session
			SecurityUtils.getSubject().getSession()
					.removeAttribute(user_id + "CART");
			return WriteClientMessage("0", "成功", result);
		} catch (Exception e) {
			return WriteClientMessage("1", "失败", "");
		}
	}

	/**
	 * 去礼豆兑换订单提交界面
	 */
	@RequestMapping(value = "/goExchangeSubmit")
	public ModelAndView goExchangeSubmit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		// 当前选择不为空，保存在session中
		if (pd.get("GOODS_ID") != null && pd.get("GOODS_ID").toString() != null
				&& pd.get("SKU_ID") != null
				&& pd.get("SKU_ID").toString() != null) {
			SecurityUtils.getSubject().getSession()
					.setAttribute(user_id + "GOODS", pd);
		} else if (SecurityUtils.getSubject().getSession()
				.getAttribute(user_id + "GOODS") != null) { // 为空，取session中的数据
			PageData goodsData = (PageData) SecurityUtils.getSubject()
					.getSession().getAttribute(user_id + "GOODS");
			if (goodsData != null && goodsData.get("GOODS_ID") != null) {
				pd.put("GOODS_ID", goodsData.get("GOODS_ID"));
				pd.put("SKU_ID", goodsData.get("SKU_ID"));
				pd.put("number", goodsData.get("number"));
			}
		}
		pd.put("USER_ID", user_id);
		if (pd.get("ADDRESS_ID") != null
				&& !pd.get("ADDRESS_ID").toString().equals("")) {
			pd.put("ADDRESS_ID", pd.get("ADDRESS_ID")); // 从地址列表选取的地址
		} else {
			pd.put("IS_DEFAULT_ADDRESS", 1); // 读取默认地址
		}
		PageData address = null; // 当前购物地址
		try {
			address = addressService.findById(pd);
		} catch (Exception e) {
			address = null; // 当前购物地址
		}
		PageData goods = goodsService.findById(pd); // 当前选中商品
		PageData sku = goodsskuService.findById(pd); // 当前选中SKU
		// 所需礼豆
		int neet_integration = Integer.parseInt(pd.get("number").toString())
				* Integer.parseInt(sku.get("INTEGRATION").toString());
		pd.put("neet_integration", neet_integration);
		mv.setViewName("lshapp/exchange_order_submit");
		mv.addObject("address", address);// 默认地址
		mv.addObject("goods", goods);// 商品
		mv.addObject("sku", sku);// 商品SKU
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 创建礼豆兑换商品订单
	 */
	@RequestMapping(value = "/createExchangeOrder")
	@ResponseBody
	public Object createExchangeOrder() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId(); // 当前用户ID
		pd.put("USER_ID", user_id);
		String orderId = getOrderId(); // 订单号
		PageData userPd = lshuserService.findById(pd); // 当前用户
		PageData goods = goodsService.findById(pd); // 商品
		PageData skuData = goodsskuService.findById(pd); // 选择的商品SKU
		PageData address = addressService.findById(pd); // 选择的地址
		// 所需礼豆
		int neet_integration = Integer.parseInt(pd.get("number").toString())
				* Integer.parseInt(skuData.get("INTEGRATION").toString());
		pd.put("INTEGRATION", neet_integration); // 减少的礼豆数量
		pd.put("AMOUNT", pd.get("number")); // 商品销量
		// 用户礼豆数
		int user_integration = Integer.parseInt(userPd.get("INTEGRATION")
				.toString());
		if (neet_integration <= user_integration) {
			double content = Double.parseDouble(skuData.get("GOODS_PRICE")
					.toString())
					* Integer.parseInt(pd.get("number").toString());
			PageData cpd = new PageData(); // 购物车
			cpd.put("USER_ID", user_id);
			cpd.put("TYPE", 0);
			cpd.put("IS_COMMENT", 0); // 评论状态
			cpd.put("GOODS_ID", goods.get("GOODS_ID").toString()); // 商品ID
			cpd.put("SPEC", skuData.get("SPECVALUE_NAME").toString()); // 规格值名称
			cpd.put("GOODS_CURRENT_PRICE", skuData.get("GOODS_PRICE")
					.toString()); // 当前规格单价
			cpd.put("AMOUNT", pd.get("number").toString()); // 数量
			cpd.put("DELETE_STATUS", 0); // 删除状态
			cpd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
			cpd.put("GOODS_ORIGINAL_PRICE", goods.get("ORIGINAL_PRICE")
					.toString()); // 商品原单价
			cpd.put("GOODS_POSITION", goods.get("GOODS_POSITION").toString()); // 商品类型
			cpd.put("GOODS_AMOUNT", String.format("%.2f", content)); // 商品金额
			cpd.put("INTEGRATION_AMOUNT", skuData.get("INTEGRATION").toString()); // 当前sku可使用礼豆数量
			cpd.put("DEDUCTION_MONEY", neet_integration); // 礼豆抵扣金额
			cpd.put("ORDER_ID", orderId); // 礼豆抵扣金额
			cpd.put("REAL_PAY_AMOUNT", 0); // 订单总金额

			PageData orderPd = new PageData();
			orderPd.put("ORDER_ID", orderId);
			orderPd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
			orderPd.put("CREATE_USER", userPd.get("NICK_NAME").toString()); // 创建人
			orderPd.put("DELETE_STATUS", 0); // 删除状态
			orderPd.put("AREA_ID", address.get("AREA_ID")); // 收货地址
			orderPd.put("DETAILS_ADDRESS", address.get("DETAILS_ADDESS")
					.toString()); // 详细地址
			orderPd.put("RECEIVER", address.get("NAME").toString()); // 收货人姓名
			orderPd.put("PHONE_NUMBER", address.get("PHONE_NUMBER").toString()); // 收货人联系电话
			orderPd.put("ORDER_STATUS", 1); // 订单状态
			orderPd.put("PAY_STATUS", 1); // 支付状态
			orderPd.put("OUT_ORDER_ID", 0); // 支付编号
			orderPd.put("USER_ID", user_id); // 用户编号
			orderPd.put("TOTAL_AMOUNT", 0); // 订单总金额
			orderPd.put("FREIGHT_AMOUNT", 0); // 邮费
			orderPd.put("PAY_WAY", 3); // 支付方式-礼豆支付
			orderPd.put("PAY_TIME", Tools.date2Str(new Date())); // 支付时间
			orderPd.put("INTEGRATION_AMOUNT", neet_integration); // 使用礼豆数量
			orderPd.put("GOODS_AMOUNT", content); // 商品总金额
			orderPd.put("TOTAL_AMOUNT", content); // 订单总金额
			orderPd.put("REAL_PAY_AMOUNT", 0); // 订单总金额
			// 礼豆消费记录
			PageData pdIn = new PageData();
			pdIn.put("USER_ID", user_id);
			pdIn.put("RECORD_TYPE", 1);
			pdIn.put("AMOUNT", neet_integration);
			pdIn.put("DELETE_STATUS", 0);
			pdIn.put("INCOME_REASON", 4);
			pdIn.put("CREATE_DATE", Tools.date2Str(new Date()));
			pdIn.put("ORDER_ID", orderId);
			try {
				orderService.createOrder(orderPd); // 产生订单
				cartService.addCart(cpd); // 加入购物车
				lshuserService.updateIntegration(pd); // 修改用户礼豆数量
				goodsskuService.editInventory(pd); // 修改库存
				goodsService.editVolume(pd); // 修改 商品销量
				integrationrecordService.save(pdIn);// 保存礼豆消耗记录
				map.put("msg", "ok");
				map.put("orderId", orderId);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", "no");
			}
		} else {
			map.put("msg", "noEnough");
		}

		return map;
	}

	/**
	 * 收货地址列表
	 */
	@RequestMapping(value = "/order_address")
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
		view.setViewName("lshapp/order_address");
		return view;
	}

	/**
	 * 产生订单Id
	 * */
	private String getOrderId() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String format = df.format(new Date());
		int x = (int) (Math.random() * 90 + 10);
		return format + x;
	}

	/**
	 * 查看物流 参数订单编号
	 */
	@RequestMapping(value = "/logistics")
	public ModelAndView logistics(HttpServletRequest request) throws Exception {
		ModelAndView view = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = orderService.informationFindById(pd); // 根据ID读取
		PageData pdC = new PageData();
		if (pd.get("EXPRESSCOMPANY_ID") != null
				&& !"".equals(pd.get("EXPRESSCOMPANY_ID").toString())) {
			pdC.put("EXPRESSCOMPANY_ID", pd.get("EXPRESSCOMPANY_ID"));// 快递公司编号
			PageData pdE = expresscompanyService.findById(pdC);
			if ((pd.getString("EXPRESS_NO") != null && !"".equals(pd.getString(
					"EXPRESS_NO").toString()))) {
				String wl = pd.getString("EXPRESS_NO");// 物流编号
				String kdgsywjc = pdE.getString("CODE");// 快递公司大写英文简称
				KdniaoTrackQueryAPI api = new KdniaoTrackQueryAPI();
				String result = api.getOrderTracesByJson(kdgsywjc, wl);
				Map<String, Object> json = BaseUtil
						.parseJson(result, Map.class);
				view.addObject("json", json.get("Traces"));
			} else {
				view.addObject("json", null);
			}
		} else {
			view.addObject("json", null);
		}
		view.setViewName("lshapp/logistics");
		return view;
	}

	/**
	 * 抽奖修改购物车参数
	 *
	 */
	@RequestMapping(value = "/update_cart")
	@ResponseBody
	public String save_binding_alipay(HttpServletRequest request)
			throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pd1 = goodsskuService.findById(pd);
		pd.put("SPEC", pd1.get("SPECVALUE_NAME"));
		cartService.editCartSPEC(pd);
		return "success";
	}

	/**
	 * 取消订单
	 *
	 */
	@RequestMapping(value = "/cancel_order")
	@ResponseBody
	public String cancel_order() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData order = orderService.findById(pd);
		if (order != null) {
			pd.put("DELETE_STATUS", 1);
			orderService.edit(pd);
			return "success";
		} else {
			return "error";
		}
	}

	/**
	 * 确认收货
	 *
	 */
	@RequestMapping(value = "/confirm_goods")
	@ResponseBody
	public String confirm_goods() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData order = orderService.findById(pd);
		if (order != null) {
			pd.put("ORDER_STATUS", 3);
			orderService.edit(pd);
			return "success";
		} else {
			return "error";
		}
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}
