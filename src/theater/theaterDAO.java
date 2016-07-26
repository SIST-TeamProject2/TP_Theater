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
	
	
	/////필드눌렀을때 그룹출력용
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
	
	
	
	public void	log(String msg) {		
		
			System.out.println(getClass() + ": " + msg);
			
	}	
	public void	log(String msg, Exception e) {
	
			System.out.println(e + ": " + getClass() + ": " + msg);
			
	}

}
