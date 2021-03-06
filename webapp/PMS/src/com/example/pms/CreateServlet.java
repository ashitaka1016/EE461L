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
		Long id = null;
		String type = null;
		
		try {
			name = req.getParameter("name");
			id = Long.parseLong(req.getParameter("id"));
			if(id == null) { resp.sendRedirect("/createemployeeiderror.jsp"); }
			type = req.getParameter("type");
			Employer.parseDate(req.getParameter("startDate"));
		} catch(NumberFormatException e) {
			resp.sendRedirect("/createemployeeiderror.jsp");
			return;
		}
		
		Employee e;
		
		if(type.equals("Salary")) {
			e = new SalaryEmployee(name, id);
		} else if(type.equals("Hourly")) {
			e = new HourlyEmployee(name, id);
		} else {
			e = new CommissionEmployee(name, id);
		}
		
		e.setStartDate(req.getParameter("startDate"));
		
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		for(Employee e1 : employer.getEmployees()) {
			if(id.equals(e1.getID())) { 
				resp.sendRedirect("/idexists.jsp"); 
				return;
			} 
		}
		
		ofy().delete().entity(employer).now();
		
		employer.addEmployee(e);
		
		ofy().save().entity(employer).now();
		
		req.getSession().setAttribute("currentEmployee", e);
		
		if(type.equals("Salary")) {
			resp.sendRedirect("/createsalary.jsp");
		} else if(type.equals("Hourly")) {
			resp.sendRedirect("/createhourly.jsp");
		} else {
			resp.sendRedirect("/createcommission.jsp");
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Long id = 0L;
		
		try {
			id = Long.parseLong(req.getParameter("EmployeeSearch"));
		} catch(NumberFormatException e) {
			resp.sendRedirect("/dashboarderror.jsp");
			return;
		}
		
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		for(Employee e : employer.getEmployees()) {
			if(id.equals(e.getID())) {
				req.getSession().setAttribute("currentEmployee", e);
				resp.sendRedirect("/dashboard.jsp");
				return;
			}
		}
		
		resp.sendRedirect("/dashboarderror.jsp");
	}
}