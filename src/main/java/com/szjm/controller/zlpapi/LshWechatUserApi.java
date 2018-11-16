package com.szjm.controller.zlpapi;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spiderman.wechat.domain.result.WechatUser;
import spiderman.wechat.util.AppWechatInterfaceInvokeUtil;

import com.szjm.controller.zlpapp.BaseAppController;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.system.wechat.wechatuser.WechatUserManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
/**
 * API接口类
 * @author
 *
 */
@Controller
@RequestMapping(value="app/Api")
public class LshWechatUserApi extends BaseAppController{
	@Resource(name="lshuserService")
	private LshUserManager lshuserService;//用户
	@Resource(name="wechatuserService")
	private WechatUserManager wechatuserService;//用户

	/**
	 * 根据code  获取用户信息   判断用户是否注册   已经注册返回token  没有注册返回  oppenid
	 */
	@RequestMapping(value = "/judge_code")
	public void judge_code(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		Map<String, Object> content = new HashMap<String, Object>();
		pd = this.getPageData();
		String code=pd.get("code").toString();
		WechatUser wechatUser=AppWechatInterfaceInvokeUtil.pullUserInformation(code);
		PageData pdW = new PageData();
		pdW.put("OPENID", wechatUser.getOpenid());
		PageData pdwUser=wechatuserService.findById(pdW);
		pdW.put("SUBSCRIBE", wechatUser.getSubscribe());
		pdW.put("NICKNAME", wechatUser.getNickname());
		pdW.put("SEX", wechatUser.getSex());
		pdW.put("LANGUAGE", wechatUser.getLanguage());
		pdW.put("CITY", wechatUser.getCity());
		pdW.put("PROVINCE", wechatUser.getProvince());
		pdW.put("COUNTRY", wechatUser.getCountry());
		pdW.put("HEADIMGURL", wechatUser.getHeadimgurl());
		pdW.put("SUBSCRIBE_TIME", wechatUser.getSubscribe_time());
		pdW.put("UNIONID", wechatUser.getUnionid());
		pdW.put("REMARK", wechatUser.getRemark());
		pdW.put("GROUPID", wechatUser.getGroupid());
		pdW.put("TAGID_LIST", wechatUser.getTagid_list());
		pdW.put("SUBSCRIBE_SCENE", wechatUser.getSubscribe_scene());
		pdW.put("QR_SCENE", wechatUser.getQr_scene());
		pdW.put("QR_SCENE_STR", wechatUser.getQr_scene_str());
		pdW.put("CREATETIME", wechatUser.getCreatetime());
		if(pdwUser==null){
			pdW.put("USER_ID", null);
			wechatuserService.save(pdW);
			content.put("OPENID", wechatUser.getOpenid());
			content.put("TOKEN","");
		}else{
			wechatuserService.edit(pdW);
			pd.put("OPENID", wechatUser.getOpenid());
			PageData pdUser =lshuserService.findById(pd);
			if(pdUser==null){
				content.put("OPENID", wechatUser.getOpenid());
				content.put("TOKEN","");
			}else{
				content.put("OPENID", "");
				content.put("TOKEN",pdUser.get("TOKEN"));
			}
		}
		WriteClientMessage(response, "0", "成功", content);
	}

	/**
	 * 绑定微信用户   返回绑定状态  0  成功  1  失败 先查询用户oppenid是否存在，存在则失败
	 */
	@RequestMapping(value = "/bind_wechat")
	public void bind_wechat(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		Map<String, Object> content = new HashMap<String, Object>();
		pd = this.getPageData();
		String code=pd.get("code").toString();
		WechatUser wechatUser=AppWechatInterfaceInvokeUtil.pullUserInformation(code);
		pd.put("OPENID", wechatUser.getOpenid());
		PageData pdUser =lshuserService.findById(pd);
		Integer user_id = Jurisdiction.getAppUserId();
		if(pdUser==null){
			pd.put("USER_ID", user_id);
			lshuserService.edit(pd);
			wechatuserService.edit(pd);
			content.put("BINDSTATUS", 1);
			content.put("FAILMESSAGE", "");
			WriteClientMessage(response, "0", "成功", content);
		}else{
			if((user_id+"").equals(pdUser.get("USER_ID").toString())){
				content.put("BINDSTATUS", 1);
				content.put("FAILMESSAGE", "");
			}else{
				content.put("BINDSTATUS", 0);
				content.put("FAILMESSAGE", "该微信已绑定其他用户!");
			}
			WriteClientMessage(response, "0", "成功", content);
		}
	}
}
