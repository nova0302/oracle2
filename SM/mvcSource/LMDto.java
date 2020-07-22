package com.javalec.ex.dto;

public class LMDto {
	String mMname, mPhone;
	int mNumOfRent;
	
	public LMDto() {}
	public LMDto(String mName, String mPhone,	int mumOfRent) {
		this.mMname = mName;
		this.mPhone = mPhone;
		this.mNumOfRent = mumOfRent;
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
	public int getmNumOfRent() {
		return mNumOfRent;
	}
	public void setmNumOfRent(int mNumOfRent) {
		this.mNumOfRent = mNumOfRent;
	}
	

}
