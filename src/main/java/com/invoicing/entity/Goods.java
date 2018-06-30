/**
 * 
 */
package com.invoicing.entity;

/**
 * @author yuyang
 * 2017年10月8日
 */
public class Goods {

	private Integer goid;
	private String name;
	private String origin;
	private String producer;
	private String unit;
	private Double inPrice;
	private Double outPrice;
	private Integer supplierId;
	private Integer goodstypeId;
	private Integer useNum;
	private Integer minNum;
	private Integer maxNum;
	public Integer getGoid() {
		return goid;
	}
	public void setGoid(Integer goid) {
		this.goid = goid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Double getInPrice() {
		return inPrice;
	}
	public void setInPrice(Double inPrice) {
		this.inPrice = inPrice;
	}
	public Double getOutPrice() {
		return outPrice;
	}
	public void setOutPrice(Double outPrice) {
		this.outPrice = outPrice;
	}
	
	public Integer getGoodstypeId() {
		return goodstypeId;
	}
	public void setGoodstypeId(Integer goodstypeId) {
		this.goodstypeId = goodstypeId;
	}
	public Integer getUseNum() {
		return useNum;
	}
	public void setUseNum(Integer useNum) {
		this.useNum = useNum;
	}
	public Integer getMinNum() {
		return minNum;
	}
	public void setMinNum(Integer minNum) {
		this.minNum = minNum;
	}
	public Integer getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(Integer maxNum) {
		this.maxNum = maxNum;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	@Override
	public String toString() {
		return "Goods [goid=" + goid + ", name=" + name + ", origin=" + origin + ", producer=" + producer + ", unit="
				+ unit + ", inPrice=" + inPrice + ", outPrice=" + outPrice + ", supplierId=" + supplierId
				+ ", goodstypeId=" + goodstypeId + ", useNum=" + useNum + ", minNum=" + minNum + ", maxNum=" + maxNum
				+ "]";
	}
	
	
	
}
