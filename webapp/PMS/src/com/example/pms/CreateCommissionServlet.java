package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class CreateCommissionServlet extends HttpServlet {
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
		Double sales = 0.;
		Integer commRate = 0;
		Double prevYearSales = 0.;
		Double maxSales = 0.;
		Integer sickDays = 0;
		Integer yearsWorked = 0;
		Double bonus = 0.;
		
		try {
			sales = Double.parseDouble(req.getParameter("sales"));
			commRate = Integer.parseInt(req.getParameter("commissionRate"));
			prevYearSales = Double.parseDouble(req.getParameter("previousYearSales"));
			maxSales = Double.parseDouble(req.getParameter("maxSales"));
			sickDays = Integer.parseInt(req.getParameter("sickDays"));
			yearsWorked = Integer.parseInt(req.getParameter("yearsWorked"));
			bonus = Double.parseDouble(req.getParameter("bonus"));
		} catch(NumberFormatException e) {
			resp.sendRedirect("/createcommissionerror.jsp");
		}
		
		if((sales == null) || (commRate == null) || (prevYearSales == null) || (sickDays == null) || (yearsWorked == null) || (bonus == null)) { resp.sendRedirect("/createcommissionerror.jsp"); }
		
		CommissionEmployee e = (CommissionEmployee) req.getSession().getAttribute("currentEmployee");
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		ofy().delete().entity(employer).now();
		employer.removeEmployee(e);
		
		e.setSales(sales);
		e.setCommRate(commRate);
		e.setPreviousYearSales(prevYearSales);
		e.setMaxSales(maxSales);
		e.setBonus(bonus);
		e.setYearsWorked(yearsWorked);
		e.setSickDays(sickDays);
		
		employer.addEmployee(e);
		ofy().save().entity(employer).now();
		
		resp.sendRedirect("/dashboard.jsp");
	}
}