import java.util.HashSet;

public class Employer {
	private HashSet<Employee> employees;
	private String name;
	private String username;
	private String password;
	
	public boolean addEmployee(Employee e) {
		return employees.add(e);
	}
	
	public boolean removeEmployee(Employee e) {
		return employees.remove(e);
	}
}
