package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class CreateHourlyServlet extends HttpServlet {
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
		Double hours = 0.;
		Double expectedHours = 0.;
		Double payRate = 0.;
		Integer sickDays = 0;
		Double yearsWorked = 0.;
		Double bonus = 0.;
		
		try {
			hours = Double.parseDouble(req.getParameter("hours"));
			expectedHours = Double.parseDouble(req.getParameter("expectedHours"));
			payRate = Double.parseDouble(req.getParameter("payRate"));
			sickDays = Integer.parseInt(req.getParameter("sickDays"));
			yearsWorked = Double.parseDouble(req.getParameter("yearsWorked"));
			bonus = Double.parseDouble(req.getParameter("bonus"));
		} catch(NumberFormatException e) {
			resp.sendRedirect("/createhourlyerror.jsp");
			return;
		}
		
		if((hours == null) || (expectedHours == null) || (payRate == null) || (sickDays == null) || (yearsWorked == null) || (bonus == null)) { 
			resp.sendRedirect("/createhourlyerror.jsp"); 
			return;
		}
		
		HourlyEmployee e = (HourlyEmployee) req.getSession().getAttribute("currentEmployee");
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		ofy().delete().entity(employer).now();
		employer.removeEmployee((Employee) req.getSession().getAttribute("currentEmployee"));
		
		e.setBonus(bonus);
		e.setHours(hours);
		e.setExpectedHours(expectedHours);
		e.setPayRate(payRate);
		e.setYearsWorked(yearsWorked);
		e.setSickDays(sickDays);
		
		employer.addEmployee(e);
		ofy().save().entity(employer).now();
		
		req.getSession().setAttribute("currentEmployee", e);
		
		resp.sendRedirect("/dashboard.jsp");
	}
}