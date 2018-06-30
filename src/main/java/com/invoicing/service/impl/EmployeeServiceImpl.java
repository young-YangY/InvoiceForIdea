/**
 * 
 */
package com.invoicing.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.invoicing.dao.EmployeeDao;
import com.invoicing.entity.Employee;
import com.invoicing.service.EmployeeService;

import ecom.invoicing.enums.GenderEnum;


/**
 * @author yuyang
 * 2017年8月27日
 */
@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	//注入employeeDao依赖
	@Autowired
	private EmployeeDao employeeDao;
	
	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#queryEmployeeByUsernameAndPassword(com.invoicing.entity.Employee)
	 */
	@Transactional
	/*
	 * 使用注解控制事务方法的优点：
	 * 1.开发团队达成一致约定，明确标注事务方法的编程风格
	 * 2.保证事务方法的执行时间尽可能短，不要穿插其他网络操作 RPC/HTTP请求或者剥离到事务方法外部
	 * 3.不是所有的方法都需要事务，如只有一条修改操作，只读操作不需要事务控制。
	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#queryEmployee(com.invoicing.entity.Employee)
	 */
	public List<Employee> queryEmployee(Employee employee) {
		List<Employee> list=null;
		//拼接sql语句，根据条件查询数据库
		StringBuffer sql=new StringBuffer("1=1");
		if(employee.getUsername()!=null && !employee.getUsername().equals("")) {
			sql.append(" and username= '").append(employee.getUsername()).append("'");
		}
		if(employee.getName()!=null && !employee.getName().equals("")) {
			sql.append(" and name= '").append(employee.getName()).append("'");
		}
		if(employee.getTelephone()!=null && !employee.getTelephone().equals("")) {
			sql.append(" and telephone= '").append(employee.getTelephone()).append("'");
		}
		if(employee.getGender()!=null && !employee.getGender().equals("")  && !employee.getGender().equals("0")) {
			//使用枚举将-1,0,1转换为对应的性别
			employee.setGender(GenderEnum.stateOf(employee.getGender()).getStateInfo());
			sql.append(" and gender= '").append(employee.getGender()).append("'");
		}
		if(employee.getEmail()!=null && !employee.getEmail().equals("")) {
			sql.append(" and email= '").append(employee.getEmail()).append("'");
		}
		if(employee.getAddress()!=null && !employee.getAddress().equals("")) {
			sql.append(" and address= '").append(employee.getAddress()).append("'");
		}
		if(employee.getLastLoginTimeStr()!=null && !employee.getLastLoginTimeStr().equals("")) {
			sql.append(" and lastLoginTimeStr= '").append(employee.getLastLoginTimeStr()).append("'");
		}
		if(employee.getDepName()!=null && !employee.getDepName().equals("") && !employee.getDepName().equals("0")) {
			sql.append(" and depName= '").append(employee.getDepName()).append("'");
		}
		list=employeeDao.queryEmployee(sql.toString());
		return list;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#queryAllEmployee()
	 */
	public List<Employee> queryAllEmployee() {
		List<Employee> list=employeeDao.queryAllEmployee();
//		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
//		for(int i=0;i<list.size();i++) {
//			list.get(i).setBirthdayStr(format.format(list.get(i).getBirthday()));
//			list.get(i).setLastLoginTimeStr(format.format(list.get(i).getLastLoginTime()));
//		}
		return list;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#queryEmployeeByUsernameAndPassword(java.lang.String, java.lang.String)
	 */
	public Employee queryEmployeeByUsernameAndPassword(String username, String password) {
		Employee emp=employeeDao.queryEmployeeByUsernameAndPassword(username,password);
		return emp;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#addEmployee(com.invoicing.entity.Employee)
	 */
	@Transactional
	public void addEmployee(Employee employee) {
		//将数值转换为对应的性别 -1：未知性别 0：男，1：女
		employee.setGender(GenderEnum.stateOf(employee.getGender()).getStateInfo());
		int row=employeeDao.addEmployee(employee);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#deleteEmployee(long)
	 */
	@Transactional
	public void deleteEmployee(long emid) {
		int row = employeeDao.deleteEmployee(emid);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#queryEmployeeByEmid(long)
	 */
	public Employee queryEmployeeByEmid(long emid) {
		Employee employee = employeeDao.queryEmployeeByEmid(emid);
		return employee;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.EmployeeService#updateEmployee(com.invoicing.entity.Employee)
	 */
	@Transactional
	public void updateEmployee(Employee employee) {
		employee.setGender(GenderEnum.stateOf(employee.getGender()).getStateInfo());
		int row = employeeDao.updateEmployee(employee);
	}

}
