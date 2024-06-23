package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.cusDAO;
import model.Customer;

import java.util.List;

/**
 * Servlet implementation class Customer
 */
@WebServlet("/LoginCusController")
public class LoginCusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String check = request.getParameter("check");
	    
	    cusDAO dao = new cusDAO();
	    int temp = 0;
	    List<Customer> ls = dao.allCustomer();
	    for (Customer cs : ls) {
	        if (username.equals(cs.getUserName()) && (password.equals(cs.getPasswd()))) {
	            temp++;
	            HttpSession session = request.getSession();
	            
	            if(check.equals("pay"))
		        {
	            	session.setAttribute("user", cs);
		        	response.sendRedirect("showCatalog.jsp");
		        }
	            else if (check.equals("cus"))
	            {
	            	session.setAttribute("user", cs);
	            	response.sendRedirect("LoginSuccess.jsp");
	            }
	            return;
	        }
	    }
	    if (temp == 0) {
	    	request.setAttribute("error", "THÔNG TIN ĐĂNG NHẬP KHÔNG CHÍNH XÁC !!!!!");
	        if(check.equals("pay"))
	        {
	        	RequestDispatcher rd = request.getRequestDispatcher("/LoginPayment.jsp");
		        rd.forward(request, response);
	        }
	        else if (check.equals("cus"))
	        {
	        	RequestDispatcher rd = request.getRequestDispatcher("/LoginCus.jsp");
		        rd.forward(request, response);
	        }
	    }
	}
}
