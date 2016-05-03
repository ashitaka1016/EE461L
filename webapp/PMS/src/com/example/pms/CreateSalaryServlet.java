package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@SuppressWarnings("serial")
public class CreateSalaryServlet extends HttpServlet {
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
		Double salary = 0.;
		Integer overtime = 0;
		Double overtimeRate = 0.;
		Integer vacDays = 0;
		Integer sickDaysTaken = 0;
		Integer sickDays = 0;
		Double yearsWorked = 0.;
		Double bonus = 0.;
		
		try {
			salary = Double.parseDouble(req.getParameter("salary"));
			overtime = Integer.parseInt(req.getParameter("overtime"));
			overtimeRate = Double.parseDouble(req.getParameter("overtimeRate"));
			vacDays = Integer.parseInt(req.getParameter("vacationDays"));
			sickDaysTaken = Integer.parseInt(req.getParameter("sickDaysTaken"));
			sickDays = Integer.parseInt(req.getParameter("sickDays"));
			yearsWorked = Double.parseDouble(req.getParameter("yearsWorked"));
			bonus = Double.parseDouble(req.getParameter("bonus"));
		} catch(NumberFormatException e) {
			resp.sendRedirect("/createsalaryerror.jsp");
			return;
		}
		
		if((salary == null) || (overtime == null) || (overtimeRate == null) || (vacDays == null) || (sickDaysTaken == null) || (sickDays == null) || (yearsWorked == null) || (bonus == null)) { 
			resp.sendRedirect("/createsalaryerror.jsp");
			return;
		}
		
		SalaryEmployee e = (SalaryEmployee) req.getSession().getAttribute("currentEmployee");
		Employer employer = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
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
		
		req.getSession().setAttribute("currentEmployee", e);
		
		resp.sendRedirect("/dashboard.jsp");
	}
	
}