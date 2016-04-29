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
	
	private static final Logger log = Logger.getLogger(EditServlet.class.getName());
	  
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String name = req.getParameter("name");
		
		Long id = Long.parseLong(req.getParameter("id"));
		
		String type = req.getParameter("type");
		
		Employee e;
		
		if(type == "Salary") {
			e = new SalaryEmployee(name, id);
		} else if(type == "Hourly") {
			e = new HourlyEmployee(name, id);
		} else {
			e = new CommissionEmployee(name, id);
		}
		
		Employer employer = ofy().load().type(Employer.class).id(req.getParameter("employer")).get();
		employer.addEmployee(e);
		
		ofy().save().entity(e).now();
	}
}