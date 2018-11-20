package com.buyme.sic.ranking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.ranking.model.service.ProductService;
import com.buyme.sic.ranking.model.vo.Product;

/**
 * Servlet implementation class SeelctSortProductServlet
 */
@WebServlet("/sProduct.so")
public class SelctSortProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelctSortProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String so = request.getParameter("so");
		String pnn = request.getParameter("pnn");
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		System.out.println(so);
		System.out.println(pnn);
		
		ProductService ps = new ProductService();
		
		list = ps.sortList(so, pnn);
		
		String page = "";
		
		if (list != null) {	
			System.out.println("연결성공");
			System.out.println(list);
			page = "views/sic/Ranking.jsp";
			request.setAttribute("list", list);
			request.setAttribute("sortsts", so);
			
		} else {
			
			System.out.println("에러발생");
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
