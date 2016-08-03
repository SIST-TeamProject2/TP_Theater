package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBControll;

public enum movieDAO {

	INSTANCE;
	
	private boolean isS = true;
	
	////////////////////////////////// 용호 //////////////////////////////////
	
	public List<movieDTO> MovieList(){
		String sql = " SELECT MV_SEQ, MV_NAME, MV_VIEW_COUNT, MV_GENRE, MV_FORMAT,MV_GRADE, MV_DIRETOR, MV_ACTOR, MV_RUNNING_TIME, MV_START_DATE, MV_POSTER, MV_VIDEO, MV_HEART, MV_STORY "
				+ " FROM TP2_MOVIE "
				+ " ORDER BY MV_VIEW_COUNT ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		log("1/6 MovieList");
		List<movieDTO> mlist = new ArrayList<movieDTO>();
		try {
			conn = DBControll.getConnection();
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
				dto.setStory(rs.getString(i++));
				mlist.add(dto);
			}
			log("5/6 MovieList");
		} catch (SQLException e) {
			log("MovieList Fail");
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
			log("6/6 MovieList");
		}
		return mlist;
	}
	
	
	public movieDTO moviedetail(int seq){
		
		String sql = " SELECT MV_SEQ, MV_NAME, MV_VIEW_COUNT, MV_GENRE, MV_FORMAT,MV_GRADE, MV_DIRETOR, MV_ACTOR, MV_RUNNING_TIME, MV_START_DATE, MV_POSTER, MV_VIDEO, MV_HEART, MV_STORY FROM TP2_MOVIE "
				+ " WHERE MV_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		movieDTO dto = new movieDTO();
		try {
			conn = DBControll.getConnection();
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
				dto.setStory(rs.getString(i++));
			}
			log("5/6 moviedetail");
		} catch (SQLException e) {
			log("moviedetail Fail");
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
			log("6/6 moviedetail");
		}
		return dto;
	}
	
	public boolean reviewfind(int seq, String id){
		
		String sql = " SELECT MVR_SEQ,MVR_ID,MVR_MOVIE_SEQ,MVR_CONTENT,MVR_LIKE_SCORE,MVR_LIKE_COUNT,MVR_DATE FROM TP2_MOVIE_REVIEW WHERE MVR_ID=? AND MVR_MOVIE_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		log("2/6 reviewfind");
		int count = 0; 
		
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, seq);
			rs = psmt.executeQuery();
		
			while(rs.next()){
				count = 1;
			}
			
			
			log("5/6 reviewfind");
		} catch (SQLException e) {
			log("reviewfind Fail");
		}finally{
			DBControll.closeDatabase(conn, psmt, rs);
			log("6/6 reviewfind");
		}
		
		return count>0?true:false;
	}
	
	public boolean likecount(int seq){
		
		String sql = " UPDATE TP2_MOVIE SET MV_HEART=MV_HEART+1 WHERE MV_SEQ=?";
	
		Connection conn = null;
		PreparedStatement psmt = null;

		log("1/5 Success likecount");
		int count =0;
		try {
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			log("2/5 Success likecount");
			psmt.setInt(1, seq);
			log("3/5 Success likecount");
			count = psmt.executeUpdate();
			log("4/5 Success likecount");
		} catch (SQLException e) {
			log("Fail downloadCount", e);
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
			log("5/5 Success likecount");
		}
		
		return count>0?true:false;
	}
	
	
	public boolean reviewupdate(String id,int seq,String content){

		String sql = " INSERT INTO TP2_MOVIE_REVIEW (MVR_SEQ,MVR_ID,MVR_MOVIE_SEQ,MVR_CONTENT,MVR_LIKE_SCORE,MVR_LIKE_COUNT,MVR_DATE) "
				+ "	VALUES(REVIEW_SEQUENCE.NEXTVAL,?,?,?,0,0,SYSDATE) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int count=0;
		log("2/5 Success reviewupdate");
		try {
		conn = DBControll.getConnection();
		psmt = conn.prepareStatement(sql);
		log("3/5 Success reviewupdate");
		int i = 1;
		psmt.setString(i++, id);
		psmt.setInt(i++, seq);
		psmt.setString(i++, content);
			
		count = psmt.executeUpdate();
		log("4/5 Success reviewupdate");
		} catch (SQLException e) {
			log("Fail reviewupdate", e);
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
			log("5/5 Success reviewupdate");
		}
		
		return count>0?true:false;
	}
		
	public List<moviereviewDTO> comentlist(int seq){
		
		String sql = " SELECT MVR_SEQ, MVR_ID, MVR_MOVIE_SEQ, MVR_CONTENT, MVR_LIKE_SCORE, MVR_LIKE_COUNT, MVR_DATE FROM TP2_MOVIE_REVIEW WHERE MVR_MOVIE_SEQ=? ORDER BY MVR_SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<moviereviewDTO> list = new ArrayList<moviereviewDTO>();
		
		try {
			log("2/5 Success comentlist");
			
			conn = DBControll.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				moviereviewDTO dto = new moviereviewDTO();
				int i = 1;
				dto.setMvr_seq(rs.getInt(i++));
				dto.setMvr_id(rs.getString(i++));
				dto.setMvr_movie_seq(rs.getInt(i++));
				dto.setMvr_content(rs.getString(i++));
				dto.setMvr_like_score(rs.getInt(i++));
				dto.setMvr_like_count(rs.getInt(i++));
				dto.setMvr_date(rs.getString(i++));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			log("Fail comentlist", e);
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
			log("5/5 Success comentlist");
		}
		return list;
	}
		
	public List<movieDTO> moviefind(String grade, String type,String keyword,String genre){
	
		String sql ="";
		System.out.println(type);
		if (type.equals("MV_ALL")) {
		 sql += " SELECT MV_SEQ, MV_NAME, MV_VIEW_COUNT, MV_GENRE, MV_FORMAT,MV_GRADE, MV_DIRETOR, MV_ACTOR, MV_RUNNING_TIME, MV_START_DATE, MV_POSTER, MV_VIDEO, MV_HEART, MV_STORY FROM (SELECT * FROM (SELECT * FROM TP2_MOVIE WHERE MV_NAME like '"+keyword+"' OR MV_DIRETOR like '"+keyword+"' OR MV_ACTOR like '"+keyword+"') WHERE MV_GRADE IN ('"+grade+"')) WHERE MV_GENRE IN ('"+genre+"') ";		 
		
			System.out.println(sql);
		}else{
		
		 sql +=" SELECT MV_SEQ, MV_NAME, MV_VIEW_COUNT, MV_GENRE, MV_FORMAT,MV_GRADE, MV_DIRETOR, MV_ACTOR, MV_RUNNING_TIME, MV_START_DATE, MV_POSTER, MV_VIDEO, MV_HEART, MV_STORY "
			+ " FROM (SELECT * FROM (SELECT * FROM TP2_MOVIE WHERE MV_GRADE IN ('" + grade + "')) WHERE "+type+" LIKE '"+keyword+"' )"
			+ " WHERE MV_GENRE IN ( '"+genre+"' ) "
			+ " ORDER BY MV_SEQ DESC ";
		}
		
		log("0/5 Success moviefind");
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<movieDTO> list = new ArrayList<movieDTO>();
		log("1/5 Success moviefind");
		try {
			conn = DBControll.getConnection();
			psmt =conn.prepareStatement(sql);
		/*
			psmt.setString(1, grade);
			psmt.setString(2, type);
			psmt.setString(3, keyword);
			psmt.setString(4, genre);*/
			log("2/5 Success moviefind");
			rs = psmt.executeQuery();
			log("3/5 Success moviefind");
			while(rs.next()){
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
				dto.setStory(rs.getString(i++));
				list.add(dto);
			}
			log("4/5 Success moviefind");
			
		} catch (SQLException e) {
			log("fail moviefind" ,e);
		}finally {
			DBControll.closeDatabase(conn, psmt, null);
			log("5/5 Success moviefind");
		}
		return list;
	}
		
		public List<chartDTO> chart(String name){
			String sql = " SELECT M_BIRTHDAY FROM TP2_RESERVATION "
					+ " INNER JOIN TP2_MEMBER ON R_MEMBER_ID=M_ID "
					+ " WHERE R_MOVIE_NAME=? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<chartDTO> list = new ArrayList<chartDTO>();
			log("2/5 Success chart");
			try {
				conn = DBControll.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);
				rs = psmt.executeQuery();
				log("4/5 Success chart");
				while (rs.next()) {
					chartDTO dto = new chartDTO();
					int i =1;
					dto.setAge(rs.getString(i++));
					
					list.add(dto);
				}
				log("3/5 Success chart");
			} catch (SQLException e) {
				log("fail chart");
			}finally {
				DBControll.closeDatabase(conn, psmt, rs);
				log("5/5 Success chart");
			}
			return list;
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
	/////////////////////////////////  !! 용호 ///////////////////////////////
	
	
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
