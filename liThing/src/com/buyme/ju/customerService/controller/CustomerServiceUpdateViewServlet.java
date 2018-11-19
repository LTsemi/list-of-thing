package com.buyme.ju.customerService.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.customerService.model.sevice.CSService;
import com.buyme.ju.customerService.model.vo.CustomerService;

/**
 * Servlet implementation class CustomerServiceUpdateViewServlet
 */
@WebServlet("/csUpView.cs")
public class CustomerServiceUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServiceUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		CustomerService c = new CSService().updateView(cno);
		
		String page = "";
		
		if (c != null) {
			
			page = "views/ju/CustomerService_Update.jsp";
			request.setAttribute("customerService", c);
			
		} else {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('QnA 수정 페이지 로드에 실패하였습니다.'); location.href='selectList.cs';</script>");
			
			out.flush();
			out.close();
			
			/*page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "QnA 수정 페이지 보기 실패");*/
			
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
