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
		
		Double salary = e.getSalary();
		Integer overtime = e.getOvertime();
		Double overtimeRate = e.getOvertimeRate();
		Integer vacDays = e.getVacDays();
		Integer sickDaysTaken = e.getSickDaysTaken();
		Integer sickDays = e.getSickDays();
		Double yearsWorked = e.getYearsWorked();
		Double bonus = e.getBonus();
		
		try {
			if(!req.getParameter("salary").equals("")) { salary = Double.parseDouble(req.getParameter("salary")); }
			if(!req.getParameter("overtime").equals("")) { overtime = Integer.parseInt(req.getParameter("overtime")); }
			if(!req.getParameter("overtimeRate").equals("")) { overtimeRate = Double.parseDouble(req.getParameter("overtimeRate")); }
			if(!req.getParameter("vacationDays").equals("")) { vacDays = Integer.parseInt(req.getParameter("vacationDays")); }
			if(!req.getParameter("sickDaysTaken").equals("")) { sickDaysTaken = Integer.parseInt(req.getParameter("sickDaysTaken")); }
			if(!req.getParameter("sickDays").equals("")) { sickDays = Integer.parseInt(req.getParameter("sickDays")); }
			if(!req.getParameter("yearsWorked").equals("")) { yearsWorked = Double.parseDouble(req.getParameter("yearsWorked")); }
			if(!req.getParameter("bonus").equals("")) { bonus = Double.parseDouble(req.getParameter("bonus")); }
		} catch(NumberFormatException e1) {
			resp.sendRedirect("/editsalaryerror.jsp");
			return;
		}
		
		ofy().delete().entity(employer).now();
		employer.removeEmployee(e);
		
		e.setBonus(bonus);
		e.setSalary(salary);
		e.setOvertime(overtime);
		e.setOvertimeRate(overtimeRate);
		e.setVacDays(vacDays);
		e.setYearsWorked(yearsWorked);
		e.setSickDaysTaken(sickDaysTaken);
		e.setSickDays(sickDays);
		
		employer.addEmployee(e);
		ofy().save().entity(employer).now();
		resp.sendRedirect("/editsalaryemployee.jsp");
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
	}
}