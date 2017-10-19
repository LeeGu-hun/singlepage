package dao;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import board.Mboard;
import board.Pboard;

public class BoardDao {

	private JdbcTemplate jdbcTemplate;

	public BoardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Transactional
	public void PboardWrite(final Pboard pboard) {
		jdbcTemplate.update("insert into pboard values(pbid_seq.nextval, ?, ?, ?, ?, 0, 0, 0, 0, sysdate, ?, ?)",
				pboard.getPbsubject(), pboard.getPbcontent(), pboard.getPbfile(), pboard.getPbnewfile(), 1, 1);
		Integer currpbid = jdbcTemplate.queryForObject("select pbid_seq.currval from dual", Integer.class);
		jdbcTemplate.update("update pboard set pbre_ref = ? where pbid = ?",
				currpbid, currpbid);
	}

	public void MboardWrite(final Mboard mboard) {
		
		
	}
}
