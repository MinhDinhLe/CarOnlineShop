package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import javax.servlet.http.HttpSession;

import DAO.lineitemDAO;
import DAO.prdDAO;
import DAO.invoiceDAO;
import model.Customer;
import model.Invoice;
import model.Lineitem;

@WebServlet("/sendEmailController")
public class sendEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public sendEmailController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Invoice
		HttpSession session1 = request.getSession();
		Customer cus = (Customer) session1.getAttribute("user");
	    Invoice invoice = new Invoice();
	    lineitemDAO cartData = new lineitemDAO();
	    prdDAO prdData = new prdDAO();
	    double total = 0;
	    List<Lineitem> carts = cartData.Cart_Cus_0(cus.getCustomerID());
	    for(var a: carts) {
	    	total += prdData.getPrd(a.getCarID()).getPrice() * a.getQuantity();
	    }
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = dateFormat.format(currentDate);
        
	    invoiceDAO invoiceData = new invoiceDAO();
	    try {
	    	invoice.setCustomerID(cus.getCustomerID());
	    	invoice.setDate(formattedDate);
	    	invoice.setTotal(total);
	    	invoiceData.addInvoice(invoice);
	    	
	    	//Trigger on database will set status of lineitem = 1
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    //total bill
	    prdDAO prddata = new prdDAO();
	    List<Lineitem> cart = (ArrayList<Lineitem>)session1.getAttribute("cart");
	    String content = "Cảm ơn bạn đã mua hàng. Đây là danh sách sản phẩm bạn đã mua:";
	    for (var a : cart) {
	        content += "\n- " + prddata.getPrd(a.getCarID()).getCarName();
	    }
	    
	    
	    
	    //email
	    final String username2="ledinhminh6a4@gmail.com";
		final String password2="nytr wyrh aeju zjhd";
		String email = (String) request.getParameter("email");
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
					InternetAddress.parse(email)
			);
			message.setSubject("Thank you!");
			message.setText(content); 
			Transport.send(message); 
			System.out.println("Done");
			} catch (Exception e) {}
		response.sendRedirect("LoginSuccess.jsp");
		doGet(request, response);
	}

}
