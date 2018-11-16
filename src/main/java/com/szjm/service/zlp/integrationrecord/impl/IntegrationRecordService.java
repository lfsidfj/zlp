package com.szjm.service.zlp.integrationrecord.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import spiderman.util.base.CommUtil;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.order.OrderManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;

/**
 * 说明： 礼豆记录 创建人： 创建时间：2018-07-18
 * 
 * @version
 */
@Service("integrationrecordService")
public class IntegrationRecordService implements IntegrationRecordManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name = "orderService")
	private OrderManager orderService;
	@Resource(name = "sysconfigService")
	private SysConfigManager sysconfigService;
	@Resource(name = "lshuserService")
	private LshUserManager lshuserService;// 用户
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
		dao.save("IntegrationRecordMapper.save", pd);
	}

	/**
	 * 删除
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("IntegrationRecordMapper.delete", pd);
	}

	/**
	 * 修改
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("IntegrationRecordMapper.edit", pd);
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"IntegrationRecordMapper.datalistPage", page);
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> appIntegrationRecordList(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"IntegrationRecordMapper.datalistPage1", page);
	}

	/**
	 * 列表(全部)
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList(
				"IntegrationRecordMapper.listAll", pd);
	}

	/**
	 * 列表(全部)
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData listTodayAll(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"IntegrationRecordMapper.listTodayAll", pd);
	}

	/**
	 * 通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IntegrationRecordMapper.findById",
				pd);
	}

	/**
	 * 批量删除
	 * 
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("IntegrationRecordMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 礼豆返现
	 * 
	 * @param order_id
	 * @throws Exception
	 */
	public void addIntegrationRecord(PageData cart) throws Exception {
		// 商品
		PageData goods = new PageData();
		goods.put("GOODS_ID", cart.get("GOODS_ID"));
		goods = goodsService.findById(goods);
		// 系统配置
		PageData config = sysconfigService.getConfig();
		// 商品种类
		String goods_position = goods.get("GOODS_POSITION").toString();
		// 返的礼豆数量
		double back_amount = 0;
		if ("0".equals(goods_position)) {// 如果是普通商品
			// 返的礼豆数量
			back_amount = CommUtil.mul(cart.get("REAL_PAY_AMOUNT"),
					config.get("INTEGRATION_RETURN_RATE"));
		} else if ("4".equals(goods_position)) {// 经销商
			back_amount = Integer.parseInt(config.get("AGENT_GIVE_INTE")
					.toString());
		} else if ("5".equals(goods_position)) {// vip
			back_amount = Integer.parseInt(config.get("VIP_GIVE_INTE")
					.toString());
		} else if ("6".equals(goods_position)) {// 合伙人
			back_amount = Integer.parseInt(config.get("PARTNER_GIVE_INTE")
					.toString());
		}else if ("7".equals(goods_position)) {// 付费会员
			back_amount = Integer.parseInt(config.get("MEMBERS_GIVE_INTE")
					.toString());
		}
		if (back_amount >= 1) {
			// 用户添加积分
			PageData pd = new PageData();
			pd.put("USER_ID", cart.get("USER_ID"));
			PageData user = lshuserService.findById(pd);
			double now_integration = CommUtil.add(user.get("INTEGRATION"),
					back_amount);
			user.put("INTEGRATION", (int) now_integration);
			lshuserService.edit(user);
			// 保存礼豆记录
			PageData ir = new PageData();
			ir.put("RECORD_TYPE", 0);
			ir.put("AMOUNT", (int) back_amount);
			ir.put("INCOME_REASON", 1);
			ir.put("ORDER_ID", cart.get("ORDER_ID"));
			ir.put("USER_ID", cart.get("USER_ID"));
			ir.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
			ir.put("DELETE_STATUS", 0); // 删除状态
			save(ir);
		}
	}
}
