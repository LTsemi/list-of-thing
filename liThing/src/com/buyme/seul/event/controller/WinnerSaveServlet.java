package com.buyme.seul.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.seul.event.model.service.EventWinnerService;
import com.buyme.seul.event.model.vo.EventWinner;
import com.buyme.seul.eventComment.model.service.EventCommentService;
import com.buyme.seul.eventComment.model.vo.EventComment;

/**
 * Servlet implementation class WinnerSaveServlet
 */
@WebServlet("/winnerSave.ev")
public class WinnerSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WinnerSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int winner_cut = Integer.parseInt(request.getParameter("winner_cut"));
		int eno = Integer.parseInt(request.getParameter("eno"));
		String cwriter = request.getParameter("cwriter");
		
//		ArrayList<EventComment> clist
//		   = new EventCommentService().userSelectList(eno, winner_cut);
//		
		
		int result = new EventWinnerService().insertWinner(eno, winner_cut);
		//ArrayList<EventWinner> ewlist = new EventWinnerService().insertWinner(eno, winner_cut);
		
		//System.out.println("ewlist : " + ewlist);
		
		
		if(result > 0) {
			System.out.println("성공하였습니다!");
			//response.sendRedirect("eventManager.ev");
			response.sendRedirect(request.getContextPath()
					+"/eventManager.ev");
			
		} else {
			/*request.setAttribute("msg", "파일 전송 실패!");*/
			System.out.println("당첨자 리스트 전송 실패!");	
			request.getRequestDispatcher("/eventManager.ev")
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
