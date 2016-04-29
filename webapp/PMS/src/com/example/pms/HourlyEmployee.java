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
		employeeType = new Hourly();
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
}
