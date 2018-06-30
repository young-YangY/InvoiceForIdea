/**
 * 
 */
package com.invoicing.controller;

import java.util.LinkedList;
import java.util.List;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.invoicing.dto.GoodsDto;
import com.invoicing.entity.Goodstype;
import com.invoicing.entity.Supplier;
import com.invoicing.factory.InvoicingFactory;
import com.invoicing.service.GoodstypeService;
import com.invoicing.service.SupplierService;

/**
 * @author yuyang
 * 2017年10月2日
 */
@Controller
@RequestMapping("/invoicing/goodstype")
public class GoodstypeController {
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GoodstypeService goodstypeService;
	@Autowired
	private SupplierService supplierService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<Goodstype> goodstypeList = goodstypeService.queryAllGoodstype();
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		GoodsDto goodsDto=null;
		List<GoodsDto> goodsDtoList=new LinkedList<GoodsDto>();
		for(Goodstype goodstype:goodstypeList) {
			goodsDto=InvoicingFactory.produceGoodsDto();
			for(Supplier supplier:supplierList) {
				if(goodstype.getSuid()==supplier.getSuid()) {
					goodsDto.setSupplierName(supplier.getName());
					goodsDto.setSupplierId(supplier.getSuid());
					break;
				}
			}
			goodsDto.setGoodstypeName(goodstype.getName());
			goodsDto.setGoodstypeId(goodstype.getGsid());
			goodsDtoList.add(goodsDto);
		}
		model.addAttribute("list", goodsDtoList);
		//model.addAttribute("list", list);
		model.addAttribute("supplierList", supplierList);
		return "/goodstype/list";
	}
	
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public String input(Model model) {
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		model.addAttribute("supplierList", supplierList);
		return "/goodstype/input";
	}
	
	@RequestMapping(value="/query",method=RequestMethod.POST)
	public String query(Goodstype goodstype,Model model) {
		List<Goodstype> goodstypeList=goodstypeService.queryGoodstype(goodstype);
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		GoodsDto goodsDto=null;
		List<GoodsDto> goodsDtoList=new LinkedList<GoodsDto>();
		for(Goodstype goodstype1:goodstypeList) {
			goodsDto=InvoicingFactory.produceGoodsDto();
			for(Supplier supplier:supplierList) {
				if(goodstype1.getSuid()==supplier.getSuid()) {
					goodsDto.setSupplierName(supplier.getName());
					goodsDto.setSupplierId(supplier.getSuid());
					break;
				}
			}
			goodsDto.setGoodstypeName(goodstype1.getName());
			goodsDto.setGoodstypeId(goodstype1.getGsid());
			goodsDtoList.add(goodsDto);
		}
		model.addAttribute("list", goodsDtoList);
		//model.addAttribute("list", list);
		model.addAttribute("supplierList", supplierList);
		return "/goodstype/list";
	}
	
	@RequestMapping(value="/save/{gsid}",method=RequestMethod.POST)
	public String save(Goodstype goodstype,Model model) {
		if(goodstype.getGsid()==0) {
			goodstypeService.addGoodstype(goodstype);
		}else {
			goodstypeService.updateGoodstype(goodstype);
		}
		return "redirect:/invoicing/goodstype/list";
	}
	
	@RequestMapping(value="/update/{gsid}",method=RequestMethod.GET)
	public String update(@PathVariable("gsid") Integer gsid,Model model) {
		Goodstype goodstype = goodstypeService.queryGoodstypeByGsid(gsid);
		if(goodstype!=null) {
			model.addAttribute("goodstype",goodstype);
		}
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		model.addAttribute("supplierList", supplierList);
		return "/goodstype/input";
	}
	
	@RequestMapping(value="/delete/{gsid}",method=RequestMethod.GET)
	public String delete(@PathVariable("gsid") Integer gsid) {
		goodstypeService.deleteGoodstype(gsid);
		return "redirect:/invoicing/goodstype/list";
	}
}
