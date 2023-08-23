package com.yeogi_jeogi.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.springframework.stereotype.Component;

@Component
public class membershipDAO {
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:myoracle";
	
	public Connection open() {
		Connection conn = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"TEST", "1234");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public void addmember(membership mem) throws Exception {
		String sql = "INSERT INTO USERS VALUES (SEQ_USERS.NEXTVAL, DEFAULT, ?, ?, ?, ?, ?, ?)";
		Connection conn = open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try (conn; pstmt) {
			pstmt.setString(1, mem.getmUserId());
			pstmt.setString(2, mem.getmName());
			pstmt.setString(3, mem.getmPassword());
			pstmt.setString(4, mem.getmEmail());
			pstmt.setString(5, mem.getmPhone());
			pstmt.setString(6, mem.getmMbti());
			pstmt.executeUpdate();
		}
		conn.close();
	}
}
