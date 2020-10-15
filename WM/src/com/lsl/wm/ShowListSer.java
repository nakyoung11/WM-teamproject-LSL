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

		String searchText = request.getParameter("searchText");
		searchText = (searchText == null ? "" : searchText); // 처음에는 null이 넘어오므로 다 검색
		String strPage = request.getParameter("page");
		if(strPage == null) { // 처음에는 null이 넘어옴
			strPage = "0";
		}

		int page = Integer.parseInt(strPage);
		
		page = (page == 0 ? 1 : page); // 처음에는 1페이지
		
		request.setAttribute("page", page);
		
		ShowVO param = new ShowVO();

		
		param.setRow(page * 6 - 6); // 페이지 limit 알고리즘
		param.setSearchText("%" + searchText + "%"); // like 뒤에 들어가 텍스트
		int pagingCnt = ShowDAO.selPagingCnt(param);
		
		List<ShowVO> list = ShowDAO.selShowList(param);
		
		 if(list.size() == 0) {
	         String jsp1 = "/WEB-INF/user_writer/err_null.jsp";
	         request.getRequestDispatcher(jsp1).forward(request, response);
	         return;
	      }
		
		//좋아요 및 댓글 개수 가져오기
		for(int i=0; i< list.size(); i++) {
			ShowVO vo = new ShowVO();
			vo.setI_show(list.get(i).getI_show());
			vo = ShowDAO.selShowlikeCnt(vo); // 좋아요 개수
			list.get(i).setLikeCnt(vo.getLikeCnt());
			vo.setI_show(list.get(i).getI_show());
			vo = ShowDAO.selShowCmtCnt(vo); // 댓글 개수
			list.get(i).setCmtCnt(vo.getCmtCnt());
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
