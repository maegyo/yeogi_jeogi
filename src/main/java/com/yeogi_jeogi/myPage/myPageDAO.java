package com.yeogi_jeogi.myPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

import org.springframework.stereotype.Component;

import com.yeogi_jeogi.board.board;
import com.yeogi_jeogi.board.boardComment;
import com.yeogi_jeogi.jdbc.connClass;
import com.yeogi_jeogi.reservation.reservation;

@Component
public class myPageDAO {
	final int pageNum = 8;
	final int comPageNum = 8;
	
	public myPage getMyInfo(int lUserNum) throws Exception{
		myPage mp = new myPage();
		String sql = "SELECT (SELECT COUNT(1) FROM WANTS_TRAVEL WHERE USER_NO = ?) mpTravels,"
				+ "        (SELECT COUNT(1) FROM WANTS_PACKAGE WHERE USER_NO = ?) mpPackages,"
				+ "        (SELECT COUNT(1) FROM WANTS_FESTIVAL WHERE USER_NO = ?) mpFestivals,"
				+ "        ((SELECT COUNT(1) FROM BOARD_FREE WHERE USER_NO = ?) + (SELECT COUNT(1) FROM BOARD_TRAVEL WHERE USER_NO = ?)) mpWrites,"
				+ "        ((SELECT COUNT(1) FROM COMMENTS_BRD_FREE WHERE USER_NO = ?) + (SELECT COUNT(1) FROM COMMENTS_BRD_TRV WHERE USER_NO = ?)) mpComments,"
				+ "        (SELECT COUNT(1) FROM RESERVATIONS WHERE USER_NO = ?) mpReservations "
				+ "    FROM DUAL";
		
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		for (int i = 1; i <= 8; i++) {
			pstmt.setInt(i,lUserNum);
		}
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		mp.setMpTravels(rs.getInt("mpTravels"));
		mp.setMpPackages(rs.getInt("mpPackages"));
		mp.setMpFestivals(rs.getInt("mpFestivals"));
		mp.setMpWrites(rs.getInt("mpWrites"));
		mp.setMpComments(rs.getInt("mpComments"));
		mp.setMpReservations(rs.getInt("mpReservations"));
		
		connClass.close(conn, pstmt, rs);
		return mp;
	}
	public LinkedList<myPageTravel> getMyInfoTravel(int lUserNum) throws Exception {
		LinkedList<myPageTravel> list = new LinkedList<myPageTravel>();
		String sql = "SELECT B.WTRV_NO mptWNum, A.TRAVEL_NO mptTNum, (SELECT NAME FROM LIST_REGION WHERE REGION_ID = A.REGION_ID) mptRName, A.NAME mptName, A.IMG_ADD mptImgAdd "
				+ "FROM LIST_TRAVEL A, WANTS_TRAVEL B "
				+ "WHERE B.USER_NO = ? "
				+ "AND B.TRAVEL_NO = A.TRAVEL_NO "
				+ "ORDER BY mptWNum ASC";
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			myPageTravel mpt = new myPageTravel();
			mpt.setMptWNum(rs.getLong("mptWNum"));
			mpt.setMptTNum(rs.getInt("mptTNum"));
			mpt.setMptRName(rs.getString("mptRName"));
			mpt.setMptName(rs.getString("mptName"));
			mpt.setMptImgAdd(rs.getString("mptImgAdd"));
			
			list.add(mpt);
		}
		connClass.close(conn, pstmt, rs);
		
