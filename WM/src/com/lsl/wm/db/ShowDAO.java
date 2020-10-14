package com.lsl.wm.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lsl.wm.vo.ShowListDomain;
import com.lsl.wm.vo.ShowVO;
import com.lsl.wm.vo.WorkVO;

public class ShowDAO {
	// 전시회 등록시 사용
	public static int insShow(ShowVO param) {
		String sql = " INSERT INTO t_show " 
				+ " (i_user, show_poster, show_title, show_ctnt) " 
				+ " VALUES " 
				+ " ( ?, ?, ?, ?) ";
		
		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {
			
			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_user());
				ps.setNString(2, param.getShow_poster());
				ps.setNString(3, param.getShow_title());
				ps.setNString(4, param.getShow_ctnt());
			
			}
		});
	}
	
	// 전시회 페이징시 사용
	public static int selPagingCnt(ShowVO param) {
		String sql = " SELECT CEIL(count(i_show) / 6) as pagingCnt "
				   + " FROM t_show "
				   + " WHERE show_title LIKE ? "
				   + " ORDER BY r_dt DESC ";
		
		return JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setNString(1, param.getSearchText());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				if(rs.next()) {
					return rs.getInt("pagingCnt");
				}
				return 0;
			}
		});
	}
	
	// 전시회 검색, 페이지마다 6개씩 보여주기위해 사용
	public static List<ShowVO> selShowList(ShowVO param) {
		List<ShowVO> list = new ArrayList<ShowVO>();
		
		String sql = " SELECT A.* "
				   + " FROM (SELECT i_show, show_title, show_poster, i_user, r_dt FROM t_show WHERE show_title LIKE ?) A"
				   + " ORDER BY A.r_dt DESC "
				   + " LIMIT ?, 6 ";
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {				
				ps.setNString(1, param.getSearchText());
				ps.setInt(2, param.getRow());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					
					int i_user = rs.getInt("i_user");
					int i_show = rs.getInt("i_show");
					String show_title = rs.getNString("show_title");
					String show_poster = rs.getNString("show_poster");
					ShowVO vo = new ShowVO();
					
					vo.setI_user(i_user);
					vo.setI_show(i_show);
					vo.setShow_title(show_title);
					vo.setShow_poster(show_poster);
					
					list.add(vo);
				}
				return 0;
			}
		});
		return list;
	}
	
	// 모든 전시회 select시 사용
	public static List<ShowVO> selAllShowList(ShowVO param) {
		List<ShowVO> list = new ArrayList<ShowVO>();
		
		String sql = " SELECT A.* "
				   + " FROM (SELECT i_show, show_title, show_poster, i_user, r_dt FROM t_show WHERE show_title LIKE ?) A"
				   + " ORDER BY A.r_dt DESC ";

		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {				
				ps.setNString(1, param.getSearchText());
				
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					
					int i_user = rs.getInt("i_user");
					int i_show = rs.getInt("i_show");
					String show_title = rs.getNString("show_title");
					String show_poster = rs.getNString("show_poster");
					ShowVO vo = new ShowVO();
					
					vo.setI_user(i_user);
					vo.setI_show(i_show);
					vo.setShow_title(show_title);
					vo.setShow_poster(show_poster);
					
					list.add(vo);
				}
				return 0;
			}
		});
		return list;
	}
	
	//전시회의 좋아요 개수 가져오기
	public static ShowVO selShowlikeCnt(ShowVO param) {
		ShowVO vo = new ShowVO();
		
		String sql = " SELECT COUNT(B.i_user) AS like_cnt "
				   + " FROM t_show_list A "
				   + " JOIN t_work_like B "
				   + " ON B.i_work = A.i_work "
				   + " WHERE A.i_show = ? ";
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {				
				ps.setInt(1, param.getI_show());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					
					int like_cnt = rs.getInt("like_cnt");
					
					vo.setLikeCnt(like_cnt);

				}
				return 0;
			}
		});
		return vo;
	}
	
	//전시회의 댓글 개수 가져오기
		public static ShowVO selShowCmtCnt(ShowVO param) {
			ShowVO vo = new ShowVO();
			
			String sql = " SELECT COUNT(B.i_user) AS cmt_cnt "
					   + " FROM t_show_list A "
					   + " JOIN t_work_cmt B "
					   + " ON B.i_work = A.i_work "
					   + " WHERE A.i_show = ? ";
			
			JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
				
				@Override
				public void prepared(PreparedStatement ps) throws SQLException {				
					ps.setInt(1, param.getI_show());
				}
				
				@Override
				public int executeQuery(ResultSet rs) throws SQLException {
					while(rs.next()) {
						
						int cmt_cnt = rs.getInt("cmt_cnt");
						
						vo.setCmtCnt(cmt_cnt);

					}
					return 0;
				}
			});
			return vo;
		}
	
	
	public static ShowVO selShow(ShowVO param) {
		String sql = " SELECT "
				+ " i_show, i_user, show_ctnt, "
				+ " show_title, show_poster "
				   + " FROM t_show "
				   + " WHERE i_show = ? ";
		
		ShowVO vo = new ShowVO();
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_show());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					vo.setI_show(rs.getInt("i_show"));
					vo.setI_user(rs.getInt("i_user"));
					vo.setShow_poster(rs.getString("show_poster"));
					vo.setShow_title(rs.getString("show_title"));
					vo.setShow_ctnt(rs.getString("show_ctnt"));
				}
				return 1;
			}
		});
		
		return vo;
	}
	
	public static List<ShowVO> selI_showList(ShowVO param) {
		String sql = " SELECT "
				+ " i_show, i_user, show_ctnt, "
				+ " show_title, show_poster "
				   + " FROM t_show "
				   + " WHERE i_user = ? ";
		
		List<ShowVO> list = new ArrayList();
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_user());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					ShowVO vo = new ShowVO();
					vo.setI_show(rs.getInt("i_show"));
					vo.setI_user(rs.getInt("i_user"));
					vo.setShow_poster(rs.getString("show_poster"));
					vo.setShow_title(rs.getString("show_title"));
					vo.setShow_ctnt(rs.getString("show_ctnt"));
					list.add(vo);
				}
				return 1;
			}
		});
		
		return list;
	}
	
	//가장 최근 전시회 정보를 가져온다.
	public static ShowVO selLatestI_show(ShowVO param) {
		String sql = " SELECT "
				+ " i_show, i_user, show_ctnt, "
				+ " show_title, show_poster "
				   + " FROM t_show "
				   + " WHERE i_show = (SELECT MAX(i_show)"
				   + "FROM t_show "
				   + "WHERE i_user = ?) ";
		
		ShowVO vo = new ShowVO();
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_user());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					vo.setI_show(rs.getInt("i_show"));
					vo.setI_user(rs.getInt("i_user"));
					vo.setShow_poster(rs.getString("show_poster"));
					vo.setShow_title(rs.getString("show_title"));
					vo.setShow_ctnt(rs.getString("show_ctnt"));
				}
				return 1;
			}
		});
		
		return vo;
	}
	
	public static int delShow(ShowVO param) {
		String sql = " DELETE " 
				+ " FROM t_show " 
				+ " WHERE " 
				+ " i_show = ? ";
		
		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {
			
			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_show());
			
			}
		});
	}
}
