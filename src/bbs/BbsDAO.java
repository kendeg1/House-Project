package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://cs336db.c1ahniozkdqz.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
/*	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
*/	
	public int getNext() {
		String SQL = "SELECT listing_id FROM Seller_Listings ORDER BY listing_id DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String username, String type, int condition, int room_count, int bathroom_count, String additional_notes) {
		String SQL="INSERT INTO Seller_Listings VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, username);
			pstmt.setInt(3, room_count);
			pstmt.setInt(4, bathroom_count);
			pstmt.setInt(5, 0);
			
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, condition);
			pstmt.setString(9, type);
			pstmt.setInt(10, 0);
			
			pstmt.setString(11, additional_notes);
			rs = pstmt.executeQuery();
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //error occured
	}
	
	
}
