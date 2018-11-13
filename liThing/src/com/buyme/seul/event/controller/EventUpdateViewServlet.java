package com.buyme.seul.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.seul.event.model.service.EventService;
import com.buyme.seul.event.model.vo.Event;

/**
 * Servlet implementation class EventUpdateViewServlet
 */
@WebServlet("/eUpdateView.ev")
public class EventUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eno = Integer.parseInt(request.getParameter("eno"));
		
		
		Event e = new EventService().updateEvtView(eno);
		
		String page = "";
		
		if (e != null) {
			page = "views/seul/eventPageUpdate.jsp";
			request.setAttribute("event", e);
			System.out.println("이벤트 수정 페이지 보기 완료!");
			
		} else {
			
			System.out.println("이벤트 수정 창 보기 실패!");
			
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
