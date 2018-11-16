package com.szjm.controller.weixin.miniprogram;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spiderman.util.base.BaseUtil;
import spiderman.util.base.StringUtil;
import spiderman.wechat.util.XSessionUtil;
import spiderman.wechat.util.XUtil;

import com.szjm.service.system.wechat.wechatuser.WechatUserManager;
import com.szjm.util.DateUtil;
import com.szjm.util.PageData;

@Controller
@RequestMapping(value="/weixin/miniprogram/example")
public class ExampleController extends XBaseController {

	@Resource(name="wechatuserService")
	private WechatUserManager wechatuserService;
	/**
	 * 登录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public Object login(HttpServletRequest request) throws Exception{
		Map<String,Object> result=new HashMap<String,Object>();
		PageData pd=this.getPageData();
		String token=XSessionUtil.saveUserData(pd.get("code").toString());
		String openid=XSessionUtil.getUserData(token).getOpenid();
		//保存用户
		PageData user=new PageData();
		user.put("OPENID", openid);
		if(wechatuserService.findById(user)==null){
			user.put("CREATETIME", DateUtil.getTime());
			wechatuserService.save(user);
		}
		user=wechatuserService.findById(user);
		result.put("nickName", user.get("NICKNAME"));
		result.put("avatarUrl", user.get("HEADIMGURL"));
		//返回token
		result.put("token", token);
		return ClientMessage(true, null, result);
	}
	/**
	 * 保存用户信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveUserInfo")
	@ResponseBody
	public Object saveUserInfo(HttpServletRequest request) throws Exception{
		PageData pd=this.getPageData();
		String json=StringUtil.getString(request.getInputStream());
		/*String token=XSessionUtil.saveUserData(pd.get("code").toString());*/
		Map data=BaseUtil.parseJson(json, Map.class);
		Map userInfo=BaseUtil.parseJson(XUtil.getData(data.get("encryptedData").toString(), getCurrentUserSession().getSession_key(), data.get("iv").toString()),Map.class);
		PageData user=new PageData();
		user.put("OPENID", userInfo.get("openId"));
		user.put("NICKNAME", userInfo.get("nickName"));
		user.put("LANGUAGE", userInfo.get("language"));
		user.put("CITY", userInfo.get("city"));
		user.put("PROVINCE", userInfo.get("province"));
		user.put("COUNTRY", userInfo.get("country"));
		user.put("HEADIMGURL", userInfo.get("avatarUrl"));
		if(wechatuserService.findById(user)==null){
			wechatuserService.save(user);
		}else{
			wechatuserService.edit(user);
		}
		/*Map<String,Object> result=new HashMap<String,Object>();
		result.put("userInfo", BaseUtil.getJson(userInfo));*/
		return ClientMessage(true, null, userInfo);
	}
	/**
	 * 获取用户信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getUserInfo")
	@ResponseBody
	public Object getUserInfo(HttpServletRequest request) throws Exception{
		PageData pd=this.getPageData();
		Map<String,Object> result=new HashMap<String,Object>();
		PageData user=getCurrentUser(wechatuserService);
		result.put("openId", user.get("OPENID"));
		result.put("nickName", user.get("NICKNAME"));
		result.put("language", user.get("LANGUAGE"));
		result.put("city", user.get("CITY"));
		result.put("province", user.get("PROVINCE"));
		result.put("country", user.get("COUNTRY"));
		result.put("avatarUrl", user.get("HEADIMGURL"));
		return ClientMessage(true, null, result);
	}
}
