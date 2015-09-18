package Db;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DbConfig {

	private static String registDriver = null;
	private static String url = null;
	private static String username = null;
	private static String password = null;

	static {
		Properties prop = new Properties();
		InputStream inStrem = DbConfig.class.getClassLoader().getResourceAsStream("dbconfig.properties");

		try {
			prop.load(inStrem);
			registDriver = prop.getProperty("registDriver");
			url = prop.getProperty("url");
			username = prop.getProperty("username");
			password = prop.getProperty("password");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inStrem.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public static String getRegistDriver() {
		return registDriver;
	}

	public static String getUrl() {
		return url;
	}

	public static String getUsername() {
		return username;
	}

	public static String getPassword() {
		return password;
	}

}
