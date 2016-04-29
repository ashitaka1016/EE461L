package com.example.pms;

import java.util.HashMap;

import com.googlecode.objectify.annotation.EntitySubclass;
import com.googlecode.objectify.annotation.Id;


@EntitySubclass(index=true)
public class HourlyEmployee extends Employee {
	private double hours;
	private double expectedHours;
	private double payRate;
	
	public HourlyEmployee(String n, long id) {
		super(n, id);
		payRate = 0;
		hours = 0;
		expectedHours = 0;
	}
	
	private HourlyEmployee() {}
	
	public double getHours() {
		return hours;
	}
	
	public double getPayRate() {
		return payRate;
	}
	
	public double calcCompensation() {
		return hours * payRate;
	}

	public double getExpectedHours() {
		return expectedHours;
	}
	
	public void setHours(double h) {
		hours = h;
	}
	
	public void setExpectedHours(double h) {
		expectedHours = h;
	}
	
	public void setPayRate(double r) {
		payRate = r;
	}
	
	@Override
	public boolean equals(Object o) {
		if(!(o instanceof HourlyEmployee)) {
			return false;
		}
		
		super.equals(o);
		
		HourlyEmployee e = (HourlyEmployee) o;
		
		if(!(getHours() == e.getHours())) { return false; }
		if(!(getPayRate() == e.getPayRate())) { return false; }
		if(!(getExpectedHours() == e.getExpectedHours())) { return false; }
		
		return true;
	}
	
	@Override
	public double calcContribution() {
		double workRatio = hours / expectedHours;
		
		if(((sickDays * 8) > (hours * 0.1)) && (workRatio < 1.25)) { // based on average 8 hour workday
			return 0;
		}
		
		return workRatio;
	}
	
	@Override
	public int analyzeProductivity(double cont) {
		if(cont >= 1.25) {
			return 5; // employee has worked at least 25% over expected work hours
		}
		
		if(cont >= 1.10) {
			return 4; // employee has worked at least 10% over expected work hours
		}
		
		if(cont >= 1.00) {
			return 3; // employee has worked as expected
		}
		
		if(cont >= 0.85) {
			return 2; // employee has worked at least 85% of expected work hours
		}
		
		return 1; // employee has not met expectations whatsoever
	}
}
