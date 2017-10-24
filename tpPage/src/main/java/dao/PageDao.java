package dao;


import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import page.Page;
import page.PageLike;

public class PageDao {
	private JdbcTemplate jdbcTemplate;
	
	public PageDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
//	public void LikePage(Page page) {
//		jdbcTemplate.update("insert into page_like values(?, ?, ?, sysdate)",);
//	}
	
	public int plikeCheck() {
		int ck = jdbcTemplate.queryForObject("select plike from (select * from page_like where mid=? and pid=? "
				+ "order by plike_date desc) where rownum = 1", Integer.class, 1, 1);
		return ck;
	}
	
	public void plikeToggle() {
		jdbcTemplate.update("insert into page_like values(?, ?, ?, sysdate)", 1, 1, 1);
	}
}
