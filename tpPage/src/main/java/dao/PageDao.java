package dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Transactional;

import page.Page;
import page.PageLike;

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
		jdbcTemplate.update("insert into page values(pid_seq.nextval, ?, ?, ?, ?, ?, sysdate, '00:00', 0, sysdate, ?, ?, ?)",
				page.getPname(), page.getPnick(), page.getPintro(), page.getPgenre(), page.getPloc(), page.getPmaster(),
				page.getPfile(), page.getPnewfile());
		
		Integer pid = jdbcTemplate.queryForObject("select pid from page where pmaster = ?", Integer.class, page.getPmaster());
		return pid;
	}
}

