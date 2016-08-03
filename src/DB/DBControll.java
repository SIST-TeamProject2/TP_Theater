package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBControll {

	public static Connection getConnection() {
			
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hr";
		String pw = "hr";
		
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		
		return conn;
	}
	
	public static void closeDatabase(Connection conn, PreparedStatement psmt, ResultSet rs) {
		
		try {
			
			if ( rs != null )	rs.close();
			if ( psmt != null )	psmt.close();
			if ( conn != null )	conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}