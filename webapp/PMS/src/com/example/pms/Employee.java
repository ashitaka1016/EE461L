package com.example.pms;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Serialize;

@Entity
public abstract class Employee implements Serializable {
	@Id private long ID;
	private String name;
	
	protected double yearsWorked;
	protected String startDate;
	protected int sickDays;
	@Serialize protected HashMap<Date, Double> pay;
	protected double bonus = 0; // could take the form of a base salary for commission employees
	
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

	public void setPay(HashMap<Date, Double> map) {
		pay = map;
	}

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	
	protected Employee() {}
	
	public Employee(String n, long id) {
		name = n;
		ID = id;
		pay = new HashMap<>();
		startDate = "1800/10/10";
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
	
	public void addPayday(Date d, Double dou) {
		pay.put(d, dou);
	}
	
	public double getYearsWorked() {
		return yearsWorked;
	}

	public HashMap<Date, Double> getPay() {
		return pay;
	}

	public double getBonus() {
		return bonus;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public boolean equals(Object o) {
		if(!(o instanceof Employee)) {
			return false;
		}
		
		Employee e = (Employee) o;
		
		if(!(getID() == e.getID())) { return false; }
		if(!(getName().equals(e.getName()))) { return false; }
		if(!(getYearsWorked() == e.getYearsWorked())) { return false; }
		if(!(getSickDays() == e.getSickDays())) { return false; }
		if(!(getPay().equals(e.getPay()))) { return false; }
		if(!(getBonus() == e.getBonus())) { return false; }

		return true;
	}

	public abstract double calcContribution();
	
	public abstract int analyzeProductivity(double cont);
}
