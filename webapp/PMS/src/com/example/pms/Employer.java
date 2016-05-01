package com.example.pms;

import java.util.ArrayList;
import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Serialize;

@Entity
public class Employer {
	@Serialize private ArrayList<Employee> employees;
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
		return employees.add(e);
	}
	
	public boolean removeEmployee(Employee e) {
		return employees.remove(e);
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getName() {
		return name;
	}
	
	public ArrayList<Employee> getEmployees() {
		return employees;
	}
	
	public void setPay(Employee e, Date date, Double amount) {
		e.addPayday(date, amount);
	}
	
	public Date parseDate(String d) throws NumberFormatException {
		@SuppressWarnings("deprecation")
		Date date = new Date(Integer.parseInt(d.substring(0, 4)), Integer.parseInt(d.substring(5, 7)), Integer.parseInt(d.substring(8, 10)));
		
		if((d.charAt(4) != '/') || (d.charAt(7) != '/') || (d.length() > 10)) {
			throw new NumberFormatException();
		}
		
		return date;
	}
}
