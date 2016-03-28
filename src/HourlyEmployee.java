
public class HourlyEmployee extends Employee {
	private double hours;
	private double payRate;
	
	public HourlyEmployee(String n, int id, double rate) {
		super(n, id);
		payRate = rate;
		hours = 0;
	}
	
	public double getHours() {
		return hours;
	}
	
	public double getPayRate() {
		return payRate;
	}
	
}
