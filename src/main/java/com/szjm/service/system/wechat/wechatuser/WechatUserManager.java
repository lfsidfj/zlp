package com.szjm.service.system.wechat.wechatuser;

import java.util.List;

import spiderman.wechat.domain.result.WechatUser;
import spiderman.wechat.domain.result.WechatUserResult;

import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 微信用户接口
 * 创建人：
 * 创建时间：2017-07-14
 * @version
 */
public interface WechatUserManager{

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
	 * 批量更新
	 *author:Spiderman
	 * @param list
	 * @throws Exception
	 */
	public void batchUpdate(List<WechatUserResult> list)throws Exception;
	/**
	 * 选择OPENID列表
	 *author:Spiderman
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> selectOpenidList(PageData pd)throws Exception;
	/**
	 * 选择所有的OPENID列表
	 *author:Spiderman
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> selectAllOpenidList(PageData pd)throws Exception;
	/**
	 * 批量插入OPENID
	 *author:Spiderman
	 * @param openidList
	 * @throws Exception
	 */
	public void batchSaveOpendid(List<String> openidList)throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public WechatUser findDomainById(PageData pd)throws Exception;
	/**修改
	 * @param user
	 * @throws Exception
	 */
	public void editDomain(WechatUser user)throws Exception;
	/**新增
	 * @param user
	 * @throws Exception
	 */
	public void saveDomain(WechatUser user)throws Exception;

}

