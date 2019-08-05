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
 * Servlet implementation class editorOnayla
 */
@WebServlet("/editorOnayla")
public class editorOnayla extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editorOnayla() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String makaleid=request.getParameter("makaleid");
		loginSelect ls=new loginSelect();
		int asd=ls.makaleEditorOnayla(makaleid);
		if(asd==1) {
			out.print("makale durumu guncellendi..");
			response.sendRedirect("editor.jsp");
		}else 
			out.print("makale silinemedi..");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		
		
		
	}

}
