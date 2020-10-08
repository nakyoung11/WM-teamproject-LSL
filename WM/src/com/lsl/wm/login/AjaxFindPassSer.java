package com.lsl.wm.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.SecurityUtils;
import com.lsl.wm.db.UserDAO;
import com.lsl.wm.vo.UserVO;

@WebServlet("/ajaxfindpass")
public class AjaxFindPassSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_email = request.getParameter("user_email");
		String user_year = request.getParameter("user_year");
		String user_month = request.getParameter("user_month");
		String user_date = request.getParameter("user_date");
		UserVO param = new UserVO();
		param.setUser_email(user_email);
		param.setUser_year(user_year);
		param.setUser_month(user_month);
		param.setUser_date(user_date);
		
		System.out.println(user_email);
		System.out.println(user_year);
		System.out.println(user_month);
		System.out.println(user_date);
		
		int result = UserDAO.findPass(param); // return값이 3이면 해당 닉네임 존재, 2면 사용가능
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		out.print(result); // data 값에 result 대입
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_email = request.getParameter("user_email");
		String pw = request.getParameter("user_pw");
		String encrypt_pw = SecurityUtils.encryptString(pw);
		
		UserVO param = new UserVO();
		param.setUser_pw(encrypt_pw);
		param.setUser_email(user_email);
		
		UserDAO.changePw(param);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		
		out.println("<script language='javascript'>");
		out.println("alert('비밀번호가 변경되었습니다.'); window.close()"); // 서블릿에서 script 태그 사용
		out.println("</script>");
		out.flush();
	}

}
