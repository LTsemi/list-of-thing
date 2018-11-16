package com.buyme.won.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.won.mypage.model.service.OrderService;
import com.buyme.won.mypage.model.vo.OrderLT;


/**
 * Servlet implementation class SelectOrderServlet
 */
@WebServlet("/sOrder.mp")
public class SelectOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid"); 
		System.out.println("userid : " + userid);
		OrderLT o = new OrderLT();
		
		OrderService os = new OrderService();
		
		o = os.selectOneList(userid);
		
		System.out.println("o :" + o);
		
		String page = "";
		
		if(o != null){
			
			page = "views/won/orderList.jsp";
			request.setAttribute("order", o);
			
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
