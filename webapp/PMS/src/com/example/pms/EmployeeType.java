package com.example.pms;



public interface EmployeeType {
	public double calcContribution(Employee e);
	
	/**************************************
	 * 1 ("F") : poor performance
	 * 2 ("D") : does not meet expectations
	 * 3 ("C") : average performance
	 * 4 ("B") : exceeds expectations
	 * 5 ("A") : superior performance
	 **************************************/
	public int analyzeProductivity(double cont);
}
