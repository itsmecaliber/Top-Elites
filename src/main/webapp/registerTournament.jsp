<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.TournamentDAOImpl"%>
<%@ page import="com.entity.TournamentDetails"%>
<%@ page import="com.DAO.TournamentDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register Team for Tournament</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #111320;
	color: #ffffff;
	background-image: url("images/cod.png"), url("images/rocket-girl.png");
	background-size: contain, contain;
	background-repeat: no-repeat;
	background-position: left center, right center;
	height: 100vh;
}

.container {
	margin-top: 30px;
}

.form-section {
	background-color: #24283c;
	padding: 20px;
	border-radius: 10px;
	max-width: 500px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	margin: auto;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center mb-4">Register Your Team</h2>

		<!-- Check if the user is not logged in -->
		<c:if test="${empty userobj}">
			<!-- Show the login message and redirect to login page when the form is submitted -->
			<script>
				alert("You must log in to register for the tournament.");
				window.location.href = "signup.jsp";  // Redirect to login page
			</script>
		</c:if>

		<!-- Success message -->
		<c:if test="${not empty succMsg}">
			<h2 class="text-center text-success">${succMsg }</h2>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<!-- Failure message -->
		<c:if test="${not empty failedMsg}">
			<h3 class="text-center text-danger">${failedMsg }</h3>
			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<%
    // Get the tournament ID from the request parameter
    String tournamentIdStr = request.getParameter("id");
    int tournamentId = 0; // Default value

    // Check if the tournamentIdStr is not null and try to parse it to an integer
    if (tournamentIdStr != null) {
        try {
            tournamentId = Integer.parseInt(tournamentIdStr);
        } catch (NumberFormatException e) {
            // Handle the case where the tournament ID is not a valid integer
            tournamentId = 0; // or handle the error as needed
        }
    }
%>

		<div class="form-section">
			<form action="add_team" method="post">
				<div class="form-group">
					<label for="teamName">Team Name</label> 
					<input type="text" class="form-control" id="teamName" name="teamName" required>
				</div>
				<div class="form-group">
					<label for="leaderName">Team Leader Name</label> 
					<input type="text" class="form-control" id="leaderName" name="leaderName" required>
				</div>
				<div class="form-group">
					<label for="leaderEmail">Team Leader Email</label> 
					<input type="email" class="form-control" id="leaderEmail" name="leaderEmail" required>
				</div>
				<div class="form-group">
					<input type="hidden" name="tournamentId" value="<%= tournamentId %>">
				</div>

				<h4>Players</h4>
				<div class="form-group">
					<label for="player1IGN">Player 1 In Game Name</label> 
					<input type="text" class="form-control" id="player1IGN" name="player1IGN" required>
				</div>
				<div class="form-group">
					<label for="player2IGN">Player 2 In Game Name</label> 
					<input type="text" class="form-control" id="player2IGN" name="player2IGN" required>
				</div>
				<div class="form-group">
					<label for="player3IGN">Player 3 In Game Name</label> 
					<input type="text" class="form-control" id="player3IGN" name="player3IGN" required>
				</div>
				<div class="form-group">
					<label for="player4IGN">Player 4 In Game Name</label> 
					<input type="text" class="form-control" id="player4IGN" name="player4IGN" required>
				</div>
				<div class="form-group">
					<label for="substituteIGN">Substitute Player In Game Name</label> 
					<input type="text" class="form-control" id="substituteIGN" name="substituteIGN" required>
				</div>

				<button type="submit" class="btn btn-primary btn-block">Register Team</button>
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
