<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.ResultDAOImpl"%>
<%@ page import="com.entity.ResultDetails"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Results</title>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/vendor.css">
<link rel="stylesheet" href="css/main.css">
<style>
body {
    background-color: #171c26;
    background-size: cover;
    font-family: Arial, sans-serif;
    color: #ffffff;
    margin: 0;
    padding: 0;
}

.container {
    margin-top: 30px;
    padding-left: 15px;
    padding-right: 15px;
}

.header-box {
    display: flex;
    justify-content: center;
    align-items: center;
}

.button-container {
    display: flex;
    justify-content: center; /* Centering the buttons */
    align-items: center;
    gap: 20px; /* Adds space between buttons */
    margin: 20px 0; /* Adds space above and below the button container */
}

.button-container button:hover {
    background-color: #2c8b37;
}

.tournament-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
}

.tournament-card {
    background-color: #24283c;
    border-radius: 10px;
    padding: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
    color: #ffffff;
    width: 450px;
    max-width: 100%;
}

.tournament-card img {
    width: 100%;
    height: 250px;
    object-fit: cover;
    border-radius: 8px;
}

.tournament-name {
    font-weight: bold;
    font-size: 1.3rem;
    margin-top: 10px;
}

@media (max-width: 768px) {
    .tournament-grid {
        flex-direction: column;
    }
    .tournament-card {
        width: 100%;
    }
}
</style>
</head>
<body>
    <div class="container">
        <!-- Header Box for Results -->
        <div class="header-box">
            <button class="button button-primary cta"
                    onclick="location.href='userResults.jsp'">
                Results
            </button>
        </div>

        <!-- Navigation Buttons -->
        <div class="button-container">
            <button class="btn btn-primary" onclick="location.href='userStreams.jsp'">Watch Stream</button>
            <button class="btn btn-primary" onclick="location.href='userTournaments.jsp'">Join Tournament</button>
        </div>

        <!-- Tournament Results Grid -->
        <div class="tournament-grid">
            <%
            ResultDAOImpl dao = new ResultDAOImpl(DBConnect.getConn());
            List<ResultDetails> list = dao.getAllResults();

            for (ResultDetails r : list) {
            %>
            <div class="tournament-card">
                <!-- Tournament Logo -->
                <img src="tournament-logo/<%=r.getResult_file()%>" alt="Tournament Logo">
                <!-- Tournament Name -->
                <div class="tournament-name"><%=r.getTournament_name()%></div>
            </div>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>
