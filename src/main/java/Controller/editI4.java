package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.cusDAO;
import model.Customer;

/**
 * Servlet implementation class editI4
 */
@WebServlet("/editI4")
public class editI4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editI4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("hiddenUsername");
	    String newName = request.getParameter("name");
	    String newContact = request.getParameter("contact");
	    String newPass = request.getParameter("password2");
	    String check = request.getParameter("check");
	    Customer a = new Customer();
	    cusDAO dao = new cusDAO();
	    List<Customer> customerList = dao.allCustomer();
	    for (Customer customer : customerList) {
	        if (username.equals(customer.getUserName())) {
	        	if (newName .equals("")) {
	        	newName=customer.getName();
	        	}
	        	if (newContact.equals("")) {
	        	newContact=customer.getContact();
	        	}
	        	if (newPass.equals("")) {
	        		newPass=customer.getPasswd();
	        	}
	            customer.setName(newName);
	            customer.setContact(newContact);
	            customer.setPasswd(newPass);
	            dao.editCus(customer);
	            a=customer;
	            break;
	        }
	    }
	    if(check.equals("editad"))
        {
        	RequestDispatcher rd = request.getRequestDispatcher("/LoginSuccessAD.jsp");
	        rd.forward(request, response);
        }
        else if (check.equals("editcus"))
        {
        	RequestDispatcher rd = request.getRequestDispatcher("/LoginSuccess.jsp");
	        rd.forward(request, response);
        }
	    HttpSession session = request.getSession();
        session.setAttribute("user", a);
        response.sendRedirect("LoginSuccess.jsp");
	}
     
}

