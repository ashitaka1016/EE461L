package com.example.pms;

import java.util.HashMap;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import static org.junit.Assert.*;

public class testAlgorithms {	
	@Before
	public void setUp() {
		HourlyEmployee hourly = new HourlyEmployee("Steve", 1);
		hourly.setHours(10);
		hourly.setPayRate(9);
		hourly.setExpectedHours(0);
		
		SalaryEmployee salary = new SalaryEmployee("Mike", 2);
		salary.setSalary(10000);
		salary.setOvertime(0);
		
		CommissionEmployee commission = new CommissionEmployee("Bob", 3);
		commission.setCommRate(20);
		commission.setSales(5);
		commission.setMaxSales(0);
	}
	
	@Test
	public void testHourlyCompensation() {
		HourlyEmployee e = new HourlyEmployee("Steve", 1);
		e.setHours(10);
		e.setPayRate(9);
		
		assertEquals(new Double(90), new Double(e.calcCompensation()));
	}
	
	@Test
	public void testHourlyContribution() {
		
	}
	
	@Test
	public void testHourlyProductivity() {
		
	}
	
	@Test
	public void testCommissionCompensation() {
		
	}
	
	@Test
	public void testCommissionContribution() {
		
	}
	
	@Test
	public void testCommissionProductivity() {
		
	}
	
	@Test
	public void testSalaryCompensation() {
		
	}
	
	@Test
	public void testSalaryContribution() {
		
	}
	
	@Test
	public void testSalaryProductivity() {
		
	}
}
