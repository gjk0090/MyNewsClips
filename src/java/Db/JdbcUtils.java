package Db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public final class JdbcUtils {
	  
	private static String registDriver = DbConfig.getRegistDriver();
	private static String url = DbConfig.getUrl();
	private static String username = DbConfig.getUsername();
	private static String password = DbConfig.getPassword();
	
	static {
		try {
			Class.forName(registDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("connect to DB");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(ResultSet rs, Statement stmt, Connection conn) {

		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	public static void main(String[] args) {
		JdbcUtils.getConnection();
	}

}
