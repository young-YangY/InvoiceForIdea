/**
 * 
 */
package com.invoicing.service;

import java.util.List;

import com.invoicing.dto.GoodsDto;
import com.invoicing.entity.Goods;

/**
 * @author yuyang
 * 2017年10月8日
 */
public interface GoodsService {

	/**
	 * @return
	 */
	List<Goods> queryAllGoods();

	/**
	 * @param goods
	 */
	void addGoods(Goods goods);

	/**
	 * @param goodsDto
	 * @return
	 */
	List<Goods> queryGoods(GoodsDto goodsDto);

	/**
	 * @param goid
	 */
	void deleteGoods(Integer goid);

	/**
	 * @param goid
	 * @return
	 */
	Goods queryGoodsByGoid(Integer goid);

	/**
	 * @param goods
	 */
	void updateGoods(Goods goods);

}
