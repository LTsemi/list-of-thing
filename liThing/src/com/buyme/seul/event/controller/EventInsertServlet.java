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
			
			// 사용자가 저장하는 파일을 서버의 형식에 맞게
			// 이름을 변경하여 설정하기
			// ex) kakaoTalk_20181029_00000.jpg
			
			// DefaultFileRenamePolicy 의 경우 같은 파일이 이미 존재하는 지 검사한 후에
			// 만약 존재한다면 파일명 뒤에 숫자를 붙여서 이름을 변경한다.
			// abc.zip --> abc1.zip ---> abc2.zip
			
			// 직접 파일 이름을 변경하여 사용함으로써 관리의 효율성을 증대 시킨다.
			
			MultipartRequest mrequest =
					new MultipartRequest(request, 
										 savePath,
										 maxSize,
										 "UTF-8",
										 new MyRenamePolicy());
			
			
			// 날짜관리
			String dateEnd = mrequest.getParameter("dateEnd");
			
			System.out.println("종료날짜 : "+dateEnd);
			
			Date endDay = null;
			
			if(dateEnd != ""){
				// 날짜가 들어 왔다면
				
				// 2018-10-23 --> 2018, 10, 23
				String[] dateEndArr = dateEnd.split("-");
				
				int[] drr = new int[dateEndArr.length];
				
				// String --> int

				for(int i = 0; i < dateEndArr.length;i++){
					drr[i] = Integer.parseInt(dateEndArr[i]);
				}
							
				endDay = new Date(
						new GregorianCalendar(drr[0], drr[1] -1, drr[2]).getTimeInMillis());
				
				
			} else {
				// 날짜가 들어 오지 않았다면
				endDay = new Date(new GregorianCalendar().getTimeInMillis());
				
			}
			
			
			// 다중 파일 업로드 시 처리하는 방법
			// 다중 파일을 업로드 할 경우 컬렉션을 사용하여
			// 파일을 별도로 관리한다.
			Event e = new Event();
//			e.setEventallno(Integer.parseInt(mrequest.getParameter("eventallno")));
//			e.setEno(Integer.parseInt(mrequest.getParameter("eno")));			
			e.setEvttitle(mrequest.getParameter("title"));
			e.setEvtcontent(mrequest.getParameter("content"));
			e.setUserid(mrequest.getParameter("userId"));
			e.setE_file(mrequest.getParameter("file"));
			e.setEvtdateend(endDay);
			
			System.out.println("userid 서블릿 : " + e.getUserid());
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
			
			// event에 기록하기 위한 파일 리스트 처리하기
			ArrayList<Event> list = new ArrayList<Event>();
						
			for(int i = originFiles.size() -1 ; i >= 0 ; i--){
				// 기존에 역순으로 저장된 파일 리스트를 올바른 순서로 재정렬하기
				Event ev = new Event();
				ev.setE_file(savePath);
				ev.setE_oname(originFiles.get(i));
				ev.setE_cname(saveFiles.get(i));
				

				list.add(ev);
			}
			for(int i = 0; i<list.size(); i++){
				System.out.println("list : "+ list.get(i));
				
			}
			
			System.out.println(e);
			int result = es.insertEvent(e, list);
			
	
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
