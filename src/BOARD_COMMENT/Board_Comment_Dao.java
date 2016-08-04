package BOARD_COMMENT;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBControll;
import EVENT_BOARD.Event_Board_Dto;
import INQUIRY_BOARD.Inquiry_Board_Dto;

public class Board_Comment_Dao {
	
	private static Board_Comment_Dao comment_dao;
	
	public Board_Comment_Dao() {
		
	}
	public static Board_Comment_Dao getInstance() {
		if(comment_dao==null){
			comment_dao = new Board_Comment_Dao();
		}return comment_dao;
	}
	public boolean Event_comment(Board_Comment_Dto dto, int seq) {
		int count = 0;
		
		String sql= " INSERT INTO TP2_BOARD_COMMENT (BC_SEQ, BC_WRITE_MEMBER_ID, BC_REF, BC_STEP, BC_DEPTH, BC_PARENT, "
				+ " BC_CONTENT, BC_WRITE_DATE, BC_DEL, EB_SEQ) "
				+ " VALUES (SEQ_COMMENT.NEXTVAL, ?, (SELECT NVL(MAX(BC_REF), 0)+1 FROM TP2_BOARD_COMMENT), "
				+ " 0, 0, 0, ?, SYSDATE, 0, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		
		try {
			conn=DBControll.getConnection();	
			psmt=conn.prepareStatement(sql);
			int i=1;
			psmt.setString(i++, dto.getId());
			psmt.setString(i++, dto.getContent());
			psmt.setInt(i++, seq);
			
			count = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBControll.closeDatabase(conn, psmt, rs);
		}
		return count>0?true:false;
	}
	public List<Board_Comment_Dto> comment_list(int seq) {
		
		String sql = " SELECT * FROM TP2_BOARD_COMMENT WHERE EB_SEQ=?"
				+ " ORDER BY BC_REF DESC, BC_STEP ASC ";	//�젙�젹�븳�떎.
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<Board_Comment_Dto> c_list = new ArrayList<Board_Comment_Dto>();
		try {
			conn=DBControll.getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs=psmt.executeQuery();
			while (rs.next()) {
				int i = 1;
				Board_Comment_Dto dto=new Board_Comment_Dto(
						rs.getInt(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getInt(i++)); 
				
				c_list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		return c_list;

	}
	public boolean Comment_answer(int seq, String id, Board_Comment_Dto dto, int eb_seq) {
		int count = 0;
		String sql1 = " UPDATE TP2_BOARD_COMMENT SET BC_STEP = BC_STEP+1 "
				+ " WHERE BC_REF = (SELECT BC_REF FROM TP2_BOARD_COMMENT WHERE BC_SEQ=? ) AND "
				+ " BC_STEP > (SELECT BC_STEP FROM TP2_BOARD_COMMENT WHERE BC_SEQ=?) ";
		
		String sql2 = " INSERT INTO TP2_BOARD_COMMENT (BC_SEQ ,BC_WRITE_MEMBER_ID,BC_REF,BC_STEP,BC_DEPTH, "
				+ " BC_PARENT,BC_CONTENT,BC_WRITE_DATE,BC_DEL, EB_SEQ) "
				+ " VALUES( SEQ_COMMENT.NEXTVAL, ?, "
				+ " (SELECT BC_REF FROM TP2_BOARD_COMMENT WHERE BC_SEQ=? ), "
				+ " (SELECT BC_STEP FROM TP2_BOARD_COMMENT WHERE BC_SEQ=?)+1, "
				+ " (SELECT BC_DEPTH FROM TP2_BOARD_COMMENT WHERE BC_SEQ=?)+1, "
				+ " ?, ?, SYSDATE, 0, ?) ";
		
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
			psmt.setString(i++, dto.getContent());
			psmt.setInt(i++, eb_seq);

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
	public void Comment_del(int seq) {
		String sql = " UPDATE TP2_BOARD_COMMENT SET BC_DEL = BC_DEL+1 WHERE BC_SEQ=? ";
		
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
