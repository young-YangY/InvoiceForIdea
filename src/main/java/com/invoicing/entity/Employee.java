/**
 * 
 */
package com.invoicing.entity;

import java.util.Date;

/**
 * @author yuyang
 * 2017年8月26日
 * 员工的基本信息
 */
public class Employee {
	private Long emid;
	private String username;
	private String password;
	private String name;
	private String email;
	private String telephone;
	private String address;
	private String gender;
	private Date birthday;
	private String birthdayStr;
	//部门名字
	private String depName;
	//最后一次登录的时间
	private Date lastLoginTime;
	private String lastLoginTimeStr;
	//最后一次登录的Ip地址
	private String lastLoginIp;
	
	
	public Long getEmid() {
		return emid;
	}
	public void setEmid(Long emid) {
		this.emid = emid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	public String getBirthdayStr() {
		return birthdayStr;
	}
	public void setBirthdayStr(String birthdayStr) {
		this.birthdayStr = birthdayStr;
	}
	public String getLastLoginTimeStr() {
		return lastLoginTimeStr;
	}
	public void setLastLoginTimeStr(String lastLoginTimeStr) {
		this.lastLoginTimeStr = lastLoginTimeStr;
	}
	@Override
	public String toString() {
		return "Employee [emid=" + emid + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", telephone=" + telephone + ", address=" + address + ", gender=" + gender
				+ ", birthday=" + birthday + ", birthdayStr=" + birthdayStr + ", depName=" + depName
				+ ", lastLoginTime=" + lastLoginTime + ", lastLoginTimeStr=" + lastLoginTimeStr + ", lastLoginIp="
				+ lastLoginIp + "]";
	}
	
	
}
