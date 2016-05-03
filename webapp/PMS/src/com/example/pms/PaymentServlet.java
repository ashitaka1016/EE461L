package com.example.pms;

import java.io.IOException;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
//import java.util.logging.Logger;

@SuppressWarnings("serial")
public class PaymentServlet extends HttpServlet {
	static {
		ObjectifyService.register(com.example.pms.Employer.class);
		ObjectifyService.register(com.example.pms.Employee.class);
		ObjectifyService.register(com.example.pms.HourlyEmployee.class);
		ObjectifyService.register(com.example.pms.SalaryEmployee.class);
		ObjectifyService.register(com.example.pms.CommissionEmployee.class);
	}
	
	//private static final Logger log = Logger.getLogger(EditHourlyServlet.class.getName());
	  
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Date date = null;
		Double amount = 0.;
		
		try {
			if(!("".equals(req.getParameter("date")))) { date = Employer.parseDate(req.getParameter("date")); }
			if(!("".equals(req.getParameter("date")))) { amount = Double.parseDouble(req.getParameter("amount")); }
			if(date.compareTo(new Date()) < 0) { throw new Exception(); }
		} catch(Exception e) {
			resp.sendRedirect("paymententryerror.jsp");
			return;
		}
		
		Employee e = (Employee) req.getSession().getAttribute("currentEmployee");
		Employer e1 = ofy().load().type(Employer.class).id((String)req.getSession().getAttribute("employer")).get();
		
		ofy().delete().entity(e1).now();
		e1.removeEmployee(e);
		
		e.addPayday(date, amount);
		
		e1.addEmployee(e);
		ofy().save().entity(e1).now();
		
		req.getSession().setAttribute("currentEmployee", e);

		resp.sendRedirect("dashboard.jsp");
	}
}