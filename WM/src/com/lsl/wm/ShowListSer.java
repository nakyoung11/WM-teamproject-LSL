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
		String strPage = request.getParameter("page");
		if(strPage == null) {
			strPage = "0";
		}
		int page = Integer.parseInt(strPage);
		
		page = (page == 0 ? 1 : page);
		
		request.setAttribute("page", page);
		
		ShowVO param = new ShowVO();
		param.setRow(page * 6 - 6);
		param.setSearchText("%" + searchText + "%");
		int pagingCnt = ShowDAO.selPagingCnt(param);
		
		List<ShowVO> list = ShowDAO.selShowList(param);
		
		request.setAttribute("list", list);
		request.setAttribute("pagingCnt", pagingCnt);
		
		request.getRequestDispatcher("/WEB-INF/view/showList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
