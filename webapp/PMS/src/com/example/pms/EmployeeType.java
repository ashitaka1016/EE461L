package com.example.pms;



public interface EmployeeType {
	public double calcContribution(Employee e);
	public double calcCompensation(Employee e);
	public int analyzeProductivity(double cont, double comp);
}
