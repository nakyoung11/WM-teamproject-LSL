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
import com.lsl.wm.vo.ShowListDomain;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;
import com.lsl.wm.vo.WorkVO;

@WebServlet("/exhibit_page2")
public class ExihibitPage2Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsp = "/WEB-INF/user_writer/exhibit_page2.jsp";
		//�α����� ����� ������ �޾ƿ´�.
		UserVO loginUser = MyUtils.getLoginUser(request);
		//����ȸ ������ �޾ƿ´�.
		ShowVO showParam = ShowDAO.selLatestExhibition();
		//exhibit_page1 ���� ���Ͽ��� �Ѿ�� i_user, i_show���� �޴´�.
		int i_user = loginUser.getI_user();
		int i_show = showParam.getI_show();
		
		System.out.println("�Ѿ�� �Ķ���Ͱ�:" + i_user);
		//�Ѿ�� �Ķ���� ���� �־��� WorkVO ��ü
		WorkVO vo = new WorkVO();
		
		ShowVO vo2 = new ShowVO();
		
		//���� �ִ´�.
		vo.setI_user(i_user);
		vo.setI_show(i_show);
		
		vo2.setI_show(i_show);
		
		//selWorkList i_user�� i_work�� ��ġ�ϴ� �޼ҵ带 ����Ͽ� ��ǰ ����� �ވf��
		List<WorkVO> list = WorkDAO.selWorkList(vo);
		
		ShowVO param = ShowDAO.selShow(vo2);
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getWork_title());
		}
		//list�� jsp�� ������ ���� ����ش�.
		//��ǰ����
		request.setAttribute("workList", list);
		//����ȸ ����
		request.setAttribute("showParam", param);
		
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		
		/*���� ��� ������*/
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		//������ ��ǰ�� i_work���� �����´�.
		int i_work = Integer.parseInt(request.getParameter("i_work"));
		int i_user = loginUser.getI_user();
		
		WorkVO param = new WorkVO();
		
		param.setI_show(i_show);
		param.setI_work(i_work);
		param.setI_user(i_user);
		
		param = WorkDAO.selWork(param);
		
		System.out.println("������ �̹��� ���� " + param.getWork_image());
		//���� ������ ���� �Ѵ�.
		String savePath = getServletContext().getRealPath("resource") + "/user_writer/images/exhibition/" + loginUser.getI_user() + "/";
		System.out.println("path : " + savePath);
		

		File f = new File(savePath + "/" + param.getWork_image());		
		if(f.exists()){
			f.delete();
			System.out.println("���� ������");
		}else{
			System.out.println("���� ����");
		}
		
		WorkDAO.delWork(param);
		/*����ȸ ����Ʈ ������ �����Ѵ�.*/
		ShowListDomain vo = new ShowListDomain();
		vo.setI_work(i_work);
		
		ShowListDAO.delShowList(vo);
		
		System.out.println("�Ѿ�� ��" + i_work);
		
		response.sendRedirect("/exhibit_page2?i_user="+ i_user + "&i_show=" + i_show);
		
		
	}

}
