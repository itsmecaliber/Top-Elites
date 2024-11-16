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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Match Details</title>
    <style>
        /* Internal CSS for styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
        .form-container h2 {
            text-align: center;
            color: #333;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        .form-container input[type="text"],
        .form-container input[type="url"],
        .form-container input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-container button:hover {
            background-color: #218838;
        }
        .message {
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Upload Match Details</h2>
        <%
            // Retrieve messages if they exist
            String successMsg = (String) request.getAttribute("succMsg");
            String errorMsg = (String) request.getAttribute("failedMsg");
            if (successMsg != null) {
                out.println("<div class='message' style='color: green;'>" + successMsg + "</div>");
            }
            if (errorMsg != null) {
                out.println("<div class='message' style='color: red;'>" + errorMsg + "</div>");
            }

            // Retrieve the tournamentId from the request parameters
            int tournamentId = Integer.parseInt(request.getParameter("id")); // Assuming 'id' is passed in the request
            TournamentDAOImpl dao = new TournamentDAOImpl(DBConnect.getConn());
            TournamentDetails t = dao.getTournamentById(tournamentId);
        %>
        
        <form action="../matchdetail" method="post">
            <!-- Hidden input to send the tournamentId with the form data -->
            <input type="hidden" name="tournamentId" value="<%= tournamentId %>">

            <label for="roomId">Room ID:</label>
            <input type="number" id="roomId" name="roomId" required>

            <label for="password">Password:</label>
            <input type="text" id="password" name="password" required>

            <label for="streamLink">Stream Link:</label>
            <input type="url" id="streamLink" name="streamLink" required>

            <button type="submit" class="btn btn-success">Send Details</button>
        </form>
    </div>
</body>
</html>
