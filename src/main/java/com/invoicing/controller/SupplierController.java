/**
 * 
 */
package com.invoicing.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.invoicing.entity.Supplier;
import com.invoicing.service.SupplierService;

/**
 * @author yuyang
 * 2017年9月22日
 */
@Controller
@RequestMapping("/invoicing/supplier")
public class SupplierController {
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SupplierService supplierService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<Supplier> list=supplierService.queryAllSupplier();
		model.addAttribute("list", list);
		return "supplier/list";
	}
	
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public String input(Model model) {
		return "supplier/input";
	}
	
	@RequestMapping(value="/save/{suid}",method=RequestMethod.POST)
	public String save(Supplier supplier) {
		if(supplier.getSuid() == 0) {
			supplierService.addSupplier(supplier);
		}else {
			supplierService.updateSupplier(supplier);
		}
		return "redirect:/invoicing/supplier/list";
	}
	
	@RequestMapping(value="/delete/{suid}",method=RequestMethod.GET)
	public String delete(@PathVariable("suid") Integer suid) {
		supplierService.deleteSupplier(suid);
		return "redirect:/invoicing/supplier/list";
	}
	
	@RequestMapping(value="/update/{suid}",method=RequestMethod.GET)
	public String update(@PathVariable("suid") Integer suid,Model model) {
		Supplier supplier=supplierService.querySupplierBySuid(suid);
		model.addAttribute("supplier", supplier);
		return "/supplier/input";
	}

	@RequestMapping(value="/query",method=RequestMethod.POST)
	public String query(Supplier supplier,Model model) {
		List<Supplier> list = supplierService.querySupplier(supplier);
		model.addAttribute("list", list);
		return "/supplier/list";
	}
}
