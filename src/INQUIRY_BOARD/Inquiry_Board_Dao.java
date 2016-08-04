package INQUIRY_BOARD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBControll;

public class Inquiry_Board_Dao {

	private static Inquiry_Board_Dao inquiry_dao;

	public Inquiry_Board_Dao() {
		
		}

	public static Inquiry_Board_Dao getInstance() {
		if (inquiry_dao == null) {
			inquiry_dao = new Inquiry_Board_Dao();
		}
		return inquiry_dao;
	}
	
	public boolean writeI_board(Inquiry_Board_Dto dto) {
		int count=0;
		
		String sql = " INSERT INTO TP2_INQUIRY_BOARD (IB_SEQ, IB_WRITE_ID, IB_REF, IB_STEP, IB_DEPTH, IB_PARENT, IB_TITLE, IB_CONTENT, IB_READ_COUNT, "
				+ " IB_WRITE_DATE, IB_STAR_COUNT, IB_DEL) VALUES(SEQ_INQURIRY.NEXTVAL, ?, (SELECT NVL(MAX(IB_REF), 0)+1 FROM TP2_INQUIRY_BOARD), "
				+ " 0, 0, 0, ?, ?, 0, SYSDATE, 0, 0) " ;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn=DBControll.getConnection();
			psmt=conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
		
		
		
		
		return count >0? true:false;
	}
	public List<Inquiry_Board_Dto> Inquiry_list(String id) {
		List<Inquiry_Board_Dto>I_list = new ArrayList<Inquiry_Board_Dto>();
		String sql = "";
		if(id.equals("admin")){
			sql = " SELECT * FROM TP2_INQUIRY_BOARD ORDER BY IB_REF DESC, IB_STEP ASC " ;
		}else{		
			sql = " SELECT * FROM TP2_INQUIRY_BOARD WHERE IB_WRITE_ID=? ORDER BY IB_REF DESC, IB_STEP ASC " ;
		}
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn=DBControll.getConnection();
			psmt=conn.prepareStatement(sql);
			if(!id.equals("admin")){
			psmt.setString(1, id);
			}
			rs = psmt.executeQuery();
			while (rs.next()) { 
				int i =1;
				Inquiry_Board_Dto dto = new Inquiry_Board_Dto(
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getInt(i++),
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getInt(i));
				I_list.add(dto);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		
		return I_list;
	}
	public Inquiry_Board_Dto I_getdto(int seq) {
		Inquiry_Board_Dto dto = null;
		String sql = " SELECT * FROM TP2_INQUIRY_BOARD WHERE IB_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				int i =1;

				dto = new Inquiry_Board_Dto(
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getInt(i++),
						rs.getInt(i++));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		return dto;
	}
	
	public boolean Inqurity_answer(int seq, String id, Inquiry_Board_Dto dto) {
		int count = 0;
		String sql1 = " UPDATE TP2_INQUIRY_BOARD SET IB_STEP = IB_STEP+1 "
				+ " WHERE IB_REF = (SELECT IB_REF FROM TP2_INQUIRY_BOARD WHERE IB_SEQ=? ) AND "
				+ " IB_STEP > (SELECT IB_STEP FROM TP2_INQUIRY_BOARD WHERE IB_SEQ=?) ";
		
		String sql2 = " INSERT INTO TP2_INQUIRY_BOARD (IB_SEQ ,IB_WRITE_ID,IB_REF,IB_STEP,IB_DEPTH, "
				+ " IB_PARENT,IB_TITLE,IB_CONTENT,IB_READ_COUNT,IB_WRITE_DATE,IB_STAR_COUNT,IB_DEL ) "
				+ " VALUES( SEQ_INQURIRY.NEXTVAL, ?, "
				+ " (SELECT IB_REF FROM TP2_INQUIRY_BOARD WHERE IB_SEQ=? ), "
				+ " (SELECT IB_STEP FROM TP2_INQUIRY_BOARD WHERE IB_SEQ=?)+1, "
				+ " (SELECT IB_DEPTH FROM TP2_INQUIRY_BOARD WHERE IB_SEQ=?)+1, "
				+ " ?, ?, ?, 0, SYSDATE, 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			count = psmt.executeUpdate();
			psmt.clearParameters();
			
			psmt = conn.prepareStatement(sql2);
			int i = 1;
			psmt.setString(i++, id);
			psmt.setInt(i++, seq);
			psmt.setInt(i++, seq);
			psmt.setInt(i++, seq);
			psmt.setInt(i++, seq);
			psmt.setString(i++, dto.getTitle());
			psmt.setString(i++, dto.getContent());

			count = psmt.executeUpdate();

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (Exception e2) {
				// TODO: handle exception
			}
			DBControll.closeDatabase(conn, psmt, null);
		}
				
		
		
		
		return count>0? true:false;
	}
	
	public void Inquiry_starcount(int seq, int star_count) {
		String sql = " UPDATE TP2_INQUIRY_BOARD SET IB_STAR_COUNT = ? WHERE IB_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, star_count);
			psmt.setInt(2, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}
	}
	public void Inquiry_readcount(int seq) {
		String sql = " UPDATE TP2_INQUIRY_BOARD SET IB_READ_COUNT = IB_READ_COUNT+1 WHERE IB_SEQ=? ";
		
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
	
}
