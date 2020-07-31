package com.javalec.ex.dto;

public class LMDto {

	String mMCode, mMname, mPhone;
	
	
	public LMDto() {}
	public LMDto(String MCode, String mName, String mPhone) {
		this.mMCode = MCode;
		this.mMname = mName;
		this.mPhone = mPhone;
	}	
	public String getmMCode() {
		return mMCode;
	}
	public void setmMCode(String mMCode) {
		this.mMCode = mMCode;
	}
	public String getmMname() {
		return mMname;
	}
	public void setmMname(String mMname) {
		this.mMname = mMname;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	
}
