package com.example.pms;



import java.util.ArrayList;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public abstract class Employee {
	@Id private long ID;
	private String name;
	
	protected double yearsWorked;
	protected int sickDays;
	ArrayList<Long> payDates;
	ArrayList<Double> payAmounts;
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

	public void setPay(ArrayList<Long> dates, ArrayList<Double> amounts) {
		this.payDates = dates;
		this.payAmounts = amounts;
	}

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	
	protected Employee() {}
	
	public Employee(String n, long id) {
		name = n;
		ID = id;
		payDates = new ArrayList<>();
		payAmounts = new ArrayList<>();
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
		payDates.add(l);
		payAmounts.add(d);
	}
	
	public double getYearsWorked() {
		return yearsWorked;
	}

	public ArrayList<Long> getPayDates() {
		return payDates;
	}
	
	public ArrayList<Double> getPayAmounts() {
		return payAmounts;
	}

	public double getBonus() {
		return bonus;
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
		if(!(getPayDates().equals(e.getPayDates()))) { return false; }
		if(!(getPayAmounts().equals(e.getPayAmounts()))) { return false; }
		if(!(getBonus() == e.getBonus())) { return false; }

		return true;
	}

	public abstract double calcContribution();
	
	public abstract int analyzeProductivity(double cont);
}
