package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import member.AuthInfo;
import member.Member;
import page.Page;

public class MemberDao {

	private JdbcTemplate jdbcTemplate;

	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void memberJoin(final Member member) {
		jdbcTemplate.update("insert into member values(mid_seq.nextval, ?, ?, ?, null, null, 0, sysdate)",
				member.getMemail(), member.getMname(), member.getMpw());
	}

	public Member memberLogin(final Member chkmember) {
		List<Member> results = jdbcTemplate.query("select * from member where memail = ?", new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getInt("mid"), rs.getString("mname"), rs.getString("memail"),
						rs.getString("mpw"), rs.getString("mphone"), rs.getInt("mcheck"), rs.getInt("mpoint"),
						rs.getDate("mdate"));
				return member;
			}
		}, chkmember.getMemail());
		return results.isEmpty() ? null : results.get(0);
	}

	public Member selectByEmail(String email) {
		List<Member> results = jdbcTemplate.query("select * from member where memail = ?", new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("memail"));
				return member;
			}
		}, email);
		return results.isEmpty() ? null : results.get(0);
	}

	public Page getMemberPid(int mid) {
		List<Page> results = jdbcTemplate.query("select pid from page where pmaster = ?", new RowMapper<Page>() {
			@Override
			public Page mapRow(ResultSet rs, int rowNum) throws SQLException {
				Page pid = new Page(rs.getInt("pid"));
				return pid;
			}
		}, mid);
		return results.isEmpty() ? null : results.get(0);
	}
	
	public boolean changeMpw(String email, String newMpw) {
		boolean result = false;
		int update = jdbcTemplate.update("update member set mpw = ? where memail = ?", newMpw, email);
		System.out.println(newMpw + "///" + update);
		if (update > 0) result = true;
		return result;
	
	/*jdbcTemplate.update("update member set mpw = ? where memail = ?", authInfo.getMemail(), authInfo.getmp);*/
}

	public void memModify(int mid, String memail, String mname, String mphone) {
		
//		update member set memail = 'b', mname = 'b', mphone = '000' where mid = 63;
	}

//	public void memberModify(AuthInfo authInfo) {
//		jdbcTemplate.update("update member set memail = ?, mname = ?, mpw = ?, mphone=? where memail = ?", authInfo.getMemail(), authInfo.getMname(),
//				authInfo.get(), authInfo.getMphone());
//	}

	// public int count() {
	// Integer count = jdbcTemplate.queryForInt("select count(*) from MEMBER");
	// return count;
	// }
	//
	//
	// public List<Member> selectAll() {
	// List<Member> results = jdbcTemplate.query("select * from member",
	// new RowMapper<Member>() {
	// @Override
	// public Member mapRow(ResultSet rs, int rowNum)
	// throws SQLException {
	// Member member = new Member(rs.getString("memail"),
	// rs.getString("mpw"),
	// rs.getString("mname"),
	// rs.getTimestamp("mdate"));
	// member.setMid(rs.getInt("mid"));
	// return member;
	// }
	// });
	// return results;
	// }
}