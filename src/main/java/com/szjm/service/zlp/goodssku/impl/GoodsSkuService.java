package com.szjm.service.zlp.goodssku.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.goodssku.GoodsSkuManager;

/** 
 * 说明： 商品SKU
 * 创建人：
 * 创建时间：2018-07-13
 * @version
 */
@Service("goodsskuService")
public class GoodsSkuService implements GoodsSkuManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GoodsSkuMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GoodsSkuMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GoodsSkuMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsSkuMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GoodsSkuMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsSkuMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GoodsSkuMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**通过商品ID删除SKU
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByGoodsId(PageData pd) throws Exception {
		dao.delete("GoodsSkuMapper.deleteByGoodsId", pd);
	}

	/**通过商品ID列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByGoodsId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("GoodsSkuMapper.listByGoodsId", pd);
	}
	
	/**购买成功，减少库存
	 * @param pd
	 * @throws Exception
	 */
	public void editInventory(PageData pd) throws Exception {
		dao.update("GoodsSkuMapper.editInventory", pd);
	}
	
}

