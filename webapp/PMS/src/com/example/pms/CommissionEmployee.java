package com.example.pms;

import com.googlecode.objectify.annotation.EntitySubclass;


@EntitySubclass
public class CommissionEmployee extends Employee {
	private double sales; // in dollars
	private int commRate; // in whole number from 1 to 100
	private double previousYearSales;
	private double maxSales; // record sales since being employed
	
	public CommissionEmployee(String name, long id) {
		super(name, id);
		employeeType = new Commission();
		sales = 0;
		previousYearSales = 0;
		maxSales = 0;
		commRate = 0;
	}
	
	public void setSales(double sales) {
		this.sales = sales;
	}

	public void setCommRate(int commRate) {
		this.commRate = commRate;
	}

	public void setPreviousYearSales(double previousYearSales) {
		this.previousYearSales = previousYearSales;
	}

	public void setMaxSales(double maxSales) {
		this.maxSales = maxSales;
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
	
	@Override
	public double calcCompensation() {
		double sales = commRate * this.sales;
		
		if((maxSales == 0) || (maxSales < this.sales)) {
			maxSales = this.sales;
		}
		
		return sales; // assumption that employee works purely off of commission
	}
	
	public boolean equals(Object o) {
		if(!(o instanceof CommissionEmployee)) {
			return false;
		}
		
		super.equals(o);
		
		CommissionEmployee e = (CommissionEmployee) o;
		
		if(!(getSales() == e.getSales())) { return false; }
		if(!(getCommRate() == e.getCommRate())) { return false; }
		if(!(getPrevYearSales() == e.getPrevYearSales())) { return false; }
		if(!(getMaxSales() == e.getMaxSales())) { return false; }
		
		return true;
	}
}
