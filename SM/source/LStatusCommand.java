package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.LDao;
import com.javalec.ex.dto.LDto;

public class LStatusCommand implements LCommand {
	int sel=0;
	public LStatusCommand(int sel){
		this.sel = sel;
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LDao dao = new LDao();
		ArrayList<LDto> dtos = dao.bStatus(sel);
		request.setAttribute("bStatusView", dtos);
	}

}
