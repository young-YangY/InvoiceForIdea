package com.invoicing.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.invoicing.entity.Employee;
import com.invoicing.service.EmployeeService;


/**
 * @author yuyang
 * 2017年8月26日
 */
@Controller	//@Service @Component
@RequestMapping("/invoicing")	//url:/模块/资源/{id}/细分/seckill/list
public class InvoicingController {
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	//自动注入EmployeeService
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String index() {
		System.out.println("index");
		return "../../index";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		System.out.println("login");
		return "login";
	}
	
	@RequestMapping(value="/main",method=RequestMethod.POST)
	public String mainPage(Employee employee,Model model) {
		String username=employee.getUsername();
		String password=employee.getPassword();
		Employee emp=employeeService.queryEmployeeByUsernameAndPassword(username,password);
		if(emp!=null) {
			model.addAttribute("employee",emp);
			return "main";
		}else {
			return "redirect:/invoicing/login";
		}
	}
	
	@RequestMapping(value="/context",method=RequestMethod.GET)
	public String context() {
		return "context";
	}
	
}
