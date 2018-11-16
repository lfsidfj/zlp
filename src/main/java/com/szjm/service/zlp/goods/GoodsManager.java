package com.szjm.service.zlp.goods;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/** 
 * 说明： 商品接口
 * 创建人：
 * 创建时间：2018-07-12
 * @version
 */
public interface GoodsManager{

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

	/**删除商品
	 * @param pd
	 * @throws Exception
	 */
	public void deleteGoods(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAllGoods(String[] ArrayDATA_IDS)throws Exception;
	
	/**移动端商品列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> appGoodsList(Page page)throws Exception;
	
	/**商品分类排序列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listByType(Page page)throws Exception;
	
	/**购买成功，修改销量
	 * @param pd
	 * @throws Exception
	 */
	public void editVolume(PageData pd)throws Exception;
	
	
	/**首页轮播图
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listBroadcast(PageData pd)throws Exception;
}

