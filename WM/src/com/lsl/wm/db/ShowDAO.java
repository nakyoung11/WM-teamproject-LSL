package com.lsl.wm.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lsl.wm.vo.ShowVO;

public class ShowDAO {
	/*
	public static int insWork(WorkVO param) {
		String sql = " INSERT INTO t_work " 
				+ " (i_user, work_images, work_title, work_ctnt) " 
				+ " VALUES " 
				+ " ( ?, ?, ?, ?) ";
		
		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {
			
			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_user());
				ps.setNString(2, param.getWork_image());
				ps.setNString(3, param.getWork_title());
				ps.setNString(4, param.getWork_ctnt());
			
			}
		});
	}
	*/
	public static int selPagingCnt(ShowVO param) {
		String sql = " SELECT CEIL(count(i_show) / 6) as pagingCnt "
				   + " FROM t_show "
				   + " WHERE show_title LIKE ? "
				   + " ORDER BY start_dt DESC ";
		
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
				   + " FROM (SELECT show_title FROM t_show WHERE show_title LIKE ? ORDER BY start_dt DESC) A "
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
					
					String show_title = rs.getNString("show_title");
					
					ShowVO vo = new ShowVO();
					
					vo.setShow_title(show_title);
					
					list.add(vo);
				}
				return 0;
			}
		});
		return list;
	}
	
	public static ShowVO selShow(ShowVO param) {
		String sql = " SELECT "
				+ " i_show, start_dt, end_dt, show_ctnt, "
				+ " exhibit_start_dt, exhibit_end_dt,"
				+ " show_title, show_ctnt, show_poster "
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
					vo.setShow_poster(rs.getString("show_poster"));
					vo.setStart_dt(rs.getString("start_dt"));
					vo.setEnd_dt(rs.getString("end_dt"));
					vo.setExhibit_start_dt(rs.getString("exhibit_start_dt"));
					vo.setExhibit_end_dt(rs.getString("exhibit_end_dt"));
					vo.setShow_title(rs.getString("show_title"));
					vo.setShow_ctnt(rs.getString("show_ctnt"));
				}
				return 1;
			}
		});
		
		return vo;
	}
	
	public static ShowVO selLatestExhibition() {
		String sql = " SELECT "
				+ " MAX(i_show) as i_show, start_dt, end_dt, show_ctnt, "
				+ " exhibit_start_dt, exhibit_end_dt,"
				+ " show_title, show_ctnt, show_poster "
				   + " FROM t_show ";
		
		ShowVO vo = new ShowVO();
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					vo.setI_show(rs.getInt("i_show"));
					vo.setShow_poster(rs.getString("show_poster"));
					vo.setStart_dt(rs.getString("start_dt"));
					vo.setEnd_dt(rs.getString("end_dt"));
					vo.setExhibit_start_dt(rs.getString("exhibit_start_dt"));
					vo.setExhibit_end_dt(rs.getString("exhibit_end_dt"));
					vo.setShow_title(rs.getString("show_title"));
					vo.setShow_ctnt(rs.getString("show_ctnt"));
				}
				return 1;
			}
		});
		
		return vo;
	}
}
