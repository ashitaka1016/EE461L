package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

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
		log.info("Got to doPost");
		String name = req.getParameter("name");
		log.info(name);
        String username = req.getParameter("username");
        log.info(username);
        String password = req.getParameter("password");
        log.info(password);
        Employer employer = new Employer(name, username, password);
        Employee e = new HourlyEmployee("Steve", 5, 10);
        Employee f = new HourlyEmployee("Mike", 6, 10);
        employer.addEmployee(e);
        log.info("ID is " + e.getID());
        
        ofy().save().entities(employer, e, f).now();
        log.info("Retrieved " + ofy().load().type(HourlyEmployee.class).id(6).get().getName());
		
		resp.sendRedirect("/dashboard.jsp");
	}

}
