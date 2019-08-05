package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.*;
import bean.makaleGosterBean;
import dao.loginSelect;

/**
 * Servlet implementation class kayitolServlet
 */
@WebServlet("/kayitolServlet")
public class kayitolServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public kayitolServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int as = 0, da = 0;
		PrintWriter out = response.getWriter();
		loginSelect m = new loginSelect();

	
		String kullaniciadi = request.getParameter("kullaniciadi");
		String ad = request.getParameter("ad");
		String soyad = request.getParameter("soyad");
		String email = request.getParameter("email");
		String telno = request.getParameter("telno");
		String sifre = request.getParameter("sifre");
		String sifretekrar = request.getParameter("sifretekrar");
		String unvan = request.getParameter("unvan");
		String unvanid = request.getParameter("unvanid");
		String uzmanlikalani = request.getParameter("uzmanlikalani");
		String okul = request.getParameter("okul");
		String bolum = request.getParameter("bolum");
		String il = request.getParameter("il");
		String ilce = request.getParameter("ilce");

		beanEditor editorkayitlar = new beanEditor();
		editorkayitlar.setKullaniciadi(kullaniciadi);
		editorkayitlar.setAd(ad);
		editorkayitlar.setSoyad(soyad);
		editorkayitlar.setEmail(email);
		editorkayitlar.setTelno(telno);
		editorkayitlar.setSifre(sifre);
		editorkayitlar.setSifretekrar(sifretekrar);
		editorkayitlar.setCalistigiil(il);
		editorkayitlar.setCalistigiilce(ilce);

		beanYazar yazarkayitlar = new beanYazar();
		yazarkayitlar.setKullaniciadi(kullaniciadi);
		yazarkayitlar.setAd(ad);
		yazarkayitlar.setSoyad(soyad);
		yazarkayitlar.setEmail(email);
		yazarkayitlar.setTelno(telno);
		yazarkayitlar.setSifre(sifre);
		yazarkayitlar.setSifretekrar(sifretekrar);
		yazarkayitlar.setUzmanlik(uzmanlikalani);
		yazarkayitlar.setOkul(okul);
		yazarkayitlar.setBolum(bolum);

		beanHakem hakemkayitlar = new beanHakem();
		hakemkayitlar.setKullaniciadi(kullaniciadi);
		hakemkayitlar.setAd(ad);
		hakemkayitlar.setSoyad(soyad);
		hakemkayitlar.setEmail(email);
		hakemkayitlar.setTelno(telno);
		hakemkayitlar.setSifre(sifre);
		hakemkayitlar.setSifretekrar(sifretekrar);
		hakemkayitlar.setUzmanlik(uzmanlikalani);

		if (unvanid.equals("1")) {
			m.editorKayit(editorkayitlar);
			m.aktar(kullaniciadi, sifretekrar, unvanid);
			response.sendRedirect("index.jsp");;

		} else if (unvanid.equals("2")) {
			m.yazarKayit(yazarkayitlar);
			m.aktar(kullaniciadi, sifretekrar, unvanid);
			response.sendRedirect("index.jsp");;


		} else if (unvanid.equals("3")) {
			m.hakemKayit(hakemkayitlar);
			m.aktar(kullaniciadi, sifretekrar, unvanid);
			response.sendRedirect("index.jsp");;


		} else {
			out.println("hata");

		}

	}

}
