package edu.smh.forntController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.smh.command.HelloCommand;
import edu.smh.command.ICommand;
import edu.smh.command.NewRecordCommand;
import edu.smh.command.SaleListCommand;
import edu.smh.command.SaveRecordCommand;
import edu.smh.command.WorldCommand;

/**
 * Servlet implementation class forntController
 */
@WebServlet("*.do")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public frontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		ICommand command = null;
		
		if (com.equals("/hello.do")) {
			command = new HelloCommand();
			command.excute(request, response);
			viewPage = "index.jsp?section=hello";
		}else if (com.equals("/world.do")) {
			command = new WorldCommand();
			command.excute(request, response);
			viewPage = "world.jsp";
		}else if (com.equals("/entryNewRecord.do")) {
			System.out.println(com);
			command = new NewRecordCommand();
			command.excute(request, response);
			viewPage = "index.jsp?section=vNewSaleRecord";
		}else if (com.equals("/saleList.do")) {
			System.out.println(com);
			command = new SaleListCommand();
			command.excute(request, response);
			viewPage = "index.jsp?section=saleList";
		}else if (com.equals("/saveSRecord.do")) {
			System.out.println(com);
			// save the user input date to db
			command = new SaveRecordCommand();
			command.excute(request, response);

			// fetch from db for nextSaveNo
			command = new NewRecordCommand();
			command.excute(request, response);
			viewPage = "index.jsp?section=vNewSaleRecord";
		}
		RequestDispatcher disp = request.getRequestDispatcher(viewPage);
		disp.forward(request, response);
	}
	


}
