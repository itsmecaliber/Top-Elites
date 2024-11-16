<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="com.DAO.TournamentDAOImpl"%>
<%@ page import="com.entity.TournamentDetails"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Tournaments</title>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/vendor.css">
<link rel="stylesheet" href="css/main.css">
<style>
body {
    background-color: #171c26;
    background-size: cover;
    background-attachment: fixed;
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
    justify-content: center; /* Horizontally center */
    align-items: center; /* Vertically center */
}

.stream-tournament {
    display: flex;
    justify-content: space-between; /* Horizontally center */
    align-items: center; /* Vertically center */
}

.tournament-card {
    background-color: #24283c;
    border-radius: 10px;
    padding: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
    margin-bottom: 20px;
    color: #ffffff;
    position: relative;
    overflow: hidden;
    min-width: 350px;
    max-width: 350px;
}

.tournament-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 8px;
}

.badge-status {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: #28a745;
    color: white;
    padding: 5px 10px;
    font-size: 0.8rem;
    font-weight: bold;
    border-radius: 4px;
}

.tournament-name {
    font-weight: bold;
    font-size: 1.2rem;
    margin-top: 10px;
}

.tournament-info {
    font-size: 0.9rem;
    color: #cccccc;
}

.btn-register {
    margin-top: 15px;
    background-color: #007bff;
    color: #ffffff;
    font-weight: bold;
    border: none;
    padding: 10px 20px;
    width: 100%;
}

.btn-register:hover {
    background-color: #0056b3;
}

.tournament-info::after {
    content: "";
    display: table;
    clear: both;
}

.tournament-date {
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 0.9rem;
    color: #cccccc;
}

@media (max-width: 992px) {
    .header-box {
        width: 80%;
    }
    .tournament-card {
        width: 100%;
    }
}

@media (max-width: 768px) {
    .header-box {
        width: 70%;
    }
    .tournament-card {
        width: 100%;
    }
}

@media (max-width: 576px) {
    .header-box {
        width: 100%;
        padding: 10px;
    }
    .tournament-card img {
        height: 150px;
    }
    .tournament-name {
        font-size: 1.1rem;
    }
    .btn-register {
        font-size: 1rem;
    }
}
</style>
</head>
<body>
    <div class="container">
        <!-- Header Box for Tournaments -->
        <div class="header-box">
            <button class="button button-primary cta" onclick="location.href='userTournaments.jsp'">
                Join Tournament
            </button>
            
        </div>

        <!-- Navigation Buttons -->
        <!-- Tournament Cards -->
        <div class="row">
        <div class="stream-tournament">
            <button class="btn btn-primary" onclick="location.href='userStreams.jsp'">Watch Stream</button>
            <button class="btn btn-primary" onclick="location.href='userResults.jsp'">Tournament Results</button>
        </div>

            <%
            // Set up date formatter
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

            // Get the current date
            LocalDate currentDate = LocalDate.now();

            // Get tournament details from DAO
            TournamentDAOImpl dao = new TournamentDAOImpl(DBConnect.getConn());
            List<TournamentDetails> list = dao.getAllTournaments();

            // Iterate through tournaments
            for (TournamentDetails t : list) {
                // Compare tournament date with current date
                if (t.getTournament_date().isAfter(currentDate)) {
            %>
            <div class="col-md-4 col-sm-6 mb-4">
                <div class="tournament-card">
                    <!-- Tournament Date -->
                    <div class="tournament-date">
                        <%=t.getTournament_date().format(formatter)%>
                    </div>

                    <!-- Tournament Logo -->
                    <img src="tournament-logo/<%=t.getLogo()%>" alt="Tournament Logo">

                    <!-- Status Badge -->
                    <div class="badge-status">Open</div>

                    <!-- Tournament Name -->
                    <div class="tournament-name"><%=t.getTournament_name()%></div>

                    <!-- Entry Fee and Prize Pool -->
                    <div class="tournament-info">
                        <span style="float: left;">Entry Fee: <%=t.getEntry_fee()%></span>
                        <span style="float: right;">Prize Pool: <%=t.getPrize_pool()%></span>
                    </div>

                    <!-- Register Button -->
                    <button class="btn btn-register" onclick="location.href='registerTournament.jsp?id=<%=t.getTournament_id()%>'">
                        Register
                    </button>
                </div>
            </div>
            <%
                }
            }
            %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
