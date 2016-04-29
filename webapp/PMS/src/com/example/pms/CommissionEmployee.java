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
		
		sales += bonus;
		
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
	
	@Override
	public double calcContribution() {
		double difference = .3*(maxSales-sales) + .7*(previousYearSales-sales);
		
		if(sales == 0) {
			return 0.5;
		}
		
		return difference/sales;
	}
	
	@Override
	public int analyzeProductivity(double cont) { // from 1 to 5
		if(cont < 0) {
			return 5; // employee has exceeded previous year sales, greatly exceeded maximum sales, or both
		}
		
		if(cont <= 0.05) {
			return 4; // 
		}
		
		if(cont <= 0.2) {
			return 3; // "C" grade
		}
		
		if(cont <= 0.35) {
			return 2; // "D" grade
		}
		
		return 1; // "F" grade
	}
}
