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
 * Servlet implementation class hakemID
 */
@WebServlet("/hakemID")
public class hakemID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hakemID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String makaleid=request.getParameter("asd");
		String hakemid=request.getParameter("hakemid");
		loginSelect ls=new loginSelect();
		PrintWriter out = response.getWriter();
		int as=ls.makaleEditorOnayla2(hakemid);
		
		if(as == 1) {
			response.sendRedirect("editor.jsp");

		}else
			response.sendRedirect("index.jsp");

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
