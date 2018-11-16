package com.szjm.service.zlp.order.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import spiderman.alipay.util.AlipayInterfaceInvokeUtil;
import spiderman.wechat.domain.param.UnifiedOrderSend;
import spiderman.wechat.domain.result.UnifiedOrderResult;
import spiderman.wechat.util.AppWechatInterfaceInvokeUtil;
import spiderman.wechat.util.SignUtil;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.finance.FinanceManager;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.goodssku.GoodsSkuManager;
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.order.OrderManager;
import com.szjm.util.PageData;
import com.szjm.util.Tools;

/**
 * 说明： 订单管理 创建人： 创建时间：2018-07-11
 * 
 * @version
 */
@Service("orderService")
public class OrderService implements OrderManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name = "financeService")
	private FinanceManager financeService;
	@Resource(name = "integrationrecordService")
	private IntegrationRecordManager integrationrecordService;
	// 用户
	@Resource(name = "lshuserService")
	private LshUserManager lshuserService;
	// 商品SKU
	@Resource(name = "goodsskuService")
	private GoodsSkuManager goodsskuService;
	// 购物车
	@Resource(name = "cartService")
	private CartManager cartService;
	// 商品
	@Resource(name = "goodsService")
	private GoodsManager goodsService;

	/**
	 * 新增
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception {
		dao.save("OrderMapper.save", pd);
	}

	/**
	 * 删除
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("OrderMapper.delete", pd);
	}

	/**
	 * 修改
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("OrderMapper.edit", pd);
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrderMapper.datalistPage",
				page);
	}

	/**
	 * 移动端订单列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> appOrdersList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrderMapper.datalistPage1",
				page);
	}

	/**
	 * 列表(全部)
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OrderMapper.listAll", pd);
	}

	/**
	 * 通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrderMapper.findById", pd);
	}

	/**
	 * 通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData informationFindById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrderMapper.informationFindById",
				pd);
	}

	/**
	 * 批量删除
	 * 
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("OrderMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 订单完成
	 * 
	 * @throws Exception
	 * 
	 */
	public void finishOrder(String out_order_id) throws Exception {
		PageData order = new PageData(); // 订单
		PageData user = new PageData(); // 当前订单用户
		PageData pdIn = new PageData(); // 礼豆明细
		order.put("OUT_ORDER_ID", out_order_id);
		order = findById(order);
		user.put("USER_ID", order.get("USER_ID"));
		// 有使用礼豆
		if (!order.get("INTEGRATION_AMOUNT").toString().equals("0")) {
			pdIn.put("USER_ID", order.get("USER_ID"));
			pdIn.put("RECORD_TYPE", 1); // 状态支出
			pdIn.put("DELETE_STATUS", 0);
			pdIn.put("INCOME_REASON", 4); // 类型订单支出
			pdIn.put("CREATE_DATE", Tools.date2Str(new Date()));
			pdIn.put("ORDER_ID", order.get("ORDER_ID"));
			pdIn.put("AMOUNT", order.get("INTEGRATION_AMOUNT"));// 使用礼豆数量
			integrationrecordService.save(pdIn);// 保存礼豆消耗记录
		}
		// 如果为待支付
		if (order != null && "0".equals(order.get("ORDER_STATUS").toString())) {
			order.put("ORDER_STATUS", 1);
			order.put("PAY_STATUS", 1);
			edit(order);
			// 分润
			financeService.shareMoney(order);
			// 修改用户礼豆数量
			order.put("INTEGRATION", order.get("INTEGRATION_AMOUNT"));
			lshuserService.updateIntegration(order);
			List<PageData> cartList = cartService.listAllCartAndGoods(order); // 订单购物车
			for (PageData cart : cartList) {
				cart.put("number", cart.get("AMOUNT"));
				goodsskuService.editInventory(cart); // 修改库存
				goodsService.editVolume(cart); // 修改 商品销量
				// 礼豆返回
				integrationrecordService.addIntegrationRecord(cart);
				// 购买代理商礼包
				if (cart.get("GOODS_POSITION").toString().equals("4")) {
					user.put("ROLE", "agent");
				} else if (cart.get("GOODS_POSITION").toString().equals("5")) {// 购买VIP礼包
					user.put("ROLE", "vip");
				} else if (cart.get("GOODS_POSITION").toString().equals("6")) {// 合伙人礼包
					user.put("ROLE", "partner");
				} else if (cart.get("GOODS_POSITION").toString().equals("7")) {// 付费会员礼包
					user.put("ROLE", "members");
				}
				lshuserService.edit(user);
			}
		}
	}

	/**
	 * 获取支付信息
	 * 
	 * @param real_pay
	 *            支付金额
	 * @param out_order_id
	 *            支付编号
	 * @param pay_type
	 *            支付类型，alipay：支付宝支付，wxpay：微信支付
	 * @param ipAddress
	 *            客户端ip地址
	 * @param order_id
	 *            订单编号
	 * @return
	 */
	public Object getPayInfo(String real_pay, String out_order_id,
			String pay_type, String ipAddress, long order_id) {
		/* real_pay=Double.valueOf(CommUtil.formatMoney(real_pay)).toString(); */
		if ("alipay".equals(pay_type)) {
			Map<String, Object> aliResult = new HashMap<String, Object>();
			aliResult.put("paytype", "alipay");
			String alipayMessge = AlipayInterfaceInvokeUtil.AlipayTradeAppPay(
					"礼尚汇商品", "礼尚汇支付", out_order_id, real_pay);
			aliResult.put("alipaymessge", alipayMessge
					.replaceAll("\u003d", "=").replaceAll("\u0026", "&"));
			aliResult.put("order_id", order_id);
			return aliResult;
		} else if ("wxpay".equals(pay_type)) {
			UnifiedOrderSend unifiedOrderSend = new UnifiedOrderSend();
			// send.set
			unifiedOrderSend.setBody("礼尚汇商品");
			unifiedOrderSend.setOut_trade_no(out_order_id);
			Double realPay = Double.valueOf(real_pay) * 100;
			real_pay = realPay.toString();
			String fee = real_pay;
			if (fee.contains(".")) {
				fee = fee.substring(0, fee.indexOf("."));
			}
			unifiedOrderSend.setTotal_fee(Integer.valueOf(fee));
			unifiedOrderSend.setSpbill_create_ip(ipAddress);
			unifiedOrderSend.setTrade_type("APP");
			UnifiedOrderResult result = AppWechatInterfaceInvokeUtil
					.unifiedOrder(unifiedOrderSend);
			Map<String, Object> wxResult = SignUtil.signOrderResult4App(result);
			wxResult.put("paytype", "wxpay");
			wxResult.put("order_id", order_id);
			return wxResult;
		} else {
			return null;
		}
	}

	/**
	 * 用户创建订单
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void createOrder(PageData pd) throws Exception {
		dao.save("OrderMapper.createOrder", pd);
	}

	/**
	 * 用户获取订单详情
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData orderDetail(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrderMapper.orderDetail", pd);
	}

	/**
	 * 订单取消或支付失败时再次支付更新支付编号
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void updadeOutOrderId(PageData pd) throws Exception {
		dao.update("OrderMapper.updadeOutOrderId", pd);
	}
}
