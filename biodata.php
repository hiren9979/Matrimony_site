<?php
	include 'header.php';
	$host = "localhost";
	$user = "root";
	$pass = "1234";
	$db = "matrimony";
	$conn = mysqli_connect($host, $user, $pass, $db) or die("Could NOT CoNnEcT" . mysqli_errno($conn));
	if (mysqli_connect_errno()) {
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
	session_start();
	$email = $_SESSION["email"];
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		$age = $_POST["age"];
		$religion = $_POST["religion"];
		$language = $_POST["language"];
		$education = $_POST["education"];
		$hometown = $_POST["hometown"];
		$job = $_POST["job"];
		$salary = $_POST["salary"];
		$other = $_POST["other"];
		$email = $_SESSION['email'];
		$filename = basename($_FILES["fileToUpload"]["name"]);
		$target_dir = "images/";
		$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
		$uploadOk = 1;
		$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
		// Check if image file is a actual image or fake image
		if ($_POST["submit"] != NULL){

			try{
			$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
			}
			catch (exception $e) {
				echo $e->getMessage();}
			if ($check !== false) {
				echo "File is an image - " . $check["mime"] . ".";
				$uploadOk = 1;
				move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $target_dir . $filename);
				$sqlphoto = "UPDATE `record` SET `image`='$filename' WHERE `email` = '$email' ";
				$result = mysqli_query($conn, $sqlphoto);
			} 
			else {
				echo "File is not an image.";
				$uploadOk = 0;
			}
		
		}
		$query = "UPDATE `record` SET age = '$age' , religion = '$religion', education = '$education' , hometown = '$hometown' , job = '$job' , salary = '$salary' , other_details = '$other' ,  mother_tongue = '$language' WHERE email = '$email' ";
		$result = mysqli_query($conn, $query);
		if ($result) {
			$_SESSION["update"] = "successfully updated";
			// header('location:check_profile.php');
		} 
		else {
			echo "failed";
		}
	}
	$sqlquery = "SELECT * FROM record WHERE email='$email' ";
	$result = mysqli_query($conn, $sqlquery);
	$row = NULL;
	if ($result) {
		$row = mysqli_fetch_assoc($result);
	}
	// else if(isset($_SESSION["msg"]))
	// {
	//     $_SESSION["msg"] = "login first !";
	//     header('location:_login.php');
	// }
?>


<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="style.css">
	<title>Document</title>
</head>

<body class="container biodata">
	<br>Upload Your Bio data
	<div>
		<button class="btn btn-success"><a href="check_profile.php">go back</a></button>
	</div>
	<!-- <h1> <?php echo $_SESSION["email"]; ?> </h1> -->
	<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
		
		<div class="form-group">
			<label for="exampleInputEmail1">Age</label>
			<input type="text" name="age" class="form-control" value="<?php echo $row['age']; ?>">
		</div>

		<div class="form-group">
			<label>religion</label>
			<select name="religion" class="form-control">
				<option value="Hindu" <?php if($row['religion'] == "Hindu") {echo "selected"; } ?>>Hindu
				<option value="Muslim" <?php if($row['religion'] == "Muslim") {echo "selected"; } ?>>Muslim
				<option value="Christian" <?php if($row['religion'] == "Christian") {echo "selected"; } ?>>Christian
				<option value="Sikh" <?php if($row['religion'] == "Sikh") {echo "selected"; } ?>>Sikh
				<option value="Jain" <?php if($row['religion'] == "Jain") {echo "selected"; } ?>>Jain
				<option value="Pasrsi" <?php if($row['religion'] == "Parsi") {echo "selected"; } ?>>Parsi
				<option value="Other" <?php if($row['religion'] == "Other") {echo "selected"; } ?>>Other religion
			</select>
		</div>

		<div class="form-group">
			<label>Mother Tongue</label>
			<select name="language" class="form-control">
				<option value="Hindi" <?php if($row['mother_tongue'] == "Hindi") {echo "selected"; } ?>>Hindi
				<option value="Gujrati" <?php if($row['mother_tongue'] == "Gujarati") {echo "selected"; } ?> >Gujrati </option>
				<option value="English" <?php if($row['mother_tongue'] == "English") {echo "selected"; } ?> >English</option>
				<option value="Marathi" <?php if($row['mother_tongue'] == "Marathi") {echo "selected"; } ?> >Marathi</option>
				<option value="Kannada" <?php if($row['mother_tongue'] == "Kannada") {echo "selected"; } ?> >Kannad</option>
				<option value="Telugu" <?php if($row['mother_tongue'] == "Telugu") {echo "selected"; } ?> >Telugu</option>
				<option value="Tamil" <?php if($row['mother_tongue'] == "Tamil") {echo "selected"; } ?> >Tamil</option>
				<option value="Other_language" <?php if($row['mother_tongue'] == "hindi") {echo "selected"; } ?> >Other Language</option>
			</select>
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">Education</label>
			<input type="text" class="form-control" name="education" value="<?php echo $row['education']; ?>">
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">Hometown</label>
			<input type="text" class="form-control" name="hometown" value="<?php echo $row['hometown']; ?>">
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">Job</label>
			<input type="text" class="form-control" name="job" value="<?php echo $row['job']; ?>">
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">salary</label>
			<select name="salary" class="form-control" > 
					<option value="10000" <?php if($row['salary'] == 10000) {echo "selected"; } ?> >10000 - 25000 </option>
					 <option value="25000" <?php if($row['salary'] == 25000) {echo "selected"; } ?> >25000 - 35000 </option>
					 <option value="35000" <?php if($row['salary'] == 35000) {echo "selected"; } ?> >35000 - 50000 </option>
					 <option value="50000" <?php if($row['salary'] == 50000) {echo "selected"; } ?> >50000 - 100000 </option>
					<option value="100000" <?php if($row['salary'] == 100000) {echo "selected"; } ?>> > 100000 </option>
			</select>
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1"> Other Details </label>
			<textarea class="form-control" name="other" ><?php echo $row['other_details']; ?></textarea>
		</div>

		<div class="form-group">
			<label>Image</label>
			<input type="file" name="fileToUpload" id="fileToUpload" accept="image">
		</div>

		<div class="form-group">
			<input type="submit" name="submit" value="update">
			<input type="reset" name="reset" value="reset">
		</div>
		
	</form>

</body>
</html>