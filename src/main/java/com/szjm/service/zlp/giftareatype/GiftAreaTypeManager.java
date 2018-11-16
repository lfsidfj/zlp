package com.szjm.service.zlp.giftareatype;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/** 
 * 说明： 区域管理类目接口
 * 创建人：
 * 创建时间：2018-08-17
 * @version
 */
public interface GiftAreaTypeManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByArea(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByType(PageData pd)throws Exception;
	
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
	
	/**批量删除(通过商品类目类目)
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAllByType(String[] ArrayDATA_IDS)throws Exception;
	
	/**列表(全部)(通过区域Id)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllByArea(PageData pd)throws Exception;
	
}

