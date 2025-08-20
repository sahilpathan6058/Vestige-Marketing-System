package vestigecom.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vestigecom.Dao.productDao;
import vestigecom.connection.DBCon;

/**
 * Servlet implementation class DeleteProductsServlet
 */
@WebServlet("/delete-products-Servlet")
public class DeleteProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   try {
	            int id = Integer.parseInt(request.getParameter("id"));
	            productDao dao = new productDao(DBCon.getConnection());
	            dao.deleteProduct(id);
	            response.sendRedirect("view-products-servlet");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting product. Please try again.");
	        }
	}
}


