/**
 * 
 */
package com.invoicing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.invoicing.entity.Goodstype;

/**
 * @author yuyang
 * 2017年10月3日
 */
public interface GoodstypeDao {

	/**
	 * @return
	 */
	List<Goodstype> queryAllGoodstype();

	/**
	 * @param string
	 * @return
	 */
	List<Goodstype> queryGoodstype(@Param("sql")String sql);

	/**
	 * @param goodstype
	 * @return
	 */
	int addGoodstype(Goodstype goodstype);

	/**
	 * @param goodstype
	 * @return
	 */
	int updateGoodstype(Goodstype goodstype);

	/**
	 * @param gsid
	 * @return
	 */
	Goodstype queryGoodstypeByGsid(Integer gsid);

	/**
	 * @param gsid
	 * @return
	 */
	int deleteGoodstype(Integer gsid);

}
