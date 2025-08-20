package vestigecom.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vestigecom.model.user;
import vestigecom.connection.DBCon;

public class userDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public  userDao(Connection con) {
		this.con = con;
	}
	
	public boolean registerUser(user u) {
	    boolean result = false;
	    try {
	        String query = "INSERT INTO user (name, email, password) VALUES (?, ?, ?)";
	        pst = this.con.prepareStatement(query);
	        pst.setString(1, u.getName());
	        pst.setString(2, u.getEmail());
	        pst.setString(3, u.getPassword());
	        pst.executeUpdate();
	        result = true;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	public user userLogin(String email, String password) {
		user user = null;
        try {
            query = "select * from user where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new user();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
        	e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }

	
	  public List<user> getAllUsers() {
	        List<user> users = new ArrayList<>();
	        try {
	            query = "SELECT * FROM user";
	            pst = this.con.prepareStatement(query);
	            rs = pst.executeQuery();
	            while (rs.next()) {
	                user u = new user();
	                u.setId(rs.getInt("id"));
	                u.setName(rs.getString("name"));
	                u.setEmail(rs.getString("email"));
	                // Skip setting password for security
	                users.add(u);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return users;
	    }
	


public boolean deleteUser(int userId) {
    boolean result = false;
    try {
        String query = "DELETE FROM user WHERE id=?";
        pst = this.con.prepareStatement(query);
        pst.setInt(1, userId);
        result = pst.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}
}


