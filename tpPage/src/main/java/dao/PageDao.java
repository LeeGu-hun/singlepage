	package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Transactional;

import board.Pboard;
import page.Page;
import page.PageLike;
import page.PageTop;

public class PageDao {
	private JdbcTemplate jdbcTemplate;
	
	public PageDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<PageLike> plikeCheck(int memId, int pageId) {
		List<PageLike> ck = jdbcTemplate.query("select plike from (select * from page_like where mid=? and pid=? "
				+ "order by plike_date desc) where rownum = 1", new RowMapper<PageLike>() {
					@Override
					public PageLike mapRow(ResultSet rs, int rowNum) throws SQLException {
						PageLike pageLike = new PageLike(
								rs.getInt("plike"));
						return pageLike;
					}
				}, memId, pageId);
		return ck;
	}
	
	public void plikeToggle(int ck, int memId, int pageId) {

		jdbcTemplate.update("insert into page_like values(?, ?, ?, sysdate)", memId, ck, pageId);
	}

	@Transactional
	public int makePage(final Page page) {
		jdbcTemplate.update("insert into page values(pid_seq.nextval, ?, ?, ?, ?, ?, ?, ?, 0, sysdate, ?, ?, ?, ?, ?)",
				page.getPname(), page.getPnick(), page.getPintro(), page.getPgenre(), page.getPloc(), page.getPperiod(), page.getPshowtime(),
				page.getPmaster(), page.getPfile(), page.getPnewfile(), page.getPlatlng(), page.getProfile());
		
		Integer pid = jdbcTemplate.queryForObject("select pid from page where pmaster = ?", Integer.class, page.getPmaster());
		return pid;
	}
	
	public void adminPage1(int host, final Page page) {
		jdbcTemplate.update("update page set pname=?, pnick=?, pintro=?, pgenre=?, ploc=?, pperiod=?, "
				+ "pshowtime=?, pfile=?, pnewfile=?, platlng=?, profile=? where pid=?",
				page.getPname(), page.getPnick(), page.getPintro(), page.getPgenre(), page.getPloc(), 
				page.getPperiod(), page.getPshowtime(),page.getPfile(), page.getPnewfile(), 
				page.getPlatlng(), page.getProfile(), host);
	}
	
	public void adminPage2(int host, final Page page) {
		jdbcTemplate.update("update page set pname=?, pnick=?, pintro=?, pgenre=?, ploc=?, pperiod=?, "
				+ "pshowtime=?, platlng=?, profile=? where pid=?",
				page.getPname(), page.getPnick(), page.getPintro(), page.getPgenre(), page.getPloc(), 
				page.getPperiod(), page.getPshowtime(),	page.getPlatlng(), page.getProfile(), host);
	}

	public Page getPage(int pageHostId) {
		List<Page> results = jdbcTemplate.query("select * from page where pid = ?",
				new RowMapper<Page>() {
					@Override
					public Page mapRow(ResultSet rs, int rowNom) throws SQLException {
						Page page = new Page(rs.getInt("pid"),
								rs.getInt("ppoint"), rs.getInt("pmaster"),
								rs.getString("pname"), rs.getString("pnick"),
								rs.getString("pintro"), rs.getString("pgenre"),
								rs.getString("ploc"), rs.getString("pfile"), rs.getString("pnewfile"),
								rs.getString("pshowtime"), rs.getTimestamp("pdate"), 
								rs.getTimestamp("pperiod"), rs.getString("platlng"),
								rs.getString("profile"));
						return page;
					}
		}, pageHostId);
		return results.isEmpty() ? null : results.get(0);
	}
	
	@Transactional
	public void regDonate(int mid, int pid, int point, int dmoney) {
		jdbcTemplate.update("insert into page_point values(?, ?, 'donate', sysdate, ?)", 
				pid, dmoney, mid);
		
		int ppoint=point + dmoney;
		jdbcTemplate.update("update page set ppoint=? where pid=?", ppoint, pid);
	}
	
