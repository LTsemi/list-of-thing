package com.buyme.ju.themaDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.customerService.model.sevice.CSService;
import com.buyme.ju.customerService.model.vo.CustomerService;
import com.buyme.ju.thema.model.service.ThemaService;
import com.buyme.ju.thema.model.vo.Thema;
import com.buyme.ju.themaDetail.model.service.ThemaDetailService;
import com.buyme.ju.themaDetail.model.vo.ThemaProduct;
import com.buyme.sic.ranking.model.service.ProductService;
import com.buyme.sic.ranking.model.vo.Product;

/**
 * Servlet implementation class ThemaDetailInsertViewServlet
 */
@WebServlet("/tdInView.td")
public class ThemaDetailInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaDetailInsertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> plist = new ProductService().selectList();
		ArrayList<Thema> tlist = new ThemaService().selectList();
		
		String page = "";
			
		if (plist != null) {
			
			page = "views/ju/ThemaDetail_Insert.jsp";
			request.setAttribute("plist", plist);
			request.setAttribute("tlist", tlist);
			
		} else {
			
			/*page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상세테마 추가 페이지 보기 실패");*/
			
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('테마 상품 추가 페이지 로드 실패'); location.href='selectList.tm';</script>");
			
			out.flush();
			out.close();
			
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
