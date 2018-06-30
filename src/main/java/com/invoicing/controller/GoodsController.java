/**
 * 
 */
package com.invoicing.controller;

import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.invoicing.dto.GoodsDto;
import com.invoicing.entity.Goods;
import com.invoicing.entity.Goodstype;
import com.invoicing.entity.Supplier;
import com.invoicing.factory.InvoicingFactory;
import com.invoicing.service.GoodsService;
import com.invoicing.service.GoodstypeService;
import com.invoicing.service.SupplierService;

/**
 * @author yuyang
 * 2017年10月8日
 */
@Controller
@RequestMapping("/invoicing/goods")
public class GoodsController {
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private GoodstypeService goodstypeService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<Goods> goodsList=goodsService.queryAllGoods();
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		List<GoodsDto> goodsDtoList=new LinkedList<GoodsDto>();
		GoodsDto goodsDto=null;
		for(Goods goods:goodsList) {
			goodsDto=InvoicingFactory.produceGoodsDto();
			for(Supplier supplier:supplierList) {
				if(goods.getSupplierId()==supplier.getSuid()) {
					goodsDto.setSupplierId(supplier.getSuid());
					goodsDto.setSupplierName(supplier.getName());
					break;
				}
			}
			goodsDto.setGoodsId(goods.getGoid());
			goodsDto.setGoodsName(goods.getName());
			goodsDto.setGoodsProducer(goods.getProducer());
			goodsDto.setGoodsOrigin(goods.getOrigin());
			goodsDto.setGoodsInPrice(goods.getInPrice());
			goodsDto.setGoodsOutPrice(goods.getOutPrice());
			goodsDto.setGoodsUnit(goods.getUnit());
			
			goodsDtoList.add(goodsDto);
		}
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("goodsDtoList", goodsDtoList);
		return "goods/list";
	}
	
	@RequestMapping(value="/query",method=RequestMethod.POST)
	public String query(GoodsDto goodsDto,Model model) {
		List<Goods> goodsList = goodsService.queryGoods(goodsDto);
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		List<GoodsDto> goodsDtoList=new LinkedList<GoodsDto>();
		GoodsDto goodsDto1=null;
		for(Goods goods:goodsList) {
			goodsDto1=InvoicingFactory.produceGoodsDto();
			for(Supplier supplier:supplierList) {
				if(goods.getSupplierId()==supplier.getSuid()) {
					goodsDto1.setSupplierId(supplier.getSuid());
					goodsDto1.setSupplierName(supplier.getName());
					break;
				}
			}
			goodsDto1.setGoodsId(goods.getGoid());
			goodsDto1.setGoodsName(goods.getName());
			goodsDto1.setGoodsProducer(goods.getProducer());
			goodsDto1.setGoodsOrigin(goods.getOrigin());
			goodsDto1.setGoodsInPrice(goods.getInPrice());
			goodsDto1.setGoodsOutPrice(goods.getOutPrice());
			goodsDto1.setGoodsUnit(goods.getUnit());
			
			goodsDtoList.add(goodsDto1);
		}
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("goodsDtoList", goodsDtoList);
		return "goods/list";
	}
	
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public String input(Model model) {
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		List<Goodstype> goodstypeList=goodstypeService.queryAllGoodstype();
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("goodstypeList", goodstypeList);
		return "goods/input";
	}
	@RequestMapping(value="/save/{goid}",method=RequestMethod.POST)
	public String save(Goods goods) {
		if(goods.getGoid()==0) {
			goodsService.addGoods(goods);
		}else {
			goodsService.updateGoods(goods);
		}
		return "redirect:/invoicing/goods/list";
	}
	@RequestMapping(value="/delete/{goid}",method=RequestMethod.GET)
	public String delete(@PathVariable("goid") Integer goid) {
		goodsService.deleteGoods(goid);
		return "redirect:/invoicing/goods/list";
	}
	@RequestMapping(value="/update/{goid}",method=RequestMethod.GET)
	public String update(@PathVariable("goid") Integer goid,Model model) {
		Goods goods=goodsService.queryGoodsByGoid(goid);
		List<Supplier> supplierList=supplierService.queryAllSupplier();
		List<Goodstype> goodstypeList=goodstypeService.queryAllGoodstype();
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("goodstypeList", goodstypeList);
		model.addAttribute("goods", goods);
		return "goods/input";
	}

}
