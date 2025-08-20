package vestigecom.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

import vestigecom.model.*;

public class adminDao {
	
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	private String query;
	
	
	public adminDao(Connection con) {
		this.con = con;
	}
	
	  public admin adminLogin(String email, String password) {
	        admin admin = null;
	        try {
	            query = "SELECT * FROM admin WHERE email=? AND password=?";
	            pst = this.con.prepareStatement(query);
	            pst.setString(1, email);
	            pst.setString(2, password);
	            rs = pst.executeQuery();
	            if (rs.next()) {
	                admin = new admin();
	                admin.setId(rs.getInt("id"));
	                admin.setName(rs.getString("name"));
	                admin.setEmail(rs.getString("email"));
	                // optionally include role or status
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return admin;
	    }
	}



