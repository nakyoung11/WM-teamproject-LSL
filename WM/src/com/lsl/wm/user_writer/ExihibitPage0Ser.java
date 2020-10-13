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
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�α����� ����� ������ �޾ƿ´�.
		UserVO loginUser = MyUtils.getLoginUser(request);
		
		String jsp;
		
		if(loginUser == null) {
			jsp = "/WEB-INF/login/login.jsp";
		}else {
			jsp = "/WEB-INF/user_writer/exhibit_page0.jsp";
		}
		
		
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		
		String savePath = getServletContext().getRealPath("resource") + "/show/images/posters/"  + loginUser.getI_user() + "/";

		//���� ����(���丮)�� ���ٸ� ���� ����
		File directory = new File(savePath);
		if(!directory.exists()) {
			directory.mkdirs();
		}
		
		int maxFileSize = 10_485_760; //1024 * 1024 * 10 (10mb) //�ִ� ���� ������ ũ��
		String fileNm = "";
		String saveFileNm = null;
		
		//���� ������ �ޱ� ���� ��Ƽ ������Ʈ ��ü ���� �Ϲ� request�� �̰ɷ� �޾ƾ��Ѵ�.
		MultipartRequest mr = new MultipartRequest(request, savePath
				, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//jsp파일의 자료들을 받아온다.

			String show_image = mr.getParameter("show_image");
			String show_title = mr.getParameter("show_title");
			String show_ctnt = mr.getParameter("show_ctnt");
			
			//데이터 베이스에 삽입
			ShowVO param = new ShowVO();
			param.setI_user(loginUser.getI_user());
			param.setShow_poster(show_image);
			param.setShow_title(show_title);
			param.setShow_ctnt(show_ctnt);
			
			ShowDAO.insShow(param);
			
			param = ShowDAO.selLatestI_show(param);
			
		
		System.out.println("타이틀 : " + param.getShow_title());
		System.out.println("이미지명 : " + param.getShow_poster());
		
		try {
			Enumeration files = mr.getFileNames();
			
			while(files.hasMoreElements()) {
				String key = (String)files.nextElement();
				fileNm = mr.getFilesystemName(key);
				String ext = fileNm.substring(fileNm.lastIndexOf("."));
				saveFileNm = show_image;				
				System.out.println("key : " + key);
				System.out.println("fileNm : " + fileNm);
				System.out.println("saveFileNm : " + saveFileNm);				
				File oldFile = new File(savePath + "/" + fileNm);
			    File newFile = new File(savePath + "/" + saveFileNm);
			    oldFile.renameTo(newFile);				  
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
			
		response.sendRedirect("/exhibit_page1?i_show=" +  param.getI_show());
	}

}
