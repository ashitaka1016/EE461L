package com.example.pms;



import java.util.HashSet;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Employer {
	private HashSet<Long> employees;
	private String name;
	@Id private String username;
	private String password;
	
	private Employer() { }
	
	public Employer(String n, String u, String p) {
		name = n;
		username = u;
		password = p;
		employees = new HashSet<>();
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
}
