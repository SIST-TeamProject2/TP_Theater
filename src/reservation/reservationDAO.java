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
	
	
	public boolean  InputReservation(String id, int pay, String  sdate, String name, 
			String theater, int room, String time, String seat ,int seenum){
		System.out.println("****************InputReservation*********************");
		System.out.println(id+"==="+pay+"==="+name+"==="+theater+"==="+room+"==="+time+"==="+seat);
		System.out.println("****************InputReservation*********************");
		String sql = " INSERT INTO TP2_RESERVATION ( R_SEQ, R_MEMBER_ID, R_PAY, R_PAY_TYPE, R_PAY_DATE, R_SEE_DATE, R_MOVIE_NAME, "
				+ " R_THEATER_NAME, R_THEATER_ROOM_NUM, R_THEATER_ROOM_TIME, R_SEAT , R_SEE_PEOPLE) "
				+ " VALUES ( seq_reservation.NEXTVAL , ?, ?,  0, SYSDATE , ?, ?, ?, ?, ?, ? , ?) ";
		
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
			psmt.setInt(2, pay);
			psmt.setString(3, sdate);
			psmt.setString(4, name);
			psmt.setString(5, theater);
			psmt.setInt(6, room);
			psmt.setString(7, time);
			psmt.setString(8, seat);
			psmt.setInt(9, seenum);
			
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
	public void	log(String msg) {		
		
		System.out.println(getClass() + ": " + msg);
		
}	
	public void	log(String msg, Exception e) {

		System.out.println(e + ": " + getClass() + ": " + msg);
		
}
}
