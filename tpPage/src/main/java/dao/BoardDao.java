package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.cglib.core.GeneratorStrategy;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import board.Mboard;
import board.Pblike;
import board.Pboard;

public class BoardDao {

	private JdbcTemplate jdbcTemplate;

	public BoardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public int getPboardListCount(int pageHostId) {
		Integer x = jdbcTemplate.queryForObject("select count(*) from pboard where pbhostid = ? and pbre_lev = 0", Integer.class, pageHostId);
		return x;
	}		
		
	public List<Pboard> getPboardList(int pageHostId, int startPage, int endPage) {
		List<Pboard> results = jdbcTemplate.query("select * "
				+ "from (select rownum rnum, pbid, pbsubject, pbcontent, pbfile, pbnewfile, "
				+ "pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbdate, pbhostid, pbwriterid, pname, mname "
				+ "from (select * from member m, page p, pboard pb where m.mid = pb.pbwriterid and p.pid = pb.pbhostid "
				+ "and pb.pbhostid = ? and pbre_lev = 0 order by pbre_ref desc, pbre_seq asc)) where rnum >= ? and rnum <= ?",
				new RowMapper<Pboard>() {
					@Override
					public Pboard mapRow(ResultSet rs, int rowNom) throws SQLException {
						Pboard pboard = new Pboard(rs.getInt("pbid"), 
								rs.getString("pbsubject"), rs.getString("pbcontent"),
								rs.getString("pbfile"), rs.getString("pbnewfile"),
								rs.getInt("pbreadcount"), rs.getTimestamp("pbdate"),
								rs.getInt("pbhostid"), rs.getInt("pbwriterid"),
								rs.getString("pname"), rs.getString("mname"));
						return pboard;
					}
				}, pageHostId, startPage, endPage);
		return results;
	}
	
	public int getMboardListCount(int pageHostId) {
		Integer x = jdbcTemplate.queryForObject("select count(*) from mboard where mbhostid = ? and mbre_lev = 0", Integer.class, pageHostId);
		return x;
	}
	
	public List<Mboard> getMboardList(int pageHostId, int startPage, int endPage) {
		List<Mboard> results = jdbcTemplate.query("select * "
				+ "from (select rownum rnum, mbid, mbsubject, mbcontent, mbfile, mbnewfile, "
				+ "mbre_ref, mbre_lev, mbre_seq, mbreadcount, mbdate, mbhostid, mbwriterid, pname, mname "
				+ "from (select * from member m, page p, mboard mb where m.mid = mb.mbwriterid and p.pid = mb.mbhostid "
				+ "and mb.mbhostid = ? and mbre_lev = 0 order by mbre_ref desc, mbre_seq asc)) where rnum >= ? and rnum <= ?",
				new RowMapper<Mboard>() {
					@Override
					public Mboard mapRow(ResultSet rs, int rowNom) throws SQLException {
						Mboard mboard = new Mboard(rs.getInt("mbid"), 
								rs.getString("mbsubject"), rs.getString("mbcontent"),
								rs.getString("mbfile"), rs.getString("mbnewfile"),
								rs.getInt("mbreadcount"), rs.getTimestamp("mbdate"),
								rs.getInt("mbhostid"), rs.getInt("mbwriterid"),
								rs.getString("pname"), rs.getString("mname"));
						return mboard;
					}
				}, pageHostId, startPage, endPage);
		return results;
	}
	
	@Transactional
	public void PboardWrite(final Pboard pboard) {
		jdbcTemplate.update("insert into pboard values(pbid_seq.nextval, ?, ?, ?, ?, 0, 0, 0, 0, sysdate, ?, ?)",
				pboard.getPbsubject(), pboard.getPbcontent(), pboard.getPbfile(), pboard.getPbnewfile(), pboard.getPbhostid(), pboard.getPbwriterid());
		
		Integer currpbid = jdbcTemplate.queryForObject("select pbid_seq.currval from dual", Integer.class);

		jdbcTemplate.update("update pboard set pbre_ref = ? where pbid = ?", currpbid, currpbid);
	}

