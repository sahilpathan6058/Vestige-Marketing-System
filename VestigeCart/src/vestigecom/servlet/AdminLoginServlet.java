package vestigecom.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vestigecom.Dao.*;
import vestigecom.connection.DBCon;
import vestigecom.model.*;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("adminlogin.jsp"); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {

	            String email = request.getParameter("admin-email");
	            String password = request.getParameter("admin-password");

	            adminDao dao = new adminDao(DBCon.getConnection());
	            admin adminUser = dao.adminLogin(email, password);

	            if (adminUser != null) {
	                // Login success
	                request.getSession().setAttribute("admin-auth", adminUser);
	                response.sendRedirect("Admin.jsp");
	            } else {
	                // Login failed
	                out.println("<h3>Invalid Admin Credentials</h3>");
	            }

	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}


