package Controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.Authenticator;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.cusDAO;
import model.Customer;

@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public signup() {
        super();
    }
    
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
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String check2 = request.getParameter("check2");
        int temp=0;
		cusDAO dao = new cusDAO();
		Customer cs2 = new Customer();
		int maxID = 0;
		for (var a : dao.allCustomer())
		{
			if (a.getCustomerID() > maxID)
			{
				maxID = a.getCustomerID();
			}
		}
		cs2.setCustomerID(maxID+1);
		cs2.setName(name);
		cs2.setUserName(username);
		cs2.setPasswd(password);
		cs2.setContact(contact);
		List<Customer> ls = dao.allCustomer();
		if (ls != null)
		{
			for (Customer cs : ls) 
			{
				if	(cs.getUserName().equals(username)) {
					temp++;
					request.setAttribute("error", "USERNAME BI TRUNG !!!!!");
					 if(check2.equals("pay"))
				        {
				        	RequestDispatcher rd = request.getRequestDispatcher("/LoginPayment.jsp");
					        rd.forward(request, response);
				        }
				        else if (check2.equals("cus"))
				        {
				        	RequestDispatcher rd = request.getRequestDispatcher("/LoginCus.jsp");
					        rd.forward(request, response);
					       
				        }
				}
			}
		}
		
		final String username2="ledinhminh6a4@gmail.com";
		final String password2="nytr wyrh aeju zjhd";
		Properties prop=new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "25S");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getInstance(prop, new jakarta.mail.Authenticator() { protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username2, password2);
			}
			});
		try {
			Message message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(username2));
			message.setRecipients( Message. RecipientType.TO, 
					InternetAddress.parse(contact)
			);
			message.setSubject(contact);
			message.setText("SIGN UP SUCCESS" + "\n- " +" PLEASE LOGIN AND CHANGE YOUR PASSWORD" ); 
			Transport.send(message); 
			System.out.println("Done");
			} catch (Exception e) {}
		
		if	(temp==0) 
		{
			dao.insert(cs2);
			HttpSession session2 = request.getSession();
			session2.setAttribute("user", cs2);
			
			if(check2.equals("pay"))
	        {
//	        	RequestDispatcher rd = request.getRequestDispatcher("/showCatalog.jsp");
//		        rd.forward(request, response);
		        
		        response.sendRedirect("showCatalog.jsp");
	        }
	        else if (check2.equals("cus"))
	        {
//	        	RequestDispatcher rd = request.getRequestDispatcher("/LoginSuccess.jsp");
//		        rd.forward(request, response);
		       
		        response.sendRedirect("LoginSuccess.jsp");
	        }
		}
	}
}
