package com.buyme.young.wishList.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.young.wishList.model.service.WishlistService;

/**
 * Servlet implementation class DeleteWishServlet
 */
@WebServlet("/mdeleteWish.mp")
public class DeleteWishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String pno = request.getParameter("pno");
		
		WishlistService ws = new WishlistService();
		
		int result = ws.deleteWish(userid, pno);
		
		if (result > 0) {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('삭제되었습니다.'); location.href='/semi/sWish.mp?userid="+ userid +"'; </script>");
			
			out.flush();
			out.close();
			
			/*response.sendRedirect("selectList.cs");*/
		
		} else {
		
			PrintWriter out = response.getWriter();
			 
			out.println("<script> alert('위시리스트 삭제 실패');  location.href='/semi/sWish.mp?userid="+ userid +"'; </script>");
			 
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
