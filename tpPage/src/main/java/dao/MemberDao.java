package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import member.Member;

public class MemberDao {

	private JdbcTemplate jdbcTemplate;

	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void memberJoin(final Member member) {
		jdbcTemplate.update("insert into member values(mid_seq.nextval, ?, ?, ?, null, null, null, sysdate)",
				member.getMemail(), member.getMname(), member.getMpw());
	}

//	public int count() {
//		Integer count = jdbcTemplate.queryForInt("select count(*) from MEMBER");
//		return count;
//	}
//
//	public Member selectByEmail(String email) {
//		List<Member> results = jdbcTemplate.query(
//				"select * from member where memail = ?",
//				new RowMapper<Member>() {
//					@Override
//					public Member mapRow(ResultSet rs, int rowNum)
//							throws SQLException {
//						Member member = new Member(rs.getString("memail"),
//								rs.getString("mpw"),
//								rs.getString("mname"),
//								rs.getTimestamp("mdate"));
//						member.setMid(rs.getInt("mid"));
//						return member;
//					}
//				},
//				email);
//
//		return results.isEmpty() ? null : results.get(0);
//	}
//	
//	public List<Member> selectAll() {
//		List<Member> results = jdbcTemplate.query("select * from member",
//				new RowMapper<Member>() {
//					@Override
//					public Member mapRow(ResultSet rs, int rowNum)
//							throws SQLException {
//						Member member = new Member(rs.getString("memail"),
//								rs.getString("mpw"),
//								rs.getString("mname"),
//								rs.getTimestamp("mdate"));
//						member.setMid(rs.getInt("mid"));
//						return member;
//					}
//				});
//		return results;
//	}
//	
//	public void update(Member member) {
//		jdbcTemplate.update("update member set mname = ?, mpw = ? where memail = ?",
//				member.getMname(), member.getMpw(), member.getMemail());
//	}

	
}