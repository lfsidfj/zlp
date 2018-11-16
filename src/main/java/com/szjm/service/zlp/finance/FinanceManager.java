package com.szjm.service.zlp.finance;

import java.util.List;

import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 收入支出明细接口
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
public interface FinanceManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> appFinanceList(Page page)throws Exception;

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData listTodayAll(PageData pd)throws Exception;

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	/**
	 * 分润
	 * @param order_id
	 * @throws Exception
	 */
	public void shareMoney(PageData order) throws Exception;
	/**
	 * 保存收入记录
	 * @param share_money	收入金额
	 * @param user_id	用户编号
	 * @param desc	中文描述
	 * @param order_id	订单编号
	 * @throws Exception
	 */
	public void saveIncomeRecord(double share_money, Object user_id, String desc, Object order_id, PageData config) throws Exception;
	/**
	 *	向上级分润
	 * @param children_id 子级编号
	 * @param children_income_money 子级收入
	 * @param partner_children_income 合伙人拿下一代新增加收入的百分比
	 * @param minimum_income 收入最低金额
	 * @param order_id	订单编号
	 * @throws Exception
	 */
	public void partnerParentIncome(Object children_id, double children_income_money,
                                    double partner_children_income, double minimum_income, String order_id) throws Exception;
}

