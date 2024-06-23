package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        performLogout(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        performLogout(request, response);
    }

    private void performLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Xóa session trên máy chủ
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Xóa cookie trên máy khách
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }

        // Xóa dữ liệu trong localStorage
        response.getWriter().println("<script>");
        response.getWriter().println("localStorage.clear();");
        response.getWriter().println("window.location.href = 'LoginCus.jsp';");
        response.getWriter().println("</script>");
    }
}