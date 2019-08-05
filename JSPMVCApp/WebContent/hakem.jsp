<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList,dao.loginSelect,bean.*"%>
<%
	String kullaniciadi;
	if (session.getAttribute("kullaniciadi") != null) {
		kullaniciadi = (String) session.getAttribute("kullaniciadi");
		out.print("Merhaba " + kullaniciadi + ",  Hakem Sayfasina Hos Geldiniz...");
	} else {
		//session.invalidate();
		response.sendRedirect("index.jsp");
	}

	loginSelect nesne = new loginSelect();
	ArrayList<makaleGosterBean> asd = nesne.hakemGonderilenMakaleler();
	ArrayList<makaleGosterBean> asd2 = nesne.getAllMakale2((String) session.getAttribute("kullaniciadi"));
	ArrayList<makaleGosterBean> asd3 = nesne.getAllMakale5((String) session.getAttribute("kullaniciadi"));
%>
<%
	response.addHeader("pragma", "no-cache");
	response.addHeader("cache-control", "no-store");
	response.addHeader("expire", "0");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
	integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
	crossorigin="anonymous"></script>
<script
	src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
	integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
	crossorigin="anonymous"></script>


<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">

/* 
Inspired by http://dribbble.com/shots/890759-Ui-Kit-Metro/attachments/97174
*/
*, *:before, *:after {
	/* Chrome 9-, Safari 5-, iOS 4.2-, Android 3-, Blackberry 7- */
	-webkit-box-sizing: border-box;
	/* Firefox (desktop or Android) 28- */
	-moz-box-sizing: border-box;
	/* Firefox 29+, IE 8+, Chrome 10+, Safari 5.1+, Opera 9.5+, iOS 5+, Opera Mini Anything, Blackberry 10+, Android 4+ */
	box-sizing: border-box;
}

body {
	background-color: #92a8d1;
	text-align: center;
	padding-top: 20px;
}

.btn-nav {
	background-color: #fff;
	border: 1px solid #e0e1db;
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box; /* Firefox, other Gecko */
	box-sizing: border-box; /* Opera/IE 8+ */
}

.btn-nav:hover {
	color: #e92d00;
	cursor: pointer;
	-webkit-transition: color 1s; /* For Safari 3.1 to 6.0 */
	transition: color 1s;
}

.btn-nav.active {
	color: #e92d00;
	padding: 2px;
	border-top: 6px solid #e92d00;
	border-bottom: 6px solid #e92d00;
	border-left: 0;
	border-right: 0;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-webkit-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	-moz-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	-ms-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	/* IE10 is actually unprefixed */
	-o-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	transition: border 0.3s ease-out, color 0.3s ease 0.5s;
	-webkit-animation: pulsate 1.2s linear infinite;
	animation: pulsate 1.2s linear infinite;
}

.btn-nav.active:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 6px 6px 0;
	border-color: #e92d00 transparent;
	display: block;
	width: 0;
	z-index: 1;
	margin-left: -6px;
	top: 0;
	left: 50%;
}

.btn-nav .glyphicon {
	padding-top: 6px;
	font-size: 30px;
}

.btn-nav.active p {
	margin-bottom: 4px;
}

@
-webkit-keyframes pulsate { 50% {
	color: #000;
}

}
@
keyframes pulsate { 50% {
	color: #000;
}

}
@media ( max-width : 220px) {
	.btn-group {
		display: block !important;
		float: none !important;
		width: 100% !important;
		max-width: 100% !important;
	}
}

@media ( max-width : 600px) {
	.btn-nav .glyphicon {
		padding-top: 12px;
		font-size: 26px;
	}
}

.table-bordered {
	border: 1px solid #dddddd;
	border-collapse: separate;
	border-left: 0;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}

.table {
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
	margin-bottom: 20px;
	background-color: transparent;
	border-collapse: collapse;
	border-spacing: 0;
	display: table;
}

.widget.widget-table .table {
	margin-bottom: 0;
	border: none;
}

.widget.widget-table .widget-content {
	padding: 0;
}

