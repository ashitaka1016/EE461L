package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
public class RemoveServlet extends HttpServlet {
	static {
		ObjectifyService.register(com.example.pms.Employer.class);
		ObjectifyService.register(com.example.pms.Employee.class);
		ObjectifyService.register(com.example.pms.HourlyEmployee.class);
		ObjectifyService.register(com.example.pms.SalaryEmployee.class);
		ObjectifyService.register(com.example.pms.CommissionEmployee.class);
	} 
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Employee e = (Employee) req.getSession().getAttribute("currentEmployee");
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		ofy().delete().entity(employer).now();
		
		employer.removeEmployee(e);
		
		ofy().save().entity(employer).now();
		
		req.getSession().setAttribute("currentEmployee", null);
		
		resp.sendRedirect("dashboard.jsp");
	}
}