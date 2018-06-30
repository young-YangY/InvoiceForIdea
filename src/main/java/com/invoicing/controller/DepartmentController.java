package com.invoicing.controller;

import java.util.List;

import javax.management.Query;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.invoicing.entity.Department;
import com.invoicing.service.DepartmentService;

/**
 * @author yuyang
 * 2017年9月13日
 */
@Controller
@RequestMapping("/invoicing/department")
public class DepartmentController {
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<Department> list=departmentService.queryDepartment(null,null);
		int size=list.size();
		model.addAttribute("size", size);
		model.addAttribute("list", list);
		return "/department/list";
	}
	
	@RequestMapping(value="/query",method=RequestMethod.GET)
	public String query(@RequestParam String departmentName,@RequestParam String departmentTelephone,Model model) {
		List<Department> list=departmentService.queryDepartment(departmentName,departmentTelephone);
		model.addAttribute("list", list);
		model.addAttribute("size",list.size());
		return "/department/list";		
	}
	
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public String input() {
		return "/department/input";
	}
	
	@RequestMapping(value="/new/{deid}",method=RequestMethod.GET)
	public String newlyBuild(@PathVariable Integer deid,@RequestParam String departmentName,@RequestParam String departmentTelephone) {
		departmentService.addDepartment(deid,departmentName,departmentTelephone);
		return "redirect:/invoicing/department/list";
	}
	
	@RequestMapping(value="/update/{deid}",method=RequestMethod.GET)
	public String update(@PathVariable("deid") Integer deid,Model model) {
		Department department=departmentService.queryDepartmentById(deid);
		model.addAttribute("department", department);
		return "/department/input";
	}
	
	@RequestMapping(value="/delete/{deid}",method=RequestMethod.GET)
	public String delete(@PathVariable("deid") Integer deid,Model model) {
		departmentService.deleteDepartment(deid);
		return "redirect:/invoicing/department/list";
	}
	
}
