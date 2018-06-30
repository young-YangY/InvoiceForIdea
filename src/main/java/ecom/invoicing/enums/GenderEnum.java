/**
 * 
 */
package ecom.invoicing.enums;

/**
 * @author yuyang
 * 2017年9月19日
 */
public enum GenderEnum {
	GENDER("-1","未知性别"),
	MALE("0","男"),
	FEMALE("1","女"),
	;
	private String state;
	private String stateInfo;
	private GenderEnum(String state,String stateInfo) {
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
	
	public static GenderEnum stateOf(String index) {
		for(GenderEnum state:values()) {
			if(state.getState().equals(index)) {
				return state;
			}
		}
		return null;
	}
}
