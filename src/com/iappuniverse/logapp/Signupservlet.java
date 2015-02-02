package com.iappuniverse.logapp;

import java.io.IOException;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class Signupservlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
	
		String uName=req.getParameter("uname");
		String pWord=req.getParameter("pword");
		String mail=req.getParameter("mail");
		String phone=req.getParameter("phone");
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();


		Entity userDetails = new Entity("UserDetails");

		userDetails.setProperty("userName",uName);
		userDetails.setProperty("passWord", pWord);
		userDetails.setProperty("email",mail);
		userDetails.setProperty("phoneNumber",phone);

		datastore.put(userDetails);
		
		
		
		HttpSession session=req.getSession();
		session.setAttribute("user", uName);
		session.setAttribute("loggedin","yes");
		resp.sendRedirect("homepage.jsp");
	}
}