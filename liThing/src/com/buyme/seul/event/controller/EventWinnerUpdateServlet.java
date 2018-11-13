package com.buyme.seul.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.seul.event.model.service.EventService;
import com.buyme.seul.event.model.vo.Event;

/**
 * Servlet implementation class EventWinnerUpdateServlet
 */
@WebServlet("/eWinUpdate.ev")
public class EventWinnerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventWinnerUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 접속 성공");
		String title = request.getParameter("title");
		System.out.println("title:" + title);
		String content = request.getParameter("content");
		int eno = Integer.parseInt(request.getParameter("eno"));
		Event e = new Event();
		
		e.setEvttitle(title);
		e.setEvtcontent(content);
		e.setEno(eno);
		
		int result = new EventService().updateWinner(e);
		
		if(result > 0) {
			
			response.sendRedirect("eSelectWin.ev?eno="+eno);
			System.out.println("당첨자 수정 확인창 불러오기 성공!");
			
		} else {
			System.out.println("당첨자 수정 확인창 불러오기 실패!");
			request.getRequestDispatcher("views/seul/eventWinList.jsp")
			.forward(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
