package com.szjm.service.zlp.collection;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 帖子商品收藏接口
 * 创建人：
 * 创建时间：2018-07-19
 * @version
 */
public interface CollectionManager{

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
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> appCollectionsList(Page page)throws Exception;

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

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**收藏帖子
	 * @param pd
	 * @throws Exception
	 */
	//public void articleCollect(PageData pd)throws Exception;

	/**取消收藏
	 * @param pd
	 * @throws Exception
	 */
	//public void cancelCollect(PageData pd)throws Exception;
	
	/** 通过商品ID获取数据 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByGoodsId(PageData pd)throws Exception;

	
	/** 通过商品ID删除收藏
	 * @param pd
	 * @throws Exception
	 */
	public void deleteGoodsId(PageData pd)throws Exception;
	
}

