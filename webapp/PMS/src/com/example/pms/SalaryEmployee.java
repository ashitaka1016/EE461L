package com.example.pms;

import com.googlecode.objectify.annotation.EntitySubclass;


@EntitySubclass
public class SalaryEmployee extends Employee {
	private double salary; // in dollars
	private int overtime; // in hours
	private double overtimeRate; // in dollars per hour
	private int vacDays;
	private int sickDaysTaken;
	
	public void setSalary(double salary) {
		this.salary = salary;
	}

	public void setOvertime(int overtime) {
		this.overtime = overtime;
	}

	public void setOvertimeRate(double overtimeRate) {
		this.overtimeRate = overtimeRate;
	}

	public void setVacDays(int vacDays) {
		this.vacDays = vacDays;
	}

	public void setSickDaysTaken(int sickDaysTaken) {
		this.sickDaysTaken = sickDaysTaken;
	}
	
	public SalaryEmployee(String n, long id) {
		super(n, id);
		salary = 0;
		overtime = 0;
		overtimeRate = 0;
	}
	
	private SalaryEmployee() {}
	
	public int getOvertime() {
		return overtime;
	}
	
	public double getSalary() {
		return salary;
	}
	
	public double getOvertimeRate() {
		return overtimeRate;
	}
	
	@Override
	public double calcCompensation() {
		double compensation = salary;
		
		if(overtime > 0) {
			compensation += (overtimeRate * overtime);
		}
		
		salary += bonus;
		
		return compensation;
	}

	public int getVacDays() {
		return vacDays;
	}

	public int getSickDaysTaken() {
		return sickDaysTaken;
	}
	
	public boolean equals(Object o) {
		if(!(o instanceof SalaryEmployee)) {
			return false;
		}
		
		super.equals(o);
		
		SalaryEmployee e = (SalaryEmployee) o;
		
		if(!(getSalary() == e.getSalary())) { return false; }
		if(!(getOvertimeRate() == e.getOvertimeRate())) { return false; }
		if(!(getOvertime() == e.getOvertime())) { return false; }
		if(!(getVacDays() == e.getVacDays())) { return false; }
		if(!(getSickDaysTaken() == e.getSickDaysTaken())) { return false; }
		
		return true;
	}
	
	@Override
	public double calcContribution() {
		double payPerDay = salary / (260 - vacDays);
		
		if((sickDaysTaken * payPerDay) > (0.03 * salary)) {
			return -1.0;
		}
		
		return overtime;
	}
	
	@Override
	public int analyzeProductivity(double cont) {
		if(cont >= 36) {
			return 5;
		}
		
		if(cont >= 12) {
			return 4;
		}
		
		if(cont >= 0) {
			return 3;
		}
		
		return 2; // no "F" grades for salary employees
	}
	
	public String toString() {
		return "Salary";
	}
}
