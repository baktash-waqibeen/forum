<?php
session_start();
require('config/config.php');
$error = false;
if(isset($_SESSION['id'])){
    header('Location: index.php');
}
if (isset($_POST["submitBnt"])) {
	if ($_POST['username'] != "" && $_POST['password'] != "" && $_POST['Confrim_password'] != "" && $_POST['email'] != "") {
		$username =  $_POST['username'];
		$password = $_POST['password'];
		$confrim_password = $_POST['Confrim_password'];
		$email = $_POST['email'];

		$request_user = "SELECT *FROM utilisateurs WHERE username = '$username'";
		$execute_request = mysqli_query($dbconnect, $request_user);
		$ifexist = mysqli_num_rows($execute_request);

		// first check the database to make sure 
		// a user does not already exist with the same username and/or email
		$user_check_query = "SELECT * FROM utilisateurs WHERE username='$username' OR email='$email' LIMIT 1";
		$result = mysqli_query($dbconnect, $user_check_query);
		$user = mysqli_fetch_assoc($result);

		if ($user) { // if user exists
			if ($user['username'] === $username) {
				echo '<div class="error">Username already exists</div>';
			}

			if ($user['email'] === $email) {
				echo '<div class="error">Email already exists </div>';
			}
		}

		if (strlen($username) >= 5 && strlen($username) < 25 && strlen($password) > 6) {
			echo 'success';
		} else {
			if (strlen($username) < 5 || strlen($username) > 25) {
				echo '<div class="error">Username must be between 5 and 25 chracters </div>';
			}

			if (strlen($password) < 6) {
				echo '<div class="error">Password must be longer than 6 chracters </div>';
			}
		}


		

		if ($ifexist == 0) {
			if ($password == $confrim_password) {
				$username = mysqli_real_escape_string($dbconnect, (trim($_POST['username'])));
				$password = password_hash($_POST['password'], PASSWORD_BCRYPT, ["cost" => 12]);
				$email = mysqli_real_escape_string($dbconnect, (trim($_POST['email'])));
				$request = "INSERT INTO `utilisateurs` (username, password, email) VALUES ('$username','$password','$email')";
				$query = mysqli_query($dbconnect, $request);
				header('Location:connexion.php');
			} else {
				$error = "Password doesn't match";
			}
		} else {
			$error = "username already exist";
		}
	} else { ?>
		<script>
			alert('Please fill up the form!');
		</script>
<?php
	}
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/main.css">
	<title>Forum - Sign Up</title>
</head>

<body id="inscription-background">
	<header>
		<?php
		include ('header.php');
		?>
	</header>
	<img src="inscription-background" alt="">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-160 p-t-50">
				<form action="" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						Account Sign Up
					</span>
					<div class="wrap-input100 rs1 validate-input" data-validate="Username is required">
						<input class="input100" type="text" name="username">
						<span class="label-input100">Login</span>
					</div>


					<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password">
						<span class="label-input100">Password</span>
					</div>
					<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="Confrim_password">
						<span class="label-input100">Confrim Password</span>
					</div>
					<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
						<input class="input100" type="email" name="email">
						<span class="label-input100">Email</span>
					</div>
					<input type="submit" name="submitBnt" class="login100-form-btn" value="Sign up">
			</div>

			</button>

		</div>

		</form>
	</div>
	</div>


	</div>
</body>

</html>