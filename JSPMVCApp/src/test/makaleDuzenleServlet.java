package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.loginSelect;

/**
 * Servlet implementation class makaleGosterServlet
 */
@WebServlet("/makaleDuzenleServlet")
public class makaleDuzenleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	loginSelect nesne;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public makaleDuzenleServlet() {
		super();
		nesne = new loginSelect();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String makaleid = request.getParameter("makaleid");
		String yorum = request.getParameter("yorum");
		String durum="4";
		loginSelect nesne = new loginSelect();

		 nesne.makaleDuzenle(Integer.parseInt(makaleid),yorum,durum);
		 response.sendRedirect("editor.jsp");


	}

}
