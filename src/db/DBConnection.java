package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection  {

	private boolean isS=true;
	private static DBConnection db;
	
	private DBConnection() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log("1/6 Success");
		}catch(ClassNotFoundException ex){
			log("1/6 Fail", ex);
			System.out.println(ex.getMessage());
		}
	}	
	public static DBConnection getInstance() {
		if(db == null){
			db = new DBConnection();
		}
		return db;
	}	
	public static Connection getConnection()throws SQLException {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "hr";
		String passwd = "hr";
		
		conn=DriverManager.getConnection(url, user, passwd);
		return conn;
	}
	
	public static void close(Connection conn, Statement psmt, ResultSet rs){
		if(rs != null){
			try{
				rs.close();
			}catch(SQLException e){}
		}
		if(psmt != null){
			try{
				psmt.close();
			}catch(SQLException e){}
		}
		if(conn != null){
			try{
				conn.close();
			}catch(SQLException e){}
		}
	}
	
	
	public void	log(String msg) {		
		if(isS){
			System.out.println(getClass() + ": " + msg);
		}		
	}	
	public void	log(String msg, Exception e) {
		boolean isS=true;
		if(isS){
			System.out.println(e + ": " + getClass() + ": " + msg);
		}		
	}

	///////////////////////영화 DTO출력
	
	

}
