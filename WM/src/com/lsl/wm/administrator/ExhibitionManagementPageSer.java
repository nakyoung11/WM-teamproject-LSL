package com.lsl.wm.administrator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsl.wm.MyUtils;
import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.db.ShowListDAO;
import com.lsl.wm.vo.ShowListDomain;
import com.lsl.wm.vo.ShowListVO;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;

@WebServlet("/exhibitionManagementPage")
public class ExhibitionManagementPageSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//�α����� ����� ������ �޾ƿ´�.
				UserVO loginUser = MyUtils.getLoginUser(request);
				//���� �ֽ� ����ȸ ������ �޾ƿ´�.
				ShowVO param = ShowDAO.selLatestExhibition();
				//����ȸ ��ǰ ����� �����´�.
				ShowListVO vo = new ShowListVO();
				
				vo.setI_show(param.getI_show());
				List<ShowListDomain> list = new ArrayList();
				list = ShowListDAO.selShowList(vo);
				
				String savePath = "/resource/show/images/posters/" + param.getI_show() + "/";
				String savePath2 = "/resource/user_writer/images/exhibition/";
				//����ȸ ���� �����ش�.
				request.setAttribute("data", param);
				//jsp���� ������� �������� ��θ� �����ش�.
				request.setAttribute("imagePath", savePath);
				//����ȸ ��ǰ ����� �����ش�.
				request.setAttribute("workList", list);
				//jsp���� ������� �̹����� ��θ� �����ش�.
				request.setAttribute("workImagePath", savePath2);
				
				String jsp = "/WEB-INF/administrator/exhibitionManagementPage.jsp";
				request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i_work =  Integer.parseInt(request.getParameter("i_work"));
		//���� �۾�
		ShowListDomain vo = new ShowListDomain();
		vo.setI_work(i_work);
		ShowListDAO.delShowList(vo);
		
		response.sendRedirect("/exhibitionManagementPage");
		
	}

}
