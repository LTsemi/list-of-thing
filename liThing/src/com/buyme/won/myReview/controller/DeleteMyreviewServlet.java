package com.buyme.won.myReview.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteMyreviewServlet
 */
@WebServlet("/deleteMyRview.mp")
public class DeleteMyreviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMyreviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		ReviewService rs = new ReviewService();
		
		int result = rs.deleteMyReview(userid, rno);
		
		if(result >0) {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('삭제되었습니다.'); location.href='/semi/sMyreview.mp?userid="+ userid +"'; </script>");
			
			out.flush();
			out.close();
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
