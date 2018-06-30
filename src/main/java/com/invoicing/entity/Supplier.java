/**
 * 
 */
package com.invoicing.entity;

/**
 * @author yuyang
 * 2017年9月25日
 */
public class Supplier {
	private Integer suid;
	private String name;
	private String address;
	//联络人
	private String contact;
	private String telephone;
	//提货方式
	private String needs;
	public Integer getSuid() {
		return suid;
	}
	public void setSuid(Integer suid) {
		this.suid = suid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getNeeds() {
		return needs;
	}
	public void setNeeds(String needs) {
		this.needs = needs;
	}
	@Override
	public String toString() {
		return "Supplier [suid=" + suid + ", name=" + name + ", address=" + address + ", contact=" + contact
				+ ", telephone=" + telephone + ", needs=" + needs + "]";
	}
	
}
