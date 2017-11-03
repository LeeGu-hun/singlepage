package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Transactional;

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

	public Member selectByEmail(String memail) {
		List<Member> results = jdbcTemplate.query("select * from member where memail = ?", new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("memail"));
				return member;
			}
		}, memail);
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
	
	public boolean changeMpw(String memail, String newmpw) {
		boolean result = false;
		int update = jdbcTemplate.update("update member set mpw = ? where memail = ?", newmpw, memail);
		System.out.println(newmpw + "///" + update);
		if (update > 0) result = true;
		return result;  //비번변경, 비번찾기 때 쓴다.ㄴ
	
	/*jdbcTemplate.update("update member set mpw = ? where memail = ?", authInfo.getMemail(), authInfo.getmp);*/
}

	public void memModify(int mid, String memail, String mname, String mphone) {
		jdbcTemplate.update("update member set memail = ?, mname = ?, mphone = ? where mid = ?",
				memail, mname, mphone, mid);
	}
	
	public boolean mpwFind(String newmpw, String mpwrmemail) {
		boolean result = false;
		int update = jdbcTemplate.update("update member set mpw = ? where memail = ?", newmpw, mpwrmemail);
		System.out.println(newmpw + "///" + update);
		if (update > 0) result = true;
		return result;
	}
	
	@Transactional
	public void regDonate(int mid, int pid, int point, int dmoney) {
		jdbcTemplate.update("insert into mem_point values(?, ?, 'donate', sysdate, ?)", 
				mid, dmoney, pid);
		
		int mpoint = point - dmoney;
		jdbcTemplate.update("update member set mpoint=? where mid=?", mpoint, mid);
	}
	
	public String memPass(String email) {
		String pass = jdbcTemplate.queryForObject("select mpw from member where memail = ?", String.class, email);
		return pass;
	}
	
	public void ckUpdate(String email, String phone) {
		jdbcTemplate.update("update member set mcheck = 1, mphone=? where memail=?", phone, email);
	}
	
	public void regCharge(int mid, int charge, int mpoint) {
		jdbcTemplate.update("insert into mem_point values(?, ?, 'charge', sysdate, null)", 
				mid, charge);
		int point = charge + mpoint;
		jdbcTemplate.update("update member set mpoint=? where mid=?", point, mid);
	}
	
	public Member getAuthInfo(int mid) {
		List<Member> results = jdbcTemplate.query("select * from member where mid = ?", new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getInt("mid"), rs.getString("mname"), rs.getString("memail"),
						rs.getString("mpw"), rs.getString("mphone"), rs.getInt("mcheck"), rs.getInt("mpoint"),
						rs.getDate("mdate"));
				return member;
			}
		}, mid);
		return results.isEmpty() ? null : results.get(0);
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