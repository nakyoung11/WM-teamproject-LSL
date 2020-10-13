package com.lsl.wm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.vo.ShowArrDomain;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;

@WebServlet("/showlist")
public class ShowListSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
	      
	       if(loginUser == null) {
	            response.sendRedirect("/login"); //
	            return;
	         }
	       
	      String searchText = request.getParameter("searchText");
	      searchText = (searchText == null ? "" : searchText);
	      String strPage = request.getParameter("page");
	      if(strPage == null) {
	         strPage = "0";
	      }
    
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

		param.setI_user(loginUser.getI_user());
		param.setRow(page * 6 - 6);
		param.setSearchText("%" + searchText + "%");
		int pagingCnt = ShowDAO.selPagingCnt(param);
		
		List<ShowVO> list = ShowDAO.selShowList(param);
		
		 if(list.size() == 0) {
	         String jsp1 = "/WEB-INF/user_writer/err_null.jsp";
	         request.getRequestDispatcher(jsp1).forward(request, response);
	         return;
	      }
		
		String savePath = "/resource/show/images/posters/";
		
		System.out.println("sadasdasd: " + list.get(0).getShow_poster());
		
		request.setAttribute("list", list);
		request.setAttribute("posterPath", savePath);
		request.setAttribute("pagingCnt", pagingCnt);
		
		request.getRequestDispatcher("/WEB-INF/view/showList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
