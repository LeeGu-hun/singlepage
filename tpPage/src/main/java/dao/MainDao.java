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
import page.Page;
import page.PageLike;

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
			board.setPname(rs.getString("pname"));
			board.setMname(rs.getString("mname"));
			return board;
		}
	};

	

	public MainDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from pboard where pbre_lev = 0", Integer.class);
		return count;
	}
	
	public List<Pboard> getBoardListRandom(int number) {
		Object row[] = new Object[number];
		String sql = "select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid, pname, mname from (select * from pboard pb, page p, member m where pb.pbhostid = p.pid and p.pmaster = m.mid and pbre_lev = 0 order by pbRE_REF desc, pbRE_SEQ asc)) where ";
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
		String sql = "select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid, pname, mname from (select * from pboard pb, page p, showtime st, member m where pb.pbhostid = p.pid and p.pid = st.pid and p.pmaster = m.mid and pbre_lev = 0 ";
		String sub = "";
		for (int i=0; i <= opts.size()-1; i++) {
			String code = opts.get(i).split("=")[0];
			String[] val = opts.get(i).split("=")[1].split(",");
			if(val.length>1) sub += " ( ";
			for (int j=0; j <=val.length-1;j++) {
				if (val[j].equals("전체")) continue;
				if(code.equals("pshowtime")) {
					int start = Integer.parseInt(val[j].split("~")[0]);
					int end = Integer.parseInt(val[j].split("~")[1]);
					if (start > 24) start -= 24;
					if (end > 24) end -= 24;
					if(val.length>1) sub += " ( ";
					sub += " showstart > " + start + " and showend < " + end;
					if(val.length>1) sub += " ) ";
				} else if (code.equals("pperiod")) {
					if (Integer.parseInt(val[j]) == 5) {
						sub += " trunc((sysdate - pperiod)/365) >= " + val[j];
					} else {
						sub += " trunc((sysdate - pperiod)/365) = " + val[j];
					}
				} else {
					sub += code.trim() + " like ";
					if (val[j].trim().split(" ").length > 1) {
						sub += "'%" + val[j].trim().split(" ")[0] + "%' and ";
						sub += code.trim() + " like ";
						sub += "'%" + val[j].trim().split(" ")[1] + "%'";
					} else {
						sub += "'%" + val[j].trim() + "%'";
					}
				}
				if(j != val.length-1) sub += " or ";
			}
			if(val.length>1) sub += " ) ";
			if (i != opts.size()-1) sub += " and ";
		}
		if (sub.length() > 0) sql += " and " + sub;
		sql += " order by pbRE_REF desc, pbRE_SEQ asc)) where rnum >= ? and rnum<= ?";
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

	public List<Pboard> getBoardListFavo(int page, int limit, int mid) {
		List<PageLike> select = jdbcTemplate.query("select distinct pid from page_like where mid = ?", new RowMapper<PageLike>() {
			@Override
			public PageLike mapRow(ResultSet rs, int rowNum) throws SQLException {
				PageLike pid = new PageLike();
				pid.setPid(rs.getInt(1));
				return pid;
			}
		}, mid);
		List<PageLike> favoPid = new ArrayList<PageLike>();
		if(!select.isEmpty()) {
			String sql = "select mid, plike, pid, plike_date from (select mid, plike, pid, plike_date from page_like where pid = ? order by plike_date desc) where rownum = 1";
			for(int i=0;i<select.size();i++) {
				PageLike plike = jdbcTemplate.queryForObject(sql, new RowMapper<PageLike>() {
				@Override
				public PageLike mapRow(ResultSet rs, int rowNum) throws SQLException {
					PageLike pageLike = new PageLike();
					pageLike.setPid(rs.getInt("pid"));
					pageLike.setPlike(rs.getInt("plike"));
					return pageLike;
				}
				}, select.get(i).getPid());
			if(plike.getPlike() != 0) favoPid.add(plike);
			}
		}
		if(favoPid.size()>0) {
			String sql = "select * from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid, pname, mname from (select * from pboard pb, page p, member m where pb.pbhostid = p.pid and p.pmaster = m.mid and pbre_lev = 0 ";
			sql += " and (";
			for(int i = 0; i <favoPid.size(); i++) {
				sql += " pbhostid = " + favoPid.get(i).getPid();
				if(i != favoPid.size()-1) sql += " or ";
			}
			sql += " ) ";
			sql += " order by pbdate desc)) where rnum >= ? and rnum<= ?";
			List<Pboard> favoList = jdbcTemplate.query(sql, boRowMapper, page, limit);
			return favoList;
		} else {
			return null;
		}
	}

	public List<Page> getFavoList(int mid) {
		List<PageLike> select = jdbcTemplate.query("select distinct pid from page_like where mid = ?", new RowMapper<PageLike>() {
			@Override
			public PageLike mapRow(ResultSet rs, int rowNum) throws SQLException {
				PageLike pid = new PageLike();
				pid.setPid(rs.getInt(1));
				return pid;
			}
		}, mid);
		List<PageLike> favoPid = new ArrayList<PageLike>();
		if(!select.isEmpty()) {
			String sql = "select mid, plike, pid, plike_date from (select mid, plike, pid, plike_date from page_like where pid = ? order by plike_date desc) where rownum = 1";
			for(int i=0;i<select.size();i++) {
				PageLike plike = jdbcTemplate.queryForObject(sql, new RowMapper<PageLike>() {
				@Override
				public PageLike mapRow(ResultSet rs, int rowNum) throws SQLException {
					PageLike pageLike = new PageLike();
					pageLike.setPid(rs.getInt("pid"));
					pageLike.setPlike(rs.getInt("plike"));
					return pageLike;
				}
				}, select.get(i).getPid());
			if(plike.getPlike() != 0) favoPid.add(plike);
			}
		}
		if(favoPid.size()>0) {
			String sql = "select * from page where ";
			sql += " (";
			for(int i = 0; i <favoPid.size(); i++) {
				sql += " pid = " + favoPid.get(i).getPid();
				if(i != favoPid.size()-1) sql += " or ";
			}
			sql += " ) ";
			List<Page> favoList = jdbcTemplate.query(sql, new RowMapper<Page>() {
				@Override
				public Page mapRow(ResultSet rs, int rowNum) throws SQLException {
					Page page = new Page(rs.getInt("pid"), rs.getString("pname"), rs.getString("pnick"), rs.getString("pgenre"), rs.getString("ploc"), rs.getString("pnewfile"));
					return page;
				}
			});			
			return favoList;
		}
		return null;
	}
}
