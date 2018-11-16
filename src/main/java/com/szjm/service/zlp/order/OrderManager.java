package com.szjm.service.zlp.order;

import java.util.List;

import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 订单管理接口
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
public interface OrderManager{

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
	/**移动端订单列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> appOrdersList(Page page)throws Exception;
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
	public PageData informationFindById(PageData pd)throws Exception;

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	/**
	 * 订单完成
	 * @param out_order_id
	 * @throws Exception
	 */
	public void finishOrder(String out_order_id) throws Exception;
	/**
     * 获取支付信息
     * @param real_pay 支付金额
     * @param out_order_id 支付编号
     * @param pay_type	支付类型，alipay：支付宝支付，wxpay：微信支付
     * @param ipAddress 客户端ip地址
     * @param order_id	订单编号
     * @return
     */
    public Object getPayInfo(String real_pay, String out_order_id, String pay_type, String ipAddress, long order_id);

    /**用户创建订单
	 * @param pd
	 * @throws Exception
	 */
	public void createOrder(PageData pd)throws Exception;

	/**用户获取订单详情
	 * @param pd
	 * @throws Exception
	 */
	public PageData orderDetail(PageData pd)throws Exception;

	/**订单取消或支付失败时再次支付更新支付编号
	 * @param pd
	 * @throws Exception
	 */
	public void updadeOutOrderId(PageData pd)throws Exception;
}

