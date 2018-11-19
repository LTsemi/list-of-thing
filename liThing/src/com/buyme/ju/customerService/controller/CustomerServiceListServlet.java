package com.buyme.ju.customerService.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.customerService.model.sevice.CSService;
import com.buyme.ju.customerService.model.vo.CustomerService;

/**
 * Servlet implementation class CustomerServiceListServlet
 */
@WebServlet("/selectList.cs")
public class CustomerServiceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServiceListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CustomerService> list = new ArrayList<CustomerService>();
				
		CSService cs = new CSService();
				
		list = cs.selectList();
				
		String page = "";

		if(list != null){
					
			page = "views/ju/CustomerService.jsp";
			request.setAttribute("list", list);
			
		} else {
					
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('고객센터 로드에 실패하였습니다.'); location.href='index.jsp';</script>");
			
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
