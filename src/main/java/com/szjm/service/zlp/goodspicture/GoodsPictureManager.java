package com.szjm.service.zlp.goodspicture;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/** 
 * 说明： 商品轮播图接口
 * 创建人：
 * 创建时间：2018-07-12
 * @version
 */
public interface GoodsPictureManager{

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
	
	/**通过商品id获取第一张轮播图（用于首页轮播展示）
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByGoodsId(PageData pd)throws Exception;
	
	/**通过商品id获取所有轮播图
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listByGoodsId(PageData pd)throws Exception;
	
}

