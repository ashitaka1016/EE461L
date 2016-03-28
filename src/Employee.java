import java.util.ArrayList;
import java.util.Date;

public abstract class Employee {
	private int ID;
	private String name;
	
	protected double yearsWorked;
	protected int sickDays;
	protected int vacDays;
	protected ArrayList<Date> paydays;
	protected double bonus; // could take the form of a base salary for commission employees
	protected EmployeeType employeeType;
	
	public Employee(String n, int id) {
		name = n;
		ID = id;
	}
	
	public boolean equals(Employee e) {
		return this.ID == e.ID;
	}
	
	public int getID() {
		return ID;
	}
	
	public void genSummary() {
		
	}
}
