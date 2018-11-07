package com.buyme.won.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.won.notice.model.service.NoticeService;
import com.buyme.won.notice.model.vo.Notice;


/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/selectList.no")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Notice> list = null;
		NoticeService ns = new NoticeService();
		// -- 페이징 처리(데이터를 일정량 끊어서 가져오는 기술) --//
		
		int startPage; // 한 번에 표시되는 페이지의 첫 페이지 (1, 2,3,4,5) --> 1
		int endPage; // 한 번에 표시되는페이지의 마지막 페이지(1,2,3,4,5) --> 5
		int maxPage; // 전체 페이지의 마지막 페이지(21,2)) -->22
		int currentPage; //현재 사용자가 위치한 페이지
		int limit;  // 한 번에 보여줄 페이지 수
		
		// 게시판은 1페이지부터 시작한다.
		currentPage = 1;
		
		limit = 10;// 한 번에 보여 줄 페이지 수/ 한 페이지에 표시할 게시글 수 
		
		// 만약에 사용자가 현재 접속한 페이지의 정보를 가진다면 해당 페이지의 정보를 받을 수 있어야 한다.
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 게시글 수  조회하기
		int listCount = ns.getListCount();
		
		System.out.println("전체 게시글 수 : "+listCount);
		
		// 전체 게시글 수 를 통한
		// 페이지 내 게시글 수 계산
		// 1,2,3,4,5 --> 50개
		// 전체 게시글 수가 13개라면 페이지는 1,2 페이지 나와야 함
		// 짜투리 게시글도 하나의 페이지로 처리하는 계산을 수행한다.
		// 10/1 --> 0.1 --> 0.1 +0.9
		// 123 --> 12.3페이지--> 13.2-->13 페이지로 만들어야함
		maxPage = (int)((double)listCount / limit + 0.9);
		
		// 시작 페이지와 마지막 페이지 계산하기
		// 1~10, 7-->0.7 -->1.6 -->int 1 ->10page부터 시작???
		//17, 11페이지가 첫 페이지여야 함-->1.7 -->2.6 -->2 --> 20page부터 시작???
		
		// 1 ~ 10, 7  --> 0.7 --> 0.6 --> 0 -->1 /10
		// 17, 11 --> 1.7 --> 1.6 --> 1 --> 10-->11 /20
		startPage = ((int)((double)currentPage / limit+0.9)-1)*limit+1;
		
		// 마지막 페이지
		//1-->11 -->10
		// 12-->21 -->20
		endPage = startPage + limit-1;
		
		// 마지막 페이지 보다 현재 게시글의 페이지가 적다면
		// endPage를 maxPage로 바꿔준다.
		
		if(endPage > maxPage){
			endPage = maxPage;
		}
		
		list = ns.selectList(currentPage,limit);
		
		String page = "";
		if(list != null){
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage,startPage, endPage);
			page = "views/board/boardList.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 목록 조회 실패!");
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
