package com.buyme.sic.ranking.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.ranking.model.service.ProductService;
import com.buyme.sic.ranking.model.vo.Product;

/**
 * Servlet implementation class ManagerSelectOneServlet
 */
@WebServlet("/mselectOne.mo")
public class ManagerSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pno = request.getParameter("pno"); 
		Product p = new Product();
		ProductService ps = new ProductService();
		
		p = ps.mselectOneList(pno);
		
		String page = "";
		

		if(p != null){
			
			page = "views/sic/ManagerDetailPage.jsp";
			request.setAttribute("mRank", p);
			
		} else {
			System.out.println("서블릿오류");
			 PrintWriter out = response.getWriter();
	          
		        out.println("<script> alert('제품조회에 실패하였습니다.'); location.href='views/sic/ManagerDetailPage.jsp';</script>");
		          
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
