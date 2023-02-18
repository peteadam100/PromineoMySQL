package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {
	private static final String HOST = "localhost";
	private static final int PORT = 3306;
	private static final String SCHEMA = "recipes";
	private static final String USER = "recipes";
	private static final String PASSWORD = "recipes";
	

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
