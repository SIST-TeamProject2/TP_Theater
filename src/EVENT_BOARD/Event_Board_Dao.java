package EVENT_BOARD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBControll;

public class Event_Board_Dao {

	private static Event_Board_Dao event_dao;
	
	public Event_Board_Dao() {
		
	}
	public static Event_Board_Dao getInstance() {
		if(event_dao==null){
			event_dao = new Event_Board_Dao();
		}return event_dao;
	}
	
	public boolean writeE_Board(Event_Board_Dto dto) {
		
		String sql = " INSERT INTO TP2_EVENT_BOARD(EB_SEQ, EB_WRITE_MEMBER_ID, "
				+ " EB_REF, EB_STEP, EB_DEPTH, EB_PARENT, EB_CATEGORY, EB_TITLE, "
				+ " EB_CONTENT, EB_FILE_NAME, EB_LIKE, EB_READ_COUNT, EB_WRITE_DATE, EB_DEL ) "
				+ " VALUES(SEQ_EVENT.NEXTVAL, ?, 0 , 0, 0, "
				+ " 0, ?, ?, ?, ?, 0, 0, SYSDATE, 0) " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			
			int i = 1;
			
			psmt.setString(i++, dto.getId());
			psmt.setString(i++, dto.getCategory());
			psmt.setString(i++, dto.getTitle());
			psmt.setString(i++, dto.getContent());
			psmt.setString(i++, dto.getFile_name());
			count = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}

		return count>0? true:false;	
	}
	public List<Event_Board_Dto> getE_boardlist(){
		
		List<Event_Board_Dto> list = new ArrayList<Event_Board_Dto>();
		
		String sql = " SELECT * FROM TP2_EVENT_BOARD ORDER BY EB_SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn=DBControll.getConnection();
			
			psmt=conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				
				Event_Board_Dto dto = new Event_Board_Dto(
						rs.getInt(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getString(i++),
						rs.getInt(i++));
				list.add(dto);
			}
			
		} catch (SQLException e) {
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		return list;
	}
	public Event_Board_Dto getDTO(int seq) {
	
		String sql = " SELECT * FROM TP2_EVENT_BOARD WHERE EB_SEQ=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Event_Board_Dto dto = null;
		try {
			conn=DBControll.getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				int i =1;

				dto = new Event_Board_Dto(
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getInt(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBControll.closeDatabase(conn, psmt, rs);
		}
		return dto;
	}
	public void Event_readCount(int seq) {
		String sql = " UPDATE TP2_EVENT_BOARD SET EB_READ_COUNT = EB_READ_COUNT+1 WHERE EB_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
	}
	public boolean Event_update(int seq, Event_Board_Dto dto) {
		String sql = " UPDATE TP2_EVENT_BOARD SET EB_CATEGORY = ?, EB_TITLE = ?, EB_CONTENT = ?, EB_FILE_NAME = ? WHERE EB_SEQ=?";
		
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getFile_name());
			psmt.setInt(5, seq);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
		return count > 0?true:false;
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	public void Event_del(int seq) {
		String sql = " UPDATE TP2_EVENT_BOARD SET EB_DEL = EB_DEL+1 WHERE EB_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
	}
	public void likeup(int seq) {
		String sql = " UPDATE TP2_EVENT_BOARD SET EB_LIKE = EB_LIKE+1 WHERE EB_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
	}
	public void like_cancel(int seq) {
		String sql = " UPDATE TP2_EVENT_BOARD SET EB_LIKE = EB_LIKE-1 WHERE EB_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
	}
	public boolean in_receipt(int seq, String id) {
		
		int count = 0;
		String sql = " INSERT INTO TP2_BOARD_RECEIPT(BR_MEMBER_ID, BR_BOARD_TYPE, BR_BOARD_SEQ) "
				+ " VALUES(?, 0, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, seq);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
		
		
		return count>0?true:false;
	}
	public boolean out_receipt(int seq, String id) {
		
		int count = 0;
		String sql = " DELETE FROM TP2_BOARD_RECEIPT WHERE BR_BOARD_SEQ=? AND BR_MEMBER_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, id);
			
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
		
		
		return count>0?true:false;
	}
	
	public boolean like_cheak(String id, int seq) {
		boolean cheak = true;
		
		String sql = " SELECT * FROM TP2_BOARD_RECEIPT WHERE BR_MEMBER_ID=? AND BR_BOARD_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn=DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, seq);
			
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				cheak = false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cheak;
	}
}
