//package com.buyme.young.search.controller;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.buyme.sic.ranking.model.service.ProductService;
//import com.google.gson.Gson;
//
//
///**
// * Servlet implementation class MainSearchServlet
// */
//@WebServlet("/mSearch.pd")
//public class MainSearchServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public MainSearchServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		ProductService ps = new ProductService();
//		String keyword = request.getParameter("keyword");
//		
//		System.out.println("keyword 1: " + keyword);
//		
//		if(keyword == null || keyword.equals("")) keyword = "_";
//		
//		System.out.println("keyword 2: " + keyword);
//		
//		ArrayList<String> list = ps.selectSearchList(keyword);
//
//		System.out.println("검색 리스트 출력 내용");
//		response.setContentType("application/json; charset=UTF-8");
//		
//		new Gson().toJson(list, response.getWriter());
//		
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
