package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import bean.*;
import bean.makaleGosterBean;

public class loginSelect {

	Connection con = null;

	public Connection start() {

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dergiyonetimsistemi", "root", "12345");

		} catch (Exception e) {
			System.out.println(e);
		}

		return con;
	}

	public int checkLogin(String kullaniciadi, String sifre) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con
					.prepareStatement("select kullaniciadi,sifre,unvanid from login where kullaniciadi=? and sifre=?");
			ps.setString(1, kullaniciadi);
			ps.setString(2, sifre);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int as = rs.getInt("unvanid");
				if (as == 1) {
					x = 1; // editor
				} else if (as == 2) {
					x = 2; // yazar
				} else if (as == 3) {
					x = 3;// hakem
				} else
					x = 4;

			} else {
				x = 30;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public int makaleSilme(String makaleid) {
		int x = 0;
		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("delete from makale where makaleid =?");
			ps.setInt(1, Integer.parseInt(makaleid));
			x = ps.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}

		return x;
	}

	public int makaleDuzenle(int makaleid, String yorum,String durum) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("update makale set yorum=?, durum=? where makaleid=" + makaleid + "");
			ps.setString(1, yorum);
			ps.setString(2, durum);
			x = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}

		return x;
	}

	public int editorKayit(beanEditor editorKayitlar) {

		int x = 0;
		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement(
					"insert into editor(kullaniciadi,ad,soyad,email,telno,sifre,sifretekrar,calistigiil,calistigiilce) "
							+ "values(?,?,?,?,?,?,?,?,?)");

			ps.setString(1, editorKayitlar.getKullaniciadi());
			ps.setString(2, editorKayitlar.getAd());
			ps.setString(3, editorKayitlar.getSoyad());
			ps.setString(4, editorKayitlar.getEmail());
			ps.setString(5, editorKayitlar.getTelno());
			ps.setString(6, editorKayitlar.getSifre());
			ps.setString(7, editorKayitlar.getSifretekrar());
			ps.setString(8, editorKayitlar.getCalistigiil());
			ps.setString(9, editorKayitlar.getCalistigiilce());

			x = ps.executeUpdate();
			// x = 1;

		} catch (Exception e) {
			System.out.println(e);
		}
		return x;

	}

	public ArrayList<makaleGosterBean> getAllMakale(String kullaniciadi) {
		ArrayList<makaleGosterBean> makaleler = new ArrayList<makaleGosterBean>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from makale where durum='1' and editorid in(select editorid from editor where kullaniciadi='"+kullaniciadi+"')");
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setMakaleid(rs.getString("makaleid"));
				makaleGosterBean.setEditorid(rs.getString("editorid"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));
				makaleGosterBean.setHakemid(rs.getString("hakemid"));
				makaleGosterBean.setKonu(rs.getString("konu"));
				makaleGosterBean.setIceriktext(rs.getString("iceriktext"));
				makaleGosterBean.setTarih(rs.getString("tarih"));
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}
	
	
	public ArrayList<makaleGosterBean> getAllMakale11() {
		ArrayList<makaleGosterBean> makaleler = new ArrayList<makaleGosterBean>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from makale where durum='1'");
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setMakaleid(rs.getString("makaleid"));
				makaleGosterBean.setEditorid(rs.getString("editorid"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));
				makaleGosterBean.setHakemid(rs.getString("hakemid"));
				makaleGosterBean.setKonu(rs.getString("konu"));
				makaleGosterBean.setIceriktext(rs.getString("iceriktext"));
				makaleGosterBean.setTarih(rs.getString("tarih"));
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}
	
	
	
	public ArrayList<makaleGosterBean> hakemGonderilenMakaleler() {
		ArrayList<makaleGosterBean> makaleler = new ArrayList<makaleGosterBean>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select makaleid,editorid,yazarid,hakemid,konu,iceriktext,tarih from makale where durum='4'");
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setMakaleid(rs.getString("makaleid"));
				makaleGosterBean.setEditorid(rs.getString("editorid"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));
				makaleGosterBean.setHakemid(rs.getString("hakemid"));
				makaleGosterBean.setKonu(rs.getString("konu"));
				makaleGosterBean.setIceriktext(rs.getString("iceriktext"));
				makaleGosterBean.setTarih(rs.getString("tarih"));
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}
	public ArrayList<beanHakem> hakemGoster(String kullaniciadi) {
		ArrayList<beanHakem> makaleler = new ArrayList<beanHakem>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from makale where durum='1' and hakemid in(select hakemid from hakem where kullaniciadi='"+kullaniciadi+"')");
			while (rs.next()) {
				beanHakem makaleGosterBean = new beanHakem();
				makaleGosterBean.setMakaleid(rs.getString("makaleid"));
				makaleGosterBean.setEditorid(rs.getString("editorid"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));
				makaleGosterBean.setHakemid(Integer.parseInt(rs.getString("hakemid")));
				makaleGosterBean.setKonu(rs.getString("konu"));
				makaleGosterBean.setIceriktext(rs.getString("iceriktext"));
				makaleGosterBean.setTarih(rs.getString("tarih"));
				makaleGosterBean.setDurum(rs.getString("durum"));
				makaleGosterBean.setYorum(rs.getString("yorum"));
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}

	public ArrayList<makaleGosterBean> getAllMakale2(String kullaniciadi) {
		ArrayList<makaleGosterBean> makaleler = new ArrayList<makaleGosterBean>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from makale where durum='0' and editorid in(select editorid from editor where kullaniciadi='"+kullaniciadi+"')");
			
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setMakaleid(rs.getString("makaleid"));
				makaleGosterBean.setEditorid(rs.getString("editorid"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));
				makaleGosterBean.setHakemid(rs.getString("hakemid"));
				makaleGosterBean.setKonu(rs.getString("konu"));
				makaleGosterBean.setIceriktext(rs.getString("iceriktext"));
				makaleGosterBean.setTarih(rs.getString("tarih"));
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}
	public ArrayList<makaleGosterBean> getAllMakale3(String makaleid) {
		ArrayList<makaleGosterBean> makaleler = new ArrayList<makaleGosterBean>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from makale where makaleid='"+makaleid+"'");
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setMakaleid(rs.getString("makaleid"));
				makaleGosterBean.setEditorid(rs.getString("editorid"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));
				makaleGosterBean.setHakemid(rs.getString("hakemid"));
				makaleGosterBean.setKonu(rs.getString("konu"));
				makaleGosterBean.setIceriktext(rs.getString("iceriktext"));
				makaleGosterBean.setTarih(rs.getString("tarih"));
				makaleGosterBean.setYorum(rs.getString("yorum"));
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}

	public int yazarKayit(beanYazar yazarKayitlar) {

		int x = 0;
		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement(
					"insert into yazar(kullaniciadi,ad,soyad,email,telno,sifre,sifretekrar,uzmanlik,okul,bolum) "
							+ "values(?,?,?,?,?,?,?,?,?,?)");

			ps.setString(1, yazarKayitlar.getKullaniciadi());
			ps.setString(2, yazarKayitlar.getAd());
			ps.setString(3, yazarKayitlar.getSoyad());
			ps.setString(4, yazarKayitlar.getEmail());
			ps.setString(5, yazarKayitlar.getTelno());
			ps.setString(6, yazarKayitlar.getSifre());
			ps.setString(7, yazarKayitlar.getSifretekrar());
			ps.setString(8, yazarKayitlar.getUzmanlik());
			ps.setString(9, yazarKayitlar.getOkul());
			ps.setString(10, yazarKayitlar.getBolum());

			x = ps.executeUpdate();
			// x = 1;

		} catch (Exception e) {
			System.out.println(e);
		}
		return x;

	}

	public ArrayList<makaleGosterBean> yazarIdBul(String kullaniciadi) {
		ArrayList<makaleGosterBean> editorler = new ArrayList<makaleGosterBean>();

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("select * from yazar where kullaniciadi='"+kullaniciadi+"'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setAd(rs.getString("ad"));
				makaleGosterBean.setSoyad(rs.getString("soyad"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));

				editorler.add(makaleGosterBean);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return editorler;
	}
	
	public ArrayList<beanEditor> editorBul() {
		ArrayList<beanEditor> editorler = new ArrayList<beanEditor>();

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("select * from editor ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				beanEditor makaleGosterBean = new beanEditor();
				makaleGosterBean.setEditorid( Integer.parseInt(rs.getString("editorid")));
				makaleGosterBean.setAd(rs.getString("ad"));
				makaleGosterBean.setSoyad(rs.getString("soyad"));
				

				editorler.add(makaleGosterBean);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return editorler;
	}
	
	
	public ArrayList<makaleGosterBean> editorBul(String kullaniciadi) {
		ArrayList<makaleGosterBean> editorler = new ArrayList<makaleGosterBean>();

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("select * from editor");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setAd(rs.getString("ad"));
				makaleGosterBean.setSoyad(rs.getString("soyad"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));

				editorler.add(makaleGosterBean);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return editorler;
	}

	public int hakemKayit(beanHakem hakemKayitlar) {

		int x = 0;
		try {
			Connection con = start();
			PreparedStatement ps = con
					.prepareStatement("insert into hakem(kullaniciadi,ad,soyad,email,telno,sifre,sifretekrar,uzmanlik) "
							+ "values(?,?,?,?,?,?,?,?)");

			ps.setString(1, hakemKayitlar.getKullaniciadi());
			ps.setString(2, hakemKayitlar.getAd());
			ps.setString(3, hakemKayitlar.getSoyad());
			ps.setString(4, hakemKayitlar.getEmail());
			ps.setString(5, hakemKayitlar.getTelno());
			ps.setString(6, hakemKayitlar.getSifre());
			ps.setString(7, hakemKayitlar.getSifretekrar());
			ps.setString(8, hakemKayitlar.getUzmanlik());

			x = ps.executeUpdate();
			// x = 1;

		} catch (Exception e) {
			System.out.println(e);
		}
		return x;

	}

	public int aktar(String kullaniciadi, String sifre, String unvanid) {

		int x = 0;
		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("insert into login (kullaniciadi,sifre,unvanid)values(?,?,?)");

			ps.setString(1, kullaniciadi);
			ps.setString(2, sifre);
			ps.setString(3, unvanid);

			x = ps.executeUpdate();
			// x = 1;

		} catch (Exception e) {
			System.out.println(e);
		}
		return x;

	}
	public int makaleEditorOnayla(String makaleid) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("update makale set durum=?,hakemid=? where makaleid=" + makaleid + "");
			ps.setString(1, "1");
			//.setString(2,hakemid);
			x = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}

		return x;
	}
	public int makaleEditorOnayla2(String hakemid) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("update makale set hakemid=? where makaleid='"+5+"'");
			ps.setString(1, hakemid);
			x = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}

		return x;
	}
	public int makaleEditorReddet(String makaleid) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("update makale set durum=? where makaleid=" + makaleid + "");
			ps.setString(1, "2");
			x = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}

		return x;
	}
	
	
	
	public ArrayList<makaleGosterBean> getAllMakale5(String kullaniciadi) {
		ArrayList<makaleGosterBean> makaleler = new ArrayList<makaleGosterBean>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from makale where durum='2' or durum='3' and editorid in(select editorid from editor where kullaniciadi='"+kullaniciadi+"')");
			while (rs.next()) {
				makaleGosterBean makaleGosterBean = new makaleGosterBean();
				makaleGosterBean.setMakaleid(rs.getString("makaleid"));
				makaleGosterBean.setEditorid(rs.getString("editorid"));
				makaleGosterBean.setYazarid(rs.getString("yazarid"));
				makaleGosterBean.setHakemid(rs.getString("hakemid"));
				makaleGosterBean.setKonu(rs.getString("konu"));
				makaleGosterBean.setIceriktext(rs.getString("iceriktext"));
				makaleGosterBean.setTarih(rs.getString("tarih"));
				makaleGosterBean.setYorum(rs.getString("yorum"));
				makaleGosterBean.setDurum(rs.getString("durum"));
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}
	
	
	public ArrayList<beanHakem> hakemAta(String makaleid) {
		ArrayList<beanHakem> makaleler = new ArrayList<beanHakem>();
		try {
			Connection con = start();
			Statement statement = (Statement) con.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from hakem where uzmanlik in (select konu from makale where makaleid='"+makaleid+"')");
			while (rs.next()) {
				beanHakem makaleGosterBean = new beanHakem();
				
				makaleGosterBean.setHakemid(Integer.parseInt(rs.getString("hakemid")));
				
				makaleGosterBean.setAd(rs.getString("ad"));

				makaleGosterBean.setSoyad(rs.getString("soyad"));
				
				makaleler.add(makaleGosterBean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return makaleler;
	}
	
	
	}
	
	


