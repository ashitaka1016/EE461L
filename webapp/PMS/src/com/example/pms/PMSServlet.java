package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class PMSServlet extends HttpServlet {
	static {
		ObjectifyService.register(com.example.pms.Employer.class);
		ObjectifyService.register(com.example.pms.Employee.class);
		ObjectifyService.register(com.example.pms.HourlyEmployee.class);
		ObjectifyService.register(com.example.pms.SalaryEmployee.class);
		ObjectifyService.register(com.example.pms.CommissionEmployee.class);
	}
	
	private static final Logger log = Logger.getLogger(PMSServlet.class.getName());
	  
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String name = req.getParameter("name");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        if(username == null || username.equals(name) || username.equals(password)) {
        	resp.sendRedirect("/signuperror.jsp");
			return;
        }
        
        Employer employer = new Employer(name, username, password);
        
        Employer e = (Employer) ofy().load().type(Employer.class).id(username).get();
		
		if(e != null) {
			resp.sendRedirect("/usernameexists.jsp");
			return;
		}
        
        ofy().save().entities(employer).now();
        
        req.getSession().setAttribute("currentEmployee", null);
        req.getSession().setAttribute("employer", employer.getUsername());
        req.getSession().setAttribute("employerName", employer.getName());
		resp.sendRedirect("/dashboard.jsp");
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		if(username.equals("") || (password.equals(""))) {
			resp.sendRedirect("/loginerror.jsp");
			return;
		}
		
		Employer e = (Employer) ofy().load().type(Employer.class).id(username).get();
		
		if((e == null) || (!password.equals(e.getPassword()))) {
			resp.sendRedirect("/loginerror.jsp");
			return;
		}
		
		req.getSession().setAttribute("currentEmployee", null);
		req.getSession().setAttribute("employer", e.getUsername());
		req.getSession().setAttribute("employerName", e.getName());
		resp.sendRedirect("/dashboard.jsp");
	}

}
