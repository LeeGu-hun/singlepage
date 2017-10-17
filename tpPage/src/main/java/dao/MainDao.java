package dao;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class MainDao {
	private JdbcTemplate jdbcTemplate;

	public MainDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int count() {
		Integer count = jdbcTemplate.queryForInt("select count(*) from board");
		return count;
	}
}
