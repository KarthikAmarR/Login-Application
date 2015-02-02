package com.iappuniverse.logapp;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class ServletFilter implements Filter{

	@Override
	public void destroy() {
			
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse response,
			FilterChain arg2) throws IOException, ServletException {
		((HttpServletResponse) response).setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		((HttpServletResponse) response).setHeader("Pragma", "no-cache"); // HTTP 1.0.
		((HttpServletResponse) response).setDateHeader("Expires", 0);
		arg2.doFilter(arg0, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
