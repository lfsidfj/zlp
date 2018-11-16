package com.szjm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spiderman.util.base.StringUtil;
import spiderman.wechat.domain.result.WechatUser;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.szjm.service.system.wechat.wechatuser.impl.WechatUserService;
import com.szjm.util.PageData;
import com.szjm.util.SpringUtil;
/**
 * 微信用户静默登录过滤器
 * @author spiderman
 * 2017年5月12日下午2:06:50
 */
public class WechatLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
	/**
	 * 调接口获取用户信息并登录
	 */
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		WechatUser wechatUser = (WechatUser)((HttpServletRequest)arg0).getSession().getAttribute("wechatUser");
		if (wechatUser == null) {
			//开发需要，pc端登录
			if (!StringUtil.isStringEmpty(((HttpServletRequest)arg0).getParameter("openId"))) {
				HttpServletRequest request=(HttpServletRequest)arg0;
				String openId=request.getParameter("openId");
				try {
					WechatUserService service=(WechatUserService) SpringUtil.getObject("wechatuserService");
					PageData pd=new PageData();
					pd.put("OPENID", openId);
					WechatUser user=service.findDomainById(pd);
					request.getSession().setAttribute("wechatUser", user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				arg2.doFilter(arg0, arg1);
			}else{
				WechatInterfaceInvokeUtil.getUserInformation((HttpServletResponse)arg1,(HttpServletRequest)arg0, true,true);
			}
		}else {
			if (wechatUser.getSex() == null) {
				WechatInterfaceInvokeUtil.getUserInformation((HttpServletResponse)arg1,(HttpServletRequest)arg0, true,true);
			}else {
				arg2.doFilter(arg0, arg1);
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