	@Transactional
	public void MboardWrite(final Mboard mboard) {
		jdbcTemplate.update("insert into mboard values(mbid_seq.nextval, ?, ?, ?, ?, 0, 0, 0, 0, sysdate, ?, ?)",
				mboard.getMbsubject(), mboard.getMbcontent(), mboard.getMbfile(), mboard.getMbnewfile(), mboard.getMbhostid(), mboard.getMbwriterid());
		
		Integer currmbid = jdbcTemplate.queryForObject("select mbid_seq.currval from dual", Integer.class);
		
		jdbcTemplate.update("update mboard set mbre_ref = ? where mbid = ?", currmbid, currmbid);	
	}

	public Pboard getpbDetail(int pbid) {
		List<Pboard> results = jdbcTemplate.query("select pbid, pbsubject, pbcontent, pbfile, pbnewfile, pbreadcount, pbdate, pbhostid, pbwriterid, pname, mname "
				+ "from (select * from member m, page p, pboard pb where m.mid = pb.pbwriterid and p.pid = pb.pbhostid and pbid = ?)",
				new RowMapper<Pboard>() {
					@Override
					public Pboard mapRow(ResultSet rs, int rowNum) throws SQLException {
						Pboard pboard = new Pboard(rs.getInt("pbid"), rs.getString("pbsubject"), rs.getString("pbcontent"),
								rs.getString("pbfile"), rs.getString("pbnewfile"), rs.getInt("pbreadcount"), rs.getTimestamp("pbdate"),
								rs.getInt("pbhostid"), rs.getInt("pbwriterid"), rs.getString("pname"), rs.getString("mname"));	
						return pboard;
					}	
				}, pbid);		
		return results.isEmpty() ? null : results.get(0);
	}

	public List<Pboard> getpbreDetail(int pbid) {
		List<Pboard> results = jdbcTemplate.query("select pbid, pbcontent, pbdate, pbhostid, pbwriterid, pbre_ref, pbre_lev, pbre_seq, pname, mname from "
				+ "(select * from member m, page p, pboard pb where m.mid = pb.pbwriterid and p.pid = pb.pbhostid and pbre_ref = ? and pbre_lev > 0 order by pbre_seq)",
				new RowMapper<Pboard>() {
					@Override
					public Pboard mapRow(ResultSet rs, int rowNum) throws SQLException {
						Pboard pboard = new Pboard(rs.getInt("pbid"), rs.getInt("pbre_ref"), rs.getInt("pbre_lev"), rs.getInt("pbre_seq"),
								rs.getInt("pbhostid"), rs.getInt("pbwriterid"), rs.getString("pbcontent"), rs.getString("pname"), rs.getString("mname"),
								rs.getTimestamp("pbdate"));
						return pboard;
					}					
				}, pbid);
		return results;
	}	
	
	@Transactional
	public void pbrewrite(int pbid, int pbreid, String pbcontent, int pbhostid, int pbwriterid) {
		int pbre_lev = jdbcTemplate.queryForObject("select pbre_lev from pboard where pbid = ?", Integer.class, pbreid);
		int pbre_seq = jdbcTemplate.queryForObject("select pbre_seq from pboard where pbid = ?", Integer.class, pbreid);
		
		jdbcTemplate.update("insert into pboard values(pbid_seq.nextval, 0, ?, null, null, ?, ?, ?, 0, sysdate, ?, ?)",
				pbcontent, pbid, pbre_lev + 1, pbre_seq, pbhostid, pbwriterid);
		
		int row = jdbcTemplate.queryForObject("select count(*) from pboard where pbre_ref = ? and pbre_lev > -1 and pbre_lev < ? and pbre_seq > ?", Integer.class,
				pbid, pbre_lev + 1, pbre_seq);
		
		if(row == 0) {
			int repbid = jdbcTemplate.queryForObject("select pbid_seq.currval from dual", Integer.class);
			int nowre_seq = jdbcTemplate.queryForObject("select * from (select pbre_seq from pboard where pbre_ref = ? order by pbre_seq desc) where rownum = 1", Integer.class, pbid);
			jdbcTemplate.update("update pboard set pbre_seq = ? where pbid = ?", nowre_seq + 1, repbid);
		} else {
			int repbid = jdbcTemplate.queryForObject("select pbid_seq.currval from dual", Integer.class);
			int nowre_seq = jdbcTemplate.queryForObject("select * from (select pbre_seq from pboard where pbre_ref = ? and pbre_lev < ? and pbre_seq > ? order by pbre_seq) where rownum = 1",
					Integer.class, pbid, pbre_lev + 1, pbre_seq);
			jdbcTemplate.update("update pboard set pbre_seq = pbre_seq + 1 where pbre_ref = ? and pbre_seq >= ?", pbid, nowre_seq);
			jdbcTemplate.update("update pboard set pbre_seq = ? where pbid = ?", nowre_seq, repbid);
		}
	}