	public List<Page> getRelatedPages(String genre, int hostId) {
		List<Page> lists;
		String sql = "select * from page where pgenre like '%" + genre + "%' ";
		sql += "and pid != ?";
		lists = jdbcTemplate.query(sql, new RowMapper<Page>() {
			@Override
			public Page mapRow(ResultSet rs, int rowNom) throws SQLException {
				Page page = new Page(rs.getInt("pid"),
						rs.getInt("ppoint"), rs.getInt("pmaster"),
						rs.getString("pname"), rs.getString("pnick"),
						rs.getString("pintro"), rs.getString("pgenre"),
						rs.getString("ploc"), rs.getString("pfile"), rs.getString("pnewfile"),
						rs.getString("pshowtime"), rs.getTimestamp("pdate"), rs.getTimestamp("pperiod"),
						rs.getString("platlng"), rs.getString("profile"));
				return page;
			}
		}, hostId);
		if(lists.size()>5) {
			while(lists.size()>5) {
				int i = (int) (Math.random()*lists.size()+1);
				lists.remove(i);
			}
		}
		return lists;
	}
	
	public List<PageTop> selectTop(int pid) {
		List<PageTop> tlist = jdbcTemplate.query("select * from toplist where pid=? order by turn", 
				new RowMapper<PageTop>() {
					@Override
					public PageTop mapRow(ResultSet rs, int rowNum) throws SQLException {
							PageTop ptop = new PageTop(rs.getInt("pid"), rs.getInt("tid"), rs.getInt("tcheck"), rs.getInt("turn"),
									rs.getString("url"), rs.getString("thum"), rs.getString("newthum"));
						return ptop;
					}				
				},
		pid);
		
		return tlist.isEmpty()?null:tlist;
	}
	
	public void addToplist1(int pid, String turn, String link, String thum, String newthum, String checked) {
		jdbcTemplate.update("insert into toplist values(?, tid_seq.nextval, ?, ?, ?, ?, ?)", 
				pid, turn, link, thum, newthum, checked);
	}
	
	public void addToplist2(int pid, String turn, String link, String checked) {
		jdbcTemplate.update("insert into toplist(pid, tid, turn, url, tcheck) values(?, tid_seq.nextval, ?, ?, ?)", 
				pid, turn, link, checked);
	}
	
	public void updateToplist1(String tid, String turn, String link, String thum, String newthum, String checked) {
		jdbcTemplate.update("update toplist set turn=?, url=?, thum=?, newthum=?, tcheck=? where tid=? ", 
				turn, link, thum, newthum, checked, tid);
	}
	
	public void updateToplist2(String tid, String turn, String link, String checked) {
		jdbcTemplate.update("update toplist set turn=?, url=?, tcheck=? where tid=? ", 
				turn, link, checked, tid);
	}
	
	public List<PageTop> selectCarousel(int pid) {
		List<PageTop> tlist = jdbcTemplate.query("select * from toplist where pid=? and tcheck=1 order by turn", 
				new RowMapper<PageTop>() {
					@Override
					public PageTop mapRow(ResultSet rs, int rowNum) throws SQLException {
							PageTop ptop = new PageTop(rs.getInt("pid"), rs.getInt("tid"), rs.getInt("tcheck"), rs.getInt("turn"),
									rs.getString("url"), rs.getString("thum"), rs.getString("newthum"));
						return ptop;
					}				
				},
		pid);
		
		return tlist.isEmpty()?null:tlist;
	}
	
	public void deleteTurn(int pid, String turn) {
		jdbcTemplate.update("delete from toplist where pid=? and turn=?", pid, turn);
	}
	
	public String selectExistTurn(String turn, int pid) {
		try {
			String tid = jdbcTemplate.queryForObject("select tid from toplist where turn=? and pid=?", String.class, turn, pid);
			return tid;
		} catch (EmptyResultDataAccessException e) {
			return "";
		}
	}

	public int likeCnt(int pageHostId) {
		Integer cnt = jdbcTemplate.queryForObject("select count(distinct mid) from page_like where pid=? and plike=1", Integer.class, pageHostId);
		return cnt;
	}
}

