<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.ResultDAOImpl"%>
<%@ page import="com.entity.ResultDetails"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>All Results</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #0d2649; /* Light gray background */
	font-family: Arial, sans-serif; /* Clean font */
}

.container {
	background: #55dcf7; /* White background for the container */
	color: #ffffff;
	border-radius: 8px; /* Rounded corners */
	padding: 5px; /* Padding around the content */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
	margin-top: 20px; /* Space above the container */
}

h2 {
	color: #007bff; /* Bootstrap primary color */
	margin-bottom: 20px; /* Space below the heading */
}

table {
	width: 100%; /* Full width table */
	margin-bottom: 20px; /* Space below the table */
	border-collapse: collapse; /* Merge border spacing */
}

th, td {
	text-align: center; /* Centered text */
	padding: 12px; /* Padding in table cells */
	border-bottom: 1px solid #dee2e6; /* Bottom border for table cells */
}

th {
	background-color: #007bff; /* Header background color */
	color: white; /* Header text color */
}

tr:hover {
	background-color: #f1f1f1; /* Hover effect for rows */
}

.btn {
	margin: 0 5px; /* Margin between buttons */
}

.text-success {
	color: #218838; /* Green for success message */
	text-align: center;
	font-size: 1.5rem; /* Adjust as needed */
	font-weight: bold; /* Make the text bold */
}

.text-danger {
	color: red; /* Red color for error message */
	text-align: center;
	font-size: 1.5rem; /* Adjust as needed */
	font-weight: bold; /* Make the text bold */
}
</style>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container mt-5">
		<h2 class="text-center" style="color: black;">All Tournament Results</h2>

		<div style="text-align: center;">
			<c:if test="${not empty succMsg}">
				<h2 class="text-success">${succMsg}</h2>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<c:if test="${not empty failedMsg}">
				<h3 class="text-danger">${failedMsg}</h3>
				<c:remove var="failedMsg" scope="session" />
			</c:if>
		</div>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Tournament Name</th>
					<th>Result</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				ResultDAOImpl dao = new ResultDAOImpl(DBConnect.getConn());
				List<ResultDetails> list = dao.getAllResults();
				for (ResultDetails r : list) {
				%>
				<tr>
					<td><%=r.getTournament_name()%></td>
					<td><%=r.getResult_id()%></td>
					
					<td>
						<a href="../deleteResult?id=<%=r.getResult_id()%>" 
							class="btn btn-danger"
							onclick="return confirm('Are you sure you want to delete this result?');">Delete</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<div class="text-center">
			<a href="adhome.jsp" class="btn btn-secondary">Back to Dashboard</a>
			<a href="addResult.jsp" class="btn btn-primary">Add New Result</a>
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
