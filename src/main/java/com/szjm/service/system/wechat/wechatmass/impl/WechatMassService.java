package com.szjm.service.system.wechat.wechatmass.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatmass.WechatMassManager;
import com.szjm.util.PageData;

/** 
 * 说明： 消息群发
 * 创建人：
 * 创建时间：2017-07-17
 * @version
 */
@Service("wechatmassService")
public class WechatMassService implements WechatMassManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("system.wechat.WechatMassMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("system.wechat.WechatMassMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("system.wechat.WechatMassMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("system.wechat.WechatMassMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("system.wechat.WechatMassMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("system.wechat.WechatMassMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("system.wechat.WechatMassMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 编辑不为空的
	 */
	@Override
	public void editNotNull(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("system.wechat.WechatMassMapper.editNotNull", pd);
	}
	
}

