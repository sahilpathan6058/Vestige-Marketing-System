package vestigecom.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vestigecom.Dao.productDao;
import vestigecom.connection.DBCon;
import vestigecom.model.product;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		    product p = new product();
		    p.setName(request.getParameter("name"));
		    p.setCategory(request.getParameter("category"));
		    p.setPrice(Double.parseDouble(request.getParameter("price")));
		    p.setImage(request.getParameter("image"));

		    productDao dao = new productDao(DBCon.getConnection());
		    dao.addProduct(p);
		    response.sendRedirect("view-products-servlet");

		} catch (Exception e) {
		    e.printStackTrace();
		    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding product. Please try again.");
		}
	}
}

