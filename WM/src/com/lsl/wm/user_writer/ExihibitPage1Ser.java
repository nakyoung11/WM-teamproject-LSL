package com.lsl.wm.user_writer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.MyUtils;
import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.db.ShowListDAO;
import com.lsl.wm.db.WorkDAO;
import com.lsl.wm.vo.ShowListDomain;
import com.lsl.wm.vo.ShowListVO;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;
import com.lsl.wm.vo.WorkVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/exhibit_page1")
public class ExihibitPage1Ser extends HttpServlet {
	// 이 출품 페이지는 최초 등록과 이후 수정 페이지의 역할을 동시에 한다.

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 유저 정보를 받아 온다.
		UserVO loginUser = MyUtils.getLoginUser(request);
		// 이전 페이지에서 받아온 i_show(전시회_인덱스)값으로 DB를 조회한다.
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		ShowVO param = new ShowVO();

		param.setI_show(i_show);

		param = ShowDAO.selShow(param);

		// 전시회의 작품 개수를 받아온다.(없으면 0 즉 최초 등록에는 0이 넘어온다.)
		ShowListDomain param2 = new ShowListDomain();
		param2.setI_show(i_show);
		param2 = ShowListDAO.selShowListCnt(param2);

		// 포스터 출력을 위한 경로(실제로 jsp에서는 포스터를 출력하지는 않는다. 추후 수정을 위해 남겨놈)
		String savePath = "/resource/show/images/posters/" + loginUser.getI_user() + "/";

		System.out.println("i_show: " + param.getI_show());
		System.out.println("title: " + param.getShow_title());

		String jsp;

		// 전시회 정보를 세팅해준다.
		request.setAttribute("data", param);
		// 포스터 이미지 경로
		request.setAttribute("imagePath", savePath);
		// 만약 작품 개수가 25개 이상이라면(더 추가 할수 없게 관리페이지로 돌려 보낸다.)
		if (param2.getShowListCnt() >= 25) {
			jsp = "/WEB-INF/user_writer/exhibit_page2.jsp";
			request.getRequestDispatcher(jsp).forward(request, response);
			return;
		}

		// 작품 개수를 세팅해준다.
		request.setAttribute("workCnt", param2.getShowListCnt());

		jsp = "/WEB-INF/user_writer/exhibit_page1.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 랜덤한 키값을 부여 할 변수
		String randomKey = null;
		List<String> keyList = new ArrayList();
		// 렌덤한 이름을 저장할 변수
		UserVO loginUser = MyUtils.getLoginUser(request);
		// 이미지가 저장될 경로를 지정
		String savePath = getServletContext().getRealPath("resource") + "/user_writer/images/exhibition/"
				+ loginUser.getI_user() + "/";

		// 폴더를 생성해 주는 부분
		File directory = new File(savePath);
		if (!directory.exists()) {
			directory.mkdirs();
		}

		int maxFileSize = 10_485_760; // 1024 * 1024 * 10 (10mb) // ִ ũ
		String fileNm = "";
		String saveFileNm = null;

		// 여러 파일을 받아오는 multi-part form을 지정해 줬으면 MultipartRequest객체로 폼안의 내용을
		// 받아와야한다.(request는 동작이 안된다.)
		MultipartRequest mr = new MultipartRequest(request, savePath, maxFileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// jsp페이지로 부터 몇개의 작품이 추가 됬는지를 받아옴
		int list_cnt = Integer.parseInt(mr.getParameter("list_cnt"));
		// 어느 전시회인지 정보를 받아옴
		int i_show = Integer.parseInt(mr.getParameter("i_show"));
		List<String> workTitleList = new ArrayList();

		// DB에 INSERT를 수행하는 부분
		for (int i = 0; i < list_cnt; i++) {
			// 랜덤한 이름을 부여한다.(이름이 겹쳐지지 않게)
			randomKey = String.valueOf(UUID.randomUUID());

			String work_image = mr.getParameter("work_image_idx_" + i);
			String work_title = mr.getParameter("input_title_" + i);
			String work_ctnt = mr.getParameter("input_comment_" + i);
			// 저장될 이름을 지정
			String saveImageName = i_show + "_" + loginUser.getI_user() + "_" + randomKey + "_" + work_image;
			// 파일명을 하나하나 저장한다.
			workTitleList.add(work_image);

			keyList.add(saveImageName);

			WorkVO param = new WorkVO();
			param.setI_show(i_show);
			param.setI_user(loginUser.getI_user());
			param.setWork_image(saveImageName);
			param.setWork_title(work_title);
			param.setWork_ctnt(work_ctnt);

			WorkDAO.insWork(param);
			param.setI_user(loginUser.getI_user());
			// 전시회 리스트에 추가해 주기 위해 방금 추가한 작품의 정보를 받아온다.
			param = WorkDAO.selLatestWork(param);
			// 전시회 리스트에 추가하는 부분
			ShowListVO vo2 = new ShowListVO();
			vo2.setI_show(i_show);
			vo2.setI_work(param.getI_work());
			System.out.println(param.getI_work());
			// INSERT처리
			ShowListDAO.insShowList(vo2);
		}

		System.out.println("savePath : " + savePath);

		ShowListVO param2 = new ShowListVO();
		param2.setI_show(i_show);
		List<ShowListDomain> list = ShowListDAO.selShowList(param2);

		// 파일을 다운로드하는 부분
		try {
			Enumeration files = mr.getFileNames();

			while (files.hasMoreElements()) {
				String key = (String) files.nextElement();
				fileNm = mr.getFilesystemName(key);
				System.out.println("fileNm : " + fileNm);
				// 실제 넘어온 파일명과 대조 해본다.
				for (int j = 0; j < workTitleList.size(); j++) {
					if (workTitleList.get(j).equals(fileNm)) {
						// 파일명에 일치하는 값을 넣어준다.
						saveFileNm = keyList.get(j);

					}
				}
				System.out.println("saveFileNm : " + saveFileNm);
				File oldFile = new File(savePath + "/" + fileNm);
				File newFile = new File(savePath + "/" + saveFileNm);
				oldFile.renameTo(newFile);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 작업이 완료되면 "exhibit_page2"(나의 전시관리페이지)로 넘어간다.
		response.sendRedirect("/exhibit_page2");

	}

}