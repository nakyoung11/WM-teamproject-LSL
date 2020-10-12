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
import com.lsl.wm.vo.WorkVO;

@WebServlet("/exhibit_page2")
public class ExihibitPage2Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsp = "/WEB-INF/user_writer/exhibit_page2.jsp";
		//�α����� ����� ������ �޾ƿ´�.
		UserVO loginUser = MyUtils.getLoginUser(request);
		//����ȸ ������ �޾ƿ´�.
		ShowVO param = new ShowVO();
		param.setI_user(loginUser.getI_user());
		List<ShowVO> showParam = ShowDAO.selI_showList(param);
		
		List<ShowArrDomain> list = new ArrayList(); 
		
		for(int i=0; i<showParam.size(); i++) {
			ShowArrDomain domain = new ShowArrDomain();
			domain.setI_show(showParam.get(i).getI_show());
			domain.setShow_title(showParam.get(i).getShow_title());
			domain.setShow_ctnt(showParam.get(i).getShow_ctnt());
			ShowListVO vo = new ShowListVO();
			vo.setI_show(showParam.get(i).getI_show());
			domain.setShowDomainList(ShowListDAO.selShowList(vo));
			list.add(domain);
		}
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("i_show: " + list.get(i).getShow_title());
			for(int j=0; j<list.get(i).getShowDomainList().size(); j++) {
				System.out.println("작품 제목: " + list.get(i).getShowDomainList().get(j).getWork_title());
			}
			System.out.println();
			System.out.println();
		}
			
		request.setAttribute("showList", list);
		
		
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
