package com.lsl.wm.gallay_3d;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.lsl.wm.MyUtils;
import com.lsl.wm.db.ShowDAO;
import com.lsl.wm.db.ShowListDAO;
import com.lsl.wm.db.UserDAO;
import com.lsl.wm.db.WorkCmtDAO;
import com.lsl.wm.db.WorkDAO;
import com.lsl.wm.db.WorkLikeDAO;
import com.lsl.wm.vo.ShowListDomain;
import com.lsl.wm.vo.ShowListVO;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.UserVO;
import com.lsl.wm.vo.WorkCmtDomain;
import com.lsl.wm.vo.WorkCmtVO;
import com.lsl.wm.vo.WorkLikeDomain;
import com.lsl.wm.vo.WorkVO;


@WebServlet("/gallay/gallay3d")
public class Gallay3dSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쌨아온댐옙.
		UserVO loginUser = MyUtils.getLoginUser(request);
		//어느 전시회 인지를 받아 온다.
		int i_show = Integer.parseInt(request.getParameter("i_show"));
		//占쏙옙占쏙옙회 占쏙옙품 占쏙옙占쏙옙占� 占쏙옙占쏙옙占승댐옙.
		ShowListVO vo = new ShowListVO();
		
		vo.setI_show(i_show);
		List<ShowListDomain> list = new ArrayList();
		list = ShowListDAO.selShowList(vo);
		
		String savePath2 = "/resource/user_writer/images/exhibition/";
		
		//占쏙옙占쏙옙회 占쏙옙품 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쌔댐옙.
		request.setAttribute("workList", list);
		//jsp占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占싱뱄옙占쏙옙占쏙옙 占쏙옙罐占� 占쏙옙占쏙옙占쌔댐옙.
		request.setAttribute("workImagePath", savePath2);
		//濡쒓렇�씤 �쑀�� �젙蹂� 蹂대궡湲�
		request.setAttribute("loginUser", loginUser);
		
		//洹몃┝ 媛쒖닔 蹂대궡湲�
		request.setAttribute("workListSize", list.size());
		
		
		String jsp = "/WEB-INF/3d_gallay/3dGallay.jsp"; 
		request.getRequestDispatcher(jsp).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쌨아온댐옙.
		UserVO loginUser = MyUtils.getLoginUser(request);  
		// json 占쏙옙占승뤄옙 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙 json占쏙옙체 占쏙옙占쏙옙
		 response.setContentType("application/x-json; charset=UTF-8");
	     PrintWriter out = response.getWriter();
	     //占쌜곤옙占쏙옙占쏙옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙 json占쏙옙占쏙옙繭占쏙옙
	     if(request.getParameter("method").equals("selI_user")) {
	    	 int i_work = Integer.parseInt(request.getParameter("i_work"));
		     //i_work占쏙옙占쏙옙占쏙옙 占쌜곤옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占승댐옙.
		     WorkVO param = new WorkVO();
		    param.setI_work(i_work); 
		    param = WorkDAO.selWork(param);
		    //占쏙옙占싣울옙 占쏙옙占쏙옙 占쏙옙占쏙옙占승댐옙.
		    WorkLikeDomain domain = new WorkLikeDomain();
		    domain.setI_work(i_work);
		    domain = WorkLikeDAO.selWorkLikeCnt(domain);
		    //占쏙옙占쏙옙 占쏙옙占싣울옙占쏙옙 占쌓몌옙占쏙옙占쏙옙 占쏙옙占쏙옙
		    WorkLikeDomain domain2 = new WorkLikeDomain();
		    domain2.setI_user(loginUser.getI_user());
		    domain2.setI_work(i_work);
		    domain2 = WorkLikeDAO.selWorkLike(domain2);
		    
		    UserVO param2 = new UserVO();
		    param2 = UserDAO.selUser(param.getI_user());
		    
			System.out.println("占쏙옙占싱울옙크占쏙옙:" + i_work);
			System.out.println("占싻놂옙占쏙옙: " + param2.getNickname());
			System.out.println("占싱몌옙占쏙옙: " + param2.getUser_email());
			
			JSONObject jobj = new JSONObject();
			System.out.println("占쏙옙占싣울옙:" + domain2.getIsLike());
			jobj.put("nickName", param2.getNickname());
			jobj.put("user_email", param2.getUser_email());
			jobj.put("workLikeCnt", domain.getWorkLikeCnt());
			jobj.put("isLike", domain2.getIsLike());
			if(param2.getProfile_img() != null) {
				jobj.put("profilePath", "/img/user/" + param.getI_user() + "/" + param2.getProfile_img());
			}else {
				jobj.put("profilePath", "/resource/profile/default_profile.jpg");
			}
			
			out.print(jobj.toJSONString()); // json 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占�
	     }
	     
	     //占쏙옙占� 占쏙옙占쏙옙占� 占쏙옙占쏙옙 json占쏙옙占쏙옙繭占쏙옙
	     if(request.getParameter("method").equals("doAddCmt")) {
	    	 int i_work = Integer.parseInt(request.getParameter("i_work"));
	    	 String cmt = request.getParameter("cmt");
			
			WorkCmtVO vo = new WorkCmtVO();
			
			vo.setI_work(i_work);
			vo.setI_user(loginUser.getI_user());
			vo.setCmt(cmt);
			
			WorkCmtDAO.insWorkCmt(vo);
			
			//占쏙옙占� 占쏙옙占쏙옙트占쏙옙 占쌨아온댐옙.
			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);
			
			//占쏙옙占쏙옙트占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 Gson占쏙옙占싱브러占쏙옙占쏙옙 활占쏙옙
			String gson = new Gson().toJson(list);
	    	 
            try {
                //ajax占쏙옙 占쏙옙占쏙옙占쏙옙占쌍댐옙 占싸븝옙
                response.getWriter().write(gson);
                return;
            } catch (JsonIOException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
	     }
	     
	     //�뙎湲� �닔�젙 硫붿냼�뱶
	     if(request.getParameter("method").equals("doEditCmt")) {
	    	 int i_work = Integer.parseInt(request.getParameter("i_work"));
	    	 int i_work_cmt = Integer.parseInt(request.getParameter("i_work_cmt"));
	    	 String cmt = request.getParameter("cmt");
			System.out.println("�뙎湲� 踰덊샇:" + i_work_cmt);
			WorkCmtVO vo = new WorkCmtVO();
			
			vo.setI_work_cmt(i_work_cmt);
			vo.setI_user(loginUser.getI_user());
			vo.setCmt(cmt);
			
			WorkCmtDAO.updWorkCmt(vo);
			
			//占쏙옙占� 占쏙옙占쏙옙트占쏙옙 占쌨아온댐옙.
			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);
			
			//占쏙옙占쏙옙트占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 Gson占쏙옙占싱브러占쏙옙占쏙옙 활占쏙옙
			String gson = new Gson().toJson(list);
	    	 
            try {
                //ajax占쏙옙 占쏙옙占쏙옙占쏙옙占쌍댐옙 占싸븝옙
                response.getWriter().write(gson);
                return;
            } catch (JsonIOException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
	     }
	     
	   //占쏙옙占쏙옙占� 占쌀뤄옙占쏙옙占쏙옙 占쏙옙占쏙옙 json占쏙옙占쏙옙繭占쏙옙
	     if(request.getParameter("method").equals("doReadCmt")) {
	    	 int i_work = Integer.parseInt(request.getParameter("i_work"));
	    	 	
			WorkCmtVO vo = new WorkCmtVO();
			
			//占쏙옙占� 占쏙옙占쏙옙트占쏙옙 占쌨아온댐옙.
			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);
			
			//占쏙옙占쏙옙트占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 Gson占쏙옙占싱브러占쏙옙占쏙옙 활占쏙옙
			String gson = new Gson().toJson(list);
	    	 
            try {
                //ajax占쏙옙 占쏙옙占쏙옙占쏙옙占쌍댐옙 占싸븝옙
                response.getWriter().write(gson);
                return;
            } catch (JsonIOException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
	     }
	     
	     //�뙎湲� �궘�젣 硫붿냼�뱶
	     if(request.getParameter("method").equals("doDelCmt")) {
	    	 int i_work = Integer.parseInt(request.getParameter("i_work"));
	    	 int i_work_cmt = Integer.parseInt(request.getParameter("i_work_cmt"));
	    	
			System.out.println("�뙎湲� 踰덊샇:" + i_work_cmt);
			WorkCmtVO vo = new WorkCmtVO();
			
			vo.setI_work_cmt(i_work_cmt);
			vo.setI_user(loginUser.getI_user());
			
			WorkCmtDAO.delWorkCmt(vo);
			
			//占쏙옙占� 占쏙옙占쏙옙트占쏙옙 占쌨아온댐옙.
			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);
			
			//占쏙옙占쏙옙트占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 Gson占쏙옙占싱브러占쏙옙占쏙옙 활占쏙옙
			String gson = new Gson().toJson(list);
	    	 
            try {
                //ajax占쏙옙 占쏙옙占쏙옙占쏙옙占쌍댐옙 占싸븝옙
                response.getWriter().write(gson);
                return;
            } catch (JsonIOException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
	     }
	     
	     
	   //占쏙옙占싣울옙 처占쏙옙占쏙옙 占쏙옙占쏙옙 json占쏙옙占쏙옙繭占쏙옙
	     if(request.getParameter("method").equals("doLike")) {
	    	 int i_work = Integer.parseInt(request.getParameter("i_work"));
	    	  //占쏙옙占쏙옙 占쏙옙占싣울옙占쏙옙 占쌓몌옙占쏙옙占쏙옙 占쏙옙占쏙옙
			    WorkLikeDomain domain2 = new WorkLikeDomain();
			    domain2.setI_user(loginUser.getI_user());
			    domain2.setI_work(i_work);
			    domain2 = WorkLikeDAO.selWorkLike(domain2);
			    if(domain2.getIsLike() != 0) {
			    	WorkLikeDAO.delWorkLike(domain2);
			    }else {
			    	WorkLikeDAO.insWorkLike(domain2);
			    }
			    //占쌕쏙옙 占쏙옙占싣울옙 占쏙옙占싸몌옙 占쌨아온댐옙.
			    domain2 = WorkLikeDAO.selWorkLike(domain2);
		    //占쏙옙占싣울옙 占쏙옙占쏙옙 占쏙옙占쏙옙占승댐옙.
		    WorkLikeDomain domain = new WorkLikeDomain();
		    domain.setI_work(i_work);
		    domain = WorkLikeDAO.selWorkLikeCnt(domain);
		    
		    System.out.println("------------doLike------------");
			System.out.println("占쏙옙占싱울옙크占쏙옙:" + i_work);
			System.out.println("占쏙옙占싣요여占쏙옙:" + domain2.getIsLike());
			System.out.println("占쏙옙占싣요개占쏙옙:" + domain2.getIsLike());

			JSONObject jobj = new JSONObject();
			jobj.put("workLikeCnt", domain.getWorkLikeCnt());
			jobj.put("isLike", domain2.getIsLike());
			out.print(jobj.toJSONString()); // json 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占�
	     }
	     
	    
		
	    // 占쏙옙占쏙옙占� json 타占쏙옙占싱띰옙占� 占쏙옙 占쏙옙占� ( 占쏙옙占쏙옙占쌍몌옙 json 타占쏙옙占쏙옙占쏙옙 占싸쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 )

		
		
	}
}