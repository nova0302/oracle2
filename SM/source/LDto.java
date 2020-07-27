package com.javalec.ex.dto;

public class LDto {

	String mBName, mBType, mIsRented, mRDate, mMName, mRent;
	public LDto() {}
	public LDto(String mBName, String mBType, String isRented, String mRDate, String mMName, String Rent) 
	{
		this.mBName = mBName;
		this.mBType = mBType;
		this.mIsRented = isRented;
		this.mRDate = mRDate;
		this.mMName = mMName;
		this.mRent = Rent;
	}
	public String getmIsRented() {
		return mIsRented;
	}
	public void setmIsRented(String mIsRented) {
		this.mIsRented = mIsRented;
	}
	public String getmRent() {
		return mRent;
	}
	public void setmRent(String mRent) {
		this.mRent = mRent;
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