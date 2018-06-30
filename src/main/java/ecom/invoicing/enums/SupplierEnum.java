/**
 * 
 */
package ecom.invoicing.enums;

import org.springframework.context.support.StaticApplicationContext;

/**
 * @author yuyang
 * 2017年9月25日
 */
public enum SupplierEnum{
	WEIXUANZE("0","未选择"),ZITI("1","自提"),SONGHUO("2","送货");
	private String state;
	private String stateInfo;
	private SupplierEnum(String state,String stateInfo) {
		this.state=state;
		this.stateInfo=stateInfo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStateInfo() {
		return stateInfo;
	}
	public void setStateInfo(String stateInfo) {
		this.stateInfo = stateInfo;
	}
	
	public static SupplierEnum stateOf(String index) {
		for(SupplierEnum state:values()) {
			if(state.getState().equals(index) || state.getStateInfo().equals(index)) {
				return state;
			}
		}
		return null;
	}
	
}
