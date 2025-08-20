package vestigecom.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vestigecom.Dao.productDao;
import vestigecom.connection.DBCon;
import vestigecom.model.product;

/**
 * Servlet implementation class ViewProductsSevlet
 */
@WebServlet("/view-products-servlet")
public class ViewProductsSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  try {
		        productDao dao = new productDao(DBCon.getConnection());
		        List<product> products = dao.getAllProducts();
		        request.setAttribute("products", products);
		        request.getRequestDispatcher("adminProducts.jsp").forward(request, response);
		    } catch (Exception e) {
		        e.printStackTrace();
		        request.setAttribute("error", "Failed to load products. Please try again.");
	
		  }
	}

}
