
package in.auction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class Register extends HttpServlet{
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub

	 {
		 String name=req.getParameter("name");
		 String email=req.getParameter("email");
		 String password=req.getParameter("password");
		 String birth=req.getParameter("birth");
		 String address=req.getParameter("address");
		 String mobile=req.getParameter("mobile");
		 PrintWriter out=resp.getWriter();
	 try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction","root","root");
		PreparedStatement ps= con.prepareStatement("insert into Register values(?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.setString(4, birth);
		ps.setString(5, address);
		ps.setString(6, mobile);
		int count=ps.executeUpdate();
		if(count > 0) {
			resp.setContentType("text/html");
			out.print("<h3 style='color:green'> Registered succefully</h3>");
			RequestDispatcher rd= req.getRequestDispatcher("/index.jsp");
		}else {
			resp.setContentType("text/html");
			out.print("<h3 style='color:red'> User not registered due to some error</h3>");
			RequestDispatcher rd= req.getRequestDispatcher("/index.jsp");
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		resp.setContentType("text/html");
		out.print("<h3 style='color:red'> Exception occured : "+e.getMessage()+"</h3>");
		RequestDispatcher rd= req.getRequestDispatcher("/index.jsp");
	}
	 }
}
}
