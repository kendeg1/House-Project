package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://cs336db.c1ahniozkdqz.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String username, String password) {
		String SQL="SELECT password FROM Users WHERE username= ?";
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(SQL);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					return 1; //succesfully logged in
				}
				else {
					return 0; //unmatched pw
				}
			}
			return -1; //no username
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //Database error
	}
	
}
