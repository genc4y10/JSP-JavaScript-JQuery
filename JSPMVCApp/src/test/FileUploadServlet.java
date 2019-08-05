package test;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUploadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class FileUploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// database connection settings
	private String dbURL = "jdbc:mysql://localhost:3306/dergiyonetimsistemi";
	private String dbUser = "root";
	private String dbPass = "12345";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// gets values of text fields
		String konu = request.getParameter("konu");
		String editorid = request.getParameter("we");
		String yazarid = request.getParameter("yazarid");
		String adsoyad = request.getParameter("adsoyad");
		String icerik = request.getParameter("icerik");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd.MM.yyyy");
		LocalDate localDate = LocalDate.now();
		InputStream inputStream = null; // input stream of the upload file

		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}

		Connection conn = null; // connection to the database
		String message = null; // message will be sent back to client

		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			// constructs SQL statement
			String sql = "INSERT INTO makale  (editorid,yazarid,konu,iceriktext,icerikdosya,tarih) values ( ?,?,?,?,?,?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, editorid);
			statement.setString(2, yazarid);
			statement.setString(3, (konu));
			statement.setString(4, icerik);

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBlob(5, inputStream);
			} else {
				message = "hata";
			}
			

			 statement.setString(6, dtf.format(localDate)); 

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File uploaded and saved into database";
			}
		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} finally {

			// sets the message in request scope
			request.setAttribute("Message", message);

			// forwards to the message page
			getServletContext().getRequestDispatcher("/yazar.jsp").forward(request, response);
		}
	}
}