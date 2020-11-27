package edu.smh.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.smh.dao.HelloWorldDao;
import edu.smh.dto.SaleRecordDto;

public class SaveRecordCommand implements ICommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("SaveRecordCommand.java");
		HelloWorldDao dao = new HelloWorldDao();

		String saleNo = request.getParameter("saleNo");
		String pCode = request.getParameter("pCode");
		String saleDate = request.getParameter("saleDate");
		String sCode = request.getParameter("sCode");
		String amount = request.getParameter("amount");
		System.out.println("SaveRecordCommand : " + saleNo 
				+ ", " + pCode +", " +  saleDate 
				+ ", " + sCode +", " +  amount);
		dao.saveRecord(new SaleRecordDto(saleNo, pCode, saleDate, sCode, amount));

	}

}
