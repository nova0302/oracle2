package com.javalec.ex.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.command.LCommand;
import com.javalec.ex.command.LMListCommand;
import com.javalec.ex.command.LRegisterCommand;
import com.javalec.ex.command.LStatusCommand;

/*
import com.javalec.ex.command.BCommand;
import com.javalec.ex.command.BContentCommand;
import com.javalec.ex.command.BDeleteCommand;
import com.javalec.ex.command.BListCommand;
import com.javalec.ex.command.BModifyCommand;
import com.javalec.ex.command.BReplyCommand;
import com.javalec.ex.command.BReplyViewCommand;
import com.javalec.ex.command.BWriteCommand;
*/
/**
 * Servlet implementation class LFrontController
 */
@WebServlet("*.do")
public class LFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("actionDo!!!!!!");	
		request.setCharacterEncoding("utf-8");	
		
		String viewPage = null;
		LCommand command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/bRegView.do")){  /*   도서등록   */
			System.out.println("bRegView");
			viewPage = "bRegView.jsp";	
		}else if(com.equals("/bReg.do")){
			System.out.println("bReg");
			command = new LRegisterCommand();
			command.execute(request, response);
			viewPage = "bRegView.jsp";	
		}else if(com.equals("/bStatusView.do")){/*   도서현황 */
			System.out.println("bStatusView");
			command = new LStatusCommand();
			command.execute(request, response);		
			viewPage = "bStatusView.jsp";
		}else if(com.equals("/mRegView.do")){/*   회원등록   */
			System.out.println("mRegView");
			viewPage = "mRegView.jsp";	
		}else if(com.equals("/mReg.do")){
			System.out.println("mReg");
			command = new LRegisterCommand();
			command.execute(request, response);
			viewPage = "mRegView.jsp";	
		}else if(com.equals("/mListView.do")){/*   회원현황 */
			System.out.println("mListView");
			command = new LMListCommand();
			command.execute(request, response);
			viewPage = "mListView.jsp";	
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);	
	}
}
