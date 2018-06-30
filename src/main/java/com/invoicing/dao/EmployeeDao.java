/**
 * 
 */
package com.invoicing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.invoicing.entity.Employee;

/**
 * @author yuyang
 * 2017年8月27日
 */
public interface EmployeeDao {

	/**
	 * @param username
	 * @param password
	 * @return
	 */
	//通过用户名和密码来查询Staff数据是否存在
	Employee queryEmployeeByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

	/**
	 * @return
	 */
	List<Employee> queryAllEmployee();

	/**
	 * @param sql
	 * @return
	 */
	List<Employee> queryEmployee(@Param("sql")String sql);

	/**
	 * @param employee
	 * @return
	 */
	int addEmployee(Employee employee);

	/**
	 * @param emid
	 * @return
	 */
	int deleteEmployee(long emid);

	/**
	 * @param emid
	 * @return
	 */
	Employee queryEmployeeByEmid(long emid);

	/**
	 * @param employee
	 * @return
	 */
	int updateEmployee(Employee employee);

}
