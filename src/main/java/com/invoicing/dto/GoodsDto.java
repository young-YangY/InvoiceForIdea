/**
 * 
 */
package com.invoicing.dto;

/**
 * @author yuyang
 * 2017年10月8日
 */
public class GoodsDto {
	private Integer supplierId;
	private String supplierName;
	private Integer goodstypeId;
	private String goodstypeName;
	private Integer goodsId;
	private String goodsName;
	private String goodsProducer;
	private String goodsOrigin;
	private String goodsUnit;
	private Double goodsInPrice;
	private Double minInPrice;
	private Double maxInPrice;
	private Double goodsOutPrice;
	private Double minOutPrice;
	private Double maxOutPrice;
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsUnit() {
		return goodsUnit;
	}
	public void setGoodsUnit(String goodsUnit) {
		this.goodsUnit = goodsUnit;
	}
	public Double getMinInPrice() {
		return minInPrice;
	}
	public void setMinInPrice(Double minInPrice) {
		this.minInPrice = minInPrice;
	}
	public Double getMaxInPrice() {
		return maxInPrice;
	}
	public void setMaxInPrice(Double maxInPrice) {
		this.maxInPrice = maxInPrice;
	}
	public Double getMinOutPrice() {
		return minOutPrice;
	}
	public void setMinOutPrice(Double minOutPrice) {
		this.minOutPrice = minOutPrice;
	}
	public Double getMaxOutPrice() {
		return maxOutPrice;
	}
	public void setMaxOutPrice(Double maxOutPrice) {
		this.maxOutPrice = maxOutPrice;
	}
	public String getGoodsProducer() {
		return goodsProducer;
	}
	public void setGoodsProducer(String goodsProducer) {
		this.goodsProducer = goodsProducer;
	}
	public Integer getGoodstypeId() {
		return goodstypeId;
	}
	public void setGoodstypeId(Integer goodstypeId) {
		this.goodstypeId = goodstypeId;
	}
	public String getGoodstypeName() {
		return goodstypeName;
	}
	public void setGoodstypeName(String goodstypeName) {
		this.goodstypeName = goodstypeName;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsOrigin() {
		return goodsOrigin;
	}
	public void setGoodsOrigin(String goodsOrigin) {
		this.goodsOrigin = goodsOrigin;
	}
	public Double getGoodsInPrice() {
		return goodsInPrice;
	}
	public void setGoodsInPrice(Double goodsInPrice) {
		this.goodsInPrice = goodsInPrice;
	}
	public Double getGoodsOutPrice() {
		return goodsOutPrice;
	}
	public void setGoodsOutPrice(Double goodsOutPrice) {
		this.goodsOutPrice = goodsOutPrice;
	}
	
	
	
}
