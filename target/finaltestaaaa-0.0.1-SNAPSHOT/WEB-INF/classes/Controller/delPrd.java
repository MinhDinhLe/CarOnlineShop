package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.prdDAO;
import model.Customer;
import model.Product;

/**
 * Servlet implementation class delPrd
 */
@WebServlet("/delPrd")
public class delPrd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delPrd() {
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
	    prdDAO dao = new prdDAO();
	    String carName = request.getParameter("carname");

	    // Tìm sản phẩm theo carName
	    List<Product> ls = dao.allPrd();
	    for (Product prd : ls) {
	        if (carName.equals(prd.getCarName())) {
	            // Gọi phương thức xóa sản phẩm
	            dao.deleteProduct(prd);
	            break;
	        }
	    }

        response.sendRedirect("showCatalogAD.jsp");
	    doGet(request, response);
	}

}
