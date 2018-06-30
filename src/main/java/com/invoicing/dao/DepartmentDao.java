/**
 * 
 */
package com.invoicing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.invoicing.entity.Department;

/**
 * @author yuyang
 * 2017年9月13日
 */
public interface DepartmentDao {

	/**
	 * @return 
	 * 
	 */
	List<Department> queryDepartment();

	/**
	 * @param departmentName
	 * @param departmentTelephone
	 * @return
	 */
	int addDepartment(@Param("departmentName")String departmentName, @Param("departmentTelephone")String departmentTelephone);

	/**
	 * @param departmentName 
	 * @return
	 */
	List<Department> queryDepartmentByName(@Param("departmentName") String departmentName);

	/**
	 * @param departmentTelephone
	 * @return
	 */
	List<Department> queryDepartmentByTelephone(@Param("departmentTelephone") String departmentTelephone);

	/**
	 * @param departmentName
	 * @param departmentTelephone
	 * @return
	 */
	List<Department> queryDepartmentByNameAndTelephone(@Param("departmentName") String departmentName,@Param("departmentTelephone") String departmentTelephone);

	/**
	 * @param deid
	 * @return
	 */
	Department queryDepartmentById(@Param("deid")Integer deid);

	/**
	 * @param did
	 * @param departmentName
	 * @param departmentTelephone
	 * @return
	 */
	int update(@Param("deid") Integer deid,@Param("departmentName") String departmentName,@Param("departmentTelephone") String departmentTelephone);

	/**
	 * @param deid
	 * @return
	 */
	int deleteDepartment(@Param("deid") Integer deid);
	
}
