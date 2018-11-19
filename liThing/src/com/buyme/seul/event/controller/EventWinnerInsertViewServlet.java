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
import com.buyme.seul.eventComment.model.service.EventCommentService;
import com.buyme.seul.eventComment.model.vo.EventComment;

/**
 * Servlet implementation class EventWinnerUpdateViewServlet
 */
@WebServlet("/eWinInsertView.ev")
public class EventWinnerInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventWinnerInsertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이벤트 글 여러 개를 받기 위한 리스트
		
		int eno = Integer.parseInt(request.getParameter("eno"));
		System.out.println("swl 서블릿 들어옴");
		Event e = new EventService().updateWinView(eno);
		
		ArrayList<EventWinner> ewlist
		   = new EventWinnerService().SelectWinnerList(eno);
		
		String page = "";
		
		if (e != null) {
			page = "views/seul/winnerPageInsertForm.jsp";
			request.setAttribute("event", e);
			request.setAttribute("ewlist", ewlist);
			System.out.println("당첨자 작성페이지 접속 성공!");
			
		} else {
			
			System.out.println("당첨자 작성페이지 접속 실패!");
			
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
