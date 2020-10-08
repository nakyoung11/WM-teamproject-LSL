package com.lsl.wm.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lsl.wm.vo.ShowVO;

public class ShowDAO {
	public static List<ShowVO> selShowList(ShowVO param) {
		List<ShowVO> list = new ArrayList<ShowVO>();
		
		String sql = " SELECT title "
				   + " FROM t_show WHERE title like ? ";
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setNString(1, param.getSearchText());
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				if(rs.next()) {
					String title = rs.getNString("title");
					
					param.setTitle(title);
					
					list.add(param);
				}
				return 0;
			}
		});
		return list;

	}
}
