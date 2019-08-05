<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList,dao.loginSelect,bean.*"%>

<%
	String makaleid = request.getParameter("makaleid");

	loginSelect nesne = new loginSelect();
	ArrayList<beanHakem> asd2 = nesne.hakemAta(makaleid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<form method="post" action="hakemID">

		<table>
			<%
				for (beanHakem e : asd2) {
			%>
			<tr>
				<td>Hakem Ad:</td>
				<td> <%=e.getAd()%></td>
			</tr>
			<tr>
				<td>Hakem Soyad:</td>
				<td> <%=e.getSoyad()%></td>
			</tr>
			
			<tr><td>
				<input type="text" value="<%=makaleid%>" name="asd" id="asd" readonly/>
				</td>
				<td><a href="hakemID?hakemid=<%=e.getHakemid()%>">HAKEM SEC</a></td>
			</tr>
			<%
				}
			%>

		</table>

	</form>

</body>
</html>