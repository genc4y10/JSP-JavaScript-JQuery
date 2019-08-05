package test;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class DisplayServlet
 */
@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {

	/**
	*
	*/
	private static final long serialVersionUID = 4593558495041379082L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultSet rs;
		InputStream sImage;

		try {

			String id = request.getParameter("makaleid");
			Connection con = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dergiyonetimsistemi", "root", "12345");
			Statement stmt = con.createStatement();
			String strSql = "select icerikdosya from makale where makaleid='"+id+"' ";
			System.out.println("inside servlet Sql–>" + strSql);
			rs = stmt.executeQuery(strSql);
			if (rs.next()) {
				byte[] bytearray = new byte[1048576];
				int size = 0;
				sImage = rs.getBinaryStream(1);
				response.reset();
				//response.setContentType("image/jpeg");
				response.setContentType("application/pdf");
				while ((size = sImage.read(bytearray)) != -1) {
					response.getOutputStream().write(bytearray, 0, size);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}