package com.buyme.sic.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.review.model.service.ReviewService;
import com.buyme.sic.review.model.vo.Review;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/upReview.ur")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		String pno = request.getParameter("pno");
		String content = request.getParameter("content");
		int rank = Integer.parseInt(request.getParameter("rank"));
		
		ReviewService rs = new ReviewService();
		Review r = new Review();
		
		r.setRno(rno);
		r.setRcontent(content);
		r.setRrank(rank);
		
		System.out.println(r);
		
		int result = rs.updateReview(r);
		
		if(result > 0) {
			response.sendRedirect("selectOne.po?pno="+pno);
			
		} else {
			System.out.println("실패");
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
