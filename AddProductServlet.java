import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String sellerName = request.getParameter("sellerName");
        String sellerEmail = request.getParameter("sellerEmail");
        String sellerPhone = request.getParameter("sellerPhone");
        String productName = request.getParameter("productName");
        String startingPrice = request.getParameter("startingPrice");
        String startingTime=request.getParameter("startingTime");
        String endingTime=request.getParameter("endingTime");
        String productDescription = request.getParameter("productDescription");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auction_db", "root", "root");

            String query = "INSERT INTO products (seller_name, seller_email, seller_phone, product_name, starting_price,starting_time,ending_time, product_description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);

            stmt.setString(1, sellerName);
            stmt.setString(2, sellerEmail);
            stmt.setString(3, sellerPhone);
            stmt.setString(4, productName);
            stmt.setString(5, startingPrice);
            stmt.setString(6, startingTime);
            stmt.setString(7, endingTime);
            stmt.setString(8, productDescription);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h3 style='color:green;'>Product Added Successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Failed to add product.</h3>");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}
