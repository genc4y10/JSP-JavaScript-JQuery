<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList,dao.loginSelect,bean.*"%>

<%
	loginSelect nesne = new loginSelect();
	ArrayList<makaleGosterBean> asd = nesne.yazarIdBul((String) session.getAttribute("kullaniciadi"));
	ArrayList<beanEditor> asd2 = nesne.editorBul();
%>
<%
	if (session.getAttribute("kullaniciadi") != null) {
		String kullaniciadi = (String) session.getAttribute("kullaniciadi");
		out.print("Merhaba " + kullaniciadi + ",  Yazar Sayfasina Hos Geldiniz...");
	} else {
		//session.invalidate();
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<style type="text/css">
#we{
	display: none
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>YAZAR SAYFASI</title>
<script >

function unvankontrol(){

	document.getElementById("we").value = document.getElementById("unvan").value;
	
	
	
}

</script>
</head>
<body>
	<center>
		<h1>Yazar dosya yukleme sayfasi</h1>
		<form method="post" action="FileUploadServlet"
			enctype="multipart/form-data">
			<table border="0">
				<tr>
					<td>KONU:</td>
					<td><input type="text" name="konu" size="50" /></td>
				</tr>
				<tr>
					<td>EDITOR SEC:</td>
					<td><select onchange="unvankontrol()" name="unvan" id="unvan">
							<option>Editor Seciniz..</option>

							<%
								for (beanEditor e2 : asd2) {
							%>
							<option value="<%=e2.getEditorid()%>"><%=e2.getAd()%>
								<%=e2.getSoyad()%></option>
							<% 
								}
							%>

					</select></td>
					<td><input type="text" name="we" id="we" size="50" /> </td>

				</tr>

				<%
					for (makaleGosterBean e : asd) {
				%>
				<tr>
					<td>YAZAR ID:</td>
					<td><input type="text" value="<%=e.getYazarid()%>" readonly
						name="yazarid" size="50" /></td>
				</tr>

				<tr>
					<td>YAZAR AD SOYAD:</td>
					<td><input type="text"
						value="<%=e.getAd()%> <%=e.getSoyad()%>" readonly
						name="yazaradsoyad" size="50" /> <%
 	}
 %></td>
				</tr>
				<tr>
					<td>ICERIK:</td>
					<td><textarea style="resize: none;" name="icerik" id="icerik" rows="5" cols="100"
							maxlength="1000"></textarea></td>
				</tr>
				<tr>
					<td>DOSYA:</td>
					<td><input type="file" name="photo" size="50" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Save"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>