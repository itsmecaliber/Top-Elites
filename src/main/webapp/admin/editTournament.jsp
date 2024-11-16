<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.TournamentDAOImpl"%>
<%@ page import="com.entity.TournamentDetails"%>
<%@ page import="com.DAO.TournamentDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Tournament</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style>
body {
	background-color: #171c26; /* Dark background color */
	background-image: url("../images/cod.png"),
		url("../images/rocket-girl.png"); /* Background images */
	background-size: contain, contain; /* Size for both images */
	background-repeat: no-repeat; /* Prevent tiling */
	background-position: left center, right center;
	/* Position of the images */
	font-family: Arial, sans-serif;
	color: white;
	margin: 0;
	height: 100vh; /* Full viewport height */
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
}

h1 {
	font-size: 3rem; /* Size of the heading */
	margin-bottom: 10px; /* Space below the heading */
	color: white; /* Color for visibility */
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
	/* Adding shadow for better visibility */
}

form {
	background-color: #212121; /* Form background color */
	padding: 20px; /* Padding around the form */
	border-radius: 10px; /* Rounded corners */
	display: inline-block; /* Form as inline block for centering */
	margin-top: 10px; /* Space above the form */
	width: 320px; /* Fixed width for the form */
}

label {
	display: block;
	margin-bottom: 5px; /* Space below the label */
	font-size: 1.7rem; /* Increased font size for labels */
	color: #39b54a; /* Label color */
}

input[type="text"], input[type="date"], input[type="number"], input[type="file"]
	{
	width: 280px; /* Width of input fields */
	height: 30px; /* Adjust height as needed */
	padding: 4px; /* Reduce padding to decrease overall height */
	margin: 0 auto 10px; /* Center horizontally and space below */
	border-radius: 5px; /* Rounded corners */
	border: 1px solid #39b54a; /* Border color */
	font-size: 1.4rem; /* Font size */
	color: white !important; /* Input text color */
	background-color: #212121; /* Background color of the input field */
	display: block; /* Make the input fields block elements */
}

input[type="file"] {
	width: 280px; /* Width of input fields */
	height: 30px; /* Adjust height as needed */
	padding: 4px; /* Reduce padding to decrease overall height */
	margin: 15px auto 10px; /* Center horizontally, with more top space */
	border-radius: 5px; /* Rounded corners */
	border: 1px solid #39b54a; /* Border color */
	font-size: 1.4rem; /* Font size */
	color: white !important; /* Input text color */
	background-color: #212121; /* Background color of the input field */
}

.button {
	background-color: #39b54a; /* Button background color */
	color: #ffffff; /* Button text color */
	border: none; /* No border */
	border-radius: 5px; /* Rounded corners */
	padding: 10px 15px; /* Padding inside button */
	font-size: 1.5rem; /* Font size */
	cursor: pointer; /* Pointer cursor on hover */
	transition: background-color 0.3s ease;
	/* Transition for hover effect */
	width: 100%; /* Full width button */
	text-align: center; /* Center text */
	display: flex; /* Enable flexbox */
	align-items: center; /* Center text vertically */
	justify-content: center; /* Center text horizontally */
}

.text-success {
	color: #39b54a; /* Green color for success */
	text-align: center;
	font-size: 1.5rem; /* Adjust as needed */
}

.text-danger {
	color: red; /* Red color for error */
	text-align: center;
	font-size: 1.5rem; /* Adjust as needed */
}

.button:hover {
	background-color: #2a9038; /* Darker shade on hover */
}
</style>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h1>Edit Tournament</h1>


	<%
	int id = Integer.parseInt(request.getParameter("id"));
	TournamentDAOImpl dao = new TournamentDAOImpl(DBConnect.getConn());
	TournamentDetails t = dao.getTournamentById(id);
	%>

	<form action="../edit_tournaments" method="post">
		<input type="hidden" name="id" value="<%=t.getTournament_id()%>">
		<label for="tournamentName">Tournament Name:</label> <input
			type="text" id="tournamentName" name="tournament_name" required
			value="<%=t.getTournament_name()%>"> <label
			for="tournamentDate">Tournament Date:</label> <input type="date"
			id="tournamentDate" name="tournament_date" required
			value="<%=t.getTournament_date()%>"> <label for="entryFee">Entry
			Fee:</label> <input type="number" id="entryFee" name="entry_fee" required
			value="<%=t.getEntry_fee()%>"> <label for="prizePool">Prize
			Pool:</label> <input type="number" id="prizePool" name="prize_pool" required
			value="<%=t.getPrize_pool()%>">


		<button type="submit" class="button">Update Tournament</button>
	</form>
	<br>
	<button class="button" onclick="location.href='adhome.jsp'">Back
		to Dashboard</button>
</body>
</html>
