package edu.smh.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.smh.dao.HelloWorldDao;
import edu.smh.dto.HelloDto;
import edu.smh.dto.WorldDto;

public class WorldCommand implements ICommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("worldcommand.java");
		request.setAttribute("name", "Danny");
		
		HelloWorldDao dao = new HelloWorldDao();
		ArrayList<WorldDto> theList = dao.wList();
//		ArrayList<WorldDto> theList = new ArrayList<WorldDto>();
//		theList.add(new WorldDto("EUNTAE", "Tel.01077365835"));
//		theList.add(new WorldDto("WOOMIN", "Tel.01071384467"));
		request.setAttribute("theList", theList);
	}
	}


