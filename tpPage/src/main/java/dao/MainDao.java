package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import board.Pboard;
import main.Loc;

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
	
	public List<Pboard> getBoardListRandom(int number) {
		Object row[] = new Object[number];
		String sql = "select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard order by pbRE_REF desc, pbRE_SEQ asc)) where ";
		for (int i = 0; i < number; i++) {
			row[i] = (int)(Math.random() * count() + 1);
			sql += " rnum = ? ";
			if (i != number-1) {
				sql += " or ";
			}
		}

		List<Pboard> board = jdbcTemplate.query(sql, row, boRowMapper);
		return board; 
	}
	
	public String time(String str) {
		if(str.length()<2) str = "0" + str;
		str += ":00";
		return str;
	}
	
	public List<Pboard> getBoardListSome(int page, int limit, ArrayList<String> opts) {
		String sql = "select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid from (select * from pboard pb, page p where pb.pbhostid = p.pid ";
		String sub = "";
		for (int i=0; i <= opts.size()-1; i++) {
			String code = opts.get(i).split("=")[0];
			String[] val = opts.get(i).split("=")[1].split(",");
			if(val.length>1) sub += " ( ";
			for (int j=0; j <=val.length-1;j++) {
				if (val[j].equals("전체")) continue;
				if(code.equals("pshowtime")) {
					String start = val[j].split("~")[0];
					String end = val[j].split("~")[1];
					start = time(start);
					end = time(end);
					if(val.length>1) sub += " ( ";
					sub += code.trim() + " between " + start + " and " + end;
					if(val.length>1) sub += " ) ";
				} else {
					sub += code.trim() + " like ";
					sub += "'%" + val[j].trim() + "%'";
				}
				if(j != val.length-1) sub += " or ";
			}
			if(val.length>1) sub += " ) ";
			if (i != opts.size()-1) sub += " and ";
		}
		if (sub.length() > 0) sql += " and " + sub;
		sql += " order by pbRE_REF desc, pbRE_SEQ asc)) where rnum >= ? and rnum<= ?";
		
		System.out.println(sql);
		List<Pboard> boardList = jdbcTemplate.query(sql, boRowMapper, page, limit);
		return boardList;
	}
	
	public List<Loc> getSidoList() {
		List<Loc> locList = jdbcTemplate.query("select distinct sido from locdb", new RowMapper<Loc>() {
			@Override
			public Loc mapRow(ResultSet rs, int rowNum) throws SQLException {
				Loc loc = new Loc(rs.getString("sido"), null); 
				return loc;
			}
		});
		return locList;
	}
	
	public List<Loc> getGunguList() {
		List<Loc> locList = jdbcTemplate.query("select * from locdb", new RowMapper<Loc>() {
			@Override
			public Loc mapRow(ResultSet rs, int rowNum) throws SQLException {
				Loc loc = new Loc(rs.getString("sido"), rs.getString("gungu")); 
				return loc;
			}
		});
		return locList;
	}
}
