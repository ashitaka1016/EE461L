package com.example.pms;

import java.util.HashMap;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import static org.junit.Assert.*;

public class testAlgorithms {
	HourlyEmployee hourly;
	SalaryEmployee salary;
	CommissionEmployee commission;
	
	Double contribution;
	
	@Before
	public void setUp() {
		hourly = new HourlyEmployee("Steve", 1);
		hourly.setHours(10);
		hourly.setPayRate(9);
		
		salary = new SalaryEmployee("Mike", 2);
		salary.setSalary(100000);
		salary.setOvertime(0);
		salary.setOvertimeRate(100);
		salary.setBonus(0);
		salary.setVacDays(10);
		
		commission = new CommissionEmployee("Bob", 3);
		commission.setCommRate(20);
		commission.setSales(5);
		commission.setMaxSales(0);
	}
	
	@Test
	public void testHourlyCompensation() {
		assertEquals(new Double(90), new Double(hourly.calcCompensation()));
	}
	
	@Test
	public void testHourlyContributionSick() {
		hourly.setHours(100);
		hourly.setSickDays(2);
		hourly.setExpectedHours(100);
		
		assertEquals(new Double(0), new Double(hourly.calcContribution()));
	}
	
	@Test
	public void testHourlyContributionHealthy() {
		hourly.setHours(125);
		hourly.setSickDays(0);
		hourly.setExpectedHours(100);
		
		assertEquals(new Double(1.25), new Double(hourly.calcContribution()));
	}
	
	@Test
	public void testHourlyProductivityA() {
		hourly.setHours(125);
		hourly.setSickDays(0);
		hourly.setExpectedHours(100);
		
		contribution = hourly.calcContribution();
		
		assertEquals(new Integer(5), new Integer(hourly.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testHourlyProductivityB() {
		hourly.setHours(110);
		hourly.setSickDays(0);
		hourly.setExpectedHours(100);
		
		contribution = hourly.calcContribution();
		
		assertEquals(new Integer(4), new Integer(hourly.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testHourlyProductivityC() {
		hourly.setHours(100);
		hourly.setSickDays(0);
		hourly.setExpectedHours(100);
		
		contribution = hourly.calcContribution();
		
		assertEquals(new Integer(3), new Integer(hourly.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testHourlyProductivityD() {
		hourly.setHours(85);
		hourly.setSickDays(0);
		hourly.setExpectedHours(100);
		
		contribution = hourly.calcContribution();
		
		assertEquals(new Integer(2), new Integer(hourly.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testHourlyProductivityF() {
		hourly.setHours(50);
		hourly.setSickDays(0);
		hourly.setExpectedHours(100);
		
		contribution = hourly.calcContribution();
		
		assertEquals(new Integer(1), new Integer(hourly.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testCommissionCompensation() {
		assertEquals(new Double(100), new Double(commission.calcCompensation()));
	}
	
	@Test
	public void testCommissionContributionNoSales() {
		commission.setSales(0);
		
		assertEquals(new Double(0.5), new Double(commission.calcContribution()));
	}
	
	@Test
	public void testCommissionContributionSales() {
		commission.setSales(100);
		commission.setMaxSales(110);
		commission.setPreviousYearSales(90);
		
		assertEquals(new Double(-0.04), new Double(commission.calcContribution()));
	}
	
	@Test
	public void testCommissionProductivityA() {
		commission.setSales(100);
		commission.setMaxSales(110);
		commission.setPreviousYearSales(90);
		
		contribution = commission.calcContribution();
		
		assertEquals(new Integer(5), new Integer(commission.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testCommissionProductivityB() {
		commission.setSales(100);
		commission.setMaxSales(110);
		commission.setPreviousYearSales(100);
		
		contribution = commission.calcContribution();
		
		assertEquals(new Integer(4), new Integer(commission.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testCommissionProductivityC() {
		commission.setSales(100);
		commission.setMaxSales(120);
		commission.setPreviousYearSales(100);
		
		contribution = commission.calcContribution();
		
		assertEquals(new Integer(3), new Integer(commission.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testCommissionProductivityD() {
		commission.setSales(100);
		commission.setMaxSales(150);
		commission.setPreviousYearSales(120);
		
		contribution = commission.calcContribution();
		
		assertEquals(new Integer(2), new Integer(commission.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testCommissionProductivityF() {
		commission.setSales(100);
		commission.setMaxSales(150);
		commission.setPreviousYearSales(150);
		
		contribution = commission.calcContribution();
		
		assertEquals(new Integer(1), new Integer(commission.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testSalaryCompensation() {
		assertEquals(new Double(100000), new Double(salary.calcCompensation()));
	}
	
	@Test
	public void testSalaryContributionSick() {
		salary.setOvertime(0);
		salary.setSickDaysTaken(8);
		
		assertEquals(new Double(-1), new Double(salary.calcContribution()));
	}
	
	@Test
	public void testSalaryContributionHealthy() {
		salary.setOvertime(0);
		salary.setSickDaysTaken(2);
		
		assertEquals(new Double(0), new Double(salary.calcContribution()));
	}
	
	@Test
	public void testSalaryProductivityA() {
		salary.setOvertime(37);
		salary.setSickDaysTaken(2);
		
		contribution = salary.calcContribution();
		
		assertEquals(new Integer(5), new Integer(salary.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testSalaryProductivityB() {
		salary.setOvertime(15);
		salary.setSickDaysTaken(7);
		
		contribution = salary.calcContribution();
		
		assertEquals(new Integer(4), new Integer(salary.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testSalaryProductivityC() {
		salary.setOvertime(0);
		salary.setSickDaysTaken(5);
		
		contribution = salary.calcContribution();
		
		assertEquals(new Integer(3), new Integer(salary.analyzeProductivity(contribution)));
	}
	
	@Test
	public void testSalaryProductivityD() {
		salary.setOvertime(0);
		salary.setSickDaysTaken(9);
		
		contribution = salary.calcContribution();
		
		assertEquals(new Integer(2), new Integer(salary.analyzeProductivity(contribution)));
	}
}
