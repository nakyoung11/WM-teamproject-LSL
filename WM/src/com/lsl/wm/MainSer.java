package com.lsl.wm;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.db.UserDAO;
import com.lsl.wm.vo.ShowVO;


@WebServlet("/main")
public class MainSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String str = String.format("%03d", UserDAO.selUserCnt()) ;
		
		ShowVO param = new ShowVO();
		param.setRow(0);
		param.setSearchText("%%");
		List<ShowVO> list = ShowDAO.selShowList(param);
		request.setAttribute("list", list);
		
		String savePath = "/resource/show/images/posters/";
		
		request.setAttribute("userCnt", str);
		request.setAttribute("posterPath", savePath);
		String jsp = "/WEB-INF/view/main.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
