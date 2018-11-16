package com.szjm.service.zlp.goodspicture.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.goodspicture.GoodsPictureManager;

/** 
 * 说明： 商品轮播图
 * 创建人：
 * 创建时间：2018-07-12
 * @version
 */
@Service("goodspictureService")
public class GoodsPictureService implements GoodsPictureManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GoodsPictureMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GoodsPictureMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GoodsPictureMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsPictureMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GoodsPictureMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsPictureMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GoodsPictureMapper.deleteAll", ArrayDATA_IDS);
	}

	/**通过商品id获取第一张轮播图（用于首页轮播展示）
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByGoodsId(PageData pd) throws Exception {
		return (PageData)dao.findForObject("GoodsPictureMapper.findByGoodsId", pd);
	}

	/**通过商品id获取所有轮播图
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByGoodsId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("GoodsPictureMapper.listByGoodsId", pd);
	}
	
}

