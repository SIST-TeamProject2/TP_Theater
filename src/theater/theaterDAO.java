package theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;


public class theaterDAO {
	
	private static theaterDAO dao;
	
	public static theaterDAO getInstance() {
		if(dao == null){
			dao = new theaterDAO();
		}
		return dao;
	}
	
	///////////모든 영화관리스트
	public List<theaterDTO> getTheater(){
		System.out.println("****************getTheater**********************");
		String sql = " SELECT T_FIELD, T_NAME ,T_ROOM_NUM ,T_TOTAL_SEAT FROM TP2_THEATER ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		List<theaterDTO> tlist = new ArrayList<theaterDTO>();
		log("1/6 Success getTheater");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success getTheater");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success getTheater");
			rs = psmt.executeQuery();
			log("4/6 Success getTheater");
			
			while(rs.next()){
				
				int i=1;
				String field = rs.getString(i++);
				String name = rs.getString(i++);
				int rnum=rs.getInt(i++);
				int tseat=rs.getInt(i++);
				
				theaterDTO tdto = new theaterDTO(field,name,rnum,tseat);
				tlist.add(tdto);
			}
			log("5/6 Success getTheater");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success getTheater");
		}
		return tlist;
	}
	
	
	/////필드눌렀을때 세부영화관출력용
	public List<String> selectTheater(String field){
		System.out.println("****************selectTheater**********************");
		String sql = " SELECT DISTINCT T_NAME FROM TP2_THEATER WHERE T_FIELD = '"+field+"'";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String name="";
	
		List<String> tlist = new ArrayList<String>();
		log("1/6 Success selectTheater");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success selectTheater");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success selectTheater");
			rs = psmt.executeQuery();
			log("4/6 Success selectTheater");
			
			while(rs.next()){
				
				int i=1;
			
				name = rs.getString(i++);
				tlist.add(name);
			}
			log("5/6 Success selectTheater");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success selectTheater");
		}
		return tlist;
	}
	
	
	/////영화제목 클릭했을때, 그 영화를 상영하고있는 영화관  code list------------------------JOIN전 사용
	public List<Integer> selectCode(String name){
		
		System.out.println("****************selectCode**********************");
		String sql = " SELECT T_CODE FROM TP2_THEATER WHERE T_NAME = '"+name+"'";
		System.out.println("sql ="+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<Integer> tlist = new ArrayList<Integer>();
	
		log("1/6 Success selectCode");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success selectCode");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success selectCode");
			rs = psmt.executeQuery();
			log("4/6 Success selectCode");
			
			while(rs.next()){
				
				int i=1;
				int code = rs.getInt(i++);
				tlist.add(code);
			}
			log("5/6 Success selectCode");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success selectCode");
		}

		return tlist;
	}
	

	
	
/*	///////영화,상영관 선택 후 일치 확인 ------------------JOIN사용
	public boolean compare_mv_theater(String mv, String theater){
		System.out.println("****************compare_mv_theater**********************");
		String sql = " SELECT * FROM TP2_THEATER INNER JOIN TP2_THEATER_ROOM ON T_CODE=TR_CODE WHERE "
				+ "T_NAME = '"+theater +"' TR_MOVIE_NAME = '" +mv+"'";
		
		System.out.println("sql ="+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean cnum =true;
		
		log("1/6 Success compare_mv_theater");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success compare_mv_theater");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success compare_mv_theater");
			rs = psmt.executeQuery();
			log("4/6 Success compare_mv_theater");
			
			while(rs.next()){
				
				int i=1;
				int code = rs.getInt(i++);
				tlist.add(code);
			}
			log("5/6 Success selcompare_mv_theaterectCode");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success compare_mv_theater");
		}

		return cnum
	}
	*/
	/*////해당 상영관에서 상영중인 	상영관룸번호/ 영화제목/상영시간 list---수정필요  수정하고있는거 밑에잇음
	public List<roomDTO> selectCode_getRoom2(int code){
	
		System.out.println("****************selectCode_getRoom**********************");
		
		String sql=" SELECT TR_CODE, TR_TIME, TR_MOVIE_NAME FROM TP2_THEATER_ROOM WHERE TR_CODE = '"+code+"'";
		
		System.out.println("sql ="+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
	
		List<roomDTO> tlist = new ArrayList<roomDTO>();
	
		log("1/6 Success selectCode_getRoom");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success selectCode_getRoom");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success selectCode_getRoom");
			rs = psmt.executeQuery();
			log("4/6 Success selectCode_getRoom");
			
			while(rs.next()){
				int i=1;
				
				int tr_code = rs.getInt(i++);
				String time = rs.getString(i++);
				String m_name=rs.getString(i++);
				
				roomDTO rdto = new roomDTO(tr_code,time,m_name);
				tlist.add(rdto);
			}
			log("5/6 Success selectCode_getRoom");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success selectCode_getRoom");
		}		
	
		return tlist;
	}*/
	
