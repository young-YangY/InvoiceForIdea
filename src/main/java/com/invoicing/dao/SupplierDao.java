/**
 * 
 */
package com.invoicing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.invoicing.entity.Supplier;

/**
 * @author yuyang
 * 2017年9月25日
 */
public interface SupplierDao {

	/**
	 * @return
	 */
	List<Supplier> queryAllSupplier();

	/**
	 * @param intValue
	 * @return
	 */
	int deleteSupplier(int intValue);

	/**
	 * @param supplier
	 * @return
	 */
	int addSupplier(Supplier supplier);

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
	 * @param string
	 * @return
	 */
	List<Supplier> querySupplier(@Param("sql") String sql);

}
