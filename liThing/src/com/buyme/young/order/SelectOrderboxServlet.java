package com.buyme.young.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
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
 * Servlet implementation class SelectOrderboxServlet
 */
@WebServlet("/sOrderbox.or")
public class SelectOrderboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOrderboxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid"); 
		String buyMonth = request.getParameter("buyMonth");
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
		
		if(o == null){
			
			page = "views/seul/orderBox.jsp";
			request.setAttribute("order", o);
			request.setAttribute("buyMonth", buyMonth);
			
		}else{
			System.out.println("서블릿오류");
			PrintWriter out = response.getWriter();
				
				out.println("<script> alert('이미 구매하신 내용이 있습니다. 해당 기간 종료 후 다시 주문해주세요!'); location.href='/semi/views/seul/lithingbox.jsp'; </script>");
				 
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
