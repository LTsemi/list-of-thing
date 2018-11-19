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
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/orderList.mp")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String price = request.getParameter("price");
		String address = request.getParameter("address");
		
		OrderService os = new OrderService();
		
		OrderLT o = new OrderLT();
		
		System.out.println("userid : " + userid);
		System.out.println("price : " + price);
		System.out.println("address : " + address);
		
		int price2 = Integer.parseInt(price)*1000;
		
		o.setUserid(userid);
		o.setPrice(price2);
		o.setUseraddress(address);
		
		// 회원 가입 확인용 메소드
		try{ 
			os.insertOrder(o);
			System.out.println("주문 완료 : " + o);
			response.sendRedirect("index.jsp");
			
		} catch(Exception e) {
			request.setAttribute("msg", "리띵박스 주문 중 에러가 발생하였습니다.");
			request.setAttribute ("exception", e);
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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