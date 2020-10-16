package com.lsl.wm.user_writer;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.MyUtils;
import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.db.WorkDAO;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;
import com.lsl.wm.vo.WorkVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/exhibitRegPage")
public class ExhibitRegPageSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인유저 정보를 받아옴.
		UserVO loginUser = MyUtils.getLoginUser(request);
		// 어느 전시회, 어느 작품인지 판별하기 위해 이전 페이지에서 전시회 인덱스와 작품 인덱스를 받아온다.
		// (전시회 인덱스 정보는 관리페이지로 다시 넘어가기 위해 받는다.)
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		int i_work = Integer.parseInt(request.getParameter("i_work"));
		WorkVO vo = new WorkVO();
		vo.setI_work(i_work);
		// 작품 정보를 받아온다.(jsp에 수정할 작품 정보를 출력해주기 위해)
		WorkVO workParam = WorkDAO.selWork(vo);

		String savePath = "/resource/show/images/posters/" + i_show + "/";
		String workImagePath = "/resource/user_writer/images/exhibition/" + loginUser.getI_user() + "/";

		// 전시회 정보를 세팅한다.(전시회 관리 페이지로 돌아가기 위함)
		request.setAttribute("data", i_show);
		// 포스터이미지를 출력해주기 위한 경로를 세팅한다.(추후 추가사항을 위해 남겨놈 실제 jsp내에서는 포스터 이미지를 출력 하지는 않는다.)
		request.setAttribute("imagePath", savePath);
		// 작품정보를 세팅해 준다.
		request.setAttribute("workData", workParam);
		// 작품이미지를 출력해주기 위한 경로를 세팅한다.
		request.setAttribute("workPath", workImagePath);

		String jsp = "/WEB-INF/user_writer/exhibitRegPage.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		// 삭제를 위해 작품의 실제 경로를 가져온다.
		String savePath = getServletContext().getRealPath("resource") + "/user_writer/images/exhibition/"
				+ loginUser.getI_user() + "/";

		// 폴더 생성 부분
		// (폴더가 없다면 생성 하는 부분이지만 실제로는 그럴일이 거의 없다 이미 앞에서 올린 이미지를 수정하는 것이기 때문.)
		File directory = new File(savePath);
		if (!directory.exists()) {
			directory.mkdirs();
		}

		int maxFileSize = 10_485_760; // 1024 * 1024 * 10 (10mb) //�ִ� ���� ������ ũ��
		String fileNm = "";
		String saveFileNm = null;

		// 여러 파일을 올리는 multi-part방식은 일반 request가 아니라 이런식으로 MultipartRequest 객체로 받아야 한다.
		MultipartRequest mr = new MultipartRequest(request, savePath, maxFileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 전시회 정보를 받아옴 (전시회 관리 페이지로 다시 이동하기 위함)
		int i_show = Integer.parseInt(mr.getParameter("i_show"));
		// 작품 정보를 받아옴 수정을 위해
		int i_work = Integer.parseInt(mr.getParameter("i_work"));

		WorkVO param = new WorkVO();
		String saveImageName = "";
		// 만약 수정 사항 중에 이미지가 넘어왔다면(기존 작품에서 이미지 변경이 있었다면)
		if (!(mr.getParameter("work_image").equals(""))) {
			String work_image = mr.getParameter("work_image");

			/* 이미지 삭제 처리 부분 */
			param.setI_work(i_work);
			param = WorkDAO.selWork(param);

			// 기존에 파일을 삭제 한다.
			File f = new File(savePath + "/" + param.getWork_image());
			if (f.exists()) {

				f.delete();
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
			// 새로운 파일을 받아오는 부분
			String randomKey = String.valueOf(UUID.randomUUID());
			try {
				Enumeration files = mr.getFileNames();

				saveImageName = i_show + "_" + loginUser.getI_user() + "_" + randomKey + "_" + work_image;

				while (files.hasMoreElements()) {
					String key = (String) files.nextElement();
					fileNm = mr.getFilesystemName(key);
					String ext = fileNm.substring(fileNm.lastIndexOf("."));
					saveFileNm = saveImageName;
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
			param.setWork_image(saveImageName);
		}

		// 수정된 제목, 내용 부분을 가져온다.
		String work_title = mr.getParameter("input_title");
		String work_ctnt = mr.getParameter("input_comment");

		param.setI_work(i_work);
		param.setI_show(i_show);
		param.setI_user(loginUser.getI_user());

		param.setWork_title(work_title);
		param.setWork_ctnt(work_ctnt);
		// 작품 업데이트
		WorkDAO.updWork(param);
		
		//출시작품관리 페이지로 이동
		response.sendRedirect("/exhibit_page2?i_user=" + loginUser.getI_user() + "&i_show=" + i_show);

	}

}