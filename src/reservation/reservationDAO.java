package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import coupon.couponDAO;
import coupon.couponDTO;
import db.DBConnection;

public class reservationDAO {
private static reservationDAO dao;
	
	public static reservationDAO getInstance() {
		if(dao == null){
			dao = new reservationDAO();
		}
		return dao;
	}
	
	
	public boolean  InputReservation(String id, String  sdate, String name, 
			String theater, int room, String time, String seat ,int seenum){
		
		String sql = " INSERT INTO TP2_RESERVATION ( R_SEQ, R_MEMBER_ID, R_PAY, R_PAY_TYPE, R_PAY_DATE, R_SEE_DATE, R_MOVIE_NAME, "
				+ " R_THEATER_NAME, R_THEATER_ROOM_NUM, R_THEATER_ROOM_TIME, R_SEAT , R_SEE_PEOPLE) "
				+ " VALUES ( seq_reservation.NEXTVAL , ?, 0,  0, SYSDATE , ?, ?, ?, ?, ?, ? , ?) ";
		
		//pay_type==0 ->무통장입금
		System.out.println(sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count=0;


		log("1/6 Success InputReservation");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success InputReservation");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, sdate);
			psmt.setString(3, name);
			psmt.setString(4, theater);
			psmt.setInt(5, room);
			psmt.setString(6, time);
			psmt.setString(7, seat);
			psmt.setInt(8, seenum);
			
			log("3/6 Success InputReservation");
			count= psmt.executeUpdate();
			log("4/6 Success InputReservation");
			
		
			log("5/6 Success InputReservation");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success InputReservation");
		}
		return count>0?true:false;
	}
	
	
	
	//건들지말라아러;ㄴㅇ미ㅓ리ㅏㄴ얼;ㅏ닝ㄹ
	public boolean  UpdateReservation(int seq, int pay, String seat){
	
		String sql = " UPDATE TP2_RESERVATION SET  R_PAY =? , R_SEAT =? WHERE R_SEQ="+seq;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count=0;


		log("1/6 Success UpdateReservation");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success UpdateReservation");
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, pay);
			psmt.setString(2, seat);
		
			log("3/6 Success UpdateReservation");
			count= psmt.executeUpdate();
			log("4/6 Success UpdateReservation");
			
		
			log("5/6 Success UpdateReservation");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success UpdateReservation");
		}
		return count>0?true:false;
	}
	
	
	
	public 	int get_reservation_seq(String id, String  sdate, String name ,String seat){
		System.out.println("****************get_reservation_seq()**********************");
		System.out.println(id+sdate+name+seat);
		String sql = " SELECT R_SEQ  FROM TP2_RESERVATION WHERE R_MEMBER_ID= ? and R_SEE_DATE=? and R_MOVIE_NAME =? AND R_SEAT=? ";
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		int seq=0;
	//	String seq2=""
		log("1/6 Success get_reservation_seq");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success get_reservation_seq");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success get_reservation_seq");

			psmt.setString(1,id);
			psmt.setString(2,sdate);
			psmt.setString(3,name);
			psmt.setString(4,seat);
			rs = psmt.executeQuery();
			log("4/6 Success get_reservation_seq");
			
			
			while(rs.next()){
				int i=1;
				seq=rs.getInt(i++);
			
			}
			log("5/6 Success get_reservation_seq");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success get_reservation_seq");
		}
		return seq;
	}
	
	
	
	public void	log(String msg) {		
		
		System.out.println(getClass() + ": " + msg);
		
}	
	public void	log(String msg, Exception e) {

		System.out.println(e + ": " + getClass() + ": " + msg);
		
}
}
