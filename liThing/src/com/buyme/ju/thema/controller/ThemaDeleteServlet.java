package com.buyme.ju.thema.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.thema.model.service.ThemaService;

/**
 * Servlet implementation class ThemaDeleteServlet
 */
@WebServlet("/tDelete.tm")
public class ThemaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		int result = new ThemaService().deleteThema(tno);	
		
		if (result > 0) {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('삭제되었습니다.'); location.href='selectList.tm' </script>");
			
			out.flush();
			out.close();
		
			/*response.sendRedirect("selectList.td?tno="+tno);*/
		
		} else {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('삭제 실패'); location.href='selectList.tm'</script>");
			
			out.flush();
			out.close();
		
			/*request.setAttribute("msg", "테마 상품 삭제 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);*/
		
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
