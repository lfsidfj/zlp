package com.szjm.service.zlp.cart;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 购物车管理接口
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
public interface CartManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	/**dcwi新增
	 * @param pd
	 * @throws Exception
	 */
	public int saveAward(PageData pd)throws Exception;

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

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllCartAndGoods(PageData pd)throws Exception;

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdIsNotNull(PageData pd)throws Exception;

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**用户新增
	 * @param pd
	 * @throws Exception
	 */
	public void addCart(PageData pd)throws Exception;

	/** 修改增加数量
	 * @param pd
	 * @throws Exception
	 */
	public void editAddCart(PageData pd)throws Exception;

	/** 修改数量
	 * @param pd
	 * @throws Exception
	 */
	public void editCart(PageData pd)throws Exception;

	/**通过id获取提交订单数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdOrder(PageData pd)throws Exception;

	/**通过id修改修改礼豆抵扣金额
	 * @param pd
	 * @throws Exception
	 */
	public void editCartDeduction(PageData pd)throws Exception;
	/**通过id修改修规格
	 * @param pd
	 * @throws Exception
	 */
	public void editCartSPEC(PageData pd)throws Exception;
	/**通过id修改修规格
	 * @param pd
	 * @throws Exception
	 */
	public void editCartIsC(PageData pd)throws Exception;

	/**修改购物车订单Id
	 * @param pd
	 * @throws Exception
	 */
	public void editCartOrderId(PageData pd)throws Exception;

	/**后台删除商品时，移除用户购物车商品
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByGoods(PageData pd)throws Exception;

	/**后台批量删除商品时，移除用户购物车商品
	 * @param pd
	 * @throws Exception
	 */
	public void deleteAllByGoods(String[] ArrayDATA_IDS)throws Exception;
}

