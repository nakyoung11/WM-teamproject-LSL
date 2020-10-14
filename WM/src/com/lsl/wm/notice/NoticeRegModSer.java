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

@WebServlet("/notice/regmod")
public class NoticeRegModSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strI_notice = request.getParameter("i_notice");
		
		if(strI_notice != null) { // i_notice값이 null이 아니면 수정, 제목이랑 내용을 그대로 사용
			int i_notice = Integer.parseInt(strI_notice);
			NoticeVO param = new NoticeVO();
			param.setI_notice(i_notice);
			
			param = NoticeDAO.selNotice(param);
			request.setAttribute("list", param);
		}
		
		request.getRequestDispatcher("/WEB-INF/notice/regmod.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		if(loginUser == null) {
			response.sendRedirect("/login");
			return;
		}
		String strI_notice = request.getParameter("i_notice");
		String title = request.getParameter("title");
		String ctnt = request.getParameter("ctnt");
		
		NoticeVO param = new NoticeVO();
		param.setTitle(title);
		param.setCtnt(ctnt);
		param.setI_user(loginUser.getI_user());
		
		if(strI_notice == "") { // i_notice값을 가져오지 못하면 등록
			NoticeDAO.insNotice(param);
		} else {
			int i_notice = Integer.parseInt(strI_notice);
			param.setI_notice(i_notice);
			NoticeDAO.updNotice(param); // i_notice값이 있으면 수정
		}
		request.setAttribute("list", param);
			
		response.sendRedirect("/notice");
	}

}
