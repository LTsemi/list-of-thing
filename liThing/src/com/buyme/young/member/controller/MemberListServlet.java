package com.buyme.young.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/mList.me")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService ms = new MemberService();
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		list = ms.selectAllMember();
		
		String page = "";
		try {
			request.setAttribute("list", list);
			page = "views/young/memberAdmin.jsp";
			
		} catch (Exception e) {
			System.out.println("회원 전체 조회 실패");
			page = "views/young/login.jsp";
		}
		request.getRequestDispatcher(page).forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
