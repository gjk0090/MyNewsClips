/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Db.JdbcUtils;
import entities.Feed;
import entities.User;

/**
 * 
 * @author ivan
 */
public class UserDAOImpl implements UserDAO {

	private static Connection conn = null;
	private static PreparedStatement prep = null;
	private static ResultSet rs = null;

	public boolean userLogin(User user) {

		boolean boo = false;

		conn = JdbcUtils.getConnection();
		String sql = "select * from user where username =? and password = ?";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, user.getUsername());
			prep.setString(2, user.getPassword());
			rs = prep.executeQuery();
			while (rs.next()) {
				boo = true;
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}

		return boo;
	}

	public boolean isUserExist(User user) {

		return false;
	}

	public boolean userRegister(User user) {
		boolean boo = false;

		System.out.println("register at DAO");

		conn = JdbcUtils.getConnection();
		String sql = "insert into user values(null,?,?)";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, user.getUsername());
			prep.setString(2, user.getPassword());
			prep.executeUpdate();
			boo = true;

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			try {
				conn.close();
				prep.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return boo;
	}

	public Integer findIdByUserName(String username) {
		conn = JdbcUtils.getConnection();
		String sql = "select uid from user where username=?";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, username);
			rs = prep.executeQuery();
			while (rs.next()) {
				return rs.getInt("uid");
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}
		return 0;
	}

	public boolean createDefault(User user) {
		boolean boo = false;

		System.out.println("register at DAO");

		conn = JdbcUtils.getConnection();
		String sql = "insert into feed_folder values(null,?,?)";
                String sql2 = "insert into article_folder values(null,?,?)";

		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, user.getUserid());
			prep.setString(2, "default");
			prep.executeUpdate();
                        
                        prep = conn.prepareStatement(sql2);
			prep.setInt(1, user.getUserid());
			prep.setString(2, "default");
			prep.executeUpdate();
			boo = true;

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			try {
				conn.close();
				prep.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return boo;
	}
}
