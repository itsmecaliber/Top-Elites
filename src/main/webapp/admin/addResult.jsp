<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Result</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f2f5;
	color: #333;
	margin: 0;
	padding: 0;
}

#add-result {
	background-image: url('../images/hero-bg.jpg');
	background-size: cover;
	background-position: center;
	padding: 100px 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.result-form {
	max-width: 400px;
	background: #ffffff;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	position: relative;
}

.branding {
	color: #39b54a;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
	position: absolute;
	top: -20px;
	left: 50%;
	transform: translateX(-50%);
	background: #ffffff;
	padding: 5px 10px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

h1 {
	font-size: 24px;
	text-align: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
	position: relative;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], input[type="file"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	margin-bottom: 10px;
}

.button {
	background-color: #39b54a;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.button:hover {
	background-color: #018713;
	transform: scale(1.02);
}

.privacy-policy {
	font-size: 12px;
	text-align: center;
	margin-top: 15px;
}
</style>
</head>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	


	<!-- Add Result Section -->
	<section id="add-result">
		<div class="result-form">
			<div class="branding">Top Elites</div>
			<h1>Add Result</h1>

			<c:if test="${not empty succMsg}">
				<h2 class="text-center text-success">${succMsg }</h2>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<c:if test="${not empty failedMsg}">
				<h3 class="text-center text-danger">${failedMsg }</h3>
				<c:remove var="failedMsg" scope="session" />
			</c:if>

			<form action="../add_result" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="tournamentName">Tournament Name:</label> <input
						type="text" id="tournamentName" name="tournament_name" required
						placeholder="Enter tournament name">
				</div>

				<div class="form-group">
					<label for="resultFile">Upload Result (File/Photo):</label> <input
						type="file" id="resultFile" name="result_file" required
						accept="image/*">
				</div>

				<div class="form-group">
					<button type="submit" class="button">Upload Result</button>
				</div>
			</form>
			<div class="privacy-policy">By clicking Upload Result, you
				agree to our Terms, Data Policy, and Cookies Policy.</div>
		</div>
	</section>

</body>
</html>
