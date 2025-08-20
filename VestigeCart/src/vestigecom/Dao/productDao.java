package vestigecom.Dao;

import java.sql.*;
import java.util.*;

import vestigecom.model.Cart;
import vestigecom.model.product;

public class productDao {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public productDao(Connection con) {
		super();
		this.con = con;
	}
	
	public List<product>getAllProducts(){
		List<product>book=new ArrayList<>();
		try {
			query="select * from product";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			
			while(rs.next()) {
				product row =new product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				book.add(row);

			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return book;
		
	}
	 public product getSingleProduct(int id) {
		 product row = null;
	        try {
	            query = "select * from product where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }

    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from product where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from product where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

	  public boolean addProduct(product p) {
	        try {
	            PreparedStatement pst = con.prepareStatement("INSERT INTO product (Id, name, category, price,  image) VALUES (?, ?, ?, ?, ?)");
	            pst.setInt(1,p.getId());
	            pst.setString(2, p.getName());
	            pst.setString(3, p.getCategory());
	            pst.setDouble(4, p.getPrice());
	            pst.setString(5, p.getImage());
	            return pst.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    public boolean deleteProduct(int id) {
	        try {
	            PreparedStatement pst = con.prepareStatement("DELETE FROM product WHERE id = ?");
	            pst.setInt(1, id);
	            return pst.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	}
	
	
	


