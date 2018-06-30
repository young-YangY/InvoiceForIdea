/**
 * 
 */
package com.invoicing.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invoicing.dao.GoodsDao;
import com.invoicing.dto.GoodsDto;
import com.invoicing.entity.Goods;
import com.invoicing.service.GoodsService;

/**
 * @author yuyang
 * 2017年10月8日
 */
@Service
public class GoodsServiceImpl implements GoodsService{
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GoodsDao goodsDao;

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodsService#queryAllGoods()
	 */
	public List<Goods> queryAllGoods() {
		List<Goods> list=goodsDao.queryAllGoods();
		return list;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodsService#addGoods(com.invoicing.entity.Goods)
	 */
	public void addGoods(Goods goods) {
		int row = goodsDao.addGoods(goods);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodsService#queryGoods(com.invoicing.dto.GoodsDto)
	 */
	public List<Goods> queryGoods(GoodsDto goodsDto) {
		StringBuffer sql = new StringBuffer("1 = 1");
		if(goodsDto.getSupplierId()!=0) {
			sql.append(" and supplierId = '").append(goodsDto.getSupplierId()).append("'");
		}
		if(goodsDto.getGoodsName()!=null && !goodsDto.getGoodsName().equals("")) {
			sql.append(" and name = '").append(goodsDto.getGoodsName()).append("'");
		}
		if(goodsDto.getGoodsProducer()!=null && !goodsDto.getGoodsProducer().equals("")) {
			sql.append(" and producer = '").append(goodsDto.getGoodsProducer()).append("'");
		}
		if(goodsDto.getGoodsUnit()!=null && !goodsDto.getGoodsUnit().equals("")) {
			sql.append(" and unit = '").append(goodsDto.getGoodsUnit()).append("'");
		}
		if(goodsDto.getMinInPrice()!=null && goodsDto.getMinInPrice()!=0) {
			sql.append(" and inPrice >= '").append(goodsDto.getMinInPrice()).append("'");
		}
		if(goodsDto.getMaxInPrice()!=null && goodsDto.getMaxInPrice()!=0) {
			sql.append(" and inPrice <= '").append(goodsDto.getMaxInPrice()).append("'");
		}
		if(goodsDto.getMinOutPrice()!=null && goodsDto.getMinOutPrice()!=0) {
			sql.append(" and outPrice >= '").append(goodsDto.getMinOutPrice()).append("'");
		}
		if(goodsDto.getMaxOutPrice()!=null && goodsDto.getMaxOutPrice()!=0) {
			sql.append(" and outPrice <= '").append(goodsDto.getMaxOutPrice()).append("'");
		}
		List<Goods> list=goodsDao.queryGoods(sql.toString());
		return list;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodsService#deleteGoods(java.lang.Integer)
	 */
	public void deleteGoods(Integer goid) {
		int row = goodsDao.deleteGoods(goid);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodsService#queryGoodsByGoid(java.lang.Integer)
	 */
	public Goods queryGoodsByGoid(Integer goid) {
		Goods goods = goodsDao.queryGoodsByGoid(goid);
		return goods;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodsService#updateGoods(com.invoicing.entity.Goods)
	 */
	public void updateGoods(Goods goods) {
		goodsDao.updateGoods(goods);
	}
}