	public Pblike pblikeChk(int mid, int pbid) {
		List<Pblike> results = jdbcTemplate.query("select pblike from (select * from pboard_like where mid = ? and pbid = ? "
				+ "order by pblike_date desc) where rownum = 1", new RowMapper<Pblike>() {
					@Override
					public Pblike mapRow(ResultSet rs, int rowNum) throws SQLException {
						Pblike pblike = new Pblike(rs.getInt("pblike"));
						return pblike;
					}
				}, mid, pbid);
		return results.isEmpty() ? null : results.get(0);
	}

	public void pblike(int pblikechk, int mid, int pbid) {
		jdbcTemplate.update("insert into pboard_like values(?, ?, ?, sysdate)", mid, pblikechk, pbid);		
	}

	public Mboard getmbDetail(int mbid) {
		List<Mboard> results = jdbcTemplate.query("select mbid, mbsubject, mbcontent, mbfile, mbnewfile, mbreadcount, mbdate, mbhostid, mbwriterid, pname, mname "
				+ "from (select * from member m, page p, mboard mb where m.mid = mb.mbwriterid and p.pid = mb.mbhostid and mbid = ?)",
				new RowMapper<Mboard>() {
					@Override
					public Mboard mapRow(ResultSet rs, int rowNum) throws SQLException {
						Mboard mboard = new Mboard(rs.getInt("mbid"), rs.getString("mbsubject"), rs.getString("mbcontent"),
								rs.getString("mbfile"), rs.getString("mbnewfile"), rs.getInt("mbreadcount"), rs.getTimestamp("mbdate"),
								rs.getInt("mbhostid"), rs.getInt("mbwriterid"), rs.getString("pname"), rs.getString("mname"));	
						return mboard;
					}	
				}, mbid);		
		return results.isEmpty() ? null : results.get(0);
	}

	public List<Mboard> getmbreDetail(int mbid) {
		List<Mboard> results = jdbcTemplate.query("select mbid, mbcontent, mbdate, mbhostid, mbwriterid, mbre_ref, mbre_lev, mbre_seq, pname, mname from "
				+ "(select * from member m, page p, mboard mb where m.mid = mb.mbwriterid and p.pid = mb.mbhostid and mbre_ref = ? and mbre_lev > 0 order by mbre_seq)",
				new RowMapper<Mboard>() {
					@Override
					public Mboard mapRow(ResultSet rs, int rowNum) throws SQLException {
						Mboard mboard = new Mboard(rs.getInt("mbid"), rs.getInt("mbre_ref"), rs.getInt("mbre_lev"), rs.getInt("mbre_seq"),
								rs.getInt("mbhostid"), rs.getInt("mbwriterid"), rs.getString("mbcontent"), rs.getString("pname"), rs.getString("mname"),
								rs.getTimestamp("mbdate"));
						return mboard;
					}					
				}, mbid);
		return results;
	}

