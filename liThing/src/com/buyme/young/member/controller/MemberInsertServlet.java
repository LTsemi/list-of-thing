package com.buyme.young.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.young.member.model.service.MemberService;
import com.buyme.young.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/mInsert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		String birth1 = request.getParameter("birthyear");
		String birth2 = request.getParameter("birthmon");
		String birth3 = request.getParameter("birthdate");
		String email = request.getParameter("email");
		
		String phone = request.getParameter("tel1") + request.getParameter("tel2");
		System.out.println(request.getParameter("tel2"));
		String address = request.getParameter("zipCode") + ", "
				       + request.getParameter("address1") + ", "
				       + request.getParameter("address2");
		
		Date birthDay = null;
		if(birth1+birth2+birth3 != ""){
			// 날짜가 들어 왔다면
			// ex) 2018-10-23 --> 2018, 10, 23 (현재 문자열 상태)

			// String --> int
				int birthyear = Integer.parseInt(birth1);
				int birthmon = Integer.parseInt(birth2);
				int birthdate = Integer.parseInt(birth3);
				
			// int -> date형태로
			birthDay = new Date(new GregorianCalendar(birthyear, birthmon-1, birthdate).getTimeInMillis());
			
		}
		MemberService ms = new MemberService();
		
		Member m = new Member(userId, password, userName, gender, birthDay, email, phone, address);
		
		// 회원 가입 확인용 메소드
		try{
			ms.insertMember(m);
			System.out.println("회원 가입 완료! : " + m);
			response.sendRedirect("index.jsp");
			
		} catch(Exception e) {
			request.setAttribute("msg", "회원 가입 중 에러가 발생하였습니다.");
			request.setAttribute ("exception", e);
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
