package com.szjm.service.system.wechat.wechatuser.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import spiderman.wechat.domain.result.WechatUser;
import spiderman.wechat.domain.result.WechatUserResult;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatuser.WechatUserManager;
import com.szjm.util.PageData;

/**
 * 说明： 微信用户
 * 创建人：
 * 创建时间：2017-07-14
 * @version
 */
@Service("wechatuserService")
public class WechatUserService implements WechatUserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("system.wechat.WechatUserMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("system.wechat.WechatUserMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("system.wechat.WechatUserMapper.edit", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("system.wechat.WechatUserMapper.datalistPage", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("system.wechat.WechatUserMapper.listAll", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("system.wechat.WechatUserMapper.findById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("system.wechat.WechatUserMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 批量更新
	 */
	@Override
	public void batchUpdate(List<WechatUserResult> list) throws Exception {
		// TODO Auto-generated method stub
		dao.update("system.wechat.WechatUserMapper.batchUpdate", list);
	}
	/**
	 * 选择OPENID列表
	 */
	@Override
	public List<PageData> selectOpenidList(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("system.wechat.WechatUserMapper.selectOpenidList", pd);
	}
	/**
	 * 选择所有的OPENID列表
	 */
	@Override
	public List<String> selectAllOpenidList(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<String>)dao.findForList("system.wechat.WechatUserMapper.selectAllOpenidList", pd);
	}
	/**
	 * 批量插入OPENID
	 */
	@Override
	public void batchSaveOpendid(List<String> openidList) throws Exception {
		// TODO Auto-generated method stub
		dao.save("system.wechat.WechatUserMapper.batchSaveOpendid", openidList);
	}
	/**
	 * 查出实体类
	 */
	@Override
	public WechatUser findDomainById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (WechatUser)dao.findForObject("system.wechat.WechatUserMapper.findDomainById", pd);
	}
	/**
	 * 修改实体类
	 */
	@Override
	public void editDomain(WechatUser user) throws Exception {
		// TODO Auto-generated method stub
		dao.update("system.wechat.WechatUserMapper.editDomain", user);
	}
	/**
	 * 保存实体类
	 */
	@Override
	public void saveDomain(WechatUser user) throws Exception {
		// TODO Auto-generated method stub
		dao.save("system.wechat.WechatUserMapper.saveDomain", user);
	}

}