.widget .widget-header+.widget-content {
	border-top: none;
	-webkit-border-top-left-radius: 0;
	-webkit-border-top-right-radius: 0;
	-moz-border-radius-topleft: 0;
	-moz-border-radius-topright: 0;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.widget .widget-content {
	padding: 20px 15px 15px;
	background: #FFF;
	border: 1px solid #D5D5D5;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

.widget .widget-header {
	position: relative;
	height: 20px;
	line-height: 20px;
	background: #E9E9E9;
	background: -moz-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fafafa),
		color-stop(100%, #e9e9e9));
	background: -webkit-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
	background: -o-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
	background: -ms-linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
	background: linear-gradient(top, #fafafa 0%, #e9e9e9 100%);
	text-shadow: 0 1px 0 #fff;
	border-radius: 5px 5px 0 0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1), inset 0 1px 0 white, inset 0
		-1px 0 rgba(255, 255, 255, 0.7);
	border-bottom: 1px solid #bababa;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA',
		endColorstr='#E9E9E9');
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
	border: 1px solid #D5D5D5;
	-webkit-border-top-left-radius: 4px;
	-webkit-border-top-right-radius: 4px;
	-moz-border-radius-topleft: 4px;
	-moz-border-radius-topright: 4px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	-webkit-background-clip: padding-box;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

.widget .widget-header h3 {
	top: 2px;
	position: relative;
	left: 10px;
	display: inline-block;
	margin-right: 3em;
	font-size: 14px;
	font-weight: 600;
	color: #555;
	line-height: 18px;
	text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5);
}

.widget .widget-header [class^="icon-"], .widget .widget-header [class*=" icon-"]
	{
	display: inline-block;
	margin-left: 13px;
	margin-right: -2px;
	font-size: 16px;
	color: #555;
	vertical-align: middle;
}
</style>
</head>
<script type="text/javascript">
	var activeEl = 2;
	$(function() {
		var items = $('.btn-nav');
		$(items[activeEl]).addClass('active');
		$(".btn-nav").click(function() {
			$(items[activeEl]).removeClass('active');
			$(this).addClass('active');
			activeEl = $(".btn-nav").index(this);
		});
	});
</script>
<script>
	
</script>

<script>
	$(function() {
		$('#gelenmakale').show();
		$('#gonderilenmakale').hide();

		$("#uc").click(function() {
			$('#gelenmakale').show();
			$('#gonderilenmakale').hide();

		});

		$("#iki").click(function() {
			$('#gelenmakale').hide();
			$('#gonderilenmakale').show();

		});
		$("#dort").click(function() {
			$('#gonderilenmakale').hide();
			$('#gelenmakale').hide();

		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="btn-group btn-group-justified">
				
				<div class="btn-group">
					<button type="button" class="btn btn-nav" id="iki">
						<span class="glyphicon glyphicon-calendar"></span>
						<p>GONDERILEN MAKALELER</p>

					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-nav" id="uc">
						<span class="glyphicon glyphicon-globe"></span>
						<p>GELEN MAKALELER</p>

					</button>
				</div>
				
				<div class="btn-group">
					<form action="Logout" method="post">
						<button type="submit" class="btn btn-nav" id="bes">
							<span class="glyphicon glyphicon-time"></span>
							<p>CIKIS</p>
						</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	<div></div>

	<div id="gonderilenmakale">
		<table class="table">
			<thead>
				<tr>
					<th class="text-center" style="font-size: 12px;">MAKALE ID</th>

					<th style="font-size: 12px;">KONU</th>
					<th style="font-size: 12px;">ICERIK</th>
					<th style="font-size: 12px;">GONDERIM TARIHI</th>

				</tr>
			</thead>
			<tbody>


				<%
					for (makaleGosterBean e : asd) {
				%>
				<tr>
					<td class="danger"><%=e.getMakaleid()%></td>
					<td class="success"><%=e.getKonu()%></td>
					<td class="active"><%=e.getIceriktext()%></td>
					<td class="danger"><%=e.getTarih()%></td>



					<!--  <td class="td-actions text-center">

						<a href="makale" rel="tooltip"
							class="btn btn-success btn-just-icon btn-sm" title="Duzenle">
							<i class="material-icons">edit</i>
						</a>
						<button type="button" rel="tooltip"
							class="btn btn-danger btn-just-icon btn-sm" title="Sil">
							<i class="material-icons">close</i>
						</button>

					</td>
					-->
					<td><a href="makaleSil?makaleid=<%=e.getMakaleid()%>"
						rel="tooltip" class="btn btn-danger btn-just-icon btn-sm"
						title="Sil"> <i class="material-icons">close</i>
					</a></td>


					<%
						}
					%>
				</tr>
			</tbody>
		</table>
	</div>



	<div id="gelenmakale">
		<table class="table">
			<thead>
				<tr>
					<th class="text-center" style="font-size: 12px;">MAKALE ID</th>

					<th style="font-size: 12px;">KONU</th>
					<th style="font-size: 12px;">ICERIK</th>
					<th style="font-size: 12px;">GONDERIM TARIHI</th>


				</tr>
			</thead>
			<tbody>


				<%
					ArrayList<beanHakem> asd5 = nesne.hakemGoster((String) (session.getAttribute("kullaniciadi")));

					for (beanHakem e : asd5) {
				%>
				<tr>
					<td class="danger"><%=e.getMakaleid()%></td>

					<td class="success"><%=e.getKonu()%></td>
					<td class="active"><%=e.getIceriktext()%></td>
					<td class="danger"><%=e.getTarih()%></td>
					<td class="success"><a
						href="DisplayServlet?makaleid=<%=e.getMakaleid()%>"> EKLER.. </a></td>


					<td class="td-actions text-center"><a
						href="makaleDuzenle.jsp?makaleid=<%=e.getMakaleid()%>"
						rel="tooltip" class="btn btn-success btn-just-icon btn-sm"
						title="DUZENLE"> <i class="material-icons">edit</i>
					</a></td>



					<td><a href="editorOnayla?makaleid=<%=e.getMakaleid()%>"
						rel="tooltip" class="btn btn-success btn-just-icon btn-sm"
						title="ONAYLA"> <i class="material-icons">close</i>
					</a></td>
					<td><a href="editorReddet?makaleid=<%=e.getMakaleid()%>"
						rel="tooltip" class="btn btn-danger btn-just-icon btn-sm"
						title="REDDET"> <i class="material-icons">edit</i>
					</a></td>
					<td><a href="makaleSil?makaleid=<%=e.getMakaleid()%>"
						rel="tooltip" class="btn btn-danger btn-just-icon btn-sm"
						title="SIL"> <i class="material-icons">close</i>
					</a></td>


					<%
						}
					%>
				</tr>
			</tbody>
		</table>
	</div>






</body>


</html>