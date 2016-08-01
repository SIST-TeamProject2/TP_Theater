package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBConnection;
import movie.movieDAO;


public class memberDAO {

	

	private static memberDAO dao;
	
	public static memberDAO getInstance() {
		if(dao == null){
			dao = new memberDAO();
		}
		return dao;
	}
	
	
	public int getPoint(String id){
		System.out.println("****************getPoint(String id)**********************");
		String sql = " SELECT M_POINT FROM TP2_MEMBER WHERE M_ID='"+id+"'";
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		int point=0;
		log("1/6 Success getPoint(String id)");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success getPoint(String id)");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success getPoint(String id)");
			rs = psmt.executeQuery();
			log("4/6 Success getPoint(String id)");
			
			
			while(rs.next()){
				
				int i=1;
				point=rs.getInt(i++);
					
			}
			log("5/6 Success getPoint(String id)");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success getPoint(String id)");
		}
		return point;
	}
	public void	log(String msg) {		
		
		System.out.println(getClass() + ": " + msg);
		
}	
	public void	log(String msg, Exception e) {

		System.out.println(e + ": " + getClass() + ": " + msg);
		
}

}
