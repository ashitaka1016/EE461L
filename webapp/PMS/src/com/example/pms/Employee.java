package com.example.pms;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Serialize;

@Entity
public abstract class Employee implements Serializable, Comparable<Employee> {
	@Id private long ID;
	private String name;
	
	protected double yearsWorked;
	protected String startDate;
	protected int sickDays;
	@Serialize protected ArrayList<Date> dates;
	@Serialize protected ArrayList<Double> amounts;
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

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	
	protected Employee() {}
	
	public Employee(String n, long id) {
		name = n;
		ID = id;
		dates = new ArrayList<>();
		amounts = new ArrayList<>();
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
	
	public double getYearsWorked() {
		return yearsWorked;
	}

	public ArrayList<Date> getDates() {
		return dates;
	}
	
	public ArrayList<Double> getAmounts() {
		return amounts;
	}
	
	public void addPayment(Date date, Double amount) {
		int i = dates.size();
		
		if((!(dates.isEmpty())) && (date.compareTo(dates.get(dates.size() - 1)) < 0)) {
			for(i = dates.size() - 1; i >= 0; i -= 1) {
				if(date.compareTo(dates.get(i)) >= 0) {
					i += 1;
					break;
				}
			}
		}
		
		if(i == -1) { i = 0; }
		
		dates.add(i, date);
		amounts.add(i, amount);
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
		if(!(getDates().equals(e.getDates()))) { return false; }
		if(!(getAmounts().equals(e.getAmounts()))) { return false; }
		if(!(getBonus() == e.getBonus())) { return false; }

		return true;
	}

	public abstract double calcContribution();
	
	public abstract int analyzeProductivity(double cont);
	
	public abstract String toString();
	
	public int compareTo(Employee e) {
		if(this.ID < e.getID()) { return -1; }
		if(this.ID == e.getID()) { return 0; }
		
		return 1;
	}

}
