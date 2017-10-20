package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import board.Pboard;

public class MainDao {
	private JdbcTemplate jdbcTemplate;
	private RowMapper<Pboard> boRowMapper = new RowMapper<Pboard>() {
		@Override
		public Pboard mapRow(ResultSet rs, int rowNum) throws SQLException {
			Pboard board = new Pboard(rs.getInt("pbid"),
					rs.getInt("pbre_ref"),
					rs.getInt("pbre_lev"),
					rs.getInt("pbre_seq"),
					rs.getInt("pbreadcount"),
					rs.getInt("pbhostid"),
					rs.getInt("pbwriterid"),
					rs.getString("pbsubject"),
					rs.getString("pbcontent"),
					rs.getString("pbfile"),
					rs.getString("pbnewfile"),
					rs.getTimestamp("pbdate"));
			return board;
		}
	};

	public MainDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from pboard", Integer.class);
		return count;
	}
	
	public List<Pboard> getBoardListAll(int page, int limit) {
		List<Pboard> boardList = jdbcTemplate.query("select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard order by pbRE_REF desc, pbRE_SEQ asc)) where rnum >= ? and rnum<= ?", boRowMapper, page, limit);
		return boardList; 
	}
	
	public Pboard getBoardListRandom() {
		int i = (int)(Math.random() * count() + 1);
		Pboard board = jdbcTemplate.queryForObject("select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard order by pbRE_REF desc, pbRE_SEQ asc)) where rnum = ?", boRowMapper, i);
		return board; 
	}
	
	public List<Pboard> getBoardListSome(int page, int limit, String where, String what) {
		List<Pboard> boardList = jdbcTemplate.query("select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard where ? = ? order by pbRE_REF desc, pbRE_SEQ asc)) where rnum >= ? and rnum<= ?", boRowMapper, where, what, page, limit);
		return boardList;
	}
}
