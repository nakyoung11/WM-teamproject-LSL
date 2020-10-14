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
import com.lsl.wm.db.ShowListDAO;
import com.lsl.wm.db.UserDAO;
import com.lsl.wm.vo.ShowListDomain;
import com.lsl.wm.vo.ShowListVO;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;

/**
 * Servlet implementation class ShowDetailSer
 */
@WebServlet("/showDetail")
public class ShowDetailSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//i_show 값을 가져온다.
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		
		System.out.println(i_show);
		
		String jsp = "/WEB-INF/view/showDetail.jsp";
		
		//DB에서 전시회 정보를 받아옴.
		ShowVO param = new ShowVO();
		param.setI_show(i_show);
		
		param = ShowDAO.selShow(param);
		
		//DB에서 유저 정보를 가져온다.(글쓴이 정보)
		UserVO param2 = new UserVO();
		
		param2 = UserDAO.selUser(param.getI_user());
		
		//전시회에 포함된 작품정보를 받아온다.
		List<ShowListDomain> list = new ArrayList();
		ShowListVO param3 = new ShowListVO();
		param3.setI_show(i_show);
		list = ShowListDAO.selShowList(param3);
		
		//전시회 이미지 저장 경로
		String showImagePath = "/resource/show/images/posters/" + param.getI_user() + "/";
		//유저 프로필 이미지 저장경로
		String userImagePath;
		if(param2.getProfile_img() != null) {
			userImagePath = "/img/user/" + param.getI_user() + "/";
		}else {
			userImagePath = "/resource/profile/";
			param2.setProfile_img("default_profile.jpg");
		}
		
		
		//전시회 정보를 세팅.
		request.setAttribute("showData", param);
		//포스터 이미지 경로 
		request.setAttribute("posterPath", showImagePath);
		//유저정보 세팅.
		request.setAttribute("userData", param2);
		//프로필 이미지 경로 
		request.setAttribute("profilePath", userImagePath);
		//작품정보를 세팅.
		request.setAttribute("workList", list);
		
		request.getRequestDispatcher(jsp).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
