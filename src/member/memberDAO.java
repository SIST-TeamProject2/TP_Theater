package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBControll;

public enum MemberDAO {

	INSTANCE;
	
	////////// 각종 체크 //////////
	
	public boolean checkId(String inputId) {
		
		String sql = "SELECT M_ID FROM TP2_MEMBER "
					+ "WHERE M_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean result = false;
		
		try {
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, inputId);
			
			rs = psmt.executeQuery();
			
			if ( rs.next() ){
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		
		return result;
	}
	
	public boolean checkMember(String inputId, String inputPw) {
		
		String sql = "SELECT M_ID, M_PW FROM TP2_MEMBER "
					+ "WHERE M_ID = ? AND M_PW = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean result = false;
		
		try {
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, inputId);
			psmt.setString(2, inputPw);
			
			rs = psmt.executeQuery();
			
			if ( rs.next() ) {
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		
		return result;
	}
	
	
	////////// 조회, 삽입, 수정, 삭제 //////////
	
	// 계정 조회
	public MemberDTO selectMember(String inputId) {
		
		String sql = "SELECT * FROM TP2_MEMBER "
					+ "WHERE M_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDTO mdto = null;
		
		try {
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, inputId);
			
			rs = psmt.executeQuery();
			
			if ( rs.next() ) {
				
				int i = 1;
				mdto = new MemberDTO(
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getDate(i)
						);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		
		return mdto;
	}
	
	
	// 계정 생성
	public boolean addMember(MemberDTO mdto) {
		
		String sql = "INSERT INTO TP2_MEMBER "
					+ "(M_SEQ, M_ID, M_PW, M_NAME, M_BIRTHDAY, M_RECEIVE_EMAIL, M_RECEIVE_SMS, M_RECEIVE_PHONE, "
					+ "M_EMAIL, M_PHONE, M_POINT, M_GRADE, M_VIEW_COUNT, M_JOIN_DATE) "
					+ "VALUES(TP2_MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, "
					+ "?, ?, ?, 0, 0, SYSDATE ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			int i = 1;
			psmt.setString(i++, mdto.getId());
			psmt.setString(i++, mdto.getPw());
			psmt.setString(i++, mdto.getName());
			psmt.setString(i++, mdto.getBirthday());
			psmt.setInt(i++, mdto.getReceiveEmail());
			psmt.setInt(i++, mdto.getReceiveSMS());
			psmt.setInt(i++, mdto.getReceivePhone());
			psmt.setString(i++, mdto.getEmail());
			psmt.setString(i++, mdto.getPhone());
			psmt.setInt(i, mdto.getPoint());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
		
		return count > 0 ? true : false;
	}
	
	
	// 계정 수정
	public boolean updateMember(MemberDTO mdto) {
		
		String sql = "UPDATE TP2_MEMBER SET "
					+ "M_PW = ?, M_NAME = ?, M_BIRTHDAY = ?, "
					+ "M_RECEIVE_EMAIL = ?, M_RECEIVE_SMS = ?, M_RECEIVE_PHONE = ?, "
					+ "M_EMAIL = ?, M_PHONE = ? "
					+ "WHERE M_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			int i = 1;
			psmt.setString(i++, mdto.getPw());
			psmt.setString(i++, mdto.getName());
			psmt.setString(i++, mdto.getBirthday());
			psmt.setInt(i++, mdto.getReceiveEmail());
			psmt.setInt(i++, mdto.getReceiveSMS());
			psmt.setInt(i++, mdto.getReceivePhone());
			psmt.setString(i++, mdto.getEmail());
			psmt.setString(i++, mdto.getPhone());
			psmt.setString(i, mdto.getId());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
		
		return count > 0 ? true : false;
	}
	
	
	// 계정 삭제
	public boolean deleteMember(String id) {
		
		String sql = "DELETE TP2_MEMBER "
					+ "WHERE M_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
		
		return count > 0 ? true : false;
	}
}
