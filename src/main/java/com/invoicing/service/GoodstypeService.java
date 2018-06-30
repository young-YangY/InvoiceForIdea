/**
 * 
 */
package com.invoicing.service;

import java.util.List;

import com.invoicing.entity.Goodstype;

/**
 * @author yuyang
 * 2017年10月3日
 */
public interface GoodstypeService {

	/**
	 * @return
	 */
	List<Goodstype> queryAllGoodstype();

	/**
	 * @param goodstype 
	 * @return
	 */
	List<Goodstype> queryGoodstype(Goodstype goodstype);

	/**
	 * @param goodstype
	 */
	void addGoodstype(Goodstype goodstype);

	/**
	 * @param goodstype
	 */
	void updateGoodstype(Goodstype goodstype);

	/**
	 * @param gsid
	 * @return
	 */
	Goodstype queryGoodstypeByGsid(Integer gsid);

	/**
	 * @param gsid
	 */
	void deleteGoodstype(Integer gsid);

}
