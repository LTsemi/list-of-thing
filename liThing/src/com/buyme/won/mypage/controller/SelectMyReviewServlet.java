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
import com.buyme.won.notice.model.vo.PageInfo;
import com.buyme.young.wishList.model.service.WishlistService;

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
		ReviewService rs = new ReviewService();
	
		
		
		// 페이징 처리
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 3;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("현재 page : " + currentPage);
		}

		int listCount = rs.getListCount(userid);

		System.out.println("전체 내 리뷰 수 : " + listCount);

		maxPage = (int) ((double) listCount / limit + 0.9);
		startPage = ((int) ((double) currentPage / limit + 0.9) - 1) * limit + 1;
		endPage = startPage + limit-1;

		System.out.println("endpage : " + endPage);
		System.out.println("startPage : " + startPage);

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		ArrayList<Review> rlist  = rs.MyreviewList(userid, currentPage, limit);
		
		
		String page = "";
/*		if(listCount < 1){
			PrintWriter out = response.getWriter();
			 
			out.println("<script> alert('등록된 리뷰가 없습니다. 리뷰를 먼저 작성해 주세요!'); location.href='index.jsp';</script>");
			 
			out.flush();
			out.close();
			page = "login.jsp";
		}*/
		
		
		if (rlist != null) {
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage,
					startPage, endPage);
			
			request.setAttribute("pi", pi);
	

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
