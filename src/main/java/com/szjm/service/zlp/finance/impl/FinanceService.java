package com.szjm.service.zlp.finance.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import spiderman.util.base.CommUtil;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import com.szjm.service.zlp.finance.FinanceManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;

/**
 * 说明： 收入支出明细
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
@Service("financeService")
public class FinanceService implements FinanceManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="sysconfigService")
	private SysConfigManager sysconfigService;
	@Resource(name="lshuserService")
	private LshUserManager lshuserService;//用户
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("FinanceMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("FinanceMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("FinanceMapper.edit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("FinanceMapper.datalistPage", page);
	}
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> appFinanceList(Page page)throws Exception{
		return (List<PageData>)dao.findForList("FinanceMapper.datalistPage1", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("FinanceMapper.listAll", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("FinanceMapper.findById", pd);
	}
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData listTodayAll(PageData pd)throws Exception{
		return (PageData)dao.findForObject("FinanceMapper.listTodayAll", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("FinanceMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 分润
	 * @param order_id 订单编号
	 * @throws Exception
	 */
	@Override
	public void shareMoney(PageData order) throws Exception {
		// TODO Auto-generated method stub
		//系统配置
		PageData config=sysconfigService.getConfig();

		//订单用户
		Integer user_id=Integer.valueOf(order.get("USER_ID").toString());
		PageData pd=new PageData();
		pd.put("USER_ID", user_id);
		PageData user=lshuserService.findById(pd);
		//用户上级
		PageData parent=null;
		//用户上级的上级
		PageData grandparent=null;
		if(user.get("PARENT_ID")!=null){
			pd.put("USER_ID", user.get("PARENT_ID"));
			parent=lshuserService.findById(pd);
			if(parent.get("PARENT_ID")!=null){
				pd.put("USER_ID", parent.get("PARENT_ID"));
				//用户上级
				grandparent=lshuserService.findById(pd);
			}
		}
		if(parent!=null){
			switch (parent.get("ROLE").toString()) {
				case "partner":
					BigDecimal partner_one_income=(BigDecimal) config.get("PARTNER_ONE_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), partner_one_income),
							parent.get("USER_ID"), "合伙人一级分润", order.get("ORDER_ID").toString(),config);
					break;
				case "agent":
					BigDecimal agent_one_income=(BigDecimal) config.get("AGENT_ONE_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), agent_one_income),
							parent.get("USER_ID"), "经销商一级分润", order.get("ORDER_ID").toString(),config);
					break;
				case "vip":
					BigDecimal vip_one_income=(BigDecimal) config.get("VIP_ONE_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), vip_one_income),
							parent.get("USER_ID"), "VIP一级分润", order.get("ORDER_ID").toString(),config);
					break;
				case "members":
					BigDecimal members_one_income=(BigDecimal) config.get("MEMBERS_ONE_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), members_one_income),
							parent.get("USER_ID"), "付费会员一级分润", order.get("ORDER_ID").toString(),config);
					break;
				default:
					break;
			}
		}
		if(grandparent!=null){
			switch (grandparent.get("ROLE").toString()) {
				case "partner":
					BigDecimal partner_two_income=(BigDecimal) config.get("PARTNER_TWO_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), partner_two_income),
							grandparent.get("USER_ID"), "合伙人二级分润", order.get("ORDER_ID").toString(),config);
					break;
				case "agent":
					BigDecimal agent_two_income=(BigDecimal) config.get("AGENT_TWO_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), agent_two_income),
							grandparent.get("USER_ID"), "经销商二级分润", order.get("ORDER_ID").toString(),config);
					break;
				case "vip":
					BigDecimal vip_two_income=(BigDecimal) config.get("VIP_TWO_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), vip_two_income),
							grandparent.get("USER_ID"), "VIP二级分润", order.get("ORDER_ID").toString(),config);
					break;
				case "members":
					BigDecimal members_two_income=(BigDecimal) config.get("MEMBERS_TWO_INCOME");
					saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), members_two_income),
							grandparent.get("USER_ID"), "付费会员二级分润", order.get("ORDER_ID").toString(),config);
					break;
				default:
				break;
			}
		}
		//级别低的 二级以外 合伙人永久拿新增业绩的5%
		if(user.get("PARTNER_USER_ID")!=null&&!"partner".equals(user.get("ROLE").toString())){
			//如果最近合伙人就是上上级
			if(grandparent!=null&&
					grandparent.get("USER_ID").toString().equals(user.get("PARTNER_USER_ID").toString())){
				return;
			}
			//如果最近合伙人就是上级
			if(parent!=null&&
					parent.get("USER_ID").toString().equals(user.get("PARTNER_USER_ID").toString())){
				return;
			}
			pd.put("USER_ID", user.get("PARTNER_USER_ID"));
			PageData parent_user=lshuserService.findById(pd);
			BigDecimal vip_three_income=(BigDecimal) config.get("VIP_THREE_INCOME");
			saveIncomeRecord(CommUtil.mul(order.get("REAL_PAY_AMOUNT"), vip_three_income),
					parent_user.get("USER_ID"), "合伙人第三级及以下分润", order.get("ORDER_ID").toString(),config);
		}
	}
	/**
	 * 保存收入记录
	 * @param share_money	收入金额
	 * @param user_id	用户编号
	 * @param desc	中文描述
	 * @param order_id	订单编号
	 * @throws Exception
	 */
	@Override
	public void saveIncomeRecord(double share_money, Object user_id,
			String desc, Object order_id,PageData config) throws Exception {
		// TODO Auto-generated method stub
		//用户添加金额
		PageData pd=new PageData();
		pd.put("USER_ID", user_id);
		PageData user=lshuserService.findById(pd);
		double now_money=CommUtil.add(user.get("MONEY"), share_money);
		user.put("MONEY", now_money);
		lshuserService.edit(user);
		//添加记录
		PageData finance=new PageData();
		finance.put("FINANCE_TYPE", 0);
		finance.put("AMOUNT", share_money);
		finance.put("CREATE_DATE", Tools.date2Str(new Date()));
		finance.put("DELETE_STATUS", 0);
		finance.put("INCOME_REASON", 1);
		finance.put("INCOME_REASON_DESC", desc);
		finance.put("USER_ID", user_id);
		finance.put("ORDER_ID", order_id);
		save(finance);
		if(config!=null){
			partnerParentIncome(user_id, share_money, Double.valueOf(config.get("PARTNER_CHILDREN_INCOME").toString()), Double.valueOf(config.get("MINIMUM_INCOME").toString()), order_id.toString());
		}
	}
	/**
	 *	合伙人平级：拿下一代新增加收入的2%”
	 * @param children_id 子级编号
	 * @param children_income_money 子级收入
	 * @param partner_children_income 合伙人拿下一代新增加收入的百分比
	 * @param minimum_income 收入最低金额
	 * @param order_id	订单编号
	 * @throws Exception
	 */
	@Override
	public void partnerParentIncome(Object children_id,
			double children_income_money, double partner_children_income,
			double minimum_income, String order_id) throws Exception {
		// TODO Auto-generated method stub
		PageData pd=new PageData();
		pd.put("USER_ID", children_id);
		pd.put("ROLE", "partner");
		PageData children_user=lshuserService.findById(pd);
		if(children_user!=null){
			pd.put("USER_ID", children_user.get("PARENT_ID"));
			pd.put("ROLE", "partner");
			PageData parent_user=lshuserService.findById(pd);
			if(parent_user!=null){
				double parent_income_money=CommUtil.mul(children_income_money, partner_children_income);
				if(parent_income_money>=minimum_income){
					saveIncomeRecord(parent_income_money, parent_user.get("USER_ID"), "合伙人拿下一代新增加收入", order_id,null);
					partnerParentIncome(parent_user.get("USER_ID"), parent_income_money, partner_children_income, minimum_income, order_id);
				}
			}
		}
	}

}

