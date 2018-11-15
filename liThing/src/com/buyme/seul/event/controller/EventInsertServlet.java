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
 * Servlet implementation class eventInsertServlet
 */
@WebServlet("/eInsert.ev")
public class EventInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EventService es = new EventService();
		
		if(ServletFileUpload.isMultipartContent(request)){
			// 만약 multipart/form-data 로 전송이 되었다면 실행해라!
			
			// 전송할 파일의 용량 선정
			int maxSize = 1024 * 1024 * 10;
			
			// 저장할 경로 설정하기
			String root = request.getServletContext().getRealPath("/resources");
			
			System.out.println("root 경로 확인 : " + root);
			
			String savePath = root + "/eventUploadFiles/";
			
			MultipartRequest mrequest =
					new MultipartRequest(request, 
										 savePath,
										 maxSize,
										 "UTF-8",
										 new MyRenamePolicy());
			
			
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
			
			// 다중 파일 업로드 시 처리하는 방법
			// 다중 파일을 업로드 할 경우 컬렉션을 사용하여
			// 파일을 별도로 관리한다.
			Event e = new Event();
			e.setEvttitle(mrequest.getParameter("title"));
			e.setUserid(mrequest.getParameter("userId"));
			
				e.setE_file(savePath);		
				e.setE_oname(originFiles.get(1));
				e.setE_cname(saveFiles.get(1));
				e.setE_dtl_oname(originFiles.get(0));
				e.setE_dtl_cname(saveFiles.get(0));				
			
			e.setEvtdate(strDay);
			e.setEvtdateend(endDay);
			System.out.println("e :" + e);
			int result = es.insertEvent(e);
			
	
			if(result > 0) {
				System.out.println("성공하였습니다!");
				response.sendRedirect("selectList.ev");
				
			} else {
				/*request.setAttribute("msg", "파일 전송 실패!");*/
				System.out.println("파일 전송 실패!");
				File file1 = new File(savePath+saveFiles);
				System.out.println("파일삭제 : " + file1.delete());
				
				/*request.getRequestDispatcher("index.jsp")
				.forward(request, response);*/
			}
		}
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
