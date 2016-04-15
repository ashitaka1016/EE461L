package com.example.pms;



import java.util.ArrayList;
import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public abstract class Employee {
	@Id private long ID;
	private String name;
	
	protected double yearsWorked;
	protected int sickDays;
	protected int vacDays;
	protected ArrayList<Date> paydays;
	protected double bonus; // could take the form of a base salary for commission employees
	protected EmployeeType employeeType;
	
	protected Employee() {}
	
	public Employee(String n, long id) {
		name = n;
		ID = id;
	}
	
	public boolean equals(Employee e) {
		return this.ID == e.ID;
	}
	
	public long getID() {
		return ID;
	}
	
	public String getName() {
		return name;
	}
	
	public void genSummary() {
		
	}
}
