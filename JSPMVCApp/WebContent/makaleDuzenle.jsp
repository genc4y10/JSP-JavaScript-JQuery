<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page
	import="java.util.ArrayList,dao.loginSelect,bean.makaleGosterBean"%>

<%
String makaleid=request.getParameter("makaleid");
	loginSelect nesne = new loginSelect();
	ArrayList<makaleGosterBean> asd = nesne.getAllMakale11();
	ArrayList<makaleGosterBean> asd2 = nesne.getAllMakale3(makaleid);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java MVC Add, Edit, Delete Using JSP & Servlet With MySQL</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function validate() {
		var name_pattern = /^[a-z A-Z]+$/; //name pattern allowed alphabet a-z or A-Z 
		var owner_pattern = /^[a-z A-Z]+$/; //owner pattern allowed alphabet a-z or A-Z 

		var name = document.getElementById("name"); //get textbox id "name" and store in "name" variable
		var owner = document.getElementById("owner"); //get textbox id "owner" and store in "owner" variable

		if (!name_pattern.test(name.value) || name.value == '') //check if condition using test() method for matching name parameter pattern or not blank value
		{
			alert("Enter Name Alphabet Only....!"); //alert message
			name.focus();
			name.style.background = '#f08080'; //set textbox color
			return false;
		}
		if (!owner_pattern.test(owner.value) || owner.value == '') //check if condition using test() method for matching owner parameter pattern or not blank value
		{
			alert("Enter Owner Alphabet Only....!"); //alert message
			owner.focus();
			owner.style.background = '#f08080'; //set textbox color
			return false;
		}
	}
</script>

</head>
<body>
	<div class="main">

		<form method="post" action="makaleDuzenleServlet">

			<table>
				<%
					for (makaleGosterBean e : asd2) {
				%>
				<tr>
					<td>Makale ID:</td>
					<td><input type="text" name="makaleid" id="makaleid"
						value="<%=e.getMakaleid()%>"></td>
				</tr>

				<tr>
					<td>Konu:</td>
					<td><input type="text" name="konu" id="konu"
						value="<%=e.getKonu()%>"></td>
				</tr>
				<tr>
					<td>Yorum:</td>
					<td><input type="text" name="yorum" id="yorum"
						value="<%=e.getYorum()%>"></td>
				</tr>

				<tr>
					<td>Icerik:</td>
					<td><textarea style="resize: none;" rows="5" cols="100"
							maxlength="1000"><%=e.getIceriktext()%></textarea></td>
				</tr>


				<tr>
					<td><input type="submit" name="guncelle" value="Guncelle!"></td>
				</tr>

				<%
					}
				%>
			</table>



		</form>

	</div>

</body>
</html>
