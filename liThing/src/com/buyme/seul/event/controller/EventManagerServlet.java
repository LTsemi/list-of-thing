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
import com.buyme.seul.eventComment.model.service.EventCommentService;
import com.buyme.seul.eventComment.model.vo.EventComment;

/**
 * Servlet implementation class EventListServlet
 */
@WebServlet("/eventManager.ev")
public class EventManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이벤트 글 여러 개를 받기 위한 리스트
		ArrayList<Event> list = null;
		
		list = new EventService().selectEventList();
		
		ArrayList<EventComment> clist
		   = new EventCommentService().allSelectList();

		
		
		
		System.out.println(list);
		
		String page = "";

		if(list != null){

			page = "views/seul/eventManager.jsp";
			request.setAttribute("list", list);
			request.setAttribute("clist", clist);
			
		} else {
			/*
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회 실패!");
			*/
			System.out.println("조회 실패!");
		}
		
		request.getRequestDispatcher(page)
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
