package com.szjm.service.zlp.contracttype.impl;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.entity.zlp.ContractType;
import com.szjm.service.zlp.contracttype.ContractTypeManager;
import com.szjm.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 合同分类
 * 创建人：FB
 * 创建时间：2017-07-31
 * @version
 */
@Service("contracttypeService")
public class ContractTypeService implements ContractTypeManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ContractTypeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ContractTypeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ContractTypeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ContractTypeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ContractTypeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ContractTypeMapper.findById", pd);
	}

	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<ContractType> listByParentId(String parentId) throws Exception {
		return (List<ContractType>) dao.findForList("ContractTypeMapper.listByParentId", parentId);
	}
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<ContractType> listTree(String parentId) throws Exception {
		List<ContractType> valueList = this.listByParentId(parentId);
		for(ContractType fhentity : valueList){
			fhentity.setTreeurl("contracttype/list.do?CONTRACTTYPE_ID="+fhentity.getCONTRACTTYPE_ID());
			fhentity.setSubContractType(this.listTree(fhentity.getCONTRACTTYPE_ID()));
			fhentity.setTarget("treeFrame");
		}
		return valueList;
	}
	
	/**假删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void fakeDelete(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("ContractTypeMapper.fakeDelete", pd);
	}

	
	/**
	 * 通过 父类id 获取对应的数据
	 * @param parentId
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findByParentId(String parentId) throws Exception {
		
		 return (List<PageData>)dao.findForList("ContractTypeMapper.findByParentId", parentId);
	}
	/**
	 * 查出子孙列表（传入分类编号:带整型PARENT_ID_LIST的pd）
	 */
	@Override
	public List<PageData> findGrandchilds(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ContractTypeMapper.findGrandchilds", pd);
	}
	/**
	 * 列出所有子孙ID列表
	 *author:Spiderman
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Integer> listAllGrandchildrenIds(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<Integer>)dao.findForList("ContractTypeMapper.listAllGrandchildrenIds", pd);
	}
		
}

