package com.szjm.service.system.wechat.wechatmenu.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.entity.system.WechatMenu;
import com.szjm.service.system.wechat.wechatmenu.WechatMenuManager;
import com.szjm.util.PageData;

/** 
 * 说明： 微信菜单
 * 创建人：FH Q313596790
 * 创建时间：2015-12-16
 * @version
 */
@Service("wechatMenuService")
public class WechatMenuService implements WechatMenuManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("system.wechat.WechatMenuMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("system.wechat.WechatMenuMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("system.wechat.WechatMenuMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("system.wechat.WechatMenuMapper.datalistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("system.wechat.WechatMenuMapper.findById", pd);
	}
	
	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByBianma(PageData pd)throws Exception{
		return (PageData)dao.findForObject("system.wechat.WechatMenuMapper.findByBianma", pd);
	}
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WechatMenu> listSubDictByParentId(String parentId) throws Exception {
		return (List<WechatMenu>) dao.findForList("system.wechat.WechatMenuMapper.listSubDictByParentId", parentId);
	}
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<WechatMenu> listAllDict(String parentId) throws Exception {
		List<WechatMenu> dictList = this.listSubDictByParentId(parentId);
		for(WechatMenu dict : dictList){
			dict.setTreeurl("wechatMenu/list.do?DICTIONARIES_ID="+dict.getDICTIONARIES_ID());
			dict.setSubDict(this.listAllDict(dict.getDICTIONARIES_ID()));
			dict.setTarget("treeFrame");
		}
		return dictList;
	}
	
	/**排查表检查是否被占用
	 * @param pd
	 * @throws Exception
	 */
	public PageData findFromTbs(PageData pd)throws Exception{
		return (PageData)dao.findForObject("system.wechat.WechatMenuMapper.findFromTbs", pd);
	}
	
}

