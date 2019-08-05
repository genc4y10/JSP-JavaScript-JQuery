package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.bean;
import dao.loginSelect;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		
		
		PrintWriter out = response.getWriter();
		loginSelect m = new loginSelect();
		String kullaniciadi = request.getParameter("kullaniciadi");
		String sifre = request.getParameter("sifre");

		

		int t = m.checkLogin(kullaniciadi, sifre);

		if (t == 1) {
			out.print("Hosgeldiniz sayin :  " + kullaniciadi);
			session.setAttribute("kullaniciadi", kullaniciadi);

			response.sendRedirect("editor.jsp");

		} else if (t == 2) {
			out.print("Hosgeldiniz sayin :  " + kullaniciadi);
			session.setAttribute("kullaniciadi", kullaniciadi);

			response.sendRedirect("yazar.jsp");

		} else if (t == 3) {
			out.print("Hosgeldiniz sayin :  " + kullaniciadi);
			session.setAttribute("kullaniciadi", kullaniciadi);

			response.sendRedirect("hakem.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}

	}

}
