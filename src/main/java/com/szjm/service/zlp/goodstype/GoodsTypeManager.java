package com.szjm.service.zlp.goodstype;

import com.szjm.entity.Page;
import com.szjm.entity.zlp.GoodsType;
import com.szjm.util.PageData;

import java.util.List;

/** 
 * 说明： 商品分类接口
 * 创建时间：2017-07-31
 * @version
 */
public interface GoodsTypeManager {

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
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<GoodsType> listByParentId(String parentId) throws Exception;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<GoodsType> listTree(String parentId) throws Exception;
	
	/**假删除
	 * @param pd
	 * @throws Exception
	 */
	public void fakeDelete(PageData pd)throws Exception;

	/**
	 * 通过 父类id 获取对应的数据
	 * @param parentId
	 * @return
	 */
	public List<PageData> findByParentId(String parentId)throws Exception ;
	/**
	 * 查出子孙列表
	 *author:Spiderman
	 * @param parentId  查出子孙列表（传入分类编号:带整型PARENT_ID_LIST的pd）
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findGrandchilds(PageData pd) throws Exception;
	/**
	 * 列出所有子孙ID列表
	 *author:Spiderman
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Integer> listAllGrandchildrenIds(PageData pd) throws Exception;
}

