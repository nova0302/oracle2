package edu.smh.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICommand {
	void excute(HttpServletRequest request , HttpServletResponse response);
}
