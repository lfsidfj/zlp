package com.szjm.controller.weixin.callback;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spiderman.util.base.StringUtil;
import spiderman.util.task.DataCacheUtil;
import spiderman.wechat.domain.result.PageAccessToken;
import spiderman.wechat.domain.result.WechatUser;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.service.system.wechat.wechatuser.impl.WechatUserService;
import com.szjm.util.PageData;
/**
 * 微信网页授权回调控制器，能获取微信用户信息
 * @author spiderman
 * 2017年5月12日下午2:02:30
 */
@Controller
@RequestMapping(value="/weixin/callback/wechatUserInfo")
public class WechatUserInfoController extends BaseController {

	@Resource(name="wechatuserService")
	private WechatUserService wechatUserService;

	@RequestMapping(value="/wechatUserInformation")
	public void wechatUserInformation (HttpServletRequest request,HttpServletResponse response) throws Exception{
		PageData pd=super.getPageData();
		String code = (String) pd.get("code");
		String state = (String) pd.get("state");
		Map<String, Object> data = (Map<String, Object>) DataCacheUtil.getData(state, "wechatSNSSate");
		if (!StringUtil.isStringEmpty(code)) {
			WechatUser pullUserInformation;
			if ((Boolean)data.get("getAllInformation")) {
				pullUserInformation = WechatInterfaceInvokeUtil.pullUserInformation(code);
				if (pullUserInformation.isSuccess()) {
					PageData userpd=new PageData();
					userpd.put("OPENID", pullUserInformation.getOpenid());
					pullUserInformation.setNickname(filterEmoji(pullUserInformation.getNickname()));
					if (wechatUserService.findDomainById(userpd) == null) {
						try {
							wechatUserService.saveDomain(pullUserInformation);
						} catch (Exception e) {
							// TODO: handle exception
							pullUserInformation.setNickname("未知昵称");
							wechatUserService.saveDomain(pullUserInformation);
						}
					}else {
						try {
							wechatUserService.editDomain(pullUserInformation);
						} catch (Exception e) {
							// TODO: handle exception
							pullUserInformation.setNickname("未知昵称");
							wechatUserService.editDomain(pullUserInformation);
						}
					}
				}
			}else {
				pullUserInformation = new WechatUser();
			    PageAccessToken pageAccessToken = WechatInterfaceInvokeUtil.getPageAccessToken(state);
			    pullUserInformation.setOpenid(pageAccessToken.getOpenid());
			}

			if (pullUserInformation.isSuccess() && (Boolean) data.get("login")) {
				PageData userpd=new PageData();
				userpd.put("OPENID", pullUserInformation.getOpenid());
				WechatUser temp = wechatUserService.findDomainById(userpd);
				if (temp == null) {
					temp = pullUserInformation;
				}
				getRequest().getSession().setAttribute("wechatUser",temp);
			}
		}
		response.sendRedirect((String) data.get("goUrl"));
	}
	/**
	 * 过滤特殊符号
	 * @param source
	 * @return
	 */
	public String filterEmoji(String source) {
        if (source == null) {
            return source;
        }
        Pattern emoji = Pattern.compile("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]",
                Pattern.UNICODE_CASE | Pattern.CASE_INSENSITIVE);
        Matcher emojiMatcher = emoji.matcher(source);
        if (emojiMatcher.find()) {
            source = emojiMatcher.replaceAll("*");
            return source;
        }
        return source;
    }
}
