package com.example.pms;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Employer {
	private ArrayList<Long> employees;
	private String name;
	@Id private String username;
	private String password;
	
	private Employer() { }
	
	public Employer(String n, String u, String p) {
		name = n;
		username = u;
		password = p;
		employees = new ArrayList<>();
	}
	
	public boolean addEmployee(Employee e) {
		return employees.add(e.getID());
	}
	
	public boolean removeEmployee(Employee e) {
		return employees.remove(e.getID());
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPay(Employee e, Long date, Double amount) {
		e.addPayday(date, amount);
	}
	
	public Long parseDate(String d) throws NumberFormatException {
		Long date = Long.parseLong(d.substring(0, 4)) * 10000 + Long.parseLong(d.substring(5, 7)) * 100 + Long.parseLong(d.substring(8, 10));
		
		if((d.charAt(4) != '/') && (d.charAt(7) != '/')) {
			throw new NumberFormatException();
		}
		
		return date;
	}
}
