package dao;


import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import page.Page;

public class PageDao {
	private JdbcTemplate jdbcTemplate;
	
	public PageDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
//	public void LikePage(Page page) {
//		jdbcTemplate.update("insert into page_like values(?, ?, ?, sysdate)",);
//	}
	
}
