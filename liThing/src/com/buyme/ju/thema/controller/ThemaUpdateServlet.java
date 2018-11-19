package com.buyme.ju.thema.controller;

import java.io.File; 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.buyme.ju.thema.model.service.ThemaService;
import com.buyme.ju.thema.model.vo.Thema;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ThemaUpdateServlet
 */
@WebServlet("/tUpdate.tm")
public class ThemaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 첨부 파일 유무를 확인하기 위한 코드
			if(!ServletFileUpload.isMultipartContent(request)){
				request.setAttribute("msg", "multipart/form-data로 전송해야만 합니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			// 저장할 파일 최대 크기와 파일의 저장 경로를 지정한다.
			int maxSize = 1024*1024*30;
			
			String root = 
					request.getServletContext().getRealPath("/");
			
			String savePath = root + "resources/themaUploadFiles";
			
			
			
			// Request -> MultipartRequest
			MultipartRequest mrequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			ThemaService ts = new ThemaService();
			
			int tno = Integer.parseInt(mrequest.getParameter("tno"));
			
			Thema t = ts.selectOne(tno);
			
			// 기본 형식 값
			
			String title = mrequest.getParameter("title");
			String content = mrequest.getParameter("content");
			
			t.setTtitle(title);
			t.setTcontent(content);
			
			// 파일 저장 유무 확인 로직
			String file = mrequest.getFilesystemName("file");
			
			if(file != null) {
				File originFile = new File(savePath + "/" + t.getTimage());
				
				originFile.delete();
				
				t.setTimage(file);
			}
			
			int result = ts.updateThema(t);
			
			String page = "";
			
			if(result > 0) {
				
				PrintWriter out = response.getWriter();
				
				out.println("<script> alert('테마가 수정되었습니다.'); location.href='selectList.tm';</script>");
				
				out.flush();
				out.close();
				
				/*response.sendRedirect("selectList.tm");*/
				
			} else {
				
				PrintWriter out = response.getWriter();
				
				out.println("<script> alert('테마 수정 실패'); location.href='selectList.tm';</script>");
				
				out.flush();
				out.close();
				
				/*page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시글 수정 실패!");
				request.getRequestDispatcher(page).forward(request, response);*/
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
