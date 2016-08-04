package coupon;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import DB.DBControll;

public class couponDAO {
private static couponDAO dao;
	
	public static couponDAO getInstance() {
		if(dao == null){
			dao = new couponDAO();
		}
		return dao;
	}
	
	
	public List<couponDTO>  getCoupon(String id){
	//	System.out.println("****************getPoint(getCoupon(String id))**********************");
		String sql = " SELECT CP_SERIAL, CP_DISCOUNT_PRICE FROM TP2_COUPON WHERE CP_USER_ID='"+id+"'";
		//System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		List<couponDTO> arr = new ArrayList<couponDTO>();

		//log("1/6 Success getCoupon(String id)");
		try{
			conn = DBControll.getConnection();
			//log("2/6 Success getCoupon(String id)");
			psmt = conn.prepareStatement(sql);
			//log("3/6 Success getCoupon(String id)");
			rs = psmt.executeQuery();
			//log("4/6 Success getCoupon(String id)");
			
			
			while(rs.next()){
			
				int i=1;
				int serial=rs.getInt(i++);
				int price=rs.getInt(i++);
				couponDTO dto = new couponDTO(serial,price);
				arr.add(dto);	
			}
			//log("5/6 Success getCoupon(String id)");
		}catch(SQLException e){
			//log("fail",e);
		}finally{
			DBControll.closeDatabase(conn, psmt, rs);
			//log("6/6 Success getCoupon(String id)");
		}
		return arr;
	}
/*	public void	log(String msg) {		
		
		System.out.println(getClass() + ": " + msg);
		
}	
	public void	log(String msg, Exception e) {

		System.out.println(e + ": " + getClass() + ": " + msg);
		
}*/

}
