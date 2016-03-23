
public class SalaryEmployee extends Employee {
	private double salary;
	private int overtime; // in hours
	private double overtimeRate;
	
	public SalaryEmployee(String n, int id, double s, double rate) {
		super(n, id);
		salary = s;
		overtime = 0;
		overtimeRate = rate;
	}
	
}
