/**
 * 
 */
package com.invoicing.service.impl;

import java.util.List;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invoicing.dao.SupplierDao;
import com.invoicing.entity.Supplier;
import com.invoicing.service.SupplierService;

import ecom.invoicing.enums.SupplierEnum;

/**
 * @author yuyang
 * 2017年9月25日
 */
@Service
public class SupplierServiceImpl implements SupplierService{
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SupplierDao supplierDao;

	/* (non-Javadoc)
	 * @see com.invoicing.service.SupplierService#queryAllSupplier()
	 */
	public List<Supplier> queryAllSupplier() {
		List<Supplier> list = supplierDao.queryAllSupplier();
		return list;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.SupplierService#addSupplier(com.invoicing.entity.Supplier)
	 */
	public void addSupplier(Supplier supplier) {
		//将数字转为对应的送货方式 1：自提  2：送货
		supplier.setNeeds(SupplierEnum.stateOf(supplier.getNeeds()).getStateInfo());
		int row = supplierDao.addSupplier(supplier);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.SupplierService#deleteSupplier(java.lang.Integer)
	 */
	public void deleteSupplier(Integer suid) {
		int row = supplierDao.deleteSupplier(suid.intValue());
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.SupplierService#querySupplierBySuid(java.lang.Integer)
	 */
	public Supplier querySupplierBySuid(Integer suid) {
		Supplier supplier=supplierDao.querySupplierBySuid(suid);
		supplier.setNeeds(SupplierEnum.stateOf(supplier.getNeeds()).getState());;
		return supplier;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.SupplierService#updateSupplier(com.invoicing.entity.Supplier)
	 */
	public void updateSupplier(Supplier supplier) {
		supplier.setNeeds(SupplierEnum.stateOf(supplier.getNeeds()).getStateInfo());
		supplierDao.updateSupplier(supplier);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.SupplierService#querySupplier()
	 */
	public List<Supplier> querySupplier(Supplier supplier) {
		StringBuffer sql=new StringBuffer("1 = 1");
		if(supplier.getName()!=null && !supplier.getName().equals("")) {
			sql.append(" and name = '").append(supplier.getName()).append("'");
		}
		if(supplier.getContact()!=null && !supplier.getContact().equals("")) {
			sql.append(" and contact= '").append(supplier.getContact()).append("'");
		}
		if(supplier.getTelephone()!=null && !supplier.getTelephone().equals("")) {
			sql.append(" and telephone= '").append(supplier.getTelephone()).append("'");
		}
		if(supplier.getNeeds()!=null && !supplier.getNeeds().equals("") && !supplier.getNeeds().equals("0")) {
			String needs=SupplierEnum.stateOf(supplier.getNeeds()).getStateInfo();
			sql.append(" and needs= '").append(needs).append("'");
		}
		List<Supplier> list=supplierDao.querySupplier(sql.toString());
		return list;
	}
	
	
}
