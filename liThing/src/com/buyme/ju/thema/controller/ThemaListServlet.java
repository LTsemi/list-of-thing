package com.buyme.ju.thema.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.thema.model.service.ThemaService;
import com.buyme.ju.thema.model.vo.Thema;

/**
 * Servlet implementation class ThemaListServlet
 */
@WebServlet("/selectList.tm")
public class ThemaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Thema> list = new ArrayList<Thema>();
		
		ThemaService ts = new ThemaService();
				
		list = ts.selectList();
				
		String page = "";

		if(list != null){
					
			page = "views/ju/LTpick.jsp";
			request.setAttribute("list", list);
			
		} else {
					
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "테마 조회 실패!");
					
		}
				
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
