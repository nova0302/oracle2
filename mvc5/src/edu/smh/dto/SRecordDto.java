package edu.smh.dto;

import java.util.ArrayList;

public class SRecordDto {
	String nextSaleNo;
	ArrayList<String> pcList;
	ArrayList<String> scList;
	public SRecordDto(String nextSaleNo, ArrayList<String> pcList, 
			ArrayList<String> scList) {
		this.nextSaleNo = nextSaleNo;
		this.pcList = pcList;
		this.scList = scList;
	}
	public String getNextSaleNo() {
		return nextSaleNo;
	}
	public void setNextSaleNo(String nextSaleNo) {
		this.nextSaleNo = nextSaleNo;
	}
	public ArrayList<String> getPcList() {
		return pcList;
	}
	public void setPcList(ArrayList<String> pcList) {
		this.pcList = pcList;
	}
	public ArrayList<String> getScList() {
		return scList;
	}
	public void setScList(ArrayList<String> scList) {
		this.scList = scList;
	}
}
