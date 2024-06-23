package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.prdDAO;
import model.Product;

/**
 * Servlet implementation class editPrd
 */
@WebServlet("/editPrd")
public class editPrd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editPrd() {
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
        prdDAO productDAO = new prdDAO();
        
		String name = request.getParameter("hiddenUsername");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String brand = request.getParameter("brand");
        String color = request.getParameter("color");
        String capacity = request.getParameter("capacity");
        int capacity2 = 0;
        double price=0;
        if (!capacity.isEmpty()) {
            try {
               capacity2 = Integer.parseInt(capacity);
                // Sử dụng giá trị capacity2 đã chuyển đổi thành số nguyên
            } catch (NumberFormatException e) {
                // Xử lý lỗi chuyển đổi không thành công
                e.printStackTrace();
            }
        } 
        if (!priceStr.isEmpty()) {
            try {
            	price = Double.parseDouble(priceStr);
                // Sử dụng giá trị capacity2 đã chuyển đổi thành số nguyên
            } catch (NumberFormatException e) {
                // Xử lý lỗi chuyển đổi không thành công
                e.printStackTrace();
            }
        } 
        
        prdDAO dao = new prdDAO();
	    List<Product> ls = dao.allPrd();
	    for (Product a : ls) {
			if(a.getCarName().equals(name))
			{

		        if (description.equals("")) {
		        	description=a.getCarDescription();
		        }	
		        if (priceStr.equals("")) {
		        	price=a.getPrice();
		        }	
		        if (brand.equals("")) {
		        	brand=a.getCarBrand();
		        }	
		        if (color.equals("")) {
		        	color=a.getColor();
		        }
		        if (capacity.equals("")) {
		        	capacity2=a.getCapacity();
		        }
		        a.setCarName(name);
		        a.setCarDescription(description);
		        a.setCarBrand(brand);
		        a.setCapacity(capacity2);
		        a.setColor(color);
		        a.setPrice(price);
		        productDAO.editProduct(a);
		        
		}
        
		doGet(request, response);
	}
	    response.sendRedirect("showCatalogAD.jsp");
	}

}
