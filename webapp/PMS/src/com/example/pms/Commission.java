package com.example.pms;


public class Commission implements EmployeeType {

	public double calcContribution(Employee e) {
		CommissionEmployee e1 = (CommissionEmployee) e;
		double difference = .3*(e1.getMaxSales()-e1.getSales()) + .7*(e1.getPrevYearSales()-e1.getSales());
		
		if(e1.getSales() == 0) {
			return 0.5;
		}
		
		return difference/e1.getSales();
	}

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
