package com.buyme.young.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.young.member.model.service.MemberService;

/**
 * Servlet implementation class MemberIdDuplicateServlet
 */
@WebServlet("/idDup.me")
public class MemberIdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*String id = request.getParameter("userId");
		
		MemberService ms = new MemberService();
		
		int result = ms.idDupCheck(id);
		
		// 0 / 1
		// 0 : 써도 된다(ok)
		// 1 : 쓰면 안된다(no)
		
		response.getWriter().print((result > 0) ? "no" : "ok");
		*/
		
		response.getWriter().print((new MemberService().idDupCheck(request.getParameter("userId")) > 0 ) ? "no" : "ok");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}