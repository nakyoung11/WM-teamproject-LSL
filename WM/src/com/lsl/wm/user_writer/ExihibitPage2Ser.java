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
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsp = "/WEB-INF/user_writer/exhibit_page2.jsp";
		//�α����� ����� ������ �޾ƿ´�.
		UserVO loginUser = MyUtils.getLoginUser(request);
		
		 if(loginUser == null) {
	         response.sendRedirect("/login"); //
	         return;
	      }       

	

		
		//����ȸ ������ �޾ƿ´�.
		ShowVO param = new ShowVO();
		param.setI_user(loginUser.getI_user());
		List<ShowVO> showParam = ShowDAO.selI_showList(param);
		
		List<ShowArrDomain> list = new ArrayList(); 
		
		 if(showParam.size() == 0) {
	         String jsp1 = "/WEB-INF/user_writer/err_null.jsp";
	         request.getRequestDispatcher(jsp1).forward(request, response);
	         return;
	      }
		 
		
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
		
		//작품의 좋아요 , 댓글 가져오기
		for(int i=0; i<list.size(); i++) {
			System.out.println("i_show: " + list.get(i).getShow_title());
			for(int j=0; j<list.get(i).getShowDomainList().size(); j++) {
				
				//좋아요 개수
				WorkDomain domain = new WorkDomain();
				domain.setI_work(list.get(i).getShowDomainList().get(j).getI_work());
				domain = WorkDAO.selWorklikeCnt(domain);
				list.get(i).getShowDomainList().get(j).setLike_cnt(domain.getLikeCnt());
				//댓글 개수
				domain.setI_work(list.get(i).getShowDomainList().get(j).getI_work());
				domain = WorkDAO.selWorkCmtCnt(domain);
				list.get(i).getShowDomainList().get(j).setCmt_cnt(domain.getCmtCnt());
				
				System.out.println("작품 제목: " + list.get(i).getShowDomainList().get(j).getWork_title());
				System.out.println("좋아요: " + list.get(i).getShowDomainList().get(j).getLike_cnt()
						+ "댓글: " + list.get(i).getShowDomainList().get(j).getCmt_cnt());
				
			}
			System.out.println();
			System.out.println();
		}
			
		request.setAttribute("showList", list);
		
		
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO loginUser = MyUtils.getLoginUser(request);
		
		int i_user = loginUser.getI_user();
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		//글을 삭제하는 post 요청 이라면
		if(request.getParameter("i_work") != null) {
			//������ ��ǰ�� i_work���� �����´�.
			int i_work = Integer.parseInt(request.getParameter("i_work"));
			
			
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
			return;
		}else {
			ShowVO param = new ShowVO();
			param.setI_show(i_show);
			ShowDAO.delShow(param);
			
			response.sendRedirect("/exhibit_page2?i_user="+ i_user + "&i_show=" + i_show);	
			return;
		}
		
		
	
	}

}
