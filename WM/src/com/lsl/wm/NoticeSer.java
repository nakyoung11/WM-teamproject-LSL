package com.lsl.wm;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.db.NoticeDAO;
import com.lsl.wm.vo.NoticeVO;

@WebServlet("/notice")
public class NoticeSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeVO param = new NoticeVO();
		
		List<NoticeVO> list = NoticeDAO.selBoardList(param);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/view/notice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
