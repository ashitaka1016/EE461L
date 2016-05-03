package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class EditHourlyServlet extends HttpServlet {
	static {
		ObjectifyService.register(com.example.pms.Employer.class);
		ObjectifyService.register(com.example.pms.Employee.class);
		ObjectifyService.register(com.example.pms.HourlyEmployee.class);
		ObjectifyService.register(com.example.pms.SalaryEmployee.class);
		ObjectifyService.register(com.example.pms.CommissionEmployee.class);
	}
	
	private static final Logger log = Logger.getLogger(EditHourlyServlet.class.getName());
	  
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		HourlyEmployee e = (HourlyEmployee) req.getSession().getAttribute("currentEmployee");
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		ofy().delete().entity(employer).now();
		employer.removeEmployee(e);
		
		Double hours = e.getHours();
		Double expectedHours = e.getExpectedHours();
		Double payRate = e.getPayRate();
		Integer sickDays = e.getSickDays();
		Double yearsWorked = e.getYearsWorked();
		Double bonus = e.getBonus();
		
		try {
			hours = Double.parseDouble(req.getParameter("hours"));
			expectedHours = Double.parseDouble(req.getParameter("expectedHours"));
			payRate = Double.parseDouble(req.getParameter("payRate"));
			sickDays = Integer.parseInt(req.getParameter("sickDays"));
			yearsWorked = Double.parseDouble(req.getParameter("yearsWorked"));
			bonus = Double.parseDouble(req.getParameter("bonus"));
		} catch(NumberFormatException e1) {
			resp.sendRedirect("/edithourlyerror.jsp");
			return;
		}
		
		employer.addEmployee(e);
		ofy().save().entity(employer).now();
		resp.sendRedirect("/edithourlyemployee.jsp");
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
	}
}