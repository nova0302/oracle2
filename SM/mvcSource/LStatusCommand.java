package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.LDao;
import com.javalec.ex.dto.LDto;

public class LStatusCommand implements LCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LDao dao = new LDao();
		ArrayList<LDto> dtos = dao.bStatus();
		request.setAttribute("bStatusView", dtos);
	}

}
