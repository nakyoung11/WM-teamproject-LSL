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
		
		
		String str = String.format("%03d", UserDAO.selUserCnt()) ; // 숫자 3자리로 3자리가 안되면 0을 채워줌
		
		ShowVO param = new ShowVO();
	
		param.setSearchText("%%"); // 쿼리문 like 뒤에 들어감
		List<ShowVO> list = ShowDAO.selAllShowList(param); // 모든 전시회를 select
		
		// 좋아요 및 댓글 개수 가져오기
		for (int i = 0; i < list.size(); i++) {
			ShowVO vo = new ShowVO();
			vo.setI_show(list.get(i).getI_show());
			vo = ShowDAO.selShowlikeCnt(vo); // 전시회의 좋아요 개수 가져오기
			list.get(i).setLikeCnt(vo.getLikeCnt()); // 좋아요 개수 저장
			vo.setI_show(list.get(i).getI_show());
			vo = ShowDAO.selShowCmtCnt(vo);  // 전시회의 댓글 개수 가져오기
			list.get(i).setCmtCnt(vo.getCmtCnt()); // 댓글 개수 저장
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
		
		// 좋아요 높은 순 10개
		List<ShowVO> topTenList;
		if(list.size() < 10) {
			topTenList = list.subList(0, list.size()); // 전시회가 10개보다 작으면 담겨있는 갯수만큼 담아줌
		}else {
			topTenList = list.subList(0, 10); // 10개보다 많으면 10개만 담아줌
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
