package com.szjm.service.weixin.callback;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;

import spiderman.wechat.domain.result.WechatUser;

@Service("wechatUserInfoService")
public class WechatUserInfoService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	public void saveWechatUser(WechatUser user) throws Exception {
		// TODO Auto-generated method stub
		dao.save("WechatUserMapper.save", user);
	}

	public WechatUser getWechatUserByOpenid(String openid) throws Exception {
		// TODO Auto-generated method stub
		return (WechatUser) dao.findForObject("WechatUserMapper.findById", openid);
	}

	public void updateWechatUser(WechatUser user) throws Exception {
		// TODO Auto-generated method stub
		dao.update("WechatUserMapper.update", user);
	}

}
