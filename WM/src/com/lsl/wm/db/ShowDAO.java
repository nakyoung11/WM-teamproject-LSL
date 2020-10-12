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
	
	public static List<ShowVO> selShowList(ShowVO param) {
		List<ShowVO> list = new ArrayList<ShowVO>();
		
		String sql = " SELECT A.* "
				   + " FROM (SELECT show_title, show_poster, i_user, r_dt FROM t_show WHERE show_title LIKE ?) A"
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
					String show_title = rs.getNString("show_title");
					String show_poster = rs.getNString("show_poster");
					ShowVO vo = new ShowVO();
					
					vo.setI_user(i_user);
					vo.setShow_title(show_title);
					vo.setShow_poster(show_poster);
					
					list.add(vo);
				}
				return 0;
			}
		});
		return list;
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
}
