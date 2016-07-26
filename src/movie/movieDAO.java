package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;


public class movieDAO {

	private static movieDAO dao;
	
	public static movieDAO getInstance() {
		if(dao == null){
			dao = new movieDAO();
		}
		return dao;
	}
	
	
	
////////////////////////영화등급& 이름  얻어오기
	public List<movieDTO> getMovie(){
		System.out.println("****************getMovie()**********************");
		String sql = " SELECT MV_NAME, MV_GRADE  FROM TP2_MOVIE ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		List<movieDTO> mlist = new ArrayList<movieDTO>();
		log("1/6 Success getMovie");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success getMovie");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success getMovie");
			rs = psmt.executeQuery();
			log("4/6 Success getMovie");
			
			while(rs.next()){
				
				int i=1;
				String name = rs.getString(i++);
				String grade = rs.getString(i++);
				
				movieDTO mdto = new movieDTO(name,grade);
				mlist.add(mdto);
			}
			log("5/6 Success getMovie");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success getMovie");
		}
		return mlist;
	}

	
	
	public void	log(String msg) {		
		
			System.out.println(getClass() + ": " + msg);
			
	}	
	public void	log(String msg, Exception e) {
	
			System.out.println(e + ": " + getClass() + ": " + msg);
			
	}
	
}
