package com.szjm.service.system.wechat.wechatnews.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatnews.WechatNewsManager;
import com.szjm.util.PageData;

/** 
 * 说明： 微信素材之文章
 * 创建人：
 * 创建时间：2017-07-12
 * @version
 */
@Service("wechatnewsService")
public class WechatNewsService implements WechatNewsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("system.wechat.WechatNewsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("system.wechat.WechatNewsMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("system.wechat.WechatNewsMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("system.wechat.WechatNewsMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("system.wechat.WechatNewsMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("system.wechat.WechatNewsMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("system.wechat.WechatNewsMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 批量保存
	 */
	@Override
	public void batchSave(List<PageData> pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("system.wechat.WechatNewsMapper.batchSave", pd);
	}
	/**
	 * 根据数据库媒体编号删除图文
	 */
	@Override
	public void deleteByWechatMediaId(Integer wechatMediaId) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("system.wechat.WechatNewsMapper.deleteByWechatMediaId", wechatMediaId);
	}
	
}

