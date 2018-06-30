/**
 * 
 */
package com.invoicing.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invoicing.dao.GoodstypeDao;
import com.invoicing.entity.Goodstype;
import com.invoicing.service.GoodstypeService;

/**
 * @author yuyang
 * 2017年10月3日
 */
@Service
public class GoodstypeServiceImpl implements GoodstypeService{
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GoodstypeDao goodstypeDao;

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodstypeService#queryAllGoodstype()
	 */
	public List<Goodstype> queryAllGoodstype() {
		List<Goodstype> list=goodstypeDao.queryAllGoodstype();
		return list;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodstypeService#queryGoodstype()
	 */
	public List<Goodstype> queryGoodstype(Goodstype goodstype) {
		StringBuffer sql=new StringBuffer(" 1 = 1");
		if(goodstype.getSuid()!=0) {
			sql.append(" and suid = '").append(goodstype.getSuid()).append("'");
		}
		if(goodstype.getName()!=null && !goodstype.getName().equals("")) {
			sql.append(" and name = '").append(goodstype.getName()).append("'");
		}
		List<Goodstype> list= goodstypeDao.queryGoodstype(sql.toString());
		return list;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodstypeService#save(com.invoicing.entity.Goodstype)
	 */
	public void addGoodstype(Goodstype goodstype) {
		int row=goodstypeDao.addGoodstype(goodstype);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodstypeService#updateGoodstype(com.invoicing.entity.Goodstype)
	 */
	public void updateGoodstype(Goodstype goodstype) {
		int row=goodstypeDao.updateGoodstype(goodstype);
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodstypeService#queryGoodstypeByGsid(java.lang.Integer)
	 */
	public Goodstype queryGoodstypeByGsid(Integer gsid) {
		Goodstype goodstype = goodstypeDao.queryGoodstypeByGsid(gsid);
		return goodstype;
	}

	/* (non-Javadoc)
	 * @see com.invoicing.service.GoodstypeService#deleteGoodstype(java.lang.Integer)
	 */
	public void deleteGoodstype(Integer gsid) {
		int row=goodstypeDao.deleteGoodstype(gsid);
	}
	
}
