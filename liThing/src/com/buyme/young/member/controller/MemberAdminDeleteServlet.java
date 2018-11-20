package com.buyme.young.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.young.member.exception.MemberException;
import com.buyme.young.member.model.service.MemberService;
import com.google.gson.Gson;

/**
 * Servlet implementation class MemberAdminDeleteServlet
 */
@WebServlet("/mAdmindelete.me")
public class MemberAdminDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAdminDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서블릿 접속성공");
		String userid = request.getParameter("userId");
		System.out.println("삭제할 아이디 : "+userid);
		
		MemberService ms = new MemberService();
		
		int result = ms.deleteMember(userid);
		
			/*if(result >0){
			

					System.out.println("관리자 회원 삭제 완료");
					response.sendRedirect("/mList.me");

			} else {
				// TODO Auto-generated catch block
				System.out.println("관리자 회원 삭제 실패");
			}
		*/
		   response.setContentType("application/json; charset=UTF-8");
			
			new Gson().toJson(result, response.getWriter());
       
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
