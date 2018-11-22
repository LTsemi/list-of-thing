package com.buyme.won.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;

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
		
		if(o != null){
			GregorianCalendar today = new GregorianCalendar();

			Calendar endday = new GregorianCalendar();

			endday.setTimeInMillis(o.getEnd_order().getTime());
					
			int compare = (endday.getTimeInMillis() - today.getTimeInMillis() > 0) ? 1 : 0;
							// 1이면 아직 기간 남은거
			if(compare == 0){
				os.updateDelf(userid);
				System.out.println("delf 변경");
			}
			
		}
		
		o = os.selectOneList(userid);
		
		System.out.println("o :" + o);
		
		String page = "";
		
		if(o != null){
			
			page = "views/won/orderList.jsp";
			request.setAttribute("order", o);
			
		} else {
			System.out.println("서블릿오류");
			PrintWriter out = response.getWriter();
				
				out.println("<script> alert('구매내역이 없습니다.'); location.href='/semi/views/seul/lithingbox.jsp'; </script>");
				 
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
