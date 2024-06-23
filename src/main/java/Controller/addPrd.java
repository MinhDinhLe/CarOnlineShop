package Controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.prdDAO;
import model.Product;

/**
 * Servlet implementation class addPrd
 */
@WebServlet("/addPrd")
public class addPrd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addPrd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		    response.setDateHeader("Expires", 0); // Proxies.
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String brand = request.getParameter("brand");
        String color = request.getParameter("color");
        double price = Double.parseDouble(priceStr);

        // Tạo đối tượng sản phẩm từ thông tin lấy được
        Product product = new Product();
        product.setCarName(name);
        product.setCarDescription(description);
        product.setPrice(price);
        product.setCarBrand(brand);
        product.setColor(color);
        // Gọi hàm để thêm sản phẩm vào cơ sở dữ liệu
        prdDAO productDAO = new prdDAO();
        productDAO.addProduct(product);

        // Chuyển hướng về trang danh sách sản phẩm sau khi thêm thành công
        response.sendRedirect("showCatalogAD.jsp");
     
	}	
	 
}
		
