package com.buyme.ju.themaDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.buyme.ju.themaDetail.model.service.ThemaDetailService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ThemaDetailDeleteServlet
 */
@WebServlet("/tdDelete.td")
public class ThemaDetailDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaDetailDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pno = request.getParameter("pno");
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		int result = new ThemaDetailService().deleteThemaProduct(pno, tno);	
		
		if (result > 0) {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('삭제되었습니다.'); location.href='selectList.td?tno="+tno+"\'"+"</script>");
			
			out.flush();
			out.close();
		
			/*response.sendRedirect("selectList.td?tno="+tno);*/
		
		} else {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('삭제 실패'); location.href='selectList.td?tno="+tno+"\'"+"</script>");
			
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
