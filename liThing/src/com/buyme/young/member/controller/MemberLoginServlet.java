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
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/login.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPwd");
		
		MemberService ms = new MemberService();
		
		Member m = new Member(userId, password);
		
		System.out.println("전달받은 회원 정보 : "  + m);
		
		try {
			m = ms.selectMember(m);

			System.out.println("로그인 성공!");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member", m);
			
			response.sendRedirect("index.jsp");
			
		} catch (MemberException e) {
			
/*			request.setAttribute("msg", "회원 로그인 실패!");
			request.setAttribute ("exception", e);
			*/
/*			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
			*/
			PrintWriter out = response.getWriter();
			 
			out.println("<script> alert('아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='views/young/login.jsp';</script>");
			 
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
