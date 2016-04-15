package com.example.pms;



public class Hourly implements EmployeeType {

	@Override
	public double calcContribution(Employee e) {
		HourlyEmployee e1 = (HourlyEmployee) e;
		
		return 0;
	}

	@Override
	public double calcCompensation(Employee e) {
		HourlyEmployee e1 = (HourlyEmployee) e;
		
		return e1.getHours() * e1.getPayRate();
	}

	@Override
	public int analyzeProductivity(double cont, double comp) {
		
		return 0;
	}

}
