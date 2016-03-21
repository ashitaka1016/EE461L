import java.util.ArrayList;
import java.util.Date;

public abstract class Employee {
	protected double yearsWorked;
	protected int sickDays;
	protected int vacDays;
	protected String name;
	protected ArrayList<Date> paydays;
	protected int ID;
	protected double bonus;
	
	public double calcContribution() { // productivity metric
		return 0.0;
	}
	
	public double calcCompensation() { // dollar value
		return 0.0;
	}
	
	public double analyzeProductivity(double cont, double comp) { // based on contribution and compensation
		return 0.0;
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
