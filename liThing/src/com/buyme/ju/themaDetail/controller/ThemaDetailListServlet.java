package com.buyme.ju.themaDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.ju.thema.model.service.ThemaService;
import com.buyme.ju.thema.model.vo.Thema;
import com.buyme.ju.themaDetail.model.service.ThemaDetailService;
import com.buyme.ju.themaDetail.model.vo.ThemaProduct;
import com.buyme.sic.ranking.model.service.ProductService;
import com.buyme.sic.ranking.model.vo.Product;


/**
 * Servlet implementation class ThemaDetailListServlet
 */
@WebServlet("/selectList.td")
public class ThemaDetailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaDetailListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		ArrayList<ThemaProduct> list = new ArrayList<ThemaProduct>();
		
		ThemaDetailService tds = new ThemaDetailService();
		ThemaService ts = new ThemaService();
		
		Thema t = ts.selectOne(tno);
				
		list = tds.selectList(tno);
				
		String page = "";

		if(list != null){
					
			page = "views/ju/LTpick_view.jsp";
			request.setAttribute("list", list);
			request.setAttribute("t", t);
			
		} else {
					
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('해당 테마에 상품이 없습니다.'); location.href='selectList.td?tno="+tno+"\'</script>");
			
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
