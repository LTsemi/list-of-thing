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
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/insertComment.eo")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String ccontent = request.getParameter("replyContent");
		int eno = Integer.parseInt(request.getParameter("eno"));
		
		EventComment eco = new EventComment();
		eco.setEno(eno);
		eco.setCcontent(ccontent);
		eco.setUserid(userId);
		
		int result = new EventCommentService().insertComment(eco);
		
		if(result > 0) {
			System.out.println("댓글 작성 성공~");
			response.sendRedirect(request.getContextPath()
					+"/selectOne.eo?eno="+eno);
		} else {
			System.out.println("댓글 작성 실패!");
			request.getRequestDispatcher("views/seul/eventList.jsp")
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
