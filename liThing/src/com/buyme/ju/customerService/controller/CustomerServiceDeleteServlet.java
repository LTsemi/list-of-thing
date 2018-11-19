package com.buyme.ju.customerService.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.customerService.model.sevice.CSService;
import com.buyme.ju.themaDetail.model.service.ThemaDetailService;

/**
 * Servlet implementation class CustomerServiceDeleteServlet
 */
@WebServlet("/csDelete.cs")
public class CustomerServiceDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServiceDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new CSService().deleteCustomerService(cno);	
		
		if (result > 0) {
		
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('삭제되었습니다.'); location.href='selectList.cs';</script>");
			
			out.flush();
			out.close();
			
			/*response.sendRedirect("selectList.cs");*/
		
		} else {
		
			PrintWriter out = response.getWriter();
			 
			out.println("<script> alert('QnA 삭제 실패'); location.href='views/ju/CustomerService.jsp';</script>");
			 
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
