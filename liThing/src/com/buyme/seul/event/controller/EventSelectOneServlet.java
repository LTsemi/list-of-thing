package com.buyme.seul.event.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.seul.event.model.service.EventService;

/**
 * Servlet implementation class EventSelectOneServlet
 */
@WebServlet("/selectOne.ev")
public class EventSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eno = Integer.parseInt(request.getParameter("eno"));
		
		HashMap<String, Object> evt = new EventService().selectEventMap(eno);
		
		System.out.println(evt);
				
		String page = "";
		if(evt != null) {
			
			page = "views/seul/eventPage.jsp";
			request.setAttribute("event", evt.get("e"));
		}else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "사진게시판 상세보기 실패");
			System.out.println("파일 전송 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
