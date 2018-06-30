/**
 * 
 */
package com.invoicing.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.invoicing.dao.DepartmentDao;
import com.invoicing.entity.Department;
import com.invoicing.service.DepartmentService;

/**
 * @author yuyang
 * 2017年9月13日
 */
@Service
public class DepartmentServiceImpl implements DepartmentService{
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());

	@Autowired
	private DepartmentDao departmentDao;
	/* (non-Javadoc)
	 * @see com.invoicing.service.DepartmentService#queryDepartment(java.lang.String, java.lang.String)
	 */
	public List<Department> queryDepartment(String departmentName, String departmentTelephone) {
		List<Department> list=null;
		if((departmentName==null || departmentName.equals("")) && 
				(departmentTelephone==null || departmentTelephone.equals(""))) {
			list = departmentDao.queryDepartment();
		}else if((departmentName!=null && !departmentName.equals("")) &&
				(departmentTelephone==null || departmentTelephone.equals(""))) {
			list=departmentDao.queryDepartmentByName(departmentName);
		}else if((departmentName==null || departmentName.equals("")) &&
				(departmentTelephone!=null && !departmentTelephone.equals(""))) {
			list=departmentDao.queryDepartmentByTelephone(departmentTelephone);
		}else {
			list=departmentDao.queryDepartmentByNameAndTelephone(departmentName,departmentTelephone);
		}
		return list;
	}
	
	/* (non-Javadoc)
	 * @see com.invoicing.service.DepartmentService#addDepartment(java.lang.String, java.lang.String)
	 */
	@Transactional
	public void addDepartment(Integer deid,String departmentName, String departmentTelephone) {
		//添加部门操作
		if(deid==null || deid==0) {
			List<Department> list = departmentDao.queryDepartmentByName(departmentName);
			if(list == null || list.size() <=0) {
				int row=departmentDao.addDepartment(departmentName,departmentTelephone);
			}
		}else {
			int row=departmentDao.update(deid,departmentName,departmentTelephone);
		}
		return;
	}
	/* (non-Javadoc)
	 * @see com.invoicing.service.DepartmentService#queryDepartmentById(java.lang.Integer)
	 */
	public Department queryDepartmentById(Integer deid) {
		Department department=departmentDao.queryDepartmentById(deid);
		return department;
	}
	
	/* (non-Javadoc)
	 * @see com.invoicing.service.DepartmentService#deleteDepartment(java.lang.Integer)
	 */
	@Transactional
	public void deleteDepartment(Integer deid) {
		int row=departmentDao.deleteDepartment(deid);
		return;
	}
}
