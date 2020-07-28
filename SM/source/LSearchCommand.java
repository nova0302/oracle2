package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.LDao;
import com.javalec.ex.dto.LDto;

public class LSearchCommand implements LCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bName = request.getParameter("bName");
		String bType = request.getParameter("bType");
		String mName = request.getParameter("mName");
		LDao dao = new LDao();
		ArrayList<LDto> dtos =dao.bSearch(bName, bType, mName);
		request.setAttribute("bStatusView", dtos);
	}
}
