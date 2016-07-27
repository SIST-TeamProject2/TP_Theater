package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;




public class movieDAO {
	private boolean isS = true;
	private static movieDAO movDAO;
	
	private movieDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log("1/6 Success");
		} catch (ClassNotFoundException ex) {
			log("1/6 Fail", ex);
			System.out.println(ex.getMessage());
		}
	}
	public static movieDAO getInstance() {
		if (movDAO == null) {
			movDAO = new movieDAO();
		}
		return movDAO;
		
		
	}
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String passwd = "hr";

		conn = DriverManager.getConnection(url, user, passwd);
		return conn;
	}
	public static void close(Connection conn, Statement psmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (psmt != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}
	}

	public List<movieDTO> MovieList(){
		String sql = " SELECT MV_SEQ, MV_NAME, MV_VIEW_COUNT, MV_GENRE, MV_FORMAT,MV_GRADE, MV_DIRETOR, MV_ACTOR, MV_RUNNING_TIME, MV_START_DATE, MV_POSTER, MV_VIDEO, MV_HEART FROM TP2_MOVIE ORDER BY MV_VIEW_COUNT";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		log("1/6 MovieList");
		List<movieDTO> mlist = new ArrayList<movieDTO>();
		try {
			conn = movieDAO.getConnection();
			log("2/6 MovieList");
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			log("3/6 MovieList");
			while (rs.next()) {
				movieDTO dto = new movieDTO();
				int i = 1;
				dto.setSeq(rs.getInt(i++));
				dto.setName(rs.getString(i++));
				dto.setView_count(rs.getInt(i++));
				dto.setGenre(rs.getString(i++));
				dto.setFormat(rs.getString(i++));
				dto.setGrade(rs.getString(i++));
				dto.setDiretor(rs.getString(i++));
				dto.setActor(rs.getString(i++));
				dto.setRunning_time(rs.getString(i++));
				dto.setStart_time(rs.getString(i++));
				dto.setPoster(rs.getString(i++));
				dto.setVideo(rs.getString(i++));
				dto.setHeart(rs.getInt(i++));
				mlist.add(dto);
			}
			log("5/6 MovieList");
		} catch (SQLException e) {
			log("MovieList Fail");
		}finally {
			movieDAO.close(conn, psmt, rs);
			log("6/6 MovieList");
		}
		return mlist;
	}
	
	
	public movieDTO moviedetail(int seq){
		
		String sql = " SELECT MV_SEQ, MV_NAME, MV_VIEW_COUNT, MV_GENRE, MV_FORMAT,MV_GRADE, MV_DIRETOR, MV_ACTOR, MV_RUNNING_TIME, MV_START_DATE, MV_POSTER, MV_VIDEO, MV_HEART FROM TP2_MOVIE "
				+ " WHERE MV_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		movieDTO dto = new movieDTO();
		try {
			conn = movieDAO.getConnection();
			log("2/6 moviedetail");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			log("3/6 moviedetail");
			while (rs.next()) {
				int i = 1;
				dto.setSeq(rs.getInt(i++));
				dto.setName(rs.getString(i++));
				dto.setView_count(rs.getInt(i++));
				dto.setGenre(rs.getString(i++));
				dto.setFormat(rs.getString(i++));
				dto.setGrade(rs.getString(i++));
				dto.setDiretor(rs.getString(i++));
				dto.setActor(rs.getString(i++));
				dto.setRunning_time(rs.getString(i++));
				dto.setStart_time(rs.getString(i++));
				dto.setPoster(rs.getString(i++));
				dto.setVideo(rs.getString(i++));
				dto.setHeart(rs.getInt(i++));
			}
			log("5/6 moviedetail");
		} catch (SQLException e) {
			log("moviedetail Fail");
		}finally {
			movieDAO.close(conn, psmt, rs);
			log("6/6 moviedetail");
		}
		return dto;
	}
	
	public boolean reviewfind(int seq, String id){
		
		String sql = " SELECT MVR_SEQ,MVR_ID,MVR_MOVIE_SEQ,MVR_CONTENT,MVR_LIKE_SCORE,MVR_LIKE_COUNT FROM TP2_MOVIE_REVIEW WHERE MVR_ID=? AND MVR_MOVIE_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		log("2/6 reviewfind");
		int count = 0; 
		
		moviereviewDTO dto = new moviereviewDTO();
		
		try {
			conn = movieDAO.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, seq);
			rs = psmt.executeQuery();
		
			while(rs.next()){
				count = 1;
			}
			
			
			log("5/6 reviewfind");
		} catch (Exception e) {
			log("reviewfind Fail");
		}finally{
			movieDAO.close(conn, psmt, rs);
			log("6/6 reviewfind");
		}
		
		return count>0?true:false;
	}
	
	
	public boolean likecount(int seq){
		
		String sql = " UPDATE TP2_MOVIE SET MV_HEART=MV_HEART+1 WHERE MV_SEQ=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		log("1/5 Success likecount");
		int count =0;
		try {
			conn = movieDAO.getConnection();
			psmt = conn.prepareStatement(sql);
			log("2/5 Success likecount");
			psmt.setInt(1, seq);
			log("3/5 Success likecount");
			count = psmt.executeUpdate();
			log("4/5 Success likecount");
		} catch (SQLException e) {
			log("Fail downloadCount", e);
		}finally {
			movieDAO.close(conn, psmt, null);
			log("5/5 Success likecount");
		}
		
		return count>0?true:false;
	}
	
	public boolean reviewupdate(String id,int seq,String content){

		String sql = " INSERT INTO TP2_MOVIE_REVIEW (MVR_SEQ,MVR_ID,MVR_MOVIE_SEQ,MVR_CONTENT,MVR_LIKE_SCORE,MVR_LIKE_COUNT) "
				+ "	VALUES(REVIEW_SEQUENCE.NEXTVAL,?,?,?,0,0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int count=0;
		log("2/5 Success reviewupdate");
		try {
		conn = movieDAO.getConnection();
		psmt = conn.prepareStatement(sql);
		log("3/5 Success reviewupdate");
		int i = 1;
		psmt.setString(i++, id);
		psmt.setInt(i++, seq);
		psmt.setString(i++, content);
			
		count = psmt.executeUpdate();
		log("4/5 Success reviewupdate");
		} catch (Exception e) {
			log("Fail reviewupdate", e);
		}finally {
			movieDAO.close(conn, psmt, null);
			log("5/5 Success reviewupdate");
		}
		
		return count>0?true:false;
	}
	
	
	
	public void log(String msg) {
		if (isS) {
			System.out.println(getClass() + ": " + msg);
		}
	}

	public void log(String msg, Exception e) {
		if (isS) {
			System.out.println(e + ": " + getClass() + ": " + msg);
		}
	}
}
