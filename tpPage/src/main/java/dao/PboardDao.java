package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import board.Pboard;

public class PboardDao {

	private JdbcTemplate jdbcTemplate;

	public PboardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Transactional
	public Pboard PboardWrite(final Pboard pboard) {
		System.out.println("dao");
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into pboard",
						new String[] {"pbid"});
				pstmt.setInt(1, pboard.getPbhostid());
				pstmt.setInt(2, pboard.getPbwriterid());
				pstmt.setString(3, pboard.getPbsubject());
				pstmt.setString(4, pboard.getPbcontent());
				pstmt.setString(5, pboard.getPbfile());
				pstmt.setString(6, pboard.getPbnewfile());
				pstmt.setInt(7, 0);
				return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		jdbcTemplate.update("update pboard set pbre_ref = ? where pbid = ?",
				keyValue.intValue(), keyValue.intValue());
		pboard.setPbid(keyValue.intValue());
		return pboard;
	}
}
