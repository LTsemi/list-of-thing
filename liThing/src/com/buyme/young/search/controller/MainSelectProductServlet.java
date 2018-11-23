package com.buyme.young.search.controller;

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

/**
 * Servlet implementation class MainSelectProductServlet
 */
@WebServlet("/mSelPro.ma")
public class MainSelectProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainSelectProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pname = request.getParameter("pname");
		
		ArrayList<Product> list = new ArrayList<Product>();
		ProductService ps = new ProductService();
		list = ps.selectMainList(pname);
		
		String page = "";
		
		if (list != null) {
			System.out.println("연결성공");
			System.out.println(list);
			page = "views/sic/Ranking.jsp";
			request.setAttribute("list", list);
			
		} else {
			
			System.out.println("에러발생");
			PrintWriter out = response.getWriter();
	          
	        out.println("<script> alert('제품을 불러오지 못하였습니다.'); location.href='views/sic/Ranking.jsp';</script>");
	          

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