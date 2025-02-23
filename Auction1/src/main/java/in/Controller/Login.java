package in.Controller;

import in.Model.User;
import in.Model.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.validateUser(email, password);
        
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("session_name", user.getName());
            RequestDispatcher rd = req.getRequestDispatcher("/Profile.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("errorMessage", "Invalid email or password");
            RequestDispatcher rd = req.getRequestDispatcher("/Login.jsp");
            rd.forward(req, resp);
        }
    }
}