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

import com.szjm.util.Jurisdiction;

public class ZlpH5Filter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stubs
		HttpServletRequest request=(HttpServletRequest) arg0;
		HttpServletResponse response=(HttpServletResponse) arg1;
		if(Jurisdiction.getAppUserId()!=null||
				request.getServletPath().contains("/appLogin")||
				request.getServletPath().contains("/zlpapp/uploading/pictures/saveForUrl")){
			arg2.doFilter(arg0, arg1);
		}else{
			response.sendRedirect(request.getContextPath()+"/zlpapp/appLogin/go_user_login.do");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
