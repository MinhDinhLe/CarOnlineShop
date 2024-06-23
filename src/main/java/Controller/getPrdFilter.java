package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.prdDAO;
import model.Product;

/**
 * Servlet implementation class getPrdFilter
 */
@WebServlet("/getPrdFilter")
public class getPrdFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getPrdFilter() {
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
		List<Product> ls = dao.allPrd();
		String carBrand = request.getParameter("categoryRadios");
		String check = request.getParameter("check");
		List<Product> ls2 = new ArrayList<Product>();
		for (Product a : ls) {
			if(a.getCarBrand().equals(carBrand))
			{
				ls2.add(a);
			}	
		}
		HttpSession session = request.getSession();
		session.setAttribute("prd", ls2);
		 if(check.equals("pay"))
	        {
	        	RequestDispatcher rd = request.getRequestDispatcher("/showCatalogAD.jsp");
		        rd.forward(request, response);
	        }
	        else if (check.equals("cus"))
	        {
	        	RequestDispatcher rd = request.getRequestDispatcher("/showCatalog.jsp");
		        rd.forward(request, response);
	        }
		doGet(request, response);
	}

}
