<?php
require('config/config.php');
session_start();
if(isset($_SESSION['id'])){
    header('Location: index.php');
}
?>



<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/main.css">
	<title>Forum - Login</title>
</head>

<body id="connexion-background">
	<header>
		<?php
		include('header.php');
		$error = false;

		if (isset($_POST['log_in'])) {
			if ($_POST['login'] != null && ($_POST['pass']) != null) {
				$login = $_POST['login'];
				$password = $_POST['pass'];
				$request = "SELECT password, id, permission FROM utilisateurs WHERE username = '$login'";
				$execute_request = mysqli_query($dbconnect, $request);
				$ifexist = mysqli_num_rows($execute_request);
				if ($ifexist != 0) {
					$resultat_request = mysqli_fetch_array($execute_request);
					if (password_verify($password, $resultat_request['password'])) {

						$_SESSION["login"] = $_POST['login'];
						$_SESSION["id"] = $resultat_request[1];
						$_SESSION['permission'] = $resultat_request[2];
						header('location:index.php');
					} else {
						$error = "Login or password doesn't match";
					}
				} else {
					$error = "Login or password doesn't match";
				}
			}
		}
		?>
	</header>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-160 p-t-50">
				<form method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						Account Login
					</span>
					<form action="" method="post">
						<div class="wrap-input100 rs1 validate-input" data-validate="Username is required">
							<input class="input100" type="text" name="login" placeholder="Username">

						</div>


						<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
							<input class="input100" type="password" name="pass" placeholder="Password">
						</div>

						<div class="container-login100-form-btn">
							<!-- <button class="login100-form-btn"> -->
							<div class="login-logout">
								<!-- <a href="">
									<h3>LOG IN</h3>
								</a> -->
								<input class="login100-form-btn" type="submit" value="LOG IN" name="log_in">
							</div>

							<!-- </button> -->

							<a href="inscription.php"><button type="button" class="login100-form-btn">Sign Up</button></a>
						</div>
						<!-- </button> -->
			</div>
			</form>
		</div>
	</div>
	</div>

</body>

</html>