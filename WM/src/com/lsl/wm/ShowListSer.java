package com.lsl.wm;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.vo.ShowVO;

@WebServlet("/showlist")
public class ShowListSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchText = request.getParameter("searchText");
		searchText = (searchText == null ? "" : searchText);
		
		ShowVO param = new ShowVO();
		param.setSearchText("%" + searchText + "%");
		
		List<ShowVO> list = ShowDAO.selShowList(param);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/view/showList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
