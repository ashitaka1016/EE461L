
public class CommissionEmployee extends Employee {
	private int sales;
	private double commRate;
	
	public CommissionEmployee(String name, int ID, double rate) {
		super(name, ID);
		employeeType = new Commission();
		sales = 0;
		commRate = rate;
	}
}
