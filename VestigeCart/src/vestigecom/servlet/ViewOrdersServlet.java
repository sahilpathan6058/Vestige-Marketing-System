package vestigecom.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vestigecom.Dao.orderDao;
import vestigecom.connection.DBCon;
import vestigecom.model.orders;

/**
 * Servlet implementation class ViewOrdersServlet
 */
@WebServlet("/view-orders-servlet")
public class ViewOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   try {
	            orderDao dao = new orderDao(DBCon.getConnection());
	            List<orders> orderList = dao.getAllOrders();

	            request.setAttribute("orderList", orderList);
	            request.getRequestDispatcher("adminOrders.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to retrieve orders.");
	        }
	    }
}


