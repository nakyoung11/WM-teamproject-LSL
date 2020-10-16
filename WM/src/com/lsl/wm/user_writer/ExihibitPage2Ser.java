package com.lsl.wm.user_writer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.MyUtils;
import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.db.ShowListDAO;
import com.lsl.wm.db.WorkDAO;
import com.lsl.wm.vo.ShowArrDomain;
import com.lsl.wm.vo.ShowListDomain;
import com.lsl.wm.vo.ShowListVO;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;
import com.lsl.wm.vo.WorkDomain;
import com.lsl.wm.vo.WorkVO;

@WebServlet("/exhibit_page2")
public class ExihibitPage2Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String jsp = "/WEB-INF/user_writer/exhibit_page2.jsp";
		//로그인 정보를 받아온다.
		UserVO loginUser = MyUtils.getLoginUser(request);
		//로그인이 되어 있지않다면 로그인 페이지로 돌려 보낸다.
		if (loginUser == null) {
			response.sendRedirect("/login"); 
			return;
		}

		//사용자가 연 전시회 정보를 받아오는 작업
		ShowVO param = new ShowVO();
		param.setI_user(loginUser.getI_user());
		//ShowDAO.selI_showList()메소드는 i_user가 가지고 있는 모든 출품전 정보를 받아온다.
		List<ShowVO> showParam = ShowDAO.selI_showList(param);
		//각 전시회안의 여러 작품 정보를 받을 객체
		List<ShowArrDomain> list = new ArrayList();
		//전시회가 하나도 없다면 에러페이지로 이동
		if (showParam.size() == 0) {
			String jsp1 = "/WEB-INF/user_writer/err_null.jsp";
			request.getRequestDispatcher(jsp1).forward(request, response);
			return;
		}
		//사용자가 가진 전시회 list로 ShowArrDomain객체 리스트에 각각 값을 넣어준다.
		for (int i = 0; i < showParam.size(); i++) {
			ShowArrDomain domain = new ShowArrDomain();
			//기존의 showPram리스트에서 전시회 인덱스, 전시회 이름, 내용을 받아옴
			domain.setI_show(showParam.get(i).getI_show());
			domain.setShow_title(showParam.get(i).getShow_title());
			domain.setShow_ctnt(showParam.get(i).getShow_ctnt());
			ShowListVO vo = new ShowListVO();
			vo.setI_show(showParam.get(i).getI_show());
			//ShowArrDomain객체 안의 showDomainList라는 list객체가 또 있다(하나의 전시회에 여러 작품이 있기 때문.)
			domain.setShowDomainList(ShowListDAO.selShowList(vo));

			// 작품 개수를 가져온다.
			ShowListDomain domain2 = new ShowListDomain();
			domain2.setI_show(showParam.get(i).getI_show());
			domain2 = ShowListDAO.selShowListCnt(domain2);
			domain.setWorkCnt(domain2.getShowListCnt());

			list.add(domain);
		}
		//확인용 콘솔 출력
		for (int i = 0; i < list.size(); i++) {
			System.out.println("i_show: " + list.get(i).getShow_title());
			for (int j = 0; j < list.get(i).getShowDomainList().size(); j++) {
				System.out.println("작품 제목: " + list.get(i).getShowDomainList().get(j).getWork_title());
			}
			System.out.println();
			System.out.println();
		}

		// 작품의 좋아요 , 댓글 가져오기
		for (int i = 0; i < list.size(); i++) {
			System.out.println("i_show: " + list.get(i).getShow_title());
			for (int j = 0; j < list.get(i).getShowDomainList().size(); j++) {

				// 좋아요 개수
				WorkDomain domain = new WorkDomain();
				domain.setI_work(list.get(i).getShowDomainList().get(j).getI_work());
				domain = WorkDAO.selWorklikeCnt(domain);
				list.get(i).getShowDomainList().get(j).setLike_cnt(domain.getLikeCnt());
				// 댓글 개수
				domain.setI_work(list.get(i).getShowDomainList().get(j).getI_work());
				domain = WorkDAO.selWorkCmtCnt(domain);
				list.get(i).getShowDomainList().get(j).setCmt_cnt(domain.getCmtCnt());

				System.out.println("작품 제목: " + list.get(i).getShowDomainList().get(j).getWork_title());
				System.out.println("좋아요: " + list.get(i).getShowDomainList().get(j).getLike_cnt() + "댓글: "
						+ list.get(i).getShowDomainList().get(j).getCmt_cnt());

			}
			System.out.println();
			System.out.println();
		}

		request.setAttribute("showList", list);

		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);

		int i_user = loginUser.getI_user();
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		// 글을 삭제하는 post 요청 이라면
		if (request.getParameter("i_work") != null) {
			//jsp로 부터 어느 작품을 삭제 할건지 받아온다.
			int i_work = Integer.parseInt(request.getParameter("i_work"));

			System.out.println("i_work값: " + i_work);
			WorkVO param = new WorkVO();

			param.setI_show(i_show);
			param.setI_work(i_work);
			param.setI_user(i_user);

			param = WorkDAO.selWork(param);

			System.out.println("이미지명: " + param.getWork_image());
			//삭제할 파일의 경로를 설정
			String savePath = getServletContext().getRealPath("resource") + "/user_writer/images/exhibition/"
					+ loginUser.getI_user() + "/";
			System.out.println("삭제하는 파일 : " + savePath + param.getWork_image());

			File f = new File(savePath + "/" + param.getWork_image());
			if (f.exists()) {
				System.gc();
				f.delete();
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
			//작품 삭제
			WorkDAO.delWork(param);
			/* 수정사항을 다시  출력해주기 위해 작품정보를 받아옴 */
			ShowListDomain vo = new ShowListDomain();
			vo.setI_work(i_work);

			ShowListDAO.delShowList(vo);


			response.sendRedirect("/exhibit_page2?i_user=" + i_user + "&i_show=" + i_show);
			return;
		} else { //ajax통신으로 날아오는 값은 작품삭제, 전시회 삭제 밖에 없다.(i_work값이 넘어온게 아니라면 전시회 삭제이다.)
			// 전시회 값을 저장
			ShowVO param = new ShowVO();
			param.setI_show(i_show);
			param = ShowDAO.selShow(param);
			// 전시회 포스터를 삭제
			String posterSavePath = getServletContext().getRealPath("resource") + "/show/images/posters/"
					+ loginUser.getI_user() + "/";

			// 포스터 파일 삭제 부문.
			File f2 = new File(posterSavePath + "/" + param.getShow_poster());
			if (f2.exists()) {
				f2.delete();
				System.out.println("삭제에 성공했습니다.");
			} else {
				System.out.println("삭제에 실패했습니다.");
			}

			// 사진을 삭제 하기 위한 처리
			// 전시회에 포함되는 작품정보를 자겨온다.
			ShowListVO param2 = new ShowListVO();
			param2.setI_show(i_show);
			List<ShowListDomain> list = ShowListDAO.selShowList(param2);

			String savePath = getServletContext().getRealPath("resource") + "/user_writer/images/exhibition/"
					+ loginUser.getI_user() + "/";
			System.out.println("path : " + savePath);
			// 작품 파일 삭제 부문.
			for (int i = 0; i < list.size(); i++) {
				File f = new File(savePath + list.get(i).getWork_image());
				if (f.exists()) {
					f.delete();
					System.out.println("삭제에 성공했습니다.");
				} else {
					System.out.println("삭제에 실패했습니다.");
				}
			}

			// 전시회 삭제.
			param.setI_show(i_show);
			ShowDAO.delShow(param);

			response.sendRedirect("/exhibit_page2?i_user=" + i_user);
			return;
		}

	}

}