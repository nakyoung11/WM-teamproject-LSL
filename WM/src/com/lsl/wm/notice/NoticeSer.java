package com.lsl.wm.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.MyUtils;
import com.lsl.wm.db.NoticeDAO;
import com.lsl.wm.vo.NoticeVO;
import com.lsl.wm.vo.UserVO;

@WebServlet("/notice")
public class NoticeSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		if(loginUser == null) {
			response.sendRedirect("/login");
			return;
		}
		
		NoticeVO param = new NoticeVO();
		
		List<NoticeVO> list = NoticeDAO.selNoticeList(param);
		
		request.setAttribute("list", list);
		request.setAttribute("i_user", loginUser.getI_user());
		
		request.getRequestDispatcher("/WEB-INF/notice/notice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
