package in.Controller;

import in.Model.User;
import in.Model.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String birth = req.getParameter("birth");
        String address = req.getParameter("address");
        String mobile = req.getParameter("mobile");
        
        User user = new User(name, email, password, birth, address, mobile);
        UserDAO userDAO = new UserDAO();
        boolean isRegistered = userDAO.registerUser(user);
        
        if (isRegistered) {
            req.setAttribute("successMessage", "Registered successfully!");
            RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("errorMessage", "Registration failed.");
            RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
            rd.forward(req, resp);
        }
    }
}