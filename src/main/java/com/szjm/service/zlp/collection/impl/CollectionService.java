package com.szjm.service.zlp.collection.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.collection.CollectionManager;

/**
 * 说明： 帖子商品收藏
 * 创建人：
 * 创建时间：2018-07-19
 * @version
 */
@Service("collectionService")
public class CollectionService implements CollectionManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CollectionMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CollectionMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CollectionMapper.edit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CollectionMapper.datalistPage", page);
	}
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> appCollectionsList(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CollectionMapper.datalistPage1", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CollectionMapper.listAll", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CollectionMapper.findById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CollectionMapper.deleteAll", ArrayDATA_IDS);
	}

	/** 通过商品ID获取数据 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByGoodsId(PageData pd) throws Exception {
		return (PageData)dao.findForObject("CollectionMapper.findByGoodsId", pd);
	}

	/** 通过商品ID删除收藏
	 * @param pd
	 * @throws Exception
	 */
	public void deleteGoodsId(PageData pd) throws Exception {
		dao.delete("CollectionMapper.deleteGoodsId", pd);
	}

	/**收藏帖子
	 * @param pd
	 * @throws Exception
	 *//*
	public void articleCollect(PageData pd)throws Exception{
		dao.save("ArticleMapper.articleCollect", pd);
	}
	*//**取消收藏
	 * @param pd
	 * @throws Exception
	 *//*
	public void cancelCollect(PageData pd)throws Exception{
		dao.update("ArticleMapper.cancelCollect", pd);
	}*/
	
}

