package com.iappuniverse.logapp;

import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.PreparedQuery;

@SuppressWarnings("serial")
public class LogAppServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		if(session.getAttribute("loggedin")==null)
		{
			resp.sendRedirect("login.jsp");
		}
		else{
			resp.sendRedirect("homepage.jsp");
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		PrintWriter write=resp.getWriter();
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Filter filterByName =
				  new FilterPredicate("userName",
				                      FilterOperator.EQUAL,
				                      username);
				Query q = new Query("UserDetails").setFilter(filterByName);
				
				PreparedQuery pq = datastore.prepare(q);
				  

				for (Entity result : pq.asIterable()) {
				  String uName = (String) result.getProperty("userName");
				  String pWord = (String) result.getProperty("passWord");
				  	
				  if(username.equals(uName)&& password.equals(pWord))
					 
				  {
					  
					  	System.out.println("Cred match.");
					  	HttpSession session=req.getSession();
						session.setAttribute("user", username);
						session.setAttribute("pword", password);
						session.setAttribute("loggedin","yes");
						write.println("true");
						resp.sendRedirect("homepage.jsp");
						break;
				  }
				}
		
	}
}
