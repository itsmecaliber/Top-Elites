<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Player Dashboard</title>
   
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        body {
            background-color: #171c26; /* Set a dark background color */
            background-image: url("images/cod.png"), url("images/rocket-girl.png"); /* Two background images */
            background-size: contain, contain; /* Both images will fit their respective areas */
            background-repeat: no-repeat; /* Prevent tiling */
            background-position: left center, right center; /* First image to the left, second image to the right */
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
            font-size: 7rem; /* Adjust font size as needed */
            margin-bottom: 20px; /* Space below the heading */
            position: absolute; /* Positioning it at the top */
            top: 150px; /* Distance from the top */
            left: 50%;
            transform: translateX(-50%); /* Centering it horizontally */
            color: white; /* Color for visibility */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* Adding shadow for better visibility */
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px; /* Space between buttons */
            margin-top: 150px; /* Space below the heading */
        }

        .button {
            background-color: #39b54a; /* Button background color */
            color: #ffffff; /* Button text color */
            border: none;
            border-radius: 5px;
            padding: 20px 40px; /* Increased padding for larger buttons */
            font-size: 1.5rem; /* Increased font size */
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center; /* Center text */
            display: flex; /* Enable flexbox */
            align-items: center; /* Center text vertically */
            justify-content: center; /* Center text horizontally */
        }

        .button:hover {
            background-color: #2a9038; /* Darker shade on hover */
        }
    </style>
</head>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"/>
	</c:if>
	


    <h1>Welcome</h1>
    <div class="button-container">
        <button class="button" onclick="location.href='userTournaments.jsp'">Play Tournament</button>
        <button class="button" onclick="location.href='userStreams.jsp'">Tournament Streams</button>
        <button class="button" onclick="location.href='userResults.jsp'">Results</button>
        <button class="button" onclick="if(confirm('Are you sure you want to logout from this account?')) { location.href='logoutUser'; }">Logout</button>
    </div>
</body>
</html>
