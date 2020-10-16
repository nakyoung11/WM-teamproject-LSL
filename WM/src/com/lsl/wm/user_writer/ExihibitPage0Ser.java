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
import com.lsl.wm.vo.ShowListVO;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;
import com.lsl.wm.vo.WorkVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/exhibit_page0")
public class ExihibitPage0Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 정보를 받아옴
		UserVO loginUser = MyUtils.getLoginUser(request);

		String jsp;

		if (loginUser == null) {
			jsp = "/WEB-INF/login/login.jsp";
		} else {
			jsp = "/WEB-INF/user_writer/exhibit_page0.jsp";
		}

		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		// 작품이미지 파일 다운로드를 위한 경로를 설정
		String savePath = getServletContext().getRealPath("resource") + "/show/images/posters/" + loginUser.getI_user()
				+ "/";

		// 폴더가 없다면 생성
		File directory = new File(savePath);
		if (!directory.exists()) {
			directory.mkdirs();
		}

		int maxFileSize = 10_485_760; // 1024 * 1024 * 10 (10mb) //올릴 수 있는 파일 용량
		String fileNm = "";
		String saveFileNm = null;

		// 여러 파일을 받아오는 form을 지정해 줬다면MultipartRequest 객체로 폼 안의 정보를 받아와야 한다.
		// (request.getParameter 사용이 안된다.)
		MultipartRequest mr = new MultipartRequest(request, savePath, maxFileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 고유 키값을 받음
		String randomKey = String.valueOf(UUID.randomUUID());

		// jsp파일의 자료들을 받아온다.

		String show_image = mr.getParameter("show_image");
		String show_title = mr.getParameter("show_title");
		String show_ctnt = mr.getParameter("show_ctnt");

		// 데이터 베이스에 삽입
		ShowVO param = new ShowVO();
		param.setI_user(loginUser.getI_user());
		param.setShow_poster(randomKey + "_" + show_image);
		param.setShow_title(show_title);
		param.setShow_ctnt(show_ctnt);

		ShowDAO.insShow(param);

		param = ShowDAO.selLatestI_show(param);

		System.out.println("타이틀 : " + param.getShow_title());
		System.out.println("이미지명 : " + param.getShow_poster());

		try {
			Enumeration files = mr.getFileNames();
			//받아온 파일 만큼 다운로드를 한다.
			//(하지만 전시회 열기 페이지의 경우 어차피 포스터를 1개 밖에 안받기 때문에 의미는 없다.
			// 그냥 이전에 만들었던 출품페이지1 에서 뺏겨왔다.)
			while (files.hasMoreElements()) {
				String key = (String) files.nextElement();
				fileNm = mr.getFilesystemName(key);
				String ext = fileNm.substring(fileNm.lastIndexOf("."));
				saveFileNm = randomKey + "_" + show_image;
				System.out.println("key : " + key);
				System.out.println("fileNm : " + fileNm);
				System.out.println("saveFileNm : " + saveFileNm);
				File oldFile = new File(savePath + "/" + fileNm);
				File newFile = new File(savePath + "/" + saveFileNm);
				oldFile.renameTo(newFile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//작업이 완료 되면 exhibit_page1(작품 출품페이지)로 넘어간다.
		response.sendRedirect("/exhibit_page1?i_show=" + param.getI_show());
	}

}