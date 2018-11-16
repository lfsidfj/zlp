package com.szjm.service.zlp.goodscomment.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.goodscomment.GoodsCommentManager;

/**
 * 说明： 商品评论
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
@Service("goodscommentService")
public class GoodsCommentService implements GoodsCommentManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public int save(PageData pd)throws Exception{
		return (int)dao.save("GoodsCommentMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GoodsCommentMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GoodsCommentMapper.edit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsCommentMapper.datalistPage", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GoodsCommentMapper.listAll", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsCommentMapper.findById", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCommentById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsCommentMapper.findCommentById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GoodsCommentMapper.deleteAll", ArrayDATA_IDS);
	}

	/**查询商品评论条数 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCountById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("GoodsCommentMapper.findCountById", pd);
	}
	
	/**商品评论列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByGoods(Page page) throws Exception {
		return (List<PageData>)dao.findForList("GoodsCommentMapper.datalistPage1", page);
	}

}

