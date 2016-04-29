package com.example.pms;



public class Salary implements EmployeeType {

	public double calcContribution(Employee e) {
		SalaryEmployee e1 = (SalaryEmployee) e;
		double payPerDay = e1.getSalary() / (260 - e1.getVacDays());
		
		if((e1.getSickDaysTaken() * payPerDay) > (0.15 * e1.getSalary())) {
			return -1.0;
		}
		
		return e1.getOvertime();
	}

	public int analyzeProductivity(double cont) {
		if(cont > 24) {
			return 5;
		}
		
		if(cont > 0) {
			return 4;
		}
		
		if(cont == 0) {
			return 3;
		}
		
		return 2; // no "F" grades for salary employees
	}

}
