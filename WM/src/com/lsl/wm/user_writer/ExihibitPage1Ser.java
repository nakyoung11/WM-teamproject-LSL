package com.lsl.wm.user_writer;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.vo.ShowVO;

@WebServlet("/exhibit_page1")
public class ExihibitPage1Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ShowVO> list = new ArrayList();
		for(int i=0; i<3; i++) {
			ShowVO vo = new ShowVO();
			vo.setTitle("����" + i);
			vo.setComment("����-" + i);
			vo.setPainting("test_img" + (i+1) + ".jpeg");
			list.add(vo);
		}
		
		request.setAttribute("workList", list);
		
		String jsp = "/WEB-INF/user_writer/exhibit_page1.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
