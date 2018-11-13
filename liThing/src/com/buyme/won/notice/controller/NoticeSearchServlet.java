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
import com.buyme.won.notice.model.vo.PageInfo;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/searchNotice.no")
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      
		// 검색 카테고리
				String condition = request.getParameter("con");
				System.out.println("con =" +condition);
				// 검색 키워드
				String keyword = request.getParameter("keyword");
				System.out.println("keyword =" +keyword);
				ArrayList<Notice> list = new ArrayList<Notice>();
				
				NoticeService ns = new NoticeService();
				
				
				// 페이징 처리
				int startPage;
				int endPage;
				int maxPage;
				int currentPage;
				int limit;
				
				currentPage = 1;
				
				// 한번에 보여 줄 페이지 수, 한페이지에 표시할 글 수 
				limit = 5;
				
				if(request.getParameter("currentPage") !=null){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
					System.out.println("현재 page : " + currentPage);
				}
				
				
				
				
				// 전체 게시글 수 조회
				System.out.println("size : " + list.size());
				int listCount = list.size();
				
				System.out.println("전체 공지글 수 : "+listCount);
				
				maxPage = (int)((double)listCount/limit +0.9);
				startPage = ((int)((double)currentPage/limit +0.9)-1)*limit+1;
				endPage = startPage + limit-1;
				
				System.out.println("endpage : " + endPage);
				System.out.println("startPage : " + startPage);
				
				if(endPage > maxPage){
					endPage = maxPage;
				}
				
				list = ns.searchNotice(condition, keyword, currentPage,limit);

				String page = "";
				
				if (list != null) {
					
					PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage,
							startPage, endPage);
					
					page = "views/won/noticeList.jsp";
					
					request.setAttribute("pi", pi);
					request.setAttribute("list", list);
					
				} else {
					
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "공지사항 검색에 실패했습니다.");
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
