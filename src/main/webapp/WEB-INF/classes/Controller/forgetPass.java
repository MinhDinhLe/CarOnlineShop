package Controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.Authenticator;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;	
import DAO.cusDAO;
import model.Customer;

/**
 * Servlet implementation class forgetPass
 */
@WebServlet("/forgetPass")
public class forgetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgetPass() {
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
        String contact = request.getParameter("contact");
        String newPassword = generateRandomPassword();
        cusDAO dao = new cusDAO();
        boolean foundUser = false;
        boolean validContact = false;
	    List<Customer> customerList = dao.allCustomer();
	    for (Customer customer : customerList) {
	        if (username.equals(customer.getUserName())) {
	        	foundUser = true;
	        	if (contact.equals(customer.getContact())) {
	        		validContact = true;
	        		 customer.setPasswd(newPassword); // Giả sử trường mật khẩu của khách hàng là "password"
	        	      dao.editCus(customer); // Hãy thay đổi phương thức updateCustomer() để cập nhật khách hàng trong cơ sở dữ liệu
	        		 final String username2="ledinhminh6a4@gmail.com";
	        			final String password2="nytr wyrh aeju zjhd";
	        			
	        			Properties prop=new Properties();
	        			prop.put("mail.smtp.host", "smtp.gmail.com");
	        			prop.put("mail.smtp.port", "25S");
	        			prop.put("mail.smtp.auth", "true");
	        			prop.put("mail.smtp.starttls.enable", "true");
	        			Session session = Session.getInstance(prop, new jakarta.mail.Authenticator() { 
	        				protected PasswordAuthentication getPasswordAuthentication() {
	        				return new PasswordAuthentication(username2, password2);
	        				}
	        				});
	        			try {
	        				Message message = new MimeMessage(session); 
	        				message.setFrom(new InternetAddress(username2));
	        				message.setRecipients( Message. RecipientType.TO, 
	        						InternetAddress.parse(contact)
	        				);
	        				message.setSubject("Forget Password! ");
	        				message.setText("New Password is: " + newPassword + "\n- " +" PLEASE LOGIN AND CHANGE YOUR PASSWORD" );
	        				Transport.send(message); 
	        				System.out.println("Done");
	        				} catch (Exception e) {}
	        			response.sendRedirect("LoginCus.jsp");
	        	}
	        }
	    }
	    if (!foundUser) {
	        request.setAttribute("error", "THÔNG TIN ĐĂNG NHẬP KHÔNG CHÍNH XÁC");
	        request.getRequestDispatcher("LoginCus.jsp").forward(request, response);
	    } else if (!validContact) {
	        request.setAttribute("error", "THÔNG TIN ĐĂNG NHẬP KHÔNG CHÍNH XÁC");
	        request.getRequestDispatcher("LoginCus.jsp").forward(request, response);
	    }
	}
	 private String generateRandomPassword() {
	        // Dinh nghia cac ki tu co the xuat hien trong mat khau moi
	        String allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        int passwordLength = 8; // Do dai mat khau moi

	        Random random = new Random();
	        StringBuilder newPassword = new StringBuilder();

	        // Tao mat khau moi bang cach chon ngau nhien cac ki tu tu chuoi allowedCharacters
	        for (int i = 0; i < passwordLength; i++) {
	            int randomIndex = random.nextInt(allowedCharacters.length());
	            char randomChar = allowedCharacters.charAt(randomIndex);
	            newPassword.append(randomChar);
	        }

	        return newPassword.toString();
	    }

}
