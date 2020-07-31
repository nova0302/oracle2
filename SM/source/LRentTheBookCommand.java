package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.LDao;

public class LRentTheBookCommand implements LCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bCode = request.getParameter("bCode");
		String mCode = request.getParameter("mCode");
		LDao dao = new LDao();
		dao.rentTheBook(bCode, mCode);

	}

}
