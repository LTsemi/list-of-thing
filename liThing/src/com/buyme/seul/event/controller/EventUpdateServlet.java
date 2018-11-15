package com.buyme.seul.event.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.buyme.common.MyRenamePolicy;
import com.buyme.seul.event.model.service.EventService;
import com.buyme.seul.event.model.vo.Event;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EventUpdateServlet
 */
@WebServlet("/eUpdate.ev")
public class EventUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventService es = new EventService();
		System.out.println("서블릿 접속 성공");
		if(ServletFileUpload.isMultipartContent(request)){
			int maxSize = 1024 * 1024 * 10;
			String root = request.getServletContext().getRealPath("/resources");
			String savePath = root + "/eventUploadFiles/";
			
			MultipartRequest mrequest =
					new MultipartRequest(request,savePath,
										 maxSize,"UTF-8",
										 new MyRenamePolicy());
			
			int eno = Integer.parseInt(mrequest.getParameter("eno"));

			// 날짜관리
			String dateStr = mrequest.getParameter("dateStr");
			String dateEnd = mrequest.getParameter("dateEnd");
			
			System.out.println("시작날짜 : "+dateEnd);
			System.out.println("종료날짜 : "+dateEnd);
			
			Date strDay = null;
			Date endDay = null;
			
			if(dateStr != ""){
				String[] dateStrArr = dateStr.split("-");				
				int[] sdrr = new int[dateStrArr.length];						
				for(int i = 0; i < dateStrArr.length;i++){
					sdrr[i] = Integer.parseInt(dateStrArr[i]);
				}				
				strDay = new Date(
						new GregorianCalendar(sdrr[0], sdrr[1] -1, sdrr[2]).getTimeInMillis());
			} else {
				// 날짜가 들어 오지 않았다면
				strDay = new Date(new GregorianCalendar().getTimeInMillis());				
			}
			
			if(dateEnd != ""){
				String[] dateEndArr = dateEnd.split("-");
				int[] drr = new int[dateEndArr.length];
				for(int i = 0; i < dateEndArr.length;i++){
					drr[i] = Integer.parseInt(dateEndArr[i]);
				}							
				endDay = new Date(
						new GregorianCalendar(drr[0], drr[1] -1, drr[2]).getTimeInMillis());						
			} else {
				endDay = new Date(new GregorianCalendar().getTimeInMillis());				
			}
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			// 폼으로 전송된 파일 이름들을 받아온다.
			Enumeration<String> files = mrequest.getFileNames();
			
			while(files.hasMoreElements()){
				// 각 파일의 정보를 가져와서 DB에 저장할 내용을 추출한다.
				
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				
				saveFiles.add(mrequest.getFilesystemName(name));
				originFiles.add(mrequest.getOriginalFileName(name));				
			}
			
			// Event e = new Event();
			Event e = es.selectEvent(eno);
			
			e.setEvttitle(mrequest.getParameter("title"));
			
			// 4가지 
			// 1. 아무 값도 없을 때
			// 2. 둘 중 하나만 있을 때 --> 2가지
			// 3. 둘 다 있을 때
			
			// ------
			System.out.println("원본 : " + e.getE_cname());
			System.out.println("변경 : " + mrequest.getParameter("titleImgFile"));
			
			System.out.println("원본 : " + e.getE_dtl_cname());
			System.out.println("변경 : " + mrequest.getParameter("contentImgFile"));
			
			/*
			if(originFiles.size() == 1) {
				if(mrequest.getParameter("titleImg").equals(e.getE_cname())) {
					// 타이틀이 변경되지 않았을 때
					new File(savePath+e.getE_dtl_cname()).delete();
					e.setE_file(savePath);	
					e.setE_dtl_oname(originFiles.get(0));
					e.setE_dtl_cname(saveFiles.get(0));
					
					e.setE_cname(mrequest.getParameter("titleImg"));
				} else {
					// 타이틀이 변경됐을 때
					new File(savePath+e.getE_cname()).delete();
					e.setE_file(savePath);	
					e.setE_oname(originFiles.get(1));
					e.setE_cname(saveFiles.get(1));
					
					e.setE_dtl_cname(mrequest.getParameter("contentImg1"));		
					
				}
			} else if (originFiles.size() > 1) {
				
				new File(savePath+e.getE_cname()).delete();
				e.setE_file(savePath);	
				e.setE_oname(originFiles.get(1));
				e.setE_cname(saveFiles.get(1));
				
				new File(savePath+e.getE_dtl_cname()).delete();
				e.setE_file(savePath);	
				e.setE_dtl_oname(originFiles.get(0));
				e.setE_dtl_cname(saveFiles.get(0));
				
			}*/
			
			e.setE_file(savePath);	
			e.setE_oname(originFiles.get(1));
			e.setE_cname(saveFiles.get(1));
			e.setE_dtl_oname(originFiles.get(0));
			e.setE_dtl_cname(saveFiles.get(0));
			
			e.setEvtdate(strDay);
			e.setEvtdateend(endDay);


			System.out.println("e :" + e);
			
			int result = es.updateEvent(e);
			
			if(result > 0) {
				
				response.sendRedirect("selectOne.ev?eno="+eno);
				System.out.println("이벤트 수정 성공!");
				
			} else {
				System.out.println("이벤트 수정  실패!");
				request.getRequestDispatcher("views/seul/eventList.jsp")
				.forward(request, response);	
			}
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
