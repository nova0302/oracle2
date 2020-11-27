package edu.smh.dto;

public class SaleListDto {
	String 	SaleNo, PCode,SaleDate, SCode, Amount;

	public SaleListDto(String saleNo, String pCode, String saleDate, String sCode, String amount) {
		super();
		SaleNo = saleNo;
		PCode = pCode;
		SaleDate = saleDate;
		SCode = sCode;
		Amount = amount;
	}
	public String getSaleNo() {
		return SaleNo;
	}

	public void setSaleNo(String saleNo) {
		SaleNo = saleNo;
	}

	public String getPCode() {
		return PCode;
	}

	public void setPCode(String pCode) {
		PCode = pCode;
	}

	public String getSaleDate() {
		return SaleDate;
	}

	public void setSaleDate(String saleDate) {
		SaleDate = saleDate;
	}

	public String getSCode() {
		return SCode;
	}

	public void setSCode(String sCode) {
		SCode = sCode;
	}

	public String getAmount() {
		return Amount;
	}

	public void setAmount(String amount) {
		Amount = amount;
	}



}
