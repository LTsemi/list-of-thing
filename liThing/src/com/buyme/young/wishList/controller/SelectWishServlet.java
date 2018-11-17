package com.buyme.young.wishList.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.ranking.model.vo.Product;
import com.buyme.young.wishList.model.service.WishlistService;

/**
 * Servlet implementation class SelectWishServlet
 */
@WebServlet("/sWish.mp")
public class SelectWishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectWishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		System.out.println("userid" + userid);
		WishlistService ws = new WishlistService();
		
		ArrayList<Product> plist = ws.selectWish(userid);
		
		
		String page = "";
		
		if(plist != null){
			
			page = "views/won/myPage.jsp";
			request.setAttribute("list", plist);
			
		} else {
			System.out.println("서블릿오류");
			/*page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세보기 실패!");*/
			
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
