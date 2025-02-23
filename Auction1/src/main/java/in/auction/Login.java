package in.auction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	PrintWriter out=resp.getWriter();
	resp.setContentType("text/html");

	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Auction","root","root");
		PreparedStatement ps= con.prepareStatement("select * from Register where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			HttpSession session = req.getSession();
			session.setAttribute("session_name", rs.getString("name"));
			
			
			RequestDispatcher rd = req.getRequestDispatcher("/Profile.jsp");
			rd.include(req, resp);
		}
		else {
			resp.setContentType("text/html");
			out.print("<h3 style = 'color : red'>Email id and password didnt match</h3>");
			RequestDispatcher rd= req.getRequestDispatcher("/Login.jsp");
			rd.include(req, resp);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		resp.setContentType("text/html");
		out.print("<h3 style = 'color : red'>"+e.getMessage()+"</h3>");
		RequestDispatcher rd= req.getRequestDispatcher("/login.jsp");
		rd.include(req, resp);
	}
	}

}
