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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 유저의 정보를 가져온다.
		UserVO loginUser = MyUtils.getLoginUser(request);

		// 로그인 유저 정보가 존재하지 않는다면(로그인을 안했다면)
		if (loginUser == null) {
			loginUser = new UserVO();
			// 3d 갤러리에서 i_user값이 0이라면 로그인 하지 않은 사용자로 인식한다.
			loginUser.setI_user(0);
		}

		System.out.println("i_user값: " + loginUser.getI_user());

		// 어느 전시회 인지를 받아 온다.
		int i_show = Integer.parseInt(request.getParameter("i_show"));

		// 전시회 작품 목록을 담을 객체를 선언
		ShowListVO vo = new ShowListVO();
		// i_show 값을 세팅하고(전시회 인덱스)
		vo.setI_show(i_show);
		// 전시회에 포함되는 작품정보를 리스트로 받는다.
		List<ShowListDomain> list = new ArrayList();
		list = ShowListDAO.selShowList(vo);

		// 실제 그림이 저장된 경로(jsp에서 이미지 출력을 위해)
		String savePath2 = "/resource/user_writer/images/exhibition/";

		// 작품 목록을 세팅한다.
		request.setAttribute("workList", list);
		// 작품의 실제 저장 경로를 세팅한다.
		request.setAttribute("workImagePath", savePath2);
		// 유저 정보를 세팅한다.
		request.setAttribute("loginUser", loginUser);
		// 작품수를 세팅한다.
		request.setAttribute("workListSize", list.size());

		String jsp = "/WEB-INF/3d_gallay/3dGallay.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 로그인유저 정보를 받아옴
		UserVO loginUser = MyUtils.getLoginUser(request);
		// 로그인 유저가 아닐 경우의 처리를 위해 i_user 값을 0으로 세팅.
		if (loginUser == null) {
			loginUser = new UserVO();
			loginUser.setI_user(0);
		}

		// json 통신을 위한 설정
		response.setContentType("application/x-json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 넘어오는 작업을 분류하기 위해 "method"라는 이름의 변수 보냈다. 이 변수의 값이 "selI_user"와 같다면
		// 작가 정보를 조회해 jsp로 보내준다.
		if (request.getParameter("method").equals("selI_user")) {
			int i_work = Integer.parseInt(request.getParameter("i_work"));
			System.out.println("i_work값" + request.getParameter("i_work"));
			// i_work에 해당하는 작가정보(i_user)값을 가져온다.
			WorkVO param = new WorkVO();
			if (i_work != 0) {
				param.setI_work(i_work);
				param = WorkDAO.selWork(param);
				// 작품의 좋아요 개수를 가져온다.
				WorkLikeDomain domain = new WorkLikeDomain();
				domain.setI_work(i_work);
				domain = WorkLikeDAO.selWorkLikeCnt(domain);
				// 사용자가 이 작품에 좋아요를 했는지 여부를 가져온다.

				WorkLikeDomain domain2 = new WorkLikeDomain();
				domain2.setI_user(loginUser.getI_user());
				domain2.setI_work(i_work);
				domain2 = WorkLikeDAO.selWorkLike(domain2);

				// 작품을 작성한 작가의 유저 정보(닉네임, 이메일 등..)을 가져온다.
				UserVO param2 = new UserVO();
				System.out.println("sadasdasdsadas: " + param.getI_user());
				if (param.getI_user() != 0) {
					param2 = UserDAO.selUser(param.getI_user());
				} else {
					param2 = UserDAO.selUser(1);
				}

				JSONObject jobj = new JSONObject();
				
				System.out.println("占쏙옙占싱울옙크占쏙옙:" + i_work);
				System.out.println("占싻놂옙占쏙옙: " + param2.getNickname());
				System.out.println("占싱몌옙占쏙옙: " + param2.getUser_email());

				System.out.println("占쏙옙占싣울옙:" + domain2.getIsLike());
				// 상세보기 화면에 들어갈 정보들을 세팅하는 부분.
				jobj.put("nickName", param2.getNickname());
				jobj.put("user_email", param2.getUser_email());
				jobj.put("workLikeCnt", domain.getWorkLikeCnt());
				jobj.put("isLike", domain2.getIsLike());
				if (param2.getProfile_img() != null) {
					jobj.put("profilePath", "/img/user/" + param.getI_user() + "/" + param2.getProfile_img());
				} else {
					jobj.put("profilePath", "/resource/profile/default_profile.jpg");
				}
				
				out.print(jobj.toJSONString()); // json 형식으로 jsp로 데이터를 보낸다.
			} else {
				JSONObject jobj = new JSONObject();
				jobj.put("nickName", " ");
				jobj.put("user_email", " ");
				jobj.put("workLikeCnt", 0);
				jobj.put("isLike", 0);
				jobj.put("profilePath", "/resource/profile/default_profile.jpg");
				
				out.print(jobj.toJSONString()); // json 형식으로 jsp로 데이터를 보낸다.

			}

			
		}

		// 댓글을 추가하는 ajax통신 처리("doAddCmt")
		if (request.getParameter("method").equals("doAddCmt")) {
			int i_work = Integer.parseInt(request.getParameter("i_work"));
			String cmt = request.getParameter("cmt");

			WorkCmtVO vo = new WorkCmtVO();

			vo.setI_work(i_work);
			vo.setI_user(loginUser.getI_user());
			vo.setCmt(cmt);
			// 댓글 정보를 삽입한다.
			WorkCmtDAO.insWorkCmt(vo);

			// 삽입 후 변경된 댓글 리스트를 화면에 출력시키기 위해 다시 댓글 목록을 읽어온다.
			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);

			// Gson으로 간편하게 자바 객체를 json형식으로 변환해 보낼 수 있다.
			String gson = new Gson().toJson(list);

			try {
				// jsp로 gson 객체를 보낸다.
				response.getWriter().write(gson);
				return;
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 댓글을수정하는 ajax통신 처리("doAddCmt")
		if (request.getParameter("method").equals("doEditCmt")) {
			int i_work = Integer.parseInt(request.getParameter("i_work"));
			int i_work_cmt = Integer.parseInt(request.getParameter("i_work_cmt"));
			String cmt = request.getParameter("cmt");

			WorkCmtVO vo = new WorkCmtVO();

			vo.setI_work_cmt(i_work_cmt);
			vo.setI_user(loginUser.getI_user());
			vo.setCmt(cmt);
			// 댓글을 수정하는 DAO매소드를 호출.
			WorkCmtDAO.updWorkCmt(vo);

			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);

			String gson = new Gson().toJson(list);

			try {

				response.getWriter().write(gson);
				return;
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 댓글을 읽어오는 ajax통신 처리("doReadCmt")
		if (request.getParameter("method").equals("doReadCmt")) {
			int i_work = Integer.parseInt(request.getParameter("i_work"));

			WorkCmtVO vo = new WorkCmtVO();

			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);

			String gson = new Gson().toJson(list);

			try {
				response.getWriter().write(gson);
				return;
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 댓글을 읽어오는 ajax통신 처리("doDelCmt")
		if (request.getParameter("method").equals("doDelCmt")) {
			int i_work = Integer.parseInt(request.getParameter("i_work"));
			int i_work_cmt = Integer.parseInt(request.getParameter("i_work_cmt"));

			WorkCmtVO vo = new WorkCmtVO();

			vo.setI_work_cmt(i_work_cmt);
			vo.setI_user(loginUser.getI_user());

			WorkCmtDAO.delWorkCmt(vo);

			List<WorkCmtDomain> list = new ArrayList();
			vo.setI_work(i_work);
			list = WorkCmtDAO.selWorkCmtList(vo);

			String gson = new Gson().toJson(list);

			try {
				response.getWriter().write(gson);
				return;
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 좋아요에 관한 ajax통신 처리("doLike")
		if (request.getParameter("method").equals("doLike")) {
			int i_work = Integer.parseInt(request.getParameter("i_work"));
			// like했는지의 여부를 읽어온다.
			WorkLikeDomain domain2 = new WorkLikeDomain();
			domain2.setI_user(loginUser.getI_user());
			domain2.setI_work(i_work);
			domain2 = WorkLikeDAO.selWorkLike(domain2);
			// 좋아요가 되어 있가면 if(domain2.getIsLike() != 0)
			if (domain2.getIsLike() != 0) {
				// 좋아요 테이블에서 데이터를 삭제
				WorkLikeDAO.delWorkLike(domain2);
			} else {
				// 좋아요 테이블에서 데이터를 삽입
				WorkLikeDAO.insWorkLike(domain2);
			}
			// 바뀐 정보를 jsp에서 출력하기 위해 좋아요 여부를 다시 받아옴
			domain2 = WorkLikeDAO.selWorkLike(domain2);
			// 작품에 좋아요 개수를 읽어오는 작업.
			WorkLikeDomain domain = new WorkLikeDomain();
			domain.setI_work(i_work);
			domain = WorkLikeDAO.selWorkLikeCnt(domain);

			JSONObject jobj = new JSONObject();
			jobj.put("workLikeCnt", domain.getWorkLikeCnt());
			jobj.put("isLike", domain2.getIsLike());
			out.print(jobj.toJSONString());
		}

	}
}