package com.szjm.service.zlp.goodstype.impl;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.entity.zlp.GoodsType;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
import com.szjm.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 合同分类
 * 创建时间：2017-07-31
 * @version
 */
@Service("goodstypeService")
public class GoodsTypeService implements GoodsTypeManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GoodsTypeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("GoodsTypeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GoodsTypeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GoodsTypeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GoodsTypeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GoodsTypeMapper.findById", pd);
	}

	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<GoodsType> listByParentId(String parentId) throws Exception {
		return (List<GoodsType>) dao.findForList("GoodsTypeMapper.listByParentId", parentId);
	}
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<GoodsType> listTree(String parentId) throws Exception {
		List<GoodsType> valueList = this.listByParentId(parentId);
		for(GoodsType fhentity : valueList){
			fhentity.setTreeurl("goodstype/list.do?GOODS_TYPE_ID="+fhentity.getGOODS_TYPE_ID());
			fhentity.setSubGoodsType(this.listTree(fhentity.getGOODS_TYPE_ID()));
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
		dao.delete("GoodsTypeMapper.fakeDelete", pd);
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
		
		 return (List<PageData>)dao.findForList("GoodsTypeMapper.findByParentId", parentId);
	}
	/**
	 * 查出子孙列表（传入分类编号:带整型PARENT_ID_LIST的pd）
	 */
	@Override
	public List<PageData> findGrandchilds(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("GoodsTypeMapper.findGrandchilds", pd);
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
		return (List<Integer>)dao.findForList("GoodsTypeMapper.listAllGrandchildrenIds", pd);
	}
		
}

