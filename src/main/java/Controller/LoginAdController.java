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

import DAO.adDAO;
import model.Admin;

/**
 * Servlet implementation class LoginAdController
 */
@WebServlet("/LoginAdController")
public class LoginAdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdController() {
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
		String username = request.getParameter("username");
        String password = request.getParameter("password");
		adDAO dao = new adDAO();
		int temp=0;
		List<Admin> ls = dao.allAdmin();
		for (Admin ad : ls) {
			if (username.equals(ad.getUserName()) && (password.equals(ad.getPasswd()))) {
				temp++;
        		HttpSession session = request.getSession();
        		session.setAttribute("admin", ad);
        		response.sendRedirect("LoginSuccessAD.jsp");
			}
		}
		if	(temp == 0) {
    		request.setAttribute("error", "THÔNG TIN ĐĂNG NHẬP KHÔNG CHÍNH XÁC !!!!!");
    		 RequestDispatcher rd = request.getRequestDispatcher("/LoginCus.jsp");
             rd.forward(request, response);
    	}
		doGet(request, response);
	}

}
