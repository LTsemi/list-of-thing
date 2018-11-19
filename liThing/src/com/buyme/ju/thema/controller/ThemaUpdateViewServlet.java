package com.buyme.ju.thema.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.customerService.model.sevice.CSService;
import com.buyme.ju.customerService.model.vo.CustomerService;
import com.buyme.ju.thema.model.service.ThemaService;
import com.buyme.ju.thema.model.vo.Thema;

/**
 * Servlet implementation class ThemaUpdateViewServlet
 */
@WebServlet("/tUpView.tm")
public class ThemaUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		Thema t = new ThemaService().updateView(tno);
		
		String page = "";
		
		if (t != null) {
			
			page = "views/ju/Thema_Update.jsp";
			request.setAttribute("thema", t);
			
		} else {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('테마 수정 페이지 로드 실패'); location.href='selectList.tm';</script>");
			
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
