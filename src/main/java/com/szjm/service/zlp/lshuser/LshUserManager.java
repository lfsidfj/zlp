package com.szjm.service.zlp.lshuser;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 用户管理接口
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
public interface LshUserManager{

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
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void updatePassword(PageData pd)throws Exception;

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

	/**用户详情
	 * @param pd
	 * @throws Exception
	 */
	public PageData userDetail(PageData pd)throws Exception;


	/**
	 * 查看用户下级
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> userSubordinate(Page page)throws Exception;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list2(Page page)throws Exception;
	
	/**修改用户礼豆数量
	 * @param pd
	 * @throws Exception
	 */
	public void updateIntegration(PageData pd)throws Exception;
	/**
	 * 修改角色
	 * @param pd
	 * @throws Exception
	 */
	public void editRole(PageData pd)throws Exception;
	/**
	 * 清空最近合伙人id
	 * @param pd
	 */
	public void editPartner(PageData pd)throws Exception;
}

