package com.szjm.service.zlp.specvalue.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.specvalue.SpecValueManager;

/** 
 * 说明： 规格值
 * 创建人：
 * 创建时间：2018-07-12
 * @version
 */
@Service("specvalueService")
public class SpecValueService implements SpecValueManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("SpecValueMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("SpecValueMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SpecValueMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SpecValueMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SpecValueMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SpecValueMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SpecValueMapper.deleteAll", ArrayDATA_IDS);
	}

	/**通过SpecID获取规格值
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listBySpecId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SpecValueMapper.listBySpecId", pd);
	}

	/**通过SpecID删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteBySpecId(PageData pd) throws Exception {
		dao.delete("SpecValueMapper.deleteBySpecId", pd);
	}
	
	/**通过SpecID批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAllBySpecId(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SpecValueMapper.deleteAllBySpecId", ArrayDATA_IDS);
	}
}

