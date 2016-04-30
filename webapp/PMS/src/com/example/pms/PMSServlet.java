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
        Employer employer = new Employer(name, username, password);
        
        /*HourlyEmployee e = new HourlyEmployee("Bob", 10);
        e.setHours(10);
        e.setExpectedHours(10);
        e.setPayRate(10);
        e.setSickDays(0);
        employer.addEmployee(e);*/
        ofy().save().entities(employer).now();
        
        req.getSession().setAttribute("employer", employer.getUsername());
		resp.sendRedirect("/dashboard.jsp");
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			List<Employer> employers = ofy().load().type(Employer.class).list();
			boolean match = false;
			Employer e1 = null;
			
			for(Employer e : employers) {
				if(e.getUsername().equals(req.getParameter("username")) && e.getPassword().equals(req.getParameter("password"))) {
					match = true;
					e1 = e;
				}
			}
			
			if(match) {
				req.getSession().setAttribute("employer", e1.getUsername());
				resp.sendRedirect("/dashboard.jsp");
			}
			
			resp.sendRedirect("/loginerror.jsp");
	}

}
