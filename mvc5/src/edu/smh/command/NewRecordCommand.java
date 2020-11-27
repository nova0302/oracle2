package edu.smh.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.smh.dao.HelloWorldDao;
import edu.smh.dto.SRecordDto;

public class NewRecordCommand implements ICommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {

		HelloWorldDao dao = new HelloWorldDao();
		System.out.println("NewRecordCommand.java");
		request.setAttribute("sRecord", dao.gList());

	}

}
