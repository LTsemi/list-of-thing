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
 * Servlet implementation class MemberIdServlet
 */
@WebServlet("/mIDCheck.me")
public class MemberIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String  name = request.getParameter("name");
		String email = request.getParameter("email");
		
		Member m = new MemberService().idCheck( name, email);
		System.out.println("name :" + name + "email : " + email);
				
		PrintWriter out = response.getWriter();
		if(m != null) {
			
			out.println("<script> alert('회원님의 아이디는  "+ m.getUserId() +"  입니다.'); location.href='views/young/login.jsp'; </script>");
			 
			out.flush();
			out.close();
			
		}else{
			
			
			 
			out.println("<script> alert('해당하는 회원이 존재하지 않습니다.'); location.href='views/young/login.jsp'; </script>");
			 
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
