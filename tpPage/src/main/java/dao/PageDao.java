package dao;


import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import page.Page;
import page.PageLike;

public class PageDao {
	private JdbcTemplate jdbcTemplate;
	
	public PageDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int plikeCheck() {
		int ck = jdbcTemplate.queryForObject("select plike from (select * from page_like where mid=? and pid=? "
				+ "order by plike_date desc) where rownum = 1", Integer.class, 1, 1);
		return ck;
	}
	
	public void plikeToggle() {
		jdbcTemplate.update("insert into page_like values(?, ?, ?, sysdate)", 1, 1, 1);
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

