package com.buyme.seul.event.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.buyme.seul.event.model.service.EventService;
import com.buyme.seul.event.model.vo.Event;

/**
 * Servlet implementation class eventInsertServlet
 */
@WebServlet("/eInsertWin.ev")
public class EventWinnerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventWinnerInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)){
			
			Event e = new Event();
			
			e.setEvttitle(request.getParameter("title"));
			e.setEvtcontent(request.getParameter("content"));
			e.setUserid(request.getParameter("userId"));
			/*e.setE_file(request.getParameter("file"));*/	
			
			EventService es = new EventService();
			
			int result = es.insertEventWinner(e);
			
			if(result > 0){
				System.out.println("성공하였습니다!");
				response.sendRedirect("selectWinList.ev");
				
			} else {
				
				/*request.setAttribute("msg", "공지사항 등록 실패!");*/
				System.out.println("파일 전송 실패!");
				/*request.getRequestDispatcher("index.jsp")
				.forward(request, response);*/
			}
		}
		
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
