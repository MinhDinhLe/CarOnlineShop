package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.Lineitem;
import DAO.lineitemDAO;
import DAO.prdDAO;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	
    public CartServlet() {
        super();
    }
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		lineitemDAO cartData = new lineitemDAO();
		Lineitem cart = new Lineitem();
		prdDAO prds = new prdDAO();
		HttpSession session = request.getSession();
		Customer cus = (Customer) session.getAttribute("user");
		int cusID = cus.getCustomerID();
		int carID = Integer.valueOf(request.getParameter("productID"));
		
		if(carID == -999)
		{
			session.setAttribute("cart", cartData.Cart_Cus_0(cusID) );
			response.sendRedirect("showcart.jsp");
			doGet(request, response);
		}
		else {
			if (!cartData.checkExist(carID, cusID))
			{
				cart.setCustomerID(cusID);
				cart.setCarID(carID);
				cart.setStatus((byte) 0);
				cart.setQuantity(1);
				
				cartData.addCartItem(cart);
			}
			else {
				cartData.updateCartItem(carID, cusID);
			}
			
			
			
			
			try {
				String removeItem = request.getParameter("rm");
			      if (removeItem != null && removeItem.equals("Remove Item")) {
			          // Xóa sản phẩm khỏi giỏ hàng
			          cartData.removeCartItem(carID, cusID);
			      } 
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			try {
				int quantity = Integer.valueOf(request.getParameter("quantity"));
				
				cartData.updateCartItem(carID, quantity, cusID);
				if (quantity == 0 )
				{				
					cartData.removeCartItem(carID, cusID);
				}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("cart", cartData.Cart_Cus_0(cusID) );
			response.sendRedirect("showcart.jsp");;
		}
		doGet(request, response);
	}

}
