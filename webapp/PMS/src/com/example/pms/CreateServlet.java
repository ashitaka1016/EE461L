package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class CreateServlet extends HttpServlet {
	static {
		ObjectifyService.register(com.example.pms.Employer.class);
		ObjectifyService.register(com.example.pms.Employee.class);
		ObjectifyService.register(com.example.pms.HourlyEmployee.class);
		ObjectifyService.register(com.example.pms.SalaryEmployee.class);
		ObjectifyService.register(com.example.pms.CommissionEmployee.class);
	}
	
	private static final Logger log = Logger.getLogger(EditSalaryServlet.class.getName());
	  
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String name = null;
		long id = 0L;
		String type = null;
		
		try {
			name = req.getParameter("name");
			id = Long.parseLong(req.getParameter("id"));
			type = req.getParameter("type");
		} catch(NumberFormatException e) {
			resp.sendRedirect("/createemployeeiderror.jsp");
		}
		
		Employee e;
		
		if(type.equals("Salary")) {
			e = new SalaryEmployee(name, id);
		} else if(type.equals("Hourly")) {
			e = new HourlyEmployee(name, id);
		} else {
			e = new CommissionEmployee(name, id);
		}
		
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		for(Employee e1 : employer.getEmployees()) {
			if(e1.getID() == id) { resp.sendRedirect("/idexists.jsp"); } 
		}
		
		employer.addEmployee(e);
		
		ofy().save().entity(e).now();
		
		if(type.equals("Salary")) {
			resp.sendRedirect("/createsalary.jsp");
		} else if(type.equals("Hourly")) {
			resp.sendRedirect("/createhourly.jsp");
		} else {
			resp.sendRedirect("/createcommission.jsp");
		}
	}
}