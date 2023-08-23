package com.yeogi_jeogi.login;

import org.springframework.stereotype.Component;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class loginDAO {
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:myoracle";
	
	public Connection open() {
		Connection conn = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "TEST", "1234");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public login getUser(loginUserData lud) throws SQLException {
		String sql = "SELECT * FROM USERS WHERE ID = ? AND PASSWORD = ?";
		Connection conn = open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lud.getlUserId());
		pstmt.setString(2, lud.getlPassword());
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		login lg = new login();
		lg.setlUserNum(rs.getInt("USER_NO"));
		lg.setlGradeNum(rs.getInt("GRADE_NO"));
		lg.setlUserId(rs.getString("ID"));
		lg.setlName(rs.getString("NAME"));
		lg.setlPassword(rs.getString("PASSWORD"));
		lg.setlEmail(rs.getString("EMAIL"));
		lg.setlPhone(rs.getString("PHONE"));
		lg.setlMbti(rs.getString("MBTI"));
		lg.setlImgAdd(rs.getString("IMG_ADD"));
		
		conn.close();
		return lg; 
	}
	public login addUser(login lg) throws SQLException {
		String sql = "INSERT INTO USERS VALUES (SEQ_USERS.NEXTVAL, DEFAULT, ?, ?, ?, ?, ?, ?, DEFAULT)";
		Connection conn = open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lg.getlUserId());
		pstmt.setString(2, lg.getlName());
		pstmt.setString(3, lg.getlPassword());
		pstmt.setString(4, lg.getlEmail());
		pstmt.setString(5, lg.getlPhone());
		pstmt.setString(6, lg.getlMbti());
		
		conn.close();
		return lg;
	}
	
}
