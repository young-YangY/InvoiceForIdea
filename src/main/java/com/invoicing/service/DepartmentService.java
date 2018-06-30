/**
 * 
 */
package com.invoicing.service;

import java.util.List;

import com.invoicing.entity.Department;

/**
 * @author yuyang
 * 2017年9月13日
 */
public interface DepartmentService {

	/**
	 * @param departmentName
	 * @param departmentTelephone
	 * @return
	 */
	List<Department> queryDepartment(String departmentName, String departmentTelephone);

	/**
	 * @param departmentName
	 * @param departmentTelephone
	 * @param deid 
	 */
	void addDepartment(Integer deid,String departmentName, String departmentTelephone);

	/**
	 * @param deid
	 * @return
	 */
	Department queryDepartmentById(Integer deid);

	/**
	 * @param deid
	 */
	void deleteDepartment(Integer deid);

}
