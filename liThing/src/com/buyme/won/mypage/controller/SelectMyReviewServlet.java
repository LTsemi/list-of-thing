package com.buyme.won.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.ranking.model.service.ProductService;
import com.buyme.sic.ranking.model.vo.Product;
import com.buyme.sic.review.model.service.ReviewService;
import com.buyme.sic.review.model.vo.Review;

/**
 * Servlet implementation class SelectMyReviewServlet
 */
@WebServlet("/sMyreview.mp")
public class SelectMyReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMyReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userid");
		ArrayList<Review> rlist  = new ReviewService().MyreviewList(userid);
		

		
		String page = "";
		if (rlist != null) {
			
			

			page = "views/won/myReviews.jsp";
			request.setAttribute("rlist", rlist);

		} else {
			System.out.println("서블릿오류");
			PrintWriter out = response.getWriter();
			 
			out.println("<script> alert('등록된 리뷰가 없습니다. 리뷰를 먼저 작성해 주세요!'); location.href='index.jsp';</script>");
			 
			out.flush();
			out.close();
			
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
