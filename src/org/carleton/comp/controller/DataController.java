package org.carleton.comp.controller;
import org.carleton.comp.dao.*;
//import org.carleton.comp.model.Data;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class DataController
 */
//@WebServlet("/DataController")
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static String LIST_DATA="/listData.jsp";
    private DataDao dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataController() {
        super();
        // TODO Auto-generated constructor stub
        dao=new DataDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String forward="";
		String action =request.getParameter("action");
		if(action.equalsIgnoreCase("listData")){
			forward=LIST_DATA;
			request.setAttribute("datas", dao.getAllData());
			}
		//System.out.println(dao.getAllData());
		RequestDispatcher view=request.getRequestDispatcher(forward);
		view.forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		Data data=new Data(); 
//		data.setCdid(request.getParameter("cdid"));
//		data.setTitle(request.getParameter("title"));
//		data.setPrice(Integer.parseInt(request.getParameter("price")));
//		data.setCategory(request.getParameter("category"));
//		RequestDispatcher view = request.getRequestDispatcher(LIST_DATA);
//	        request.setAttribute("users", dao.getAllData());
//	        view.forward(request, response);
//	}

}
