package com.buyme.ju.themaDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.buyme.common.MyRenamePolicy;
import com.buyme.ju.thema.model.service.ThemaService;
import com.buyme.ju.thema.model.vo.Thema;
import com.buyme.ju.themaDetail.model.service.ThemaDetailService;
import com.buyme.ju.themaDetail.model.vo.ThemaProduct;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ThemaDetailInsertServlet
 */
@WebServlet("/tdInsert.td")
public class ThemaDetailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaDetailInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("ttitle"));
		String pno = request.getParameter("pname");
		
		ThemaProduct tp = new ThemaProduct();
		ArrayList<ThemaProduct> tplist = new ThemaDetailService().selectList(tno);
		ArrayList<Thema> tlist = new ThemaService().selectList();
		
		tp.setThema_no(tno);
		tp.setProd_no(pno);
		
		ThemaDetailService tds = new ThemaDetailService();
		
		int result = tds.insertThemaProduct(tno, pno);
		
		if(result > 0){
			
			request.setAttribute("tplist", tplist);
			request.setAttribute("tlist", tlist);
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('추가 되었습니다.'); location.href='selectList.td?tno="+tno+"\'"+"</script>");
			
			out.flush();
			out.close();
			
			/*response.sendRedirect("selectList.td?tno=" + tno);*/
			
		} else {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('테마 상품 추가 실패'); location.href='selectList.td?tno="+tno+"\'"+"</script>");
			
			out.flush();
			out.close();
			
			/*request.setAttribute("msg", "테마 상품 등록 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);*/
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
