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

@WebServlet("/exhibit_page1")
public class ExihibitPage1Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�α����� ����� ������ �޾ƿ´�.
		UserVO loginUser = MyUtils.getLoginUser(request);
		//����ȸ ������ �޾ƿ´�.
		ShowVO param = ShowDAO.selLatestExhibition();
		
		String savePath = "/resource/show/images/posters/" + param.getI_show() + "/";
		
		//����ȸ ������ �����ش�.
		request.setAttribute("data", param);
		//jsp���� ������� �������� ��θ� �����ش�.
		request.setAttribute("imagePath", savePath);
		
		String jsp = "/WEB-INF/user_writer/exhibit_page1.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		//������ ����
		String savePath = getServletContext().getRealPath("resource") + "/user_writer/images/exhibition/" + loginUser.getI_user() + "/";

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
		
		/*jsp�� ���� ��ǰ ������ �޾ƿ´�.*/
		//����Ʈ�� � ����
		int list_cnt = Integer.parseInt(mr.getParameter("list_cnt"));
		//��� ����ȸ ����
		int i_show = Integer.parseInt(mr.getParameter("i_show"));
		
		//������ �Ѿ�� ������ DB�� t_work�� �־��ش�
		for(int i=0; i<list_cnt; i++) {
			String work_image = mr.getParameter("work_image_idx_" + i);
			String work_title = mr.getParameter("input_title_" + i);
			String work_ctnt = mr.getParameter("input_comment_" + i);
			//���� ����� ���� �̸� (����ȸidx_����idx_���ϸ�) ���� work_iamge�� ���ϸ� �޾ƿ� ���̴�.
			String saveImageName = i_show  + "_" + loginUser.getI_user() + "_" +  work_image; 
			
			WorkVO param = new WorkVO();
			param.setI_show(i_show);
			param.setI_user(loginUser.getI_user());
			param.setWork_image(saveImageName);
			param.setWork_title(work_title);
			param.setWork_ctnt(work_ctnt);
			
			WorkDAO.insWork(param);
			param.setI_user(loginUser.getI_user());
			//���� �ֱٿ� �� i_work���� �����´�.
			param = WorkDAO.selLatestWork(param);
			//�Ѿ�� ������ ����ȸ ����Ʈ(t_show_list)�� �ξ��ش�.
			ShowListVO vo2 = new ShowListVO(); 
			vo2.setI_show(i_show);
			vo2.setI_work(param.getI_work());
			System.out.println(param.getI_work());
			ShowListDAO.insShowList(vo2);
		}
		
		
		
		System.out.println("savePath : " + savePath);
		
		try {
			Enumeration files = mr.getFileNames();
			
			while(files.hasMoreElements()) {
				String key = (String)files.nextElement();
				fileNm = mr.getFilesystemName(key);
				String ext = fileNm.substring(fileNm.lastIndexOf("."));
				saveFileNm = i_show  + "_" + loginUser.getI_user() + "_" + fileNm;				
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
		
			
		response.sendRedirect("/exhibit_page2");
	
	}

}
