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
		
		if(strI_notice != null) { // i_notice의 값이 있으면 수정
			int i_notice = Integer.parseInt(strI_notice);
			NoticeVO param = new NoticeVO();
			param.setI_notice(i_notice);
			
			param = NoticeDAO.selNotice(param);
			request.setAttribute("list", param); // 수정 시 제목과 내용을 출력해줌
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
		
		if(strI_notice == "") { // i_notice가 없다면 등록
			NoticeDAO.insNotice(param);
		} else { // 수정
			int i_notice = Integer.parseInt(strI_notice);
			param.setI_notice(i_notice);
			NoticeDAO.updNotice(param);
		}
		request.setAttribute("list", param);
			
		response.sendRedirect("/notice");
	}

}
