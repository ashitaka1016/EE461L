package com.example.pms;

import com.googlecode.objectify.annotation.EntitySubclass;


@EntitySubclass
public class CommissionEmployee extends Employee {
	private double sales; // in dollars
	private int commRate; // in whole number from 1 to 100
	private double previousYearSales;
	private double maxSales; // record sales since being employed
	
	public CommissionEmployee(String name, int ID, int rate) {
		super(name, ID);
		employeeType = new Commission();
		sales = 0;
		previousYearSales = 0;
		maxSales = 0;
		commRate = rate;
	}
	
	private CommissionEmployee() {}
	
	public double getSales() {
		return sales;
	}
	
	public double getCommRate() {
		return commRate * 0.01;
	}
	
	public double getPrevYearSales() {
		return previousYearSales;
	}
	
	public double getMaxSales() {
		return maxSales;
	}
	
	public void setMaxSales(double s) {
		maxSales = s;
	}
}
