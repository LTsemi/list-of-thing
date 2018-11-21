package com.buyme.young.wishList.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.ranking.model.vo.Product;
import com.buyme.young.wishList.model.service.WishlistService;
import com.buyme.young.wishList.model.vo.Wishlist;


/**
 * Servlet implementation class WishlistInsertServlet
 */
@WebServlet("/mWishlist.mp")
public class WishlistInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pno = request.getParameter("pno");
		String userid = request.getParameter("userid");
		
		WishlistService ws = new WishlistService();
		Wishlist w = new Wishlist(pno, userid);
		
		
		System.out.println("pno : " + pno);
		int result = ws.insertWish(w);
		

		if(result > 0 ){
			System.out.println("위시리스트 등록 성공");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('위시리스트에 등록되었습니다.');  location.href='/semi/selectOne.po?pno="+ pno +"'</script>");
			 
			out.flush();
			out.close();

		}else{
			PrintWriter out = response.getWriter();
			out.println("<script> alert('이미 위시리스트에 등록되어 있는 상품 입니다.');  location.href='/semi/selectOne.po?pno="+ pno +"';</script>");
			 
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
