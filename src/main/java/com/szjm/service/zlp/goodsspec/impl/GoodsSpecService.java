package com.szjm.service.zlp.goodsspec.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.goodsspec.GoodsSpecManager;

/** 
 * 说明： 商品规格
 * 创建人：
 * 创建时间：2018-07-13
 * @version
 */
@Service("goodsspecService")
public class GoodsSpecService implements GoodsSpecManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GoodsSpecMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GoodsSpecMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GoodsSpecMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsSpecMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GoodsSpecMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsSpecMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GoodsSpecMapper.deleteAll", ArrayDATA_IDS);
	}

	/**商品规格
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listGoodsId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("GoodsSpecMapper.listGoodsId", pd);
	}
	
	/**通过商品ID删除规格
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteByGoodsId(PageData pd) throws Exception {
		dao.delete("GoodsSpecMapper.deleteByGoodsId", pd);
	}
	
}

