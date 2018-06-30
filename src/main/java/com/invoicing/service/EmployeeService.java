package com.invoicing.service;

import java.util.List;

import com.invoicing.entity.Employee;

/**
 * @author yuyang
 * 2017年8月27日
 */
public interface EmployeeService {
	
	/**
	 * @param staff
	 * @return
	 */
	List<Employee> queryEmployee(Employee employee);

	/**
	 * @return
	 */
	List<Employee> queryAllEmployee();

	/**
	 * @param username
	 * @param password
	 * @return
	 */
	Employee queryEmployeeByUsernameAndPassword(String username, String password);

	/**
	 * @param employee
	 */
	void addEmployee(Employee employee);

	/**
	 * @param emid
	 */
	void deleteEmployee(long emid);

	/**
	 * @param emid
	 * @return
	 */
	Employee queryEmployeeByEmid(long emid);

	/**
	 * @param employee
	 */
	void updateEmployee(Employee employee);

}
