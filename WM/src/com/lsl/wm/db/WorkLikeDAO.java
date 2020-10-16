package com.lsl.wm.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lsl.wm.vo.WorkLikeDomain;
import com.lsl.wm.vo.WorkLikeVO;
import com.lsl.wm.vo.WorkVO;

public class WorkLikeDAO {
	// 작품의 좋아요를 삽입하는 메소드
	public static int insWorkLike(WorkLikeVO param) {
		String sql = " INSERT INTO t_work_like " + " (i_user, i_work) " + " VALUES " + " (?, ?) ";

		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {

			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_user());
				ps.setInt(2, param.getI_work());
			}
		});
	}

	// 특정 사용자의 좋아요 여부를 조회하는 메소드(1이면 좋아요 됨 0이면 좋아요 안됨)
	public static WorkLikeDomain selWorkLike(WorkLikeDomain param) {
		String sql = " SELECT count(i_user) as cnt" + " FROM t_work_like " + " WHERE i_user = ? AND i_work = ?";

		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {

			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_user());
				ps.setInt(2, param.getI_work());
			}

			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while (rs.next()) {
					param.setIsLike(rs.getInt("cnt"));
				}
				return 0;
			}
		});

		return param;
	}

	// 특정 작품의 좋아요 개수를 읽어오는 메소드
	public static WorkLikeDomain selWorkLikeCnt(WorkLikeVO param) {
		String sql = " SELECT count(i_user) as cnt" + " FROM t_work_like " + " WHERE i_work = ?";

		WorkLikeDomain domain = new WorkLikeDomain();
		domain.setWorkLikeCnt(0);

		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {

			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_work());
			}

			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while (rs.next()) {
					domain.setWorkLikeCnt(rs.getInt("cnt"));
				}
				return 0;
			}
		});

		return domain;
	}

	// 좋아요 여부를 삭제하는 메소드
	public static int delWorkLike(WorkLikeVO param) {
		String sql = " DELETE " + " FROM t_work_like " + " WHERE " + " i_user = ? AND i_work = ? ";

		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {

			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getI_user());
				ps.setInt(2, param.getI_work());
			}
		});
	}

}
