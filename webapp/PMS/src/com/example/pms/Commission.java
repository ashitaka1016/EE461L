package com.example.pms;


public class Commission implements EmployeeType {

	public double calcContribution(Employee e) {
		CommissionEmployee e1 = (CommissionEmployee) e;
		double difference = .3*(e1.getMaxSales()-e1.getSales()) + .7*(e1.getPrevYearSales()-e1.getSales());
		
		return difference/e1.getSales();
	}

	public double calcCompensation(Employee e) {
		CommissionEmployee e1 = (CommissionEmployee) e;
		double sales = e1.getCommRate() * e1.getSales();
		
		if((e1.getMaxSales() == 0) || (e1.getMaxSales() < e1.getSales())) {
			e1.setMaxSales(e1.getSales());
		}
		
		return sales; // assumption that employee works purely off of commission
	}

	public int analyzeProductivity(double cont, double comp) { // from 1 to 5
		if(comp == 0) {
			return 1; // corresponds to "F" grade, meaning no sales made
		}
		
		if(cont < 0) {
			return 5; // "A" grade
		}
		
		if(cont <= 0.05) {
			return 4; // "B" grade
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
