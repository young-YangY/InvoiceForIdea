/**
 * 
 */
package com.invoicing.controller;

import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.invoicing.entity.Employee;
import com.invoicing.service.EmployeeService;

/**
 * @author yuyang
 * 2017年9月17日
 */
@Controller
@RequestMapping("/invoicing/employee")
public class EmployeeController {
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EmployeeService employeeService;
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<Employee> list=employeeService.queryAllEmployee();
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);
		System.out.println("list.get(0):"+list.get(0).getBirthday());
		return "/employee/list";
	}
	
	@RequestMapping(value="/query",method=RequestMethod.POST)
	public String query(Employee employee,Model model) {
		System.out.println("query");
		System.out.println(employee.toString());
		System.out.println("employee.getLastLoginTimeStr()"+employee.getLastLoginTimeStr());
		List<Employee> list=employeeService.queryEmployee(employee);
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);
		return "/employee/list";
	}
	
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public String input() {
		return "/employee/input";
	}
	
	@RequestMapping(value="/save/{emid}",method=RequestMethod.POST)
	public String save(Employee employee) {
		if(employee.getEmid()==0) {
			//添加employee
			employeeService.addEmployee(employee);
			return "redirect:/invoicing/employee/list";
		}else {
			//修改employee
			employeeService.updateEmployee(employee);
			return "redirect:/invoicing/employee/list";
		}
		
	}
	
	@RequestMapping(value="/update/{emid}",method=RequestMethod.GET)
	public String update(@PathVariable("emid") long emid,Model model) {
		Employee employee = employeeService.queryEmployeeByEmid(emid);
		model.addAttribute("employee", employee);
		return "employee/input";
	}
	
	@RequestMapping(value="/delete/{emid}",method=RequestMethod.GET)
	public String delete(@PathVariable("emid") long emid) {
		employeeService.deleteEmployee(emid);
		return "redirect:/invoicing/employee/list";
	}
	
	
}
