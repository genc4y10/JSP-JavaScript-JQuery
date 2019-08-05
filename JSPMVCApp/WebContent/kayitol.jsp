<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="tr">
<head>
<style type="text/css">

/*
 * General styles
 */
body, html {
	height: 0%;
	background-repeat: no-repeat;
	background-color: #bdb76b;
	font-family: 'Oxygen', sans-serif;
	font-size: 12px;
}

.main {
	margin-top: 5px;
}

#unvanid {
	display: none
}

h2.title {
	font-size: 50px;
	font-family: 'Passion One', cursive;
	font-weight: 400;
}

hr {
	width: 10%;
	color: #fff;
}

.form-group {
	margin-bottom: 15px;
}

label {
	margin-bottom: 14px;
}

input, input::-webkit-input-placeholder {
	font-size: 9px;
	padding-top: 3px;
}

.main-login {
	background-color: #fff;
	/* shadows and rounded borders */
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.main-center {
	margin-top: 30px;
	margin: 0 auto;
	width: 440px;
	padding: 40px 40px;
}

.form-vertical {
	width: 380px;
}

.login-button {
	margin-top: 12px;
}

.login-register {
	font-size: 8px;
	text-align: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

<!-- Website CSS style -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(function() {
		$('#uzmanlikalani').hide();
		$('#bolum').hide();
		$('#okul').hide();
		$('#il').hide();
		$('#ilce').hide();
		$('#unvan').change(function() {
			if ($('#unvan').val() == 'hakem') {
				$('#uzmanlikalani').show();
				$('#bolum').hide();
				$('#okul').hide();
				$('#il').hide();
				$('#ilce').hide();
			} else if ($('#unvan').val() == 'yazar') {
				$('#uzmanlikalani').show();
				$('#bolum').show();
				$('#okul').show();
				$('#il').hide();
				$('#ilce').hide();
			} else if ($('#unvan').val() == 'editor') {
				$('#il').show();
				$('#ilce').show();
				$('#uzmanlikalani').hide();
				$('#bolum').hide();
				$('#okul').hide();
			}else{
				$('#uzmanlikalani').hide();
				$('#bolum').hide();
				$('#okul').hide();
				$('#il').hide();
				$('#ilce').hide();
			}
		});
	});
</script>
<script type="text/javascript">
	function kontrol() {
		var sifre = document.getElementById("sifre").value;
		var sifretekrar = document.getElementById("sifretekrar").value;
		if (sifre == sifretekrar) {
			return true;
		} else {

			alert("Sifreler ayni degil");
			return false;
		}

	}
	function unvankontrol() {
		var unvan2 = document.getElementById("unvan").value;

		if (unvan2 == "editor") {
			document.getElementById("unvanid").value = 1;

			return true;

		} else if (unvan2 == "yazar") {
			document.getElementById("unvanid").value = 2;
			return true;

		} else if (unvan2 == "hakem") {
			document.getElementById("unvanid").value = 3;
			
			return true;

		} else {
			document.getElementById("unvanid").value = 0;
			return false;
		}
	}
</script>
<title>KAYIT OL!</title>
</head>

<body>
	<div class="container">
		<div class="row main">
			<div class="main-login main-center">
				<form class="form-vertical" name="form1"
					onsubmit="return kontrol(document.form1);" method="post"
					action="kayitolServlet">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Kullanici
							Adi</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="kullaniciadi" id="kullaniciadi"
									placeholder="Kullanici Adi" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Ad</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="ad" id="ad" placeholder="Ad" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Soyad</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="soyad" id="soyad" placeholder="Soyad" />
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">E-mail</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="text" class="form-control" name="email" id="email"
									placeholder="Email Adresi" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="mobile" class="cols-sm-2 control-label required">Telefon
							Numarasi</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-mobile aria-hidden="true"></i></span> <input type="text"
									class="form-control" name="telno" id="telno"
									placeholder="Telefon No" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Sifre</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="password"
									class="form-control" name="sifre" id="sifre"
									placeholder="Sifre" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Sifre
							Tekrar</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="password"
									class="form-control" name="sifretekrar" id="sifretekrar"
									placeholder="Sifre Tekrar" />
							</div>
						</div>
					</div>



					<div class="form-group">
						<label for="nationality" class="cols-sm-2 control-label">Unvan</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-globe fa-lg" aria-hidden="true"></i></span> <select
									class="form-control" onchange="unvankontrol()" name="unvan"
									id="unvan">
									<option>Unvan Seciniz..</option>
									<option value="editor">Editor</option>
									<option value="yazar">Yazar</option>
									<option value="hakem">Hakem</option>

								</select>
							</div>
						</div>
					</div>

					<input type="text" name="unvanid" id="unvanid" />

					<div class="form-group" id="ilgi">
						<label for="name" class="cols-sm-2 control-label">Uzmanlik 
							Alanlarinizi Girin</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="uzmanlikalani" id="uzmanlikalani" placeholder="Uzmanlik Alanlarinizi Girin.." />
							</div>
						</div>
					</div>
					<div class="form-group" id="okul">
						<label for="name" class="cols-sm-2 control-label">Gorev
							Yaptiginiz Okul..</label>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-globe fa-lg" aria-hidden="true"></i></span> <select
								class="form-control" name="okul" id="okul">
								<option>Okul Seciniz..</option>
								<option value="Firat Universitesi">Firat Universitesi</option>
								<option value="Istanbul Teknik Universitesi">Istanbul
									Teknik Universitesi</option>
								<option value="Yildiz Teknik Universitesi">Yildiz
									Teknik Universitesi</option>

							</select>
						</div>
					</div>
					<div class="form-group" id="bolum">
						<label for="name" class="cols-sm-2 control-label">Bolumnuzu
							Secin..</label>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-globe fa-lg" aria-hidden="true"></i></span> <select
								class="form-control" name="bolum"
								id="bolum">
								<option>Bolum Seciniz..</option>
								<option value="Bilgisayar Muhendisligi">Bilgisayar
									Muhendisligi</option>
								<option value="Makine Muhendisligi">Makine Muhendisligi</option>
								<option value="Elektrik Elektronik Muhendisligi">Elektrik
									Elektronik Muhendisligi</option>

							</select>
						</div>
					</div>
					<div class="form-group" id=il>
						<label for="nationality" class="cols-sm-2 control-label">il</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-globe fa-lg" aria-hidden="true"></i></span> <select
									class="form-control" name="il" id="il">
									<option>IL Seciniz..</option>
									<option value="Tekirdag">Tekirdag</option>
									<option value="Ordu">Ordu</option>
									<option value="Malatya">Malatya</option>

								</select>
							</div>
						</div>
					</div>
					<div class="form-group" id="ilce">
						<label for="name" class="cols-sm-2 control-label">Ilce</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="ilce" id="ilce" placeholder="Ilce" />
							</div>
						</div>
					</div>

					<div class="form-group ">
						<button type="submit"
							class="btn btn-primary btn-lg btn-block login-button">Kayit
							Ol!</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
</body>
</html>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>