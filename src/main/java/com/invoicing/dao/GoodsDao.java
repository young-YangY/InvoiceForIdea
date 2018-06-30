/**
 * 
 */
package com.invoicing.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.invoicing.entity.Goods;

/**
 * @author yuyang
 * 2017年10月8日
 */
public interface GoodsDao {

	/**
	 * @return
	 */
	List<Goods> queryAllGoods();

	/**
	 * @param goods
	 * @return
	 */
	int addGoods(Goods goods);

	/**
	 * @param string
	 * @return
	 */
	List<Goods> queryGoods(@Param("sql")String sql);

	/**
	 * @param goid
	 * @return
	 */
	int deleteGoods(Integer goid);

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
