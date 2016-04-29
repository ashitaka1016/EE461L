package com.example.pms;

public class Hourly implements EmployeeType {

	@Override
	public double calcContribution(Employee e) {
		HourlyEmployee e1 = (HourlyEmployee) e;
		double workRatio = e1.getHours() / e1.getExpectedHours();
		
		if(((e1.getSickDays() * 8) > (e1.getHours() * 0.1)) && (workRatio < 1.25)) { // based on average 8 hour workday
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
