
public class SalaryEmployee extends Employee {
	private double salary; // in dollars
	private int overtime; // in hours
	private double overtimeRate; // in dollars per hour
	
	public SalaryEmployee(String n, int id, double s, double rate) {
		super(n, id);
		salary = s;
		overtime = 0;
		overtimeRate = rate;
	}
	
	public int getOvertime() {
		return overtime;
	}
	
	public double getSalary() {
		return salary;
	}
	
	public double getOvertimeRate() {
		return overtimeRate;
	}
}
