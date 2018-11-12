package com.buyme.ju.customerService.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.customerService.model.sevice.CSService;
import com.buyme.ju.customerService.model.vo.CustomerService;


/**
 * Servlet implementation class CustomerServiceInsertServlet
 */
@WebServlet("/csInsert.cs")
public class CustomerServiceInsertServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServiceInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ctitle = request.getParameter("ctitle");
		String writer = request.getParameter("name");
		String content = request.getParameter("ccontent");
		String date = request.getParameter("cdate");
		String userId = request.getParameter("userId");
		
		System.out.println("날짜 : "+date);
		
		Date writeDay = null;
		
		if(date != ""){
			// 날짜가 들어 왔다면
			
			String[] dateArr = date.split("-");
			
			int[] drr = new int[dateArr.length];
			
			// String --> int
			for(int i = 0; i < dateArr.length;i++){
				drr[i] = Integer.parseInt(dateArr[i]);
			}
			
			writeDay = new Date(
					new GregorianCalendar(drr[0], drr[1] -1, drr[2]).getTimeInMillis());
			
		} else {
			// 날짜가 들어 오지 않았다면
			writeDay = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		CustomerService c = new CustomerService();
		
		c.setCtitle(ctitle);
		c.setCcontent(content);
		c.setUserid(userId);
		c.setCdate(writeDay);
		
		System.out.println("c : " + c);
		
		CSService cs = new CSService();
		
		int result = cs.insertCustomerService(c);
		
		if(result > 0){
			
			response.sendRedirect("selectList.cs");
			
		} else {
			
			request.setAttribute("msg", "공지사항 등록 실패!");
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
