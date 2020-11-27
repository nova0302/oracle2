package edu.smh.dto;

public class WorldDto {

	String mName, mTel;

	public WorldDto(String mName, String mTel) {
		super();
		this.mName = mName;
		this.mTel = mTel;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmTel() {
		return mTel;
	}

	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
}
