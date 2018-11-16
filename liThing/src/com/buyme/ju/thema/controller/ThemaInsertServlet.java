package com.buyme.ju.thema.controller;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.buyme.common.MyRenamePolicy;
import com.buyme.ju.thema.model.service.ThemaService;
import com.buyme.ju.thema.model.vo.Thema;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ThemaInsertServlet
 */
@WebServlet("/tInsert.tm")
public class ThemaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;
		
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("msg", "enctype 을 통한 multipart 전송이 필요합니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
		}
		
		String root = request.getServletContext()
				.getRealPath("/");
		
		String savePath
		= root + "resources/themaUploadFiles";
		
		MultipartRequest mrequest = new MultipartRequest(
				request, // 기존의 request 객체
				savePath, // 파일 저장 경로
				maxSize, // 파일 최대 크기
				"UTF-8", // 인코딩 방식
				new MyRenamePolicy()
				);
		
		String ttitle = mrequest.getParameter("title");
		String tcontent = mrequest.getParameter("content");
		String userId = mrequest.getParameter("userId");
		String timage = mrequest.getFilesystemName("file");
		
		Thema t = new Thema();
		
		t.setTtitle(ttitle);
		t.setTcontent(tcontent);
		t.setUserid(userId);
		t.setTimage(timage);
		
		System.out.println("t : " + t);
		
		ThemaService ts = new ThemaService();
		
		int result = ts.insertThema(t);
		
		if(result > 0){
			
			response.sendRedirect("selectList.tm");
			
		} else {
			
			request.setAttribute("msg", "테마 등록 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
