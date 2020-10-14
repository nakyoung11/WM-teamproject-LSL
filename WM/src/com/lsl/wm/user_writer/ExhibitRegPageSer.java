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
		// �α����� ����� ������ �޾ƿ´�.
		UserVO loginUser = MyUtils.getLoginUser(request);
		//������ ��ǰ�� i_work ���� �޾ƿ´�.
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		int i_work = Integer.parseInt(request.getParameter("i_work"));
		WorkVO vo = new WorkVO();
		vo.setI_work(i_work);
		//��ǰ������ �����´�.
		WorkVO workParam = WorkDAO.selWork(vo);

		String savePath = "/resource/show/images/posters/" + i_show + "/";
		String workImagePath = "/resource/user_writer/images/exhibition/" + loginUser.getI_user() + "/";

		// ����ȸ ������ �����ش�.
		request.setAttribute("data", i_show);
		// jsp���� ������� �������� ��θ� �����ش�.
		request.setAttribute("imagePath", savePath);
		//��ǰ������ �����ش�.
		request.setAttribute("workData", workParam);
		//��ǰ ���
		request.setAttribute("workPath", workImagePath);
		
		String jsp = "/WEB-INF/user_writer/exhibitRegPage.jsp";
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
		//��� ����ȸ ����
		int i_show = Integer.parseInt(mr.getParameter("i_show"));
		//��� ��ǰ����
		int i_work = Integer.parseInt(mr.getParameter("i_work"));
		
		
		
		
		
			WorkVO param = new WorkVO();
			String saveImageName ="";
			//���࿡ �׸��� �������ִٸ�
			if(!(mr.getParameter("work_image").equals(""))) {
				String work_image = mr.getParameter("work_image");
				
				/*������ ���� ����*/
				param.setI_work(i_work);
				param = WorkDAO.selWork(param);
				
				File f = new File(savePath + "/" + param.getWork_image());		
				if(f.exists()){
					
					f.delete();
					System.out.println("���� ������");
				}else{
					System.out.println("���� ����");
				}
				String randomKey = String.valueOf(UUID.randomUUID());
				try {
					Enumeration files = mr.getFileNames();
					
					saveImageName = i_show  + "_" + loginUser.getI_user() + "_" + randomKey + "_" + work_image; 
					
					while(files.hasMoreElements()) {
						String key = (String)files.nextElement();
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
				} catch(Exception e) {
					e.printStackTrace();
				}
				param.setWork_image(saveImageName);
			}
			
			String work_title = mr.getParameter("input_title");
			String work_ctnt = mr.getParameter("input_comment");
			
			
			
			param.setI_work(i_work);
			param.setI_show(i_show);
			param.setI_user(loginUser.getI_user());
			
			param.setWork_title(work_title);
			param.setWork_ctnt(work_ctnt);
			
			WorkDAO.updWork(param);
		
		
		
			System.out.println("post����");
		
		
		
			
		response.sendRedirect("/exhibit_page2?i_user="+ loginUser.getI_user() + "&i_show=" + i_show);
	
	}

}