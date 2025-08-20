package vestigecom.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import vestigecom.model.*;

public class orderDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    

	public orderDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertOrder(orders model) {
        boolean result = false;
        try {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

    public List<orders> userOrders(int id) {
        List<orders> list = new ArrayList<>();
        try {
            query = "select * from orders where u_id=? order by orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                orders order = new orders();
                productDao productDao = new productDao(this.con);
                int pId = rs.getInt("p_id");
                product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("o_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQuantity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
    
    public List<orders> getAllOrders() {
        List<orders> orderList = new ArrayList<>();
        try {
            query = "SELECT * FROM orders ORDER BY o_id DESC";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                orders o = new orders();

                int pid = rs.getInt("p_id");

                // Get product details
                productDao pdao = new productDao(this.con);
                product p = pdao.getSingleProduct(pid);

                if (p != null) {
                    o.setId(p.getId());
                    o.setName(p.getName());
                    o.setCategory(p.getCategory());
                    o.setPrice(p.getPrice());
                    o.setImage(p.getImage());
                }

                o.setOrderId(rs.getInt("o_id"));
                o.setUid(rs.getInt("u_id"));
                o.setQuantity(rs.getInt("o_quantity"));
                o.setDate(rs.getString("o_date"));

                orderList.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderList;
    }



}
