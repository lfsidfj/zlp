package com.szjm.service.zlp.specvalue;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/** 
 * 说明： 规格值接口
 * 创建人：
 * 创建时间：2018-07-12
 * @version
 */
public interface SpecValueManager{

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
	
	/**通过SpecID获取规格值
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listBySpecId(PageData pd)throws Exception;
	
	/**通过SpecID删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteBySpecId(PageData pd)throws Exception;
	
	/**通过SpecID批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAllBySpecId(String[] ArrayDATA_IDS)throws Exception;
}

