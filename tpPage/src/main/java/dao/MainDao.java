package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
//	private RowMapper<Pboard> pRowMapper = new RowMapper<Pboard>() {
//		@Override
//		public Pboard mapRow(ResultSet rs, int rowNum) throws SQLException {
//			Pboard board = new Pboard(rs.getInt("pbid"),
//					rs.getInt("pbre_ref"),
//					rs.getInt("pbre_lev"),
//					rs.getInt("pbre_seq"),
//					rs.getInt("pbreadcount"),
//					rs.getInt("pbhostid"),
//					rs.getInt("pbwriterid"),
//					rs.getString("pbsubject"),
//					rs.getString("pbcontent"),
//					rs.getString("pbfile"),
//					rs.getString("pbnewfile"),
//					rs.getTimestamp("pbdate"));
//			return board;
//		}
//	};

	public MainDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from pboard", Integer.class);
		return count;
	}
	
	public List<Pboard> getBoardListAll(int page, int limit) {
		List<Pboard> boardList = jdbcTemplate.query("sel1ect * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard order by pbRE_REF desc, pbRE_SEQ asc)) where rnum >= ? and rnum<= ?", boRowMapper, page, limit);
		return boardList; 
	}
	
	public Pboard getBoardListRandom() {
		int i = (int)(Math.random() * count() + 1);
		Pboard board = jdbcTemplate.queryForObject("select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard order by pbRE_REF desc, pbRE_SEQ asc)) where rnum = ?", boRowMapper, i);
		return board; 
	}
	
	public List<Pboard> getBoardListSome(int page, int limit, ArrayList<String> opts) {
		String sql = "select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard pb, page p where pb.pbhostid = p.pid ";
		if (!opts.isEmpty()) sql += " and ";
		for (int i=0; i <= opts.size()-1; i++) {
			String code = opts.get(i).split("=")[0];
			String[] val = opts.get(i).split("=")[1].split(",");
			for (int j=0; j <=val.length-1;j++) {
				sql += code.trim() + "=";
				sql += "'" + val[j].trim() + "'";
				if(j != val.length-1) sql += " and ";
			}
			if (i != opts.size()-1) sql += " and ";
		}
		sql += " order by pbRE_REF desc, pbRE_SEQ asc)) where rnum >= ? and rnum<= ?";
		
		System.out.println(sql);
		
		List<Pboard> boardList = jdbcTemplate.query(sql, boRowMapper, page, limit);
		return boardList;
	}
}
