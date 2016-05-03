package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class EditSalaryServlet extends HttpServlet {
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
		SalaryEmployee e = (SalaryEmployee) req.getSession().getAttribute("currentEmployee");
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		ofy().delete().entity(employer).now();
		employer.removeEmployee(e);
		
		Double salary = e.getSalary();
		Integer overtime = e.getOvertime();
		Double overtimeRate = e.getOvertimeRate();
		Integer vacDays = e.getVacDays();
		Integer sickDaysTaken = e.getSickDaysTaken();
		Integer sickDays = e.getSickDays();
		Double yearsWorked = e.getYearsWorked();
		Double bonus = e.getBonus();
		
		try {
			salary = Double.parseDouble(req.getParameter("salary"));
			overtime = Integer.parseInt(req.getParameter("overtime"));
			overtimeRate = Double.parseDouble(req.getParameter("overtimeRate"));
			vacDays = Integer.parseInt(req.getParameter("vacationDays"));
			sickDaysTaken = Integer.parseInt(req.getParameter("sickDaysTaken"));
			sickDays = Integer.parseInt(req.getParameter("sickDays"));
			yearsWorked = Double.parseDouble(req.getParameter("yearsWorked"));
			bonus = Double.parseDouble(req.getParameter("bonus"));
		} catch(NumberFormatException e1) {
			resp.sendRedirect("/editsalaryerror.jsp");
			return;
		}
		
		employer.addEmployee(e);
		ofy().save().entity(employer).now();
		resp.sendRedirect("/editsalaryemployee.jsp");
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
	}
}