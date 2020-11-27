package edu.smh.dto;

public class HelloDto {

	String mName, mId;

	public HelloDto(String mName, String mId) {
		super();
		this.mName = mName;
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}
}
