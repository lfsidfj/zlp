package com.szjm.service.zlp.goodssku;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/** 
 * 说明： 商品SKU接口
 * 创建人：
 * 创建时间：2018-07-13
 * @version
 */
public interface GoodsSkuManager{

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
	
	/**通过商品ID删除SKU
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByGoodsId(PageData pd)throws Exception;
	
	/**通过商品ID列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listByGoodsId(PageData pd)throws Exception;
	
	/**购买成功，减少库存
	 * @param pd
	 * @throws Exception
	 */
	public void editInventory(PageData pd)throws Exception;
}

