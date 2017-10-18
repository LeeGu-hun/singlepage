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
	public void PboardWrite(final Pboard pboard) {
		jdbcTemplate.update("insert into pboard values(pbid_seq.nextval, ?, ?, ?, ?, 0, 0, 0, 0, sysdate, ?, ?)",
				pboard.getPbsubject(), pboard.getPbcontent(), pboard.getPbfile(), pboard.getPbnewfile(), 1, 1);
		int currpbid = jdbcTemplate.queryForInt("select pbid_seq.currval from dual");
		jdbcTemplate.update("update pboard set pbre_ref = ? where pbid = ?",
				currpbid, currpbid);
	}
}
