package com.lsl.wm.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lsl.wm.vo.UserVO;

public class UserDAO {
	public static int insUser(UserVO param) {
		String sql = " INSERT INTO t_user " 
				+ " (user_email, nickname, user_pw, salt, user_year, user_month, user_date, news) " 
				+ " VALUES " 
				+ " ( ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {
			
			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setNString(1, param.getUser_email());
				ps.setNString(2, param.getNickname());
				ps.setNString(3, param.getUser_pw());
				ps.setNString(4, param.getSalt());
				ps.setNString(5, param.getUser_year());
				ps.setNString(6, param.getUser_month());
				ps.setNString(7, param.getUser_date());
				ps.setNString(8, param.getNews());
			}
		});
	}
}
