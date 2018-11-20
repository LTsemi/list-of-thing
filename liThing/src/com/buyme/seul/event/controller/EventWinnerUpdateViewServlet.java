package com.buyme.seul.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.seul.event.model.service.EventService;
import com.buyme.seul.event.model.service.EventWinnerService;
import com.buyme.seul.event.model.vo.Event;
import com.buyme.seul.event.model.vo.EventWinner;

/**
 * Servlet implementation class EventWinnerUpdateViewServlet
 */
@WebServlet("/eWinUpdateView.ev")
public class EventWinnerUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventWinnerUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eno = Integer.parseInt(request.getParameter("eno"));
		int evtEno = Integer.parseInt(request.getParameter("evtEno"));
		
		Event e = new EventService().updateWinView(eno);
		
		ArrayList<EventWinner> ewlist
		   = new EventWinnerService().SelectWinnerOneList(evtEno);
		
		String page = "";
		
		if (e != null) {
			page = "views/seul/winnerPageUpdate.jsp";
			request.setAttribute("event", e);
			request.setAttribute("ewlist", ewlist);
			System.out.println("당첨자 글 보기 완료!");
			
		} else {
			
			System.out.println("당첨자 수정 창 보기 실패!");
			
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