////해당 상영관에서 상영중인 	상영관룸번호/ 영화제목/상영시간 list 수정!!!!!!!!!!!1완료!!!!!!!!!!!!!!!!!!!!
	public List<roomDTO> selectCode_getRoom(String areaName){
	
		System.out.println("****************selectCode_getRoom**********************");
		
		String sql=" SELECT T_ROOM_NUM, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE FROM TP2_THEATER  INNER JOIN TP2_THEATER_ROOM "
				+ " ON T_CODE=TR_CODE WHERE T_NAME = '"+areaName+"'";
		

		System.out.println("sql ="+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
	
		List<roomDTO> tlist = new ArrayList<roomDTO>();
	
		log("1/6 Success selectCode_getRoom");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success selectCode_getRoom");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success selectCode_getRoom");
			rs = psmt.executeQuery();
			log("4/6 Success selectCode_getRoom");
			
			while(rs.next()){
				int i=1;
				
				int room_num = rs.getInt(i++);
				String start_time = rs.getString(i++);
				String movie_name= rs.getString(i++);
				String sdate= rs.getString(i++);
				String edate= rs.getString(i++);
				
				roomDTO rdto = new roomDTO(room_num,start_time,movie_name,sdate,edate);
				tlist.add(rdto);
			}
			log("5/6 Success selectCode_getRoom");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success selectCode_getRoom");
		}		
	System.out.println("tlist.size()==="+tlist.size());
		return tlist;
	}
	
	//////영화제목으로 전체 지역 검색
	public List<roomDTO> movieName_getRoom(String movieName){
		
		System.out.println("****************movieName_getRoom**********************");
		
		String sql=" SELECT T_ROOM_NUM, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE FROM TP2_THEATER  INNER JOIN TP2_THEATER_ROOM "
				+ " ON T_CODE=TR_CODE WHERE TR_MOVIE_NAME = '"+movieName+"'";
		
		System.out.println("sql ="+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
	
		List<roomDTO> tlist = new ArrayList<roomDTO>();
	
		log("1/6 Success movieName_getRoom");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success movieName_getRoom");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success movieName_getRoom");
			rs = psmt.executeQuery();
			log("4/6 Success movieName_getRoom");
			
			while(rs.next()){
				int i=1;
				
				int room_num = rs.getInt(i++);
				String start_time = rs.getString(i++);
				String movie_name= rs.getString(i++);
				String sdate= rs.getString(i++);
				String edate= rs.getString(i++);
				
				roomDTO rdto = new roomDTO(room_num,start_time,movie_name,sdate,edate);
				tlist.add(rdto);
			}
			log("5/6 Success movieName_getRoom");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success movieName_getRoom");
		}		
	
		return tlist;
	}
	

