package com.example.pms;



public class Salary implements EmployeeType {

	public double calcContribution(Employee e) {
		SalaryEmployee e1 = (SalaryEmployee) e;
		
		return 0;
	}

	public double calcCompensation(Employee e) {
		SalaryEmployee e1 = (SalaryEmployee) e;
		double compensation = e1.getSalary();
		
		if(e1.getOvertime() > 0) {
			compensation += (e1.getOvertimeRate() * e1.getOvertime());
		}
		
		return compensation;
	}

	public int analyzeProductivity(double cont, double comp) {
		
		return 0;
	}

}
