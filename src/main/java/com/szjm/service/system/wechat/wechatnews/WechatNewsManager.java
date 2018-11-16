package com.szjm.service.system.wechat.wechatnews;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/** 
 * 说明： 微信素材之文章接口
 * 创建人：
 * 创建时间：2017-07-12
 * @version
 */
public interface WechatNewsManager{

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
	
	/**
	 * 批量保存
	 *author:Spiderman
	 * @param pd
	 * @throws Exception
	 */
	public void batchSave(List<PageData> pd)throws Exception;
	/**
	 * 根据数据库媒体编号删除图文
	 *author:Spiderman
	 * @param wechatMediaId
	 * @throws Exception
	 */
	public void deleteByWechatMediaId(Integer wechatMediaId)throws Exception;
	
}

