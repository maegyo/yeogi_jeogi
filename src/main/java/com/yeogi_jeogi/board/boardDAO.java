package com.yeogi_jeogi.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.print.attribute.standard.PrinterState;

import com.yeogi_jeogi.jdbc.connClass;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public class boardDAO {
	final int pageNum = 15;
	public int getMaxPageNum(boolean isBF) throws Exception {
		int result;
		Connection conn = connClass.open();
		String sql;
		if (isBF) {
			sql = "SELECT COUNT(1) cnt FROM BOARD_FREE";
		}
		else {
			sql = "SELECT COUNT(1) cnt FROM BOARD_TRAVEL";
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		result = rs.getInt("cnt");
		connClass.close(conn, pstmt, rs);
		
		return result;
	}
	public LinkedList<board> getAllList(int startNum, boolean isBF) throws Exception {
		LinkedList<board> list = new LinkedList<board>();
		String sql;
		if (isBF) {
			sql = "SELECT BRD_NO bNum, (SELECT ID FROM USERS WHERE USER_NO = A.USER_NO) bUserId, SORT bSort, TITLE bTitle, COUNT bCount, TO_CHAR(CREATE_DATE,'YY/MM/DD hh:mi') bCDate, bRcm "
					+ "				FROM (SELECT ROWNUM RN, BRD_NO, USER_NO, SORT, TITLE, COUNT, CREATE_DATE, bRcm "
					+ "					FROM (SELECT BRD_NO, USER_NO, SORT, TITLE, COUNT, CREATE_DATE,"
					+ "                        (SELECT COUNT(1) FROM RCM_BRD_FREE A, BOARD_FREE B WHERE A.BRD_NO = B.BRD_NO) bRcm "
					+ "                        FROM BOARD_FREE "
					+ "                        ORDER BY BRD_NO DESC)) A "
					+ "				WHERE RN BETWEEN ? AND ?";
		}
		else {
			sql = "SELECT BRD_NO bNum, (SELECT ID FROM USERS WHERE USER_NO = A.USER_NO) bUserId, TITLE bTitle, COUNT bCount, TO_CHAR(CREATE_DATE,'YY/MM/DD hh:mi') bCDate, bRcm "
					+ "				FROM (SELECT ROWNUM RN, BRD_NO, USER_NO, TITLE, COUNT, CREATE_DATE, bRcm "
					+ "					FROM (SELECT BRD_NO, USER_NO, TITLE, COUNT, CREATE_DATE,"
					+ "                        (SELECT COUNT(1) FROM RCM_BRD_TRV A, BOARD_TRAVEL B WHERE A.BRD_NO = B.BRD_NO) bRcm "
					+ "                        FROM BOARD_TRAVEL "
					+ "                        ORDER BY BRD_NO DESC)) A "
					+ "				WHERE RN BETWEEN ? AND ?";
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = connClass.open();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, (startNum -1) * pageNum +1);
		pstmt.setInt(2, startNum * pageNum);
		rs = pstmt.executeQuery();

		try {
			while (rs.next()) {
				board bd = new board();
				String subNum = (String.valueOf(rs.getInt("bNum"))).substring(3);
				bd.setbNum(rs.getInt("bNum"));
				bd.setbSubNum(Integer.parseInt(subNum));
				bd.setbUserId(rs.getString("bUserId"));
				if (isBF) {
					bd.setbSort(rs.getString("bSort"));
				}
				bd.setbTitle(rs.getString("bTitle"));
				bd.setbCount(rs.getInt("bCount"));
				bd.setbCDate(rs.getString("bCDate"));
				bd.setbRcm(rs.getInt("bRcm"));
				list.add(bd);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		connClass.close(conn, pstmt, rs);
		return list; 
	}
	public board getBoard(int bNum, boolean isBF) throws SQLException {
		Connection conn = connClass.open();
		board bd = new board();
		String sql;
		if (isBF) {
			sql = "SELECT BRD_NO bNum, (SELECT ID FROM USERS WHERE USER_NO = A.USER_NO) bUserId, SORT bSort, TITLE bTitle, CONTENT bContent, IMG_ADD bImgAdd, COUNT bCount, TO_CHAR(CREATE_DATE,'YY/MM/DD hh:mi') bCDate, TO_CHAR(MODIFY_DATE,'YYYY/MM/DD') bMDate, bRcm "
					+ "FROM (SELECT BRD_NO, USER_NO, SORT, TITLE, CONTENT, IMG_ADD, COUNT, CREATE_DATE, MODIFY_DATE,"
						+ "(SELECT COUNT(1) FROM RCM_BRD_FREE A, BOARD_FREE B WHERE A.BRD_NO = B.BRD_NO) bRcm "
						+ "FROM BOARD_FREE "
						+ "WHERE BRD_NO = ?) A ";
		}
		else {
			sql = "SELECT BRD_NO bNum, (SELECT ID FROM USERS WHERE USER_NO = A.USER_NO) bUserId, TITLE bTitle, CONTENT bContent, IMG_ADD bImgAdd, COUNT bCount, TO_CHAR(CREATE_DATE,'YY/MM/DD hh:mi') bCDate, TO_CHAR(MODIFY_DATE,'YYYY/MM/DD') bMDate, bRcm "
					+ "FROM (SELECT BRD_NO, USER_NO, TITLE, CONTENT, IMG_ADD, COUNT, CREATE_DATE, MODIFY_DATE,"
						+ "(SELECT COUNT(1) FROM RCM_BRD_TRV A, BOARD_TRAVEL B WHERE A.BRD_NO = B.BRD_NO) bRcm "
						+ "FROM BOARD_TRAVEL "
						+ "WHERE BRD_NO = ?) A ";
		}
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bNum);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try (conn; pstmt; rs;) {
			bd.setbNum(rs.getInt("bNum"));
			bd.setbUserId(rs.getString("bUserId"));
			if (isBF) {
				bd.setbSort(rs.getString("bSort"));
			}
			bd.setbTitle(rs.getString("bTitle"));
			bd.setbContent(rs.getString("bContent"));
			if (rs.getString("bImgAdd") != null) {
				bd.setbImgAdd(rs.getString("bImgAdd"));
			}
			else {
				bd.setbImgAdd("");
			}
			bd.setbCount(rs.getInt("bCount"));
			bd.setbCDate(rs.getString("bCDate"));
			if (rs.getString("bMDate") != null) {
				bd.setbMDate(rs.getString("bMDate"));
			}
			else {
				bd.setbMDate("");
			}
			bd.setbRcm(rs.getInt("bRcm"));
		}	
		connClass.close(conn, pstmt, rs);
		return bd;
	}
	public void addWrite(board bd, boolean isBF) throws Exception {
		String sql;
		if (isBF) {
			sql = "INSERT INTO BOARD_FREE VALUES(SEQ_BOARD_FREE.NEXTVAL, (SELECT USER_NO FROM USERS WHERE ID = ?), ?, ?, ?, NULL, DEFAULT, DEFAULT, NULL)";
		}
		else {
			sql = "INSERT INTO BOARD_TRAVEL VALUES(SEQ_BOARD_TRAVEL.NEXTVAL, (SELECT USER_NO FROM USERS WHERE ID = ?), ?, ?, NULL, DEFAULT, DEFAULT, NULL)";
		}
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try (conn; pstmt) {
			pstmt.setString(1, bd.getbUserId());
			pstmt.setString(2, bd.getbTitle());
			if (isBF) {
				pstmt.setString(3, bd.getbSort());
				pstmt.setString(4, bd.getbContent());
			}
			else {
				pstmt.setString(3, bd.getbContent());
			}
			pstmt.executeUpdate();
		}
		connClass.close(conn, pstmt, null);
	}
	public LinkedList<boardComment> getAllCommentList(int cBNum, boolean isBF) throws Exception {
		LinkedList<boardComment> list = new LinkedList<boardComment>();
		String sql;
		if (isBF) {
			sql = "SELECT COM_NO cNum, BRD_NO cBNum, USER_NO cUserNum, CONTENT cContent, G_COUNT cGCount, TO_CHAR(CREATE_DATE, 'YY/MM/DD hh:mi') cCDate "
					+ "FROM COMMENTS_BRD_FREE A "
					+ "WHERE BRD_NO = ? "
					+ "ORDER BY cGCount";
		}
		else {
			sql = "SELECT COM_NO cNum, BRD_NO cBNum, USER_NO cUserNum, CONTENT cContent, G_COUNT cGCount, TO_CHAR(CREATE_DATE, 'YY/MM/DD hh:mi') cCDate "
					+ "FROM COMMENTS_BRD_TRV A "
					+ "WHERE BRD_NO = ? "
					+ "ORDER BY cGCount";
		}
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cBNum);
		ResultSet rs = pstmt.executeQuery();

		try(conn; pstmt; rs) {
			while (rs.next()) {
				boardComment bdc = new boardComment();
				bdc.setcNum(rs.getLong("cNum"));
				bdc.setcBNum(rs.getInt("cBNum"));
				bdc.setcUserNum(rs.getInt("cUserNum"));
				bdc.setcContent(rs.getString("cContent"));
				bdc.setcGCount(rs.getInt("cGCount"));
				bdc.setcCDate(rs.getString("cCDate"));
				list.add(bdc);
			}
		}
		connClass.close(conn, pstmt, rs);
		return list; 
	}
	public void addComment(boardComment bdc, boolean isBF) throws Exception {
		String sql;
		if (isBF) {
			sql = "INSERT INTO COMMENTS_BRD_FREE VALUES (SEQ_COMMENTS_BRD_FREE.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, NULL)";
		}
		else {
			sql = "INSERT INTO COMMENTS_BRD_TRV VALUES (SEQ_COMMENTS_BRD_TRV.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, NULL)";
		}
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try (conn; pstmt) {
			pstmt.setInt(1, bdc.getcBNum());
			pstmt.setInt(2, bdc.getcUserNum());
			pstmt.setString(3, bdc.getcContent());
			pstmt.executeQuery();
		}
		pstmt.close();
		conn.close();
	}
	public void updateCount(int bNum, boolean isBF) throws Exception {
		String sql;
		if (isBF) {
			sql = "UPDATE BOARD_FREE SET COUNT = COUNT +1 WHERE BRD_NO = ?";
		}
		else {
			sql = "UPDATE BOARD_TRAVEL SET COUNT = COUNT +1 WHERE BRD_NO = ?";
		}
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bNum);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void insertRcm(int bNum, int lUserNum, boolean isBF) throws Exception {
		String sql;
		if (isBF) {
			sql = "INSERT INTO RCM_BRD_FREE VALUES (SEQ_RCM_BRD_FREE.NEXTVAL, ?, ?)";
		}
		else {
			sql = "INSERT INTO RCM_BRD_TRV VALUES (SEQ_RCM_BRD_TRV.NEXTVAL, ?, ?)";
		}
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bNum);
		pstmt.setInt(2, lUserNum);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
