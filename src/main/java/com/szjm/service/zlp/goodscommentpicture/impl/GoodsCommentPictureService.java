package com.szjm.service.zlp.goodscommentpicture.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.goodscommentpicture.GoodsCommentPictureManager;

/**
 * 说明： 商品评论图片
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
@Service("goodscommentpictureService")
public class GoodsCommentPictureService implements GoodsCommentPictureManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GoodsCommentPictureMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GoodsCommentPictureMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GoodsCommentPictureMapper.edit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsCommentPictureMapper.datalistPage", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GoodsCommentPictureMapper.listAll", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsCommentPictureMapper.findById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GoodsCommentPictureMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public void listPicture(List<PageData> picture) throws Exception {
		dao.save("GoodsCommentPictureMapper.save", picture);

	}

	/**通过评论id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByIdComment(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("GoodsCommentPictureMapper.findByIdComment", pd);
	}
}

