package edu.smh.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.smh.dao.HelloWorldDao;
import edu.smh.dto.HelloDto;

public class HelloCommand implements ICommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stubo
		System.out.println("hellocommand.java");
		request.setAttribute("name", "Peter");
		HelloWorldDao dao = new HelloWorldDao();
		ArrayList<HelloDto> theList = dao.hList();
//		ArrayList<HelloDto> theList = new ArrayList<HelloDto>();
//		theList.add(new HelloDto("Peter", "IdPeter"));
//		theList.add(new HelloDto("Danny", "IdDanny"));
		request.setAttribute("theList", theList);
	}

}
