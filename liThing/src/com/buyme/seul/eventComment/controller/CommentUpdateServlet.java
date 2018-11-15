package com.buyme.seul.eventComment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.seul.eventComment.model.service.EventCommentService;
import com.buyme.seul.eventComment.model.vo.EventComment;

/**
 * Servlet implementation class CommentUpdateServlet
 */
@WebServlet("/updateComment.co")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int eno = Integer.parseInt(request.getParameter("eno"));
		String content = request.getParameter("content");
		
		EventCommentService ecs = new EventCommentService();
		EventComment eco = new EventComment();
		
		eco.setCno(cno);
		eco.setCcontent(content);
		
		int result = ecs.updateComment(eco);
		
		if(result > 0) {
			System.out.println("댓글 수정 성공");
			response.sendRedirect("selectOne.ev?eno="+eno);
		} else {
			System.out.println("댓글 삭제 실패!");
			request.getRequestDispatcher("/semi/selectList.ev")
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
