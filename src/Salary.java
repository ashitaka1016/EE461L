
public class Salary implements EmployeeType {

	@Override
	public double calcContribution(Employee e) {
		Employee e1 = (SalaryEmployee) e;
		return 0;
	}

	@Override
	public double calcCompensation(Employee e) {
		Employee e1 = (SalaryEmployee) e;
		return 0;
	}

	@Override
	public double analyzeProductivity(double cont, double comp) {
		// TODO Auto-generated method stub
		return 0;
	}

}
