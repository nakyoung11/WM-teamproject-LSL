package com.lsl.wm.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lsl.wm.vo.NoticeVO;

public class NoticeDAO {
	public static List<NoticeVO> selNoticeList(NoticeVO param) {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		
		String sql = " SELECT A.i_notice, A.title, B.nickname as nm, A.r_dt, A.m_dt "
				   + " FROM t_notice A "
				   + " INNER JOIN t_user B "
				   + " ON A.i_user = B.i_user "
				   + " ORDER BY r_dt DESC ";
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					int i_notice = rs.getInt("i_notice");
					String title = rs.getString("title");
					String nm = rs.getString("nm");
					String r_dt = rs.getString("r_dt");
					String m_dt = rs.getString("m_dt");
					
					NoticeVO vo = new NoticeVO();
					vo.setI_notice(i_notice);
					vo.setTitle(title);
					vo.setNm(nm);
					vo.setR_dt(r_dt);
					vo.setM_dt(m_dt);
					
					list.add(vo);
				}
				return 0;
			}
		});
		
		return list;
	}
	
	public static NoticeVO selNotice(NoticeVO param) {
		String sql = " SELECT title, ctnt "
				   + " FROM t_notice "
				   + " WHERE i_notice = ? ";
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_notice());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				if(rs.next()) {
					String title = rs.getNString("title");
					String ctnt = rs.getNString("ctnt");
					
					param.setTitle(title);
					param.setCtnt(ctnt);
				}
				return 0;
			}
		});
		
		return param;
	}
	
	public static int insNotice(NoticeVO param) {
		String sql = " INSERT INTO t_notice "
				   + " (title, ctnt, i_user) "
				   + " VALUES "
				   + " (?, ?, ?) ";
		
		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {
			
			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setNString(1, param.getTitle());
				ps.setNString(2, param.getCtnt());
				ps.setInt(3, param.getI_user());
			}
		});
	}
	
	public static int updNotice(NoticeVO param) {
		String sql = " UPDATE t_notice "
				   + " SET title = ?, ctnt = ?, m_dt = now() "
				   + " WHERE i_notice = ? ";
		
		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {
			
			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setNString(1, param.getTitle());
				ps.setNString(2, param.getCtnt());
				ps.setInt(3, param.getI_notice());
			}
		});
	}
}
