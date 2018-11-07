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
 * Servlet implementation class eventInsertServlet
 */
@WebServlet("/eInsert.ev")
public class eventInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public eventInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 기본 전송 값 처리 로직
		String evttitle = request.getParameter("evttitle");
		String evtcontent = request.getParameter("evtcontent");
		String userid = request.getParameter("userId");

		Event e = new Event();

		e.setEvttitle(evttitle);
		e.setEvtcontent(evtcontent);
		e.setUserid(userid);

		int result = new EventService().insertEvent(e);

		/*if (result > 0) {

			response.sendRedirect("selectList.ev");

		} else {

			request.setAttribute("msg", "게시글 작성 실패!");

			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

		}*/

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
