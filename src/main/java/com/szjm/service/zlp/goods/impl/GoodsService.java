package com.szjm.service.zlp.goods.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.goods.GoodsManager;

/** 
 * 说明： 商品
 * 创建人：
 * 创建时间：2018-07-12
 * @version
 */
@Service("goodsService")
public class GoodsService implements GoodsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GoodsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GoodsMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GoodsMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GoodsMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GoodsMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**删除商品
	 * @param pd
	 * @throws Exception
	 */
	public void deleteGoods(PageData pd) throws Exception {
		dao.update("GoodsMapper.deleteGoods", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAllGoods(String[] ArrayDATA_IDS)throws Exception{
		dao.update("GoodsMapper.deleteAllGoods", ArrayDATA_IDS);
	}

	/**移动端商品首页列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> appGoodsList(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsMapper.datalistPage1", page);
	}
	
	/**商品分类排序列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByType(Page page) throws Exception {
		return (List<PageData>)dao.findForList("GoodsMapper.datalistPage2", page);
	}

	/**购买成功，修改销量
	 * @param pd
	 * @throws Exception
	 */
	public void editVolume(PageData pd) throws Exception {
		dao.update("GoodsMapper.editVolume", pd);
	}

	/**首页轮播图
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listBroadcast(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("GoodsMapper.listBroadcast", pd);
	}
}

