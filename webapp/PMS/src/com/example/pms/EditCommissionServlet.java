package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class EditCommissionServlet extends HttpServlet {
	static {
		ObjectifyService.register(com.example.pms.Employer.class);
		ObjectifyService.register(com.example.pms.Employee.class);
		ObjectifyService.register(com.example.pms.HourlyEmployee.class);
		ObjectifyService.register(com.example.pms.SalaryEmployee.class);
		ObjectifyService.register(com.example.pms.CommissionEmployee.class);
	}
	
	private static final Logger log = Logger.getLogger(EditCommissionServlet.class.getName());
	  
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		CommissionEmployee e = (CommissionEmployee) req.getSession().getAttribute("currentEmployee");
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		Double sales = e.getSales();
		Integer commRate = e.getCommRate();
		Double prevYearSales = e.getPrevYearSales();
		Double maxSales = e.getMaxSales();
		Integer sickDays = e.getSickDays();
		Double yearsWorked = e.getYearsWorked();
		Double bonus = e.getBonus();
		
		try {
			if(!req.getParameter("sales").equals("")) { sales = Double.parseDouble(req.getParameter("sales")); }
			if(!req.getParameter("commissionRate").equals("")) { commRate = Integer.parseInt(req.getParameter("commissionRate")); }
			if(!req.getParameter("previousYearSales").equals("")) { prevYearSales = Double.parseDouble(req.getParameter("previousYearSales")); }
			if(!req.getParameter("maxSales").equals("")) { maxSales = Double.parseDouble(req.getParameter("maxSales")); }
			if(!req.getParameter("sickDays").equals("")) { sickDays = Integer.parseInt(req.getParameter("sickDays")); }
			if(!req.getParameter("yearsWorked").equals("")) { yearsWorked = Double.parseDouble(req.getParameter("yearsWorked")); }
			if(!req.getParameter("bonus").equals("")) { bonus = Double.parseDouble(req.getParameter("bonus")); }
		} catch(NumberFormatException e1) {
			resp.sendRedirect("/editcommissionerror.jsp");
			return;
		}
		
		ofy().delete().entity(employer).now();
		employer.removeEmployee((Employee) req.getSession().getAttribute("currentEmployee"));
		
		e.setSales(sales);
		e.setCommRate(commRate);
		e.setPreviousYearSales(prevYearSales);
		e.setMaxSales(maxSales);
		e.setBonus(bonus);
		e.setYearsWorked(yearsWorked);
		e.setSickDays(sickDays);
		
		employer.addEmployee(e);
		ofy().save().entity(employer).now();
		
		req.getSession().setAttribute("currentEmployee", e);
		
		resp.sendRedirect("/editcommissionemployee.jsp");
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		CommissionEmployee e = (CommissionEmployee) req.getSession().getAttribute("currentEmployee");
		
		
	}
}