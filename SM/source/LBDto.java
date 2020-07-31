package com.javalec.ex.dto;

public class LBDto {
	String mBCode, mBName, mType;
	
	public LBDto() {}

	public LBDto(String mBCode, String mBName, String mType) {
		super();
		this.mBCode = mBCode;
		this.mBName = mBName;
		this.mType = mType;
	}

	public String getmBCode() {
		return mBCode;
	}

	public void setmBCode(String mBCode) {
		this.mBCode = mBCode;
	}

	public String getmBName() {
		return mBName;
	}

	public void setmBName(String mBName) {
		this.mBName = mBName;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}
}
