package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBControll;

public enum MovieDAO {

	INSTANCE;
	
	////////// 각종 체크 //////////
	
	
	
	////////// 조회, 삽입, 수정, 삭제 //////////
	
	// 예매한 티켓 리스트 조회
	public List<TicketDTO> selectTicketingList(String memberId) {
		
		String sql = "SELECT * FROM TP2_RESERVATION "
					+ "WHERE R_MEMBER_ID = ? "
					+ "ORDER BY R_SEE_DATE ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TicketDTO> mvdtoList = new ArrayList<TicketDTO>();
		TicketDTO mvdto = null;
		
		try {
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, memberId);
			
			rs = psmt.executeQuery();
			
			while ( rs.next() ) {
				
				int i = 1;
				mvdto = new TicketDTO(
						rs.getInt(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getDate(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i)
						);
				
				mvdtoList.add(mvdto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		
		return mvdtoList;
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
