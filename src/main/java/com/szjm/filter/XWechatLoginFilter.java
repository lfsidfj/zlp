package com.szjm.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spiderman.util.base.BaseUtil;
import spiderman.wechat.domain.param.XSessionKeyResult;
import spiderman.wechat.util.XSessionUtil;

public class XWechatLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		String path=request.getServletPath();
		String token=request.getParameter("token");
		if(path.contains("/login.do")){
			arg2.doFilter(arg0, arg1);
		}else if(token!=null&&XSessionUtil.getUserData(token.replaceAll(" ", "+"))!=null){
			arg2.doFilter(arg0, arg1);
		}else{
			Map<String,Object> result=new HashMap<String,Object>();
			result.put("errCode", -1);
			PrintWriter writer=response.getWriter();
			writer.print(BaseUtil.getJson(result));
			writer.flush();
			writer.close();
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
