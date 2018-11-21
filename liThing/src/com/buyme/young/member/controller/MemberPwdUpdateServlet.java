package com.buyme.young.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.buyme.young.member.exception.MemberException;
import com.buyme.young.member.model.service.MemberService;
import com.buyme.young.member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdUpdateServlet
 */
@WebServlet("/mPwUp.mp")
public class MemberPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("pwd");
		
		System.out.println("mpw 서블릿 들어옴");
		MemberService ms = new MemberService();
		
		Member m = new Member(userId, password);
		
		System.out.println("전달받은 회원 정보 : "  + m);
		Member result = ms.selectPwMember(m);
		if(result != null){
			

			System.out.println("로그인 성공!");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member", result);
			
			response.sendRedirect("views/young/update.jsp");
			
		} else{
			
/*			request.setAttribute("msg", "회원 로그인 실패!");
			request.setAttribute ("exception", e);
			*/
/*			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
			*/

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
