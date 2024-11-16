<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.StreamDAOImpl"%>
<%@ page import="com.entity.StreamDetails"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Streams</title>
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
	margin-bottom: 20px;
}



.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.stream-card {
	background-color: #24283c;
	border-radius: 10px;
	padding: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	text-align: center;
	color: #ffffff;
	width: 100%;
	margin: 10px;
}

.stream-card iframe {
	width: 100%;
	height: 200px;
	border: none;
	border-radius: 8px;
}

.stream-name {
	font-weight: bold;
	font-size: 1.2rem;
	
}

@media (min-width: 576px) {
	.stream-card {
		flex: 0 0 100%;
		max-width: 100%;
	}
}

@media (min-width: 768px) {
	.stream-card {
		flex: 0 0 48%; /* Two cards per row */
		max-width: 48%;
	}
}

@media (min-width: 992px) {
	.stream-card {
		flex: 0 0 30%; /* Three cards per row */
		max-width: 30%;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="header-box">
			<button class="button button-primary" onclick="location.href='userStreams.jsp'">Watch LiveStream</button>
		</div>

		<div class="row">
			<%
			// Fetch stream details from the database
			List<StreamDetails> streamList = null;
			try {
				StreamDAOImpl streamDAO = new StreamDAOImpl(DBConnect.getConn());
				streamList = streamDAO.getAllStreams(); // Fetch all streams
			} catch (Exception e) {
				e.printStackTrace();
				out.println("<div class='alert alert-danger'>Failed to load streams. Please try again later.</div>");
			}

			// Display streams if available
			if (streamList != null && !streamList.isEmpty()) {
				for (StreamDetails stream : streamList) {
					String videoId = stream.getStream_link(); // Assume this now holds only the video ID
					String streamLink = "https://www.youtube.com/embed/" + videoId; // Construct embed link
			%>
			<div class="stream-card">
				<div class="stream-name"><%=stream.getTournament_name()%></div>
				<iframe src="<%=streamLink%>" allowfullscreen></iframe>
			</div>
			<%
				}
			} else {
				out.println("<div class='alert alert-warning'>No streams available at the moment.</div>");
			}
			%>
		</div>
	</div>
</body>
</html>
