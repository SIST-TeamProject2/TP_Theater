package NOTICE_BOARD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*import com.sun.org.apache.regexp.internal.recompile;
*/
import DB.DBControll;

public class Notice_Board_Dao {
	
	private static Notice_Board_Dao notice_dao;
	
	public Notice_Board_Dao() {
		
	}
	public static Notice_Board_Dao getInstance() {
		if(notice_dao==null){
			notice_dao = new Notice_Board_Dao();
		}return notice_dao;
	}
	
	public boolean writeN_Board(Notice_Board_Dto dto){
		int count = 0;
		
		String sql = " INSERT INTO TP2_NOTICE_BOARD (NB_SEQ ,NB_WRITE_ID ,NB_CATEGORY,NB_TITLE,NB_CONTENT,NB_READ_COUNT,NB_WRITE_DATE,NB_DEL) "
				+ " VALUES ( SEQ_NOTICE.NEXTVAL, ?, ?, ?, ?, 0, to_char(SYSDATE,'yyyy/mm/dd'), 0 )";
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn=DBControll.getConnection();
			psmt=conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getCategory());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
		}	
		return count > 0? true:false;
	}
	
	public List<Notice_Board_Dto> getN_boardlist(String category) {
		List<Notice_Board_Dto> list = new ArrayList<Notice_Board_Dto>();
		String sql = "";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBControll.getConnection();
			
			if(category!=null){
				sql = " SELECT * FROM TP2_NOTICE_BOARD WHERE NB_CATEGORY =? ORDER BY NB_SEQ DESC ";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, category);

			}else{
				sql = " SELECT * FROM TP2_NOTICE_BOARD ORDER BY NB_SEQ DESC ";
				psmt = conn.prepareStatement(sql);

			}
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				Notice_Board_Dto dto = new Notice_Board_Dto(
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getString(i++),
						rs.getInt(i++));
				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
		}
		return list;	
	}
	
	public Notice_Board_Dto get_Bdto(int seq) {
		Notice_Board_Dto dto = null;
		
		String sql = " SELECT * FROM TP2_NOTICE_BOARD WHERE NB_SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn=DBControll.getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				dto = new Notice_Board_Dto(
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getInt(i++),
						rs.getString(i++),
						rs.getInt(i++));
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	public void Notice_readCount(int seq) {
		String sql = " UPDATE TP2_NOTICE_BOARD SET NB_READ_COUNT = NB_READ_COUNT+1 WHERE NB_SEQ=? ";
		
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
	public void Notice_del(int seq) {
		String sql = " UPDATE TP2_NOTICE_BOARD SET NB_DEL = NB_DEL+1 WHERE NB_SEQ=? ";
		
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
	public boolean Notice_modify(int seq, Notice_Board_Dto dto) {
		String sql = " UPDATE TP2_NOTICE_BOARD SET NB_CATEGORY=? , NB_TITLE=? , NB_CONTENT=? WHERE NB_SEQ=?" ;
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBControll.getConnection();
			psmt=conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, seq);
			
			count = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBControll.closeDatabase(conn, psmt, null);
		}
		return count > 0? true:false;
	}
	
}
