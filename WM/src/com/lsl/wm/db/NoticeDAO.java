package com.lsl.wm.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lsl.wm.vo.NoticeVO;

public class NoticeDAO {
	public static List<NoticeVO> selBoardList(NoticeVO param) {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		
		String sql = " SELECT A.i_notice, A.title, A.ctnt, B.nickname as nm, A.r_dt "
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
					String ctnt = rs.getString("ctnt");
					String nm = rs.getString("nm");
					String r_dt = rs.getString("r_dt");
					
					NoticeVO vo = new NoticeVO();
					vo.setI_notice(i_notice);
					vo.setTitle(title);
					vo.setCtnt(ctnt);
					vo.setNm(nm);
					vo.setR_dt(r_dt);
					
					list.add(vo);
				}
				return 0;
			}
		});
		
		return list;
	}
}
