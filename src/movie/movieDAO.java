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

	public movieDTO get_grade_Movie(String mv_name){
		System.out.println("****************get_grade_Movie()**********************");
		String sql = " SELECT MV_NAME, MV_GRADE  FROM TP2_MOVIE WHERE MV_NAME='"+mv_name+"'";
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		movieDTO mdto = new movieDTO();
		log("1/6 Success get_grade_Movie");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success get_grade_Movie");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success get_grade_Movie");
			rs = psmt.executeQuery();
			log("4/6 Success get_grade_Movie");
			
			
			while(rs.next()){
				
				int i=1;
				String name = rs.getString(i++);
				String grade = rs.getString(i++);
				
				mdto = new movieDTO(name,grade);
			
			}
			log("5/6 Success getMovie");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success getMovie");
		}
		return mdto;
	}
	
	public 	String get_poster_Movie(String mv_name){
		System.out.println("****************get_poster_Movie()**********************");
		String sql = " SELECT MV_POSTER  FROM TP2_MOVIE WHERE MV_NAME='"+mv_name+"'";
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		String poster="";
		log("1/6 Success get_poster_Movie");
		try{
			conn = DBConnection.getConnection();
			log("2/6 Success get_poster_Movie");
			psmt = conn.prepareStatement(sql);
			log("3/6 Success get_poster_Movie");
			rs = psmt.executeQuery();
			log("4/6 Success get_poster_Movie");
			
			
			while(rs.next()){
				
				int i=1;
				poster=rs.getString(i++);
			
			}
			log("5/6 Success get_poster_Movie");
		}catch(SQLException e){
			log("fail",e);
		}finally{
			DBConnection.close(conn, psmt, rs);
			log("6/6 Success get_poster_Movie");
		}
		return poster;
	}
	
	
	public void	log(String msg) {		
		
			System.out.println(getClass() + ": " + msg);
			
	}	
	public void	log(String msg, Exception e) {
	
			System.out.println(e + ": " + getClass() + ": " + msg);
			
	}
	
}
