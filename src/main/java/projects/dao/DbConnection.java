package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {
//	private static final String HOST = "localhost";
//	private static final int PORT = 3306;
	private static final String HOST = "10.4.50.100";
	private static final int PORT = 49154;
	private static final String SCHEMA = "projects";
	private static final String USER = "projects_user";
	private static final String PASSWORD = "projects";
	

	public static Connection getConnection() {
		String uri = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s", HOST, PORT, SCHEMA, USER, PASSWORD); 
		System.out.println("Attempting to connect to the database [" + SCHEMA + "]");
		try {
			Connection connection = DriverManager.getConnection(uri);
			System.out.println("Connection was successful!!");
			return connection;
		} catch (SQLException e) {
			System.out.println("Connection FAILED");
			throw new DbException(e);
		}
	}

}
