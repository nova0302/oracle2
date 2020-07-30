package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.LDao;
import com.javalec.ex.dto.LDto;

public class LReturnTheBookCommand implements LCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String nRent = request.getParameter("nRent");
		LDao dao = new LDao();
		dao.bReturnTheBook(nRent);
	}
}
