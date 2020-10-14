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
	
		param.setSearchText("%%");
		List<ShowVO> list = ShowDAO.selAllShowList(param);
		
		// 좋아요 및 댓글 개수 가져오기
		for (int i = 0; i < list.size(); i++) {
			ShowVO vo = new ShowVO();
			vo.setI_show(list.get(i).getI_show());
			vo = ShowDAO.selShowlikeCnt(vo);
			list.get(i).setLikeCnt(vo.getLikeCnt());
			vo.setI_show(list.get(i).getI_show());
			vo = ShowDAO.selShowCmtCnt(vo);
			list.get(i).setCmtCnt(vo.getCmtCnt());
		}
		// 좋아요가 높은 순대로 정렬
		ShowVO temp = new ShowVO();
		for (int i = 0; i < (list.size() - 1); i++) {
			for (int j = 0; j < (list.size() - 1) - i; j++) {
				if (list.get(j).getLikeCnt() < list.get(j + 1).getLikeCnt()) {
					temp = list.get(j);
					list.set(j, list.get(j + 1));
					list.set(j + 1, temp);

				}
			}
		}
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("전시회 명:" + list.get(i).getShow_title()
					+ "좋아요 개수:" + list.get(i).getLikeCnt());
		}
		List<ShowVO> topTenList;
		if(list.size() < 10) {
			topTenList = list.subList(0, list.size());
		}else {
			topTenList = list.subList(0, 10);
		}
		
	
		
		
		
		request.setAttribute("list", topTenList);
		
		String savePath = "/resource/show/images/posters/";
		
		request.setAttribute("userCnt", str);
		request.setAttribute("posterPath", savePath);
		String jsp = "/WEB-INF/view/main.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