		return list;
	}
	public LinkedList<myPagePackage> getMyInfoPackage(int lUserNum) throws Exception {
		LinkedList<myPagePackage> list = new LinkedList<myPagePackage>();
		
		String sql = "SELECT B.WPKG_NO mppWNum, A.PKG_NO mppPNum, (SELECT NAME FROM LIST_REGION WHERE REGION_ID = A.REGION_ID) mppRName,"
							+ "A.TITLE mppTitle, A.SORT mppSort, A.IMG_ADD mppImgAdd,"
							+ "A.COUNT mppCount, A.PRICE mppPrice "
							+ "FROM PACKAGES A, WANTS_PACKAGE B "
							+ "WHERE B.USER_NO = ? "
							+ "AND B.PKG_NO = A.PKG_NO "
							+ "ORDER BY mppWNum ASC";
		
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			myPagePackage mpp = new myPagePackage();
			mpp.setMppWNum(rs.getLong("mppWNum"));
			mpp.setMppPNum(rs.getInt("mppPNum"));
			mpp.setMppRName(rs.getString("mppRName"));
			mpp.setMppTitle(rs.getString("mppTitle"));
			mpp.setMppSort(rs.getString("mppSort"));
			mpp.setMppImgAdd(rs.getString("mppImgAdd"));
			mpp.setMppCount(rs.getInt("mppCount"));
			mpp.setMppPrice(rs.getInt("mppPrice"));
			
			list.add(mpp);
		}
		connClass.close(conn, pstmt, rs);
		
		return list;
	}
	public LinkedList<myPageFestival> getMyInfoFestival(int lUserNum) throws Exception {
		LinkedList<myPageFestival> list = new LinkedList<myPageFestival>();
		
		String sql = "SELECT B.WFEST_NO mpfWNum, A.FEST_NO mpfFNum, (SELECT NAME FROM LIST_REGION WHERE REGION_ID = A.REGION_ID) mpfRName,"
							+ "A.TITLE mpfTitle, A.IMG_ADD mpfImgAdd,"
							+ "A.START_DATE mpfStartDate, A.END_DATE mpfEndDate "
							+ "FROM FESTIVALS A, WANTS_FESTIVAL B "
							+ "WHERE B.USER_NO = ? "
							+ "AND B.FEST_NO = A.FEST_NO "
							+ "ORDER BY mpfWNum ASC";
		
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			myPageFestival mpf = new myPageFestival();
			mpf.setMpfWNum(rs.getLong("mpfWNum"));
			mpf.setMpfFNum(rs.getInt("mpfFNum"));
			mpf.setMpfRName(rs.getString("mpfRName"));
			mpf.setMpfTitle(rs.getString("mpfTitle"));
			mpf.setMpfImgAdd(rs.getString("mpfImgAdd"));
			mpf.setMpfStartDate(rs.getString("mpfStartDate"));
			mpf.setMpfEndDate(rs.getString("mpfEndDate"));
			
			list.add(mpf);
		}
		connClass.close(conn, pstmt, rs);
		
		return list;
	}
	public int getMaxPageNum(int lUserNum, boolean isBF) throws Exception {
		int result;
		Connection conn = connClass.open();
		String sql;
		if (isBF) {
			sql = "SELECT COUNT(1) cnt FROM BOARD_FREE WHERE USER_NO = ?";
		}
		else {
			sql = "SELECT COUNT(1) cnt FROM BOARD_TRAVEL WHERE USER_NO = ?";
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		result = rs.getInt("cnt");
		connClass.close(conn, pstmt, rs);
		
		return result;
	}
	public LinkedList<board> getMyInfoWrites(int lUserNum, int startNum, boolean isBF) throws Exception {
		LinkedList<board> list = new LinkedList<board>();
		String sql;
		if (isBF) {
			sql = "SELECT B.BRD_NO, B.mpwUserId, B.TITLE, B.SORT, B.CONTENT, B.IMG_ADD, B.COUNT, B.CDate, B.mpwRcm "
					+ "    FROM (SELECT ROWNUM RN, BRD_NO, (SELECT ID FROM USERS WHERE USER_NO = ?) mpwUserId,"
					+ "        TITLE, SORT, CONTENT, IMG_ADD, COUNT, TO_CHAR(CREATE_DATE,'YY/MM/DD hh:mi') CDate,"
					+ "        (SELECT COUNT(1) FROM RCM_BRD_FREE WHERE A.BRD_NO = BRD_NO) mpwRcm "
					+ "        FROM BOARD_FREE A "
					+ "        WHERE USER_NO = ?) B "
					+ "    WHERE RN BETWEEN ? AND ? "
					+ "    ORDER BY RN DESC";
		}
		else {
			sql = "SELECT B.BRD_NO, B.mpwUserId, B.TITLE, B.CONTENT, B.IMG_ADD, B.COUNT, B.CDate, B.mpwRcm "
					+ "    FROM (SELECT ROWNUM RN, BRD_NO, (SELECT ID FROM USERS WHERE USER_NO = ?) mpwUserId,"
					+ "        TITLE, CONTENT, IMG_ADD, COUNT, TO_CHAR(CREATE_DATE,'YY/MM/DD hh:mi') CDate,"
					+ "        (SELECT COUNT(1) FROM RCM_BRD_TRV WHERE A.BRD_NO = BRD_NO) mpwRcm "
					+ "        FROM BOARD_TRAVEL A "
					+ "        WHERE USER_NO = ?) B "
					+ "    WHERE RN BETWEEN ? AND ? "
					+ "    ORDER BY RN DESC";
		}
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		pstmt.setInt(2, lUserNum);
		pstmt.setInt(3, (startNum -1) * pageNum +1);
		pstmt.setInt(4, startNum * pageNum);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			board mpw = new board();
			String subNum = (String.valueOf(rs.getInt("BRD_NO"))).substring(3);
			mpw.setbNum(rs.getInt("BRD_NO"));
			mpw.setbSubNum(Integer.parseInt(subNum));
			mpw.setbUserId(rs.getString("mpwUserId"));
			mpw.setbTitle(rs.getString("TITLE"));
			if (isBF ) {
				mpw.setbSort(rs.getString("SORT"));
			}
			mpw.setbContent(rs.getString("CONTENT"));
			mpw.setbImgAdd(rs.getString("IMG_ADD"));
			mpw.setbCount(rs.getInt("COUNT"));
			mpw.setbCDate(rs.getString("CDate"));
			mpw.setbRcm(rs.getInt("mpwRcm"));
			
			list.add(mpw);
		}
		connClass.close(conn, pstmt, rs);
		
		return list;
	}
	public void deleteMyBFWrites(int bNum) throws Exception {
		String sql = "DELETE FROM BOARD_FREE WHERE BRD_NO = ?";
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bNum);
		ResultSet rs = pstmt.executeQuery();
		connClass.close(conn, pstmt, rs);
	}
	public LinkedList<boardComment> getMyAllComments(int lUserNum)  throws Exception {
		LinkedList<boardComment> list = new LinkedList<boardComment>();
		Connection conn = connClass.open();
		String sql;
		sql = "SELECT * "
				+ "FROM (SELECT 0 ISBF, COM_NO, BRD_NO, USER_NO, CONTENT, G_COUNT, TO_CHAR(CREATE_DATE, 'YY/MM/DD hh:mm') cCDate, TO_CHAR(MODIFY_DATE, 'YY/MM/DD hh:mm') cMDate FROM COMMENTS_BRD_TRV WHERE USER_NO = ? "
				+ "UNION ALL SELECT 1 ISBF, COM_NO, BRD_NO, USER_NO, CONTENT, G_COUNT, TO_CHAR(CREATE_DATE, 'YY/MM/DD hh:mm') cCDate, TO_CHAR(MODIFY_DATE, 'YY/MM/DD hh:mm') cMDate FROM COMMENTS_BRD_FREE WHERE USER_NO = ?) "
				+ "ORDER BY cCDate DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		pstmt.setInt(2, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			boardComment bdc = new boardComment();
			bdc.setcIsBF(rs.getInt("ISBF"));
			bdc.setcNum(rs.getLong("COM_NO"));
			bdc.setcBNum(rs.getInt("BRD_NO"));
			String subNum = (String.valueOf(rs.getInt("BRD_NO"))).substring(3);
			bdc.setcBSubNum(Integer.parseInt(subNum));
			bdc.setcUserNum(rs.getInt("USER_NO"));
			bdc.setcContent(rs.getString("CONTENT"));
			bdc.setcGCount(rs.getInt("G_COUNT"));
			bdc.setcCDate(rs.getString("cCDate"));
			if (rs.getString("cMDate") == null) {
				bdc.setcMDate(null);
			}
			else {
				bdc.setcMDate(rs.getString("cMDate"));
			}
			list.add(bdc);
		}
		connClass.close(conn, pstmt, rs);
		return list;
	}
	public int getComsPageNum(int lUserNum) throws Exception {
		int result;
		Connection conn = connClass.open();
		String sql = "SELECT COUNT(1) cnt "
							+ "FROM (SELECT * FROM COMMENTS_BRD_TRV WHERE USER_NO = ? "
							+ "UNION ALL "
							+ "SELECT * FROM COMMENTS_BRD_FREE WHERE USER_NO = ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		pstmt.setInt(2, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		result = rs.getInt("cnt");
		connClass.close(conn, pstmt, rs);
		return result;
	}
	public void deleteMyComs(boolean IsBF, long cNum) throws Exception {
		String sql;
		if (IsBF) {
			sql = "DELETE FROM COMMENTS_BRD_FREE WHERE COM_NO = ?";
		}
		else {
			sql = "DELETE FROM COMMENTS_BRD_TRV WHERE COM_NO = ?";
		}
		Connection conn = connClass.open();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setLong(1, cNum);
		ResultSet rs = pstmt.executeQuery();
		connClass.close(conn, pstmt, rs);
	}
	public LinkedList<reservation> getMyAllReservation(int lUserNum) throws Exception {
		LinkedList<reservation> list = new LinkedList<reservation>();
		Connection conn = connClass.open();
		String sql = "SELECT * FROM RESERVATIONS WHERE USER_NO = ? ORDER BY RSV_DATE DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			reservation rsv = new reservation();
			rsv.setrRsvNum(rs.getInt("RSV_NO"));
			rsv.setrUserNum(rs.getInt("USER_NO"));
			rsv.setrPeopleNum(rs.getInt("PEOPLE_NUM"));
			rsv.setrRDate(rs.getString("RSV_DATE"));
			rsv.setrSDate(rs.getString("RSV_START_DATE"));
			rsv.setrEDate(rs.getString("RSV_END_DATE"));
			rsv.setrPayCheck(rs.getInt("PAY_CHK"));
			list.add(rsv);
		}
		connClass.close(conn, pstmt, rs);
		return list;
	}
	public int getRsvPageNum(int lUserNum) throws Exception {
		int result;
		Connection conn = connClass.open();
		String sql = "SELECT COUNT(1) cnt "
							+ "FROM (SELECT * FROM RESERVATIONS WHERE USER_NO = ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, lUserNum);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		result = rs.getInt("cnt");
		connClass.close(conn, pstmt, rs);
		return result;
	}
}
