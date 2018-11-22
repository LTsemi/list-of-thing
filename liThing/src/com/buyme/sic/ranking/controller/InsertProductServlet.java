package com.buyme.sic.ranking.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.buyme.common.MyRenamePolicy;
import com.buyme.sic.ranking.model.service.ProductService;
import com.buyme.sic.ranking.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertProductServlet
 */
@WebServlet("/pInsert.pn")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService ps = new ProductService();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getServletContext().getRealPath("/resources");
			
			String savePath = root + "/productImg/";
			
		
			MultipartRequest mrequest =
					new MultipartRequest(request, 
										 savePath,
										 maxSize,
										 "UTF-8",
										 new MyRenamePolicy());
			
			Product p = new Product();
			
			p.setPnn(mrequest.getParameter("pnn"));
			p.setKno(mrequest.getParameter("kno"));
			p.setPname(mrequest.getParameter("pname"));
			p.setPprice(Integer.parseInt(mrequest.getParameter("pprice")));
			p.setPindg(String.join(", ",mrequest.getParameterValues("pindg")));
			p.setBrand(mrequest.getParameter("brand"));
			p.setPcap(mrequest.getParameter("pcap"));
			p.setCount(Integer.parseInt(mrequest.getParameter("pcount")));
			p.setPexp(mrequest.getParameter("pexp"));
			

			String saveFile;
			String originFile;
			
			Enumeration file = mrequest.getFileNames();
			
			String name = (String) file.nextElement();
			
			System.out.println(name);
			
			saveFile = mrequest.getFilesystemName(name);
			originFile = mrequest.getOriginalFileName(name);
			
			p.setPimg(savePath);
			p.setOname(originFile);
			p.setCname(saveFile);
			
			System.out.println(p);
			
			int result = ps.insertProduct(p);
			
			String page = "";
			
			if(result > 0) {
				System.out.println("제품등록완료");
				
				response.sendRedirect("views/sic/ManagerPage.jsp");
				
				// page = "/views/sic/ManagerPage.jsp"
				
			}else {
				System.out.println("실패하였습니다..");
				File file1 = new File(savePath+saveFile);
				System.out.println("파일삭제 : " + file1.delete());
		        PrintWriter out = response.getWriter();
		          
		        out.println("<script> alert('제품등록에 실패하였습니다.'); location.href='views/sic/ManagerPage.jsp';</script>");
		          
		        out.flush();
		        out.close();
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













