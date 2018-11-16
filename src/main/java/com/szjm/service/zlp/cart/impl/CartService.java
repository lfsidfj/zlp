package com.szjm.service.zlp.cart.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.cart.CartManager;

/**
 * 说明： 购物车管理
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
@Service("cartService")
public class CartService implements CartManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CartMapper.save", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
/*	public int saveAward(PageData pd)throws Exception{
		return (int)dao.save("CartMapper.save", pd);
	}*/
	public int saveAward(PageData pd)throws Exception{
		return (int)dao.save("CartMapper.saveAward", pd);
	}
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CartMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CartMapper.edit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CartMapper.datalistPage", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CartMapper.listAll", pd);
	}
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllCartAndGoods(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CartMapper.listAllCartAndGoods", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CartMapper.findById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CartMapper.deleteAll", ArrayDATA_IDS);
	}

	/**用户新增
	 * @param pd
	 * @throws Exception
	 */
	public void addCart(PageData pd) throws Exception {
		dao.save("CartMapper.addCart", pd);
	}

	/** 修改增加数量
	 * @param pd
	 * @throws Exception
	 */
	public void editAddCart(PageData pd) throws Exception {
		dao.update("CartMapper.editAddCart", pd);
	}

	/** 修改数量
	 * @param pd
	 * @throws Exception
	 */
	public void editCart(PageData pd) throws Exception {
		dao.update("CartMapper.editCart", pd);
	}

	/**提交订单通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdOrder(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CartMapper.findByIdOrder", pd);
	}
	/**提交订单通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdIsNotNull(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CartMapper.findByIdIsNotNull", pd);
	}

	/**通过id修改修改礼豆抵扣金额
	 * @param pd
	 * @throws Exception
	 */
	public void editCartDeduction(PageData pd) throws Exception {
		dao.update("CartMapper.editCartDeduction", pd);
	}
	/**通过id修改规格
	 * @param pd
	 * @throws Exception
	 */
	public void editCartSPEC(PageData pd) throws Exception {
		dao.update("CartMapper.editCartSPEC", pd);
	}
	/**通过id修改规格
	 * @param pd
	 * @throws Exception
	 */
	public void editCartIsC(PageData pd) throws Exception {
		dao.update("CartMapper.editCartIsC", pd);
	}

	/**修改购物车订单Id
	 * @param pd
	 * @throws Exception
	 */
	public void editCartOrderId(PageData pd) throws Exception {
		dao.update("CartMapper.editCartOrderId", pd);
	}

	/**后台删除商品时，移除用户购物车商品
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByGoods(PageData pd) throws Exception {
		dao.update("CartMapper.deleteByGoods", pd);
	}

	/**后台批量删除商品时，移除用户购物车商品
	 * @param pd
	 * @throws Exception
	 */
	public void deleteAllByGoods(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CartMapper.deleteAllByGoods", ArrayDATA_IDS);
	}
}

