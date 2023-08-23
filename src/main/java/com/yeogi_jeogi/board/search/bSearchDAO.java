package com.yeogi_jeogi.board.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.yeogi_jeogi.board.board;
import com.yeogi_jeogi.jdbc.connClass;

@Component
public class bSearchDAO {
	public ArrayList<board> searchBFListAll(bSearch bs) throws Exception {
		ArrayList<board> list = new ArrayList<board>();
		String sql = "SELECT BRD_NO bNum, TITLE bTitle, SORT bSort, CONTENT bContent, IMG_ADD bImgAdd, COUNT bCount,"
							+ "CREATE_DATE bCDate, MODIFY_DATE bMDate, (SELECT NAME FROM USERS WHERE USER_NO = A.USER_NO) bUserId, (SELECT COUNT(1) FROM RCM_BRD_FREE WHERE BRD_NO = A.BRD_NO) bRcm "
							+ "FROM BOARD_FREE A ";
		String chooseSQL;
		
		if (bs.getsSort().equals("title")) {
			chooseSQL = "WHERE TITLE LIKE ? ORDER BY bNum DESC";
		}
		else if (bs.getsSort().equals("content")) {
			chooseSQL = "WHERE CONTENT LIKE ? ORDER BY bNum DESC";
		}
		else if (bs.getsSort().equals("id")) {
			chooseSQL = "WHERE (SELECT NAME FROM USERS WHERE USER_NO = A.USER_NO) LIKE ? ORDER BY bNum DESC";
		}
		else {
			chooseSQL = "WHERE TITLE LIKE ? "
						+ "OR CONTENT LIKE ? "
						+ "OR (SELECT NAME FROM USERS WHERE USER_NO = A.USER_NO) LIKE ? "
						+ "ORDER BY bNum DESC";
		}
		sql += chooseSQL;
		System.out.println(bs.getsSort());
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		if (bs.getsSort().equals("all")){
			pstmt.setString(1, bs.getsWord());
			pstmt.setString(2, bs.getsWord());
			pstmt.setString(3, bs.getsWord());
		}
		else {
			pstmt.setString(1, bs.getsWord());
		}
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			board bf = new board();
			bf.setbNum(rs.getInt("bNum"));
			bf.setbSort(rs.getString("bSort"));
			bf.setbUserId(rs.getString("bUserId"));
			bf.setbTitle(rs.getString("bTitle"));
			bf.setbContent(rs.getString("bContent"));
			bf.setbImgAdd(null);
			bf.setbCount(rs.getInt("bCount"));
			bf.setbCDate(rs.getString("bCDate"));
			bf.setbMDate(rs.getString("bMDate"));
			bf.setbRcm(rs.getInt("bRcm"));
			
			list.add(bf);
		}
		connClass.close(conn, pstmt, rs);
		return list;
	}
}
