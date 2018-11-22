package com.buyme.sic.ranking.controller;

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
 * Servlet implementation class SelectOneProductServlet
 */
@WebServlet("/selectOne.po")
public class SelectOneProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("selectOneServlet 들어옴");
		String pno = request.getParameter("pno"); 
		Product p = new Product();
		ProductService ps = new ProductService();
		System.out.println("selectOneServlet Pno : " + pno);
		p = ps.selectOneList(pno);
		
		ArrayList<Review> rlist = new ArrayList<Review>();
		rlist = new ReviewService().reviewList(pno);

		String page = "";
		
		if(p != null){
			System.out.println("성공");
			page = "views/sic/rankDetail.jsp";
			request.setAttribute("dRank", p);
			request.setAttribute("rlist", rlist);
			
			System.out.println("drank : " + p);
			System.out.println("rlist : " + rlist);
			
		} else {
			System.out.println("서블릿오류");
			PrintWriter out = response.getWriter();
	          
	        out.println("<script> alert('제품 조회에 실패하였습니다.'); location.href='views/sic/rankDetail.jsp';</script>");
	          
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
