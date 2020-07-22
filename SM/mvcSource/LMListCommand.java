package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.LDao;
import com.javalec.ex.dto.LMDto;

public class LMListCommand implements LCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LDao dao = new LDao();
		ArrayList<LMDto> dtos = dao.mList();
		request.setAttribute("list", dtos);
		request.setAttribute("name", "Peter");
		
	}

}
