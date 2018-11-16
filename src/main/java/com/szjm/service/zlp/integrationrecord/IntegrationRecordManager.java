package com.szjm.service.zlp.integrationrecord;

import java.util.List;

import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 礼豆记录接口
 * 创建人：
 * 创建时间：2018-07-18
 * @version
 */
public interface IntegrationRecordManager{

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
	public List<PageData> appIntegrationRecordList(Page page)throws Exception;

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public PageData listTodayAll(PageData pd)throws Exception;

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
	/**
	 * 礼豆返现
	 * @param order_id
	 * @throws Exception
	 */
	public void addIntegrationRecord(PageData order) throws Exception;
}

