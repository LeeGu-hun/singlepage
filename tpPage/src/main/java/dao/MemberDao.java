package dao;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;


public class MemberDao {

	private JdbcTemplate jdbcTemplate;

	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int count() {
		Integer count = jdbcTemplate.queryForInt("select count(*) from MEMBER");
		return count;
	}
	
}
