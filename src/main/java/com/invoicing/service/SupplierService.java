/**
 * 
 */
package com.invoicing.service;

import java.util.List;

import com.invoicing.entity.Supplier;

/**
 * @author yuyang
 * 2017年9月25日
 */
public interface SupplierService {

	/**
	 * @return
	 */
	List<Supplier> queryAllSupplier();

	/**
	 * @param supplier
	 */
	void addSupplier(Supplier supplier);

	/**
	 * @param suid
	 */
	void deleteSupplier(Integer suid);

	/**
	 * @param suid
	 * @return
	 */
	Supplier querySupplierBySuid(Integer suid);

	/**
	 * @param supplier
	 */
	void updateSupplier(Supplier supplier);

	/**
	 * @param supplier 
	 * @return
	 */
	List<Supplier> querySupplier(Supplier supplier);

}
