package com.lsl.wm.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.MyUtils;
import com.lsl.wm.db.NoticeDAO;
import com.lsl.wm.vo.NoticeVO;
import com.lsl.wm.vo.UserVO;

@WebServlet("/notice/detail")
public class NoticeDetailSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		
		String strI_notice = request.getParameter("i_notice");
		int i_notice = Integer.parseInt(strI_notice);
		
		NoticeVO param = new NoticeVO();
		param.setI_notice(i_notice);
		
		request.setAttribute("list", NoticeDAO.selNotice(param));
		request.setAttribute("i_user", loginUser.getI_user());
		request.getRequestDispatcher("/WEB-INF/notice/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
