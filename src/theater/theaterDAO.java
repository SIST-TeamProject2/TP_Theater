package theater;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class theaterDAO {

	private boolean isS = true;
	private static theaterDAO theaterdao;
	
	private theaterDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log("1/6 Success");
		} catch (ClassNotFoundException ex) {
			log("1/6 Fail", ex);
			System.out.println(ex.getMessage());
		}
	}
	public static theaterDAO getInstance() {
		if (theaterdao == null) {
			theaterdao = new theaterDAO();
		}
		return theaterdao;
		
		
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
	public List<theaterDTO> fieldlist(String num){
		
		String sql = " SELECT T_NAME FROM (SELECT * FROM TP2_THEATER WHERE T_CODE LIKE '"+num+"%' ORDER BY T_NAME) GROUP BY T_NAME "; 
		
		List<theaterDTO> list = new ArrayList<theaterDTO>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		log("3/6 fieldlist");
		try {
		conn = theaterDAO.getConnection();
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		log("4/6 fieldlist");
		while (rs.next()) {
			theaterDTO dto = new theaterDTO();
			int i = 1;
			dto.setT_name(rs.getString(i++));
			
			list.add(dto);
		}
		log("4/6 fieldlist");
		} catch (SQLException e) {
			log("fail fieldlist");
		}finally {
			theaterDAO.close(conn, psmt, rs);
			log("6/6 fieldlist");
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
		log("1/6 schedule");
		
		try {
		conn = theaterDAO.getConnection();
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		log("2/6 schedule");
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
		log("3/6 schedule");
		} catch (SQLException e) {
			log("fail schedule");
		}finally {
			theaterDAO.close(conn, psmt, rs);
			log("6/6 schedule");
		}
		return list;
	}
	
	
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
		      conn = theaterDAO.getConnection();
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
		      theaterDAO.close(conn, psmt, rs);
		      log("6/6 Success existSeat");
		   }
		   System.out.println("======="+existSeat);
		   return existSeat;
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
