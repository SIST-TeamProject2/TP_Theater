package theater;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DB.DBControll;

import theater.theaterDTO;


public class theaterDAO {

	private boolean isS = true;
	
	private static theaterDAO dao;
	
	public static theaterDAO getInstance() {
		if(dao == null){
			dao = new theaterDAO();
		}
		return dao;
	}
	

	public List<theaterDTO> fieldlist(String num){
		
		String sql = " SELECT T_NAME FROM (SELECT * FROM TP2_THEATER WHERE T_CODE LIKE '"+num+"%' ORDER BY T_NAME) GROUP BY T_NAME "; 
		
		List<theaterDTO> list = new ArrayList<theaterDTO>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	//	log("3/6 fieldlist");
		try {
		conn = DBControll.getConnection();
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		//log("4/6 fieldlist");
		while (rs.next()) {
			theaterDTO dto = new theaterDTO();
			int i = 1;
			dto.setT_name(rs.getString(i++));
			
			list.add(dto);
		}
	//	log("4/6 fieldlist");
		} catch (SQLException e) {
			log("fail fieldlist");
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
		//	log("6/6 fieldlist");
		}
		
		
		return list;
	}
	
	
	public List<theaterscheduleDTO> getschedule(String t_name){
		
		String sql = " SELECT T_CODE, T_FIELD, T_NAME, T_ROOM_NUM, T_TOTAL_SEAT, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE, TR_OUT_SEAT "
				+ " FROM TP2_THEATER INNER JOIN TP2_THEATER_ROOM ON T_CODE=TR_CODE WHERE T_NAME='"+t_name+"' ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<theaterscheduleDTO> list = new ArrayList<theaterscheduleDTO>();
	//	log("1/6 schedule");
		
		try {
		conn =DBControll.getConnection();
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
	//	log("2/6 schedule");
		while (rs.next()) {
			theaterscheduleDTO dto = new theaterscheduleDTO();
			int i = 1;
			dto.setT_code(rs.getInt(i++));
			dto.setT_field(rs.getString(i++));
			dto.setT_name(rs.getString(i++));
			dto.setT_room_num(rs.getInt(i++));
			dto.setT_total_seat(rs.getInt(i++));
			dto.setTr_time(rs.getString(i++));
			dto.setTr_movie_name(rs.getString(i++));
			dto.setTr_start_date(rs.getString(i++));
			dto.setTr_end_date(rs.getString(i++));
			dto.setTr_out_seat(rs.getInt(i++));
			list.add(dto);
		}
		//log("3/6 schedule");
		} catch (SQLException e) {
		//	log("fail schedule");
		}finally {
			DBControll.closeDatabase(conn, psmt, rs);
		//	log("6/6 schedule");
		}
		return list;
	}
	
	
	///////////모든 영화관리스트
	public List<theaterDTO> getTheater(){
		//System.out.println("****************getTheater**********************");
		String sql = " SELECT T_FIELD, T_NAME ,T_ROOM_NUM ,T_TOTAL_SEAT FROM TP2_THEATER ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		List<theaterDTO> tlist = new ArrayList<theaterDTO>();
		//log("1/6 Success getTheater");
		try{
			conn = DBControll.getConnection();
		//	log("2/6 Success getTheater");
			psmt = conn.prepareStatement(sql);
			//log("3/6 Success getTheater");
			rs = psmt.executeQuery();
			//log("4/6 Success getTheater");
			
			while(rs.next()){
				
				int i=1;
				String field = rs.getString(i++);
				String name = rs.getString(i++);
				int rnum=rs.getInt(i++);
				int tseat=rs.getInt(i++);
				
				theaterDTO tdto = new theaterDTO(field,name,rnum,tseat);
				tlist.add(tdto);
			}
		//	log("5/6 Success getTheater");
		}catch(SQLException e){
		//	log("fail",e);
		}finally{
			DBControll.closeDatabase(conn, psmt, rs);
			//log("6/6 Success getTheater");
		}
		return tlist;
	}
	
	
	/////필드눌렀을때 세부영화관출력용
	public List<String> selectTheater(String field){
	//	System.out.println("****************selectTheater**********************");
		String sql = " SELECT DISTINCT T_NAME FROM TP2_THEATER WHERE T_FIELD = '"+field+"'";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String name="";
	
		List<String> tlist = new ArrayList<String>();
		//log("1/6 Success selectTheater");
		try{
			conn = DBControll.getConnection();
			//log("2/6 Success selectTheater");
			psmt = conn.prepareStatement(sql);
			//log("3/6 Success selectTheater");
			rs = psmt.executeQuery();
			//log("4/6 Success selectTheater");
			
			while(rs.next()){
				
				int i=1;
			
				name = rs.getString(i++);
				tlist.add(name);
			}
			//log("5/6 Success selectTheater");
		}catch(SQLException e){
			//log("fail",e);
		}finally{
			DBControll.closeDatabase(conn, psmt, rs);
			//log("6/6 Success selectTheater");
		}
		return tlist;
	}
	
	
	/////영화제목 클릭했을때, 그 영화를 상영하고있는 영화관  code list------------------------JOIN전 사용
	public List<Integer> selectCode(String name){
		
		//System.out.println("****************selectCode**********************");
		String sql = " SELECT T_CODE FROM TP2_THEATER WHERE T_NAME = '"+name+"'";
		System.out.println("sql ="+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<Integer> tlist = new ArrayList<Integer>();
	
		//log("1/6 Success selectCode");
		try{
			conn = DBControll.getConnection();
		//	log("2/6 Success selectCode");
			psmt = conn.prepareStatement(sql);
			//log("3/6 Success selectCode");
			rs = psmt.executeQuery();
			//log("4/6 Success selectCode");
			
			while(rs.next()){
				
				int i=1;
				int code = rs.getInt(i++);
				tlist.add(code);
			}
			//log("5/6 Success selectCode");
		}catch(SQLException e){
			//log("fail",e);
		}finally{
			DBControll.closeDatabase(conn, psmt, rs);
			//log("6/6 Success selectCode");
		}

		return tlist;
	}
	


	   
	   public List<theaterscheduleDTO> getschedule(String t_name,String date){
	      
	      String sql =" SELECT T_CODE, T_FIELD, T_NAME, T_ROOM_NUM, T_TOTAL_SEAT, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE, TR_OUT_SEAT FROM TP2_THEATER "
	            + " INNER JOIN TP2_THEATER_ROOM ON T_CODE=TR_CODE WHERE T_NAME='"+t_name+"' AND TR_END_DATE > '"+date+"' ";
	      
	            
	      
	    //  System.out.println(sql);
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;

	      List<theaterscheduleDTO> list = new ArrayList<theaterscheduleDTO>();
	     // log("1/6 schedule");
	      
	      try {
	    	  conn = DBControll.getConnection();
	      psmt = conn.prepareStatement(sql);
	      rs = psmt.executeQuery();
	    //  log("2/6 schedule");
	      while (rs.next()) {
	         theaterscheduleDTO dto = new theaterscheduleDTO();
	         int i = 1;
	         dto.setT_code(rs.getInt(i++));
	         dto.setT_field(rs.getString(i++));
	         dto.setT_name(rs.getString(i++));
	         dto.setT_room_num(rs.getInt(i++));
	         dto.setT_total_seat(rs.getInt(i++));
	         dto.setTr_time(rs.getString(i++));
	         dto.setTr_movie_name(rs.getString(i++));
	         dto.setTr_start_date(rs.getString(i++));
	         dto.setTr_end_date(rs.getString(i++));
	         dto.setTr_out_seat(rs.getInt(i++));
	         list.add(dto);
	      }
	      //log("3/6 schedule");
	      } catch (SQLException e) {
	      //   log("fail schedule");
	      }finally {
	    	  DBControll.closeDatabase(conn, psmt, rs);	         log("6/6 schedule");
	      }
	      return list;
	   }
	   
	   
	   public int reservation_count_people(String title,String date,String name){

	         String sql = " SELECT R_SEE_PEOPLE FROM TP2_RESERVATION WHERE R_SEE_DATE = '"+date+"' AND R_MOVIE_NAME ='"+title+"' AND R_THEATER_NAME ='"+name+"'" ;
	        // System.out.println("sql ="+sql);
	         Connection conn = null;
	         PreparedStatement psmt = null;
	         ResultSet rs = null;

	         int existSeat=0;

	       //  log("1/6 Success existSeat");
	         try{
	        	 conn = DBControll.getConnection();
	         //   log("2/6 Success existSeat");
	            psmt = conn.prepareStatement(sql);
	            
	          //  log("3/6 Success existSeat");
	            rs = psmt.executeQuery();
	          //  log("4/6 Success existSeat");
	            
	            while(rs.next()){
	               int i=1;
	               existSeat +=rs.getInt(i++);
	            }
	          //  log("5/6 Success existSeat");
	         }catch(SQLException e){
	          //  log("fail",e);
	         }finally{
	        	 DBControll.closeDatabase(conn, psmt, rs);
	          //  log("6/6 Success existSeat");
	         }
	       //  System.out.println("======="+existSeat);
	         return existSeat;
	      }
	   
	   
	
	
	
	
	public void log(String msg) {
		if (isS) {
			//System.out.println(getClass() + ": " + msg);
		}
	}

	public void log(String msg, Exception e) {
		if (isS) {
			//System.out.println(e + ": " + getClass() + ": " + msg);
		}
	}
}
