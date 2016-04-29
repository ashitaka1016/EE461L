package com.example.pms;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public abstract class Employee {
	@Id private long ID;
	private String name;
	
	protected double yearsWorked;
	protected int sickDays;
	protected HashMap<Long, Double> pay;
	protected double bonus; // could take the form of a base salary for commission employees
	protected EmployeeType employeeType;
	
	public void setID(long iD) {
		ID = iD;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setYearsWorked(double yearsWorked) {
		this.yearsWorked = yearsWorked;
	}

	public void setSickDays(int sickDays) {
		this.sickDays = sickDays;
	}

	public void setPay(HashMap<Long, Double> pay) {
		this.pay = pay;
	}

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	
	protected Employee() {}
	
	public Employee(String n, long id) {
		name = n;
		ID = id;
		pay = new HashMap<>();
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
	
	public int getSickDays() {
		return sickDays;
	}
	
	public double calcCompensation() {
		return 0.0;
	}
	
	public void genSummary() {
		
	}
	
	public void addPayday(Long l, Double d) {
		pay.put(l, d);
	}
	
	public double getYearsWorked() {
		return yearsWorked;
	}

	public HashMap<Long, Double> getPay() {
		return pay;
	}

	public double getBonus() {
		return bonus;
	}

	public EmployeeType getEmployeeType() {
		return employeeType;
	}
	
	public boolean equals(Object o) {
		if(!(o instanceof Employee)) {
			return false;
		}
		
		Employee e = (Employee) o;
		
		if(!(getID() == e.getID())) { return false; }
		if(!(getName() == e.getName())) { return false; }
		if(!(getYearsWorked() == e.getYearsWorked())) { return false; }
		if(!(getSickDays() == e.getSickDays())) { return false; }
		if(!(getPay().equals(e.getPay()))) { return false; }
		if(!(getBonus() == e.getBonus())) { return false; }
		if(!(getEmployeeType() == e.getEmployeeType())) { return false; }

		return true;
	}
}
