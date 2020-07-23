package com.javalec.ex.dto;

public class LDto {

	String mBName, mBType, mRDate, mMName;
	public LDto() {}
	public LDto(String mBName, String mBType, String mRDate, String mMName) 
	{
		this.mBName = mBName;
		this.mBType = mBType;
		this.mRDate = mRDate;
		this.mMName = mMName;
	}
	public String getmBName() {
		return mBName;
	}
	public void setmBName(String mBName) {
		this.mBName = mBName;
	}
	public String getmBType() {
		return mBType;
	}
	public void setmBType(String mBType) {
		this.mBType = mBType;
	}
	public String getmRDate() {
		return mRDate;
	}
	public void setmRDate(String mRDate) {
		this.mRDate = mRDate;
	}
	public String getmMName() {
		return mMName;
	}
	public void setmMName(String mMName) {
		this.mMName = mMName;
	}

}