public List<theaterDTO> movieName_getTheater(String movieName){
		
		System.out.println("****************movieName_getTheater**********************");
		
		String sql=" SELECT T_FIELD, T_NAME, T_ROOM_NUM, T_TOTAL_SEAT FROM TP2_THEATER  INNER JOIN TP2_THEATER_ROOM "
				+ " ON T_CODE=TR_CODE WHERE TR_MOVIE_NAME = '"+movieName+"'";
		
		System.out.println("sql ="+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
	
		List<theaterDTO> tlist = new ArrayList<theaterDTO>();
	
		log("1/6 Success movieName_getTheater");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success movieName_getTheater");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success movieName_getTheater");
			rs = psmt.executeQuery();
			log("4/6 Success movieName_getTheater");
			
			while(rs.next()){
				int i=1;
				
				
				String field = rs.getString(i++);
				String name = rs.getString(i++);
				int room_num = rs.getInt(i++);
				int tseat = rs.getInt(i++);
				
				theaterDTO rdto = new theaterDTO(field,name,room_num,tseat);
				tlist.add(rdto);
			}
			log("5/6 Success movieName_getTheater");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success movieName_getTheater");
		}		
	
		return tlist;
	}
	
///////////////////////선택한 영화/영화관/상영관/선택한날짜(4)       -->       예매인원수
public int reservation_count_people(String movie, String theater, int room , String date){

	System.out.println("****************existSeat**********************");
	System.out.println(theater+"/"+movie+"/"+date+"/"+room);
	String sql = " SELECT R_SEE_PEOPLE FROM TP2_THEATER A INNER JOIN TP2_RESERVATION B ON A.T_NAME =B.R_THEATER_NAME "
			+ " WHERE A.T_NAME=? AND B.R_MOVIE_NAME=?  AND B.R_SEE_DATE=?  AND A.T_ROOM_NUM=? ";
	System.out.println("sql ="+sql);
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int existSeat=0;

	log("1/6 Success existSeat");
	try{
		conn = DBConnection.getConnection();
		log("2/6 Success existSeat");
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, movie);
		psmt.setString(2, theater);
		psmt.setString(3, date);
		psmt.setInt(4, room);
		
		log("3/6 Success existSeat");
		rs = psmt.executeQuery();
		log("4/6 Success existSeat");
		
		while(rs.next()){
			int i=1;
			existSeat +=rs.getInt(i++);
		}
		log("5/6 Success existSeat");
	}catch(SQLException e){
		log("fail",e);
	}finally{
		DBConnection.close(conn, psmt, rs);
		log("6/6 Success existSeat");
	}
	System.out.println("======="+existSeat);
	return existSeat;
}


public List<String> existSeat(String movie, String theater, int room , String date){

	System.out.println("****************existSeat**********************");
	System.out.println(theater+"/"+movie+"/"+date+"/"+room);
	String sql = " SELECT R_SEAT FROM TP2_THEATER A INNER JOIN TP2_RESERVATION B ON A.T_NAME =B.R_THEATER_NAME "
			+ " WHERE A.T_NAME=? AND B.R_MOVIE_NAME=?  AND B.R_SEE_DATE=?  AND A.T_ROOM_NUM=? ";
	System.out.println("sql ="+sql);
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	List<String>arr = new ArrayList<String>();

	log("1/6 Success existSeat");
	try{
		conn = DBConnection.getConnection();
		log("2/6 Success existSeat");
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, movie);
		psmt.setString(2, theater);
		psmt.setString(3, date);
		psmt.setInt(4, room);
		
		log("3/6 Success existSeat");
		rs = psmt.executeQuery();
		log("4/6 Success existSeat");
		
		while(rs.next()){
			int i=1;
			String temp = rs.getString(i++);
			arr.add(temp);
		}
		log("5/6 Success existSeat");
	}catch(SQLException e){
		log("fail",e);
	}finally{
		DBConnection.close(conn, psmt, rs);
		log("6/6 Success existSeat");
	}
	System.out.println("======="+arr.size());
	return arr;
}



public void	log(String msg) {		
		
			System.out.println(getClass() + ": " + msg);
			
	}	
	public void	log(String msg, Exception e) {
	
			System.out.println(e + ": " + getClass() + ": " + msg);
			
	}

}
