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
import model.Product;

/**
 * Servlet implementation class getPrd
 */
@WebServlet("/getPrd")
public class getPrd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getPrd() {
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
	    HttpSession session = request.getSession();
	    session.setAttribute("prd", ls);
	    String redirectURL = null;
	    if (request.getHeader("Referer").endsWith("LoginCus.jsp")) {
	        redirectURL = "showCatalog.jsp";
	    }
	    
	    if (request.getHeader("Referer").endsWith("LoginSuccess.jsp")) {
	        redirectURL = "showCatalog.jsp";
	    }

	    // Kiểm tra nguồn chuyển hướng từ loginsuccessAD.jsp
	    if (request.getHeader("Referer").endsWith("LoginSuccessAD.jsp")) {
	        redirectURL = "showCatalogAD.jsp";
	    }
	    if (request.getHeader("Referer").endsWith("showUser.jsp")) {
	        redirectURL = "showCatalogAD.jsp";
	    }

	    response.sendRedirect(redirectURL);
	    doGet(request, response);
	}

}
