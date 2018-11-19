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
 * Servlet implementation class CustomerServiceUpdateServlet
 */
@WebServlet("/csUpdate.cs")
public class CustomerServiceUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServiceUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		CustomerService c = new CustomerService();
		
		c.setCtitle(title);
		c.setCcontent(content);
		c.setCno(cno);
		
		int result = new CSService().updateCustomerSerivce(c);
		
		if(result > 0) {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('QnA가 수정되었습니다.'); location.href='selectList.cs';</script>");
			
			out.flush();
			out.close();
			
			/*response.sendRedirect("selectList.cs");*/
			
		} else {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('QnA 수정에 실패하였습니다.'); location.href='selectList.cs';</script>");
			
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
