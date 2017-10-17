package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.transaction.annotation.Transactional;

import board.Pboard;

public class PboardDao {

	private JdbcTemplate jdbcTemplate;

	public PboardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Transactional
	public Pboard PboardWrite(final Pboard pboard) {
		System.out.println("1");
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into pboard values(pbid_seq.nextval, ?, ?, ?, ?, 0, 0, 0, 0, sysdate, ?, ?)");
				System.out.println("11");
				pstmt.setString(1, pboard.getPbsubject());
				pstmt.setString(2, pboard.getPbcontent());
				pstmt.setString(3, pboard.getPbfile());
				pstmt.setString(4, pboard.getPbnewfile());
				pstmt.setInt(5, pboard.getPbhostid());
				pstmt.setInt(6, pboard.getPbwriterid());
				System.out.println("111");
				return pstmt;
			}
		});
		System.out.println("2");
		int currpbid = jdbcTemplate.queryForInt("select pbid_seq.currval from dual");
		System.out.println("3");
		jdbcTemplate.update("update pboard set pbre_ref = ? where pbid = ?",
				currpbid, currpbid);
		return pboard;
	}
}
