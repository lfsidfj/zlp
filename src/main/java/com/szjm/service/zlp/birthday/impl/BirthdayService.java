package com.szjm.service.zlp.birthday.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.birthday.BirthdayManager;

/**
 * 说明： 生日管理
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
@Service("birthdayService")
public class BirthdayService implements BirthdayManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BirthdayMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BirthdayMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BirthdayMapper.edit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BirthdayMapper.datalistPage", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BirthdayMapper.listAll", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BirthdayMapper.findById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BirthdayMapper.deleteAll", ArrayDATA_IDS);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> list2(Page page) throws Exception {
		return (List<PageData>)dao.findForList("BirthdayMapper.datalistPage2", page);
	}

}

