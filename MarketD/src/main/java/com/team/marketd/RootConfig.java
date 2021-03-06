package com.team.marketd;



import java.io.IOException;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ComponentScan(basePackages = {"com.team.marketd"}, 
excludeFilters = @ComponentScan.Filter(Controller.class))
@EnableTransactionManagement
@Configuration
public class RootConfig {
	String driver = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	String url = "jdbc:log4jdbc:oracle:thin://@192.168.0.59:1521:XE";
	String username = "system";
	String password ="1111";
	
	@Bean
	public DriverManagerDataSource db () {
		DriverManagerDataSource dmb =new DriverManagerDataSource(url,username,password);
		dmb.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
				return dmb;
				
	}
	@Bean
	public DataSourceTransactionManager transactionManager() {
		DataSourceTransactionManager dt = new DataSourceTransactionManager();
		dt.setDataSource(db());
		return dt;
	}
	@Bean
	public SqlSessionFactory SqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sql = new SqlSessionFactoryBean();
		sql.setDataSource(db());
		try {
			sql.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("/mappers/*.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql.setConfigLocation(new ClassPathResource("/config/mybatis_config.xml"));
		return(SqlSessionFactory)sql.getObject();
	}
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		SqlSessionTemplate st = new SqlSessionTemplate(SqlSessionFactory());
		return st;
	}
	

}