	@Transactional
	public void mbrewrite(int mbid, int mbreid, String mbcontent, int mbhostid, int mbwriterid) {
		int mbre_lev = jdbcTemplate.queryForObject("select mbre_lev from mboard where mbid = ?", Integer.class, mbreid);
		int mbre_seq = jdbcTemplate.queryForObject("select mbre_seq from mboard where mbid = ?", Integer.class, mbreid);
		
		jdbcTemplate.update("insert into mboard values(mbid_seq.nextval, 0, ?, null, null, ?, ?, ?, 0, sysdate, ?, ?)",
				mbcontent, mbid, mbre_lev + 1, mbre_seq, mbhostid, mbwriterid);
		
		int row = jdbcTemplate.queryForObject("select count(*) from mboard where mbre_ref = ? and mbre_lev > -1 and mbre_lev < ? and mbre_seq > ?", Integer.class,
				mbid, mbre_lev + 1, mbre_seq);
		
		if(row == 0) {
			int rembid = jdbcTemplate.queryForObject("select mbid_seq.currval from dual", Integer.class);
			int nowre_seq = jdbcTemplate.queryForObject("select * from (select mbre_seq from mboard where mbre_ref = ? order by mbre_seq desc) where rownum = 1", Integer.class, mbid);
			jdbcTemplate.update("update mboard set mbre_seq = ? where mbid = ?", nowre_seq + 1, rembid);
		} else {
			int rembid = jdbcTemplate.queryForObject("select mbid_seq.currval from dual", Integer.class);
			int nowre_seq = jdbcTemplate.queryForObject("select * from (select mbre_seq from mboard where mbre_ref = ? and mbre_lev < ? and mbre_seq > ? order by mbre_seq) where rownum = 1",
					Integer.class, mbid, mbre_lev + 1, mbre_seq);
			jdbcTemplate.update("update mboard set mbre_seq = mbre_seq + 1 where mbre_ref = ? and mbre_seq >= ?", mbid, nowre_seq);
			jdbcTemplate.update("update mboard set mbre_seq = ? where mbid = ?", nowre_seq, rembid);
		}
	}

	public Pboard getPboard(int pbid) {
		List<Pboard> results = jdbcTemplate.query("select pbid from pboard where pbid = ?",
				new RowMapper<Pboard>() {
					@Override
					public Pboard mapRow(ResultSet rs, int rowNum) throws SQLException {
						Pboard pboard = new Pboard(rs.getInt("pbid"));
						return pboard;
					}
		}, pbid);
		return results.isEmpty() ? null : results.get(0);
	}
	
	public Mboard getMboard(int mbid) {
		List<Mboard> results = jdbcTemplate.query("select mbid from mboard where mbid = ?",
				new RowMapper<Mboard>() {
					@Override
					public Mboard mapRow(ResultSet rs, int rowNum) throws SQLException {
						Mboard mboard = new Mboard(rs.getInt("mbid"));
						return mboard;
					}
			
		}, mbid);
		return results.isEmpty() ? null : results.get(0);
	}

	public void pbrerm(int rmpbid) {
		String remove = "삭제된 댓글입니다.";
		int pbid = 0 - rmpbid;
		jdbcTemplate.update("update pboard set pbcontent = ?, pbid = ? where pbid = ?", remove, pbid, rmpbid);
	}

	public void pbidrm(int pbid) {
		jdbcTemplate.update("update pboard set pbre_lev = -1 where pbid = ?", pbid);
	}

	public void mbrerm(int rmmbid) {
		String remove = "삭제된 댓글입니다.";
		int mbid = 0 - rmmbid;
		jdbcTemplate.update("update mboard set mbcontent = ?, mbid = ? where mbid = ?", remove, mbid, rmmbid);
	}

	public void mbidrm(int mbid) {
		jdbcTemplate.update("update mboard set mbre_lev = -1 where mbid = ?", mbid);	
	}

	public void pballdrop(int pbhostid) {
		jdbcTemplate.update("update pboard set pbre_lev = -1 where pbhostid = ? and pbre_lev = 0", pbhostid);
	}

	public void mballdrop(int mbhostid) {
		jdbcTemplate.update("update mboard set mbre_lev = -1 where mbhostid = ? and mbre_lev = 0", mbhostid);
	}
}