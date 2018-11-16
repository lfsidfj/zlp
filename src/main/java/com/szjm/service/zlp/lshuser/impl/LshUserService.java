package com.szjm.service.zlp.lshuser.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.util.PageData;

/**
 * 说明： 用户管理
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
@Service("lshuserService")
public class LshUserService implements LshUserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ZlpUserMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ZlpUserMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ZlpUserMapper.edit", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void updatePassword(PageData pd)throws Exception{
		dao.update("ZlpUserMapper.updatePassword", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ZlpUserMapper.datalistPage", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ZlpUserMapper.listAll", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ZlpUserMapper.findById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ZlpUserMapper.deleteAll", ArrayDATA_IDS);
	}

	/**用户详情
	 * @param pd
	 * @throws Exception
	 */
	public PageData userDetail(PageData pd) throws Exception {
		return (PageData)dao.findForObject("ZlpUserMapper.userDetail", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> userSubordinate(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ZlpUserMapper.datalistPage1", page);
	}

	@Override
	public List<PageData> list2(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ZlpUserMapper.datalistPage2", page);
	}

	/**修改用户礼豆数量
	 * @param pd
	 * @throws Exception
	 */
	public void updateIntegration(PageData pd) throws Exception {
		dao.update("ZlpUserMapper.updateIntegration", pd);
	}

	@Override
	public void editRole(PageData pd) throws Exception {
		dao.update("ZlpUserMapper.editRole", pd);
	}

	@Override
	public void editPartner(PageData pd) throws Exception {
		dao.update("ZlpUserMapper.editPartner", pd);
	}

}

