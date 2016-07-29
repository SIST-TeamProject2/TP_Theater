package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBControll;

public enum memberDAO {

	INSTANCE;
	
	///// 각종 체크 /////
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
}