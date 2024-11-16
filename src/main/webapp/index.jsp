<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="com.DAO.TournamentDAOImpl"%>
<%@ page import="com.entity.TournamentDetails"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.StreamDAOImpl"%>
<%@ page import="com.entity.StreamDetails"%>
<%@ page import="com.DAO.ResultDAOImpl"%>
<%@ page import="com.entity.ResultDetails"%>



<!DOCTYPE html>
<!--[if lt IE 9 ]><html class="no-js oldie" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>

<!--- basic page needs
   ================================================== -->
<meta charset="utf-8">
<title>Top Elites</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
   ================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS
   ================================================== -->
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/vendor.css">
<link rel="stylesheet" href="css/main.css">

<!-- script
   ================================================== -->
<script src="js/modernizr.js"></script>
<script src="js/pace.min.js"></script>

<!-- favicons
	================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

</head>

<body id="top">


	<!-- header 
   ================================================== -->
	<header id="header" class="row">

		<div class="header-logo">
			<a href="index.jsp"> <img src="images/te2.png"
				alt="Top Elites Logo" style="height: 140%; width: auto;">
			</a>
		</div>
		
		




		<nav id="header-nav-wrap">
			<ul class="header-main-nav">
				<li class="current"><a class="smoothscroll" href="#home"
					title="home">Home</a></li>
				<li><a class="smoothscroll" href="#abt" title="about">About</a></li>
				<li><a class="smoothscroll" href="#tournaments"
					title="tournaments">Tournaments</a></li>
				<li><a class="smoothscroll" href="#livestreams"
					title="livestreams">LiveStreams</a></li>
				<li><a class="smoothscroll" href="#results" title="results">Results</a></li>
			</ul>



			<c:if test="${empty userobj}">
				<a href="signup.jsp" title="sign-up"
					class="button button-primary cta">Get Started</a>
			</c:if>
			<c:if test="${not empty userobj}">
				<a href="signup.jsp" title="logout"
					class="button button-primary cta"
					onclick="if(confirm('Are you sure you want to logout from this account?')) { location.href='logoutUser'; return false; }">
					Logout </a>
			</c:if>

		</nav>

		<a class="header-menu-toggle" href="#"><span>Menu</span></a>

	</header>
	<!-- /header -->




	<!-- home
   ================================================== -->
	<section id="home">


		<div class="home-content">

			<div class="row contents">
				<div class="home-content-left">



					<h1 data-aos="fade-up">
						Play, Compete, Conquer <br> Welcome to the Future of eSports
						<br> Tournaments!

					</h1>

					<div class="buttons" data-aos="fade-up">

						</a> <a href="userTournaments.jsp" title="sign-up"
							class="button stroke">Play Tournament</a> <a
							href="https://www.youtube.com/watch?v=ymAH0vulWIM" data-lity
							class="button stroke"> <span class="icon-play"
							aria-hidden="true"></span> Watch Video
						</a>


					</div>

				</div>

				<div class="home-image-right">
					<img src="images/challenger-landing.png"
						srcset="images/challenger-landing.png 1x, images/challenger-landing.png 2x"
						data-aos="fade-up" style="width: 150%; height: auto;">
				</div>

			</div>

		</div>
		<!-- end home-content -->

		<ul class="home-social-list">
			<li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-instagram"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
		</ul>
		<!-- end home-social-list -->

		<div class="home-scrolldown">
			<a href="#abt" class="scroll-icon smoothscroll"> <span>Scroll
					Down</span> <i class="icon-arrow-right" aria-hidden="true"></i>
			</a>
		</div>

	</section>
	<!-- end home -->


	<!-- about
    ================================================== -->
<head>
<style>
/* Base Styles */
#abt {
    background-color: #171c26; /* Set a dark background color */
    background-image: url("images/cod.png"), url("images/rocket-girl.png");
    /* Two background images */
    background-size: contain, contain;
    /* Both images will fit their respective areas */
    background-repeat: no-repeat; /* Prevent tiling */
    background-position: left center, right center;
    /* First image to the left, second image to the right */
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

#abt .overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Dark overlay for text readability */
}

#abt .home-content {
    position: relative;
    z-index: 1;
    text-align: center;
    max-width: 800px;
    margin-top: 50px; /* Adjust this value as needed */
}

#abt h1 {
    color: white;
    font-size: 4rem;
    margin-bottom: 40px;
    margin-top: 150px;
}

#abt p {
    font-size: 2rem;
    margin: 0 auto;
}

/* Media Queries for Responsiveness */
@media (max-width: 992px) {
    #abt h1 {
        font-size: 3rem;
    }
    #abt p {
        font-size: 1.3rem;
    }
}

@media (max-width: 768px) {
    /* Hide background images on mobile */
    #abt {
        background-image: none;
        
    }

    #abt h1 {
        font-size: 4rem;
        padding:20px;
    }

    #abt p {
        font-size: 2.5rem;
         padding:20px;
    }
}

@media (max-width: 576px) {
	#abt {
        background-image: none;
    }
	
    #abt h1 {
        font-size: 3.5rem;
         padding:20px;
    }
    #abt p {
        font-size: 2rem;
         padding:20px;
    }
}

</style>
</head>

<body>
	<section id="abt" data-parallax="scroll">
		<div class="home-content">
			<h1 data-aos="fade-up">About Top Elites</h1>
			<p data-aos="fade-up">Your go-to esports platform for joining
				exciting tournaments and scrims while competing for great prize
				pools. We focus on our players, creating a friendly community that
				values your skills and helps you grow. At Top Elites, every match is
				a chance to connect, compete, and achieve your gaming dreams. Join
				us today and take your gaming journey to the next level!</p>
		</div>
	</section>
</body>

<section id="tournaments">
	<head>
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


@media ( max-width : 992px) {
	.header-box {
		width: 80%;
	}
	.tournament-card {
		width: 100%;
	}
}

@media ( max-width : 768px) {
	.header-box {
		width: 70%;
	}
	.tournament-card {
		width: 100%;
	}
}

@media ( max-width : 576px) {
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
				<button class="button button-primary cta"
					onclick="location.href='userTournaments.jsp'">Join
					Tournament</button>
			</div>

			<!-- Navigation Buttons -->
			<!-- Tournament Cards -->
			<div class="row">
				

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
						<button class="btn btn-register"
							onclick="location.href='registerTournament.jsp?id=<%=t.getTournament_id()%>'">
							Register</button>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</body>
</section>



<section id="livestreams">

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

.stream-grid {
	display: flex;
	flex-wrap: wrap;
	justify-content: center; /* Align items in the center */
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

@media ( min-width : 576px) {
	.stream-card {
		flex: 0 0 100%;
		max-width: 100%;
	}
}

@media ( min-width : 768px) {
	.stream-card {
		flex: 0 0 48%; /* Two cards per row */
		max-width: 48%;
	}
}

@media ( min-width : 992px) {
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
				<button class="button button-primary"
					onclick="location.href='userStreams.jsp'">Watch LiveStream</button>
			</div>

			<div class="stream-grid">
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

</section>

<section id="results">

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

.tournament-name {
	font-weight: bold;
	font-size: 1.3rem;
	margin-top: 10px;
}

@media ( max-width : 768px) {
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
					onclick="location.href='userResults.jsp'">Results</button>
			</div>

			<!-- Navigation Buttons -->
			

			<!-- Tournament Results Grid -->
			<div class="tournament-grid">
				<%
				ResultDAOImpl res = new ResultDAOImpl(DBConnect.getConn());
				List<ResultDetails> li = res.getAllResults();

				for (ResultDetails r : li) {
				%>
				<div class="tournament-card">
					<!-- Tournament Logo -->
					<img src="tournament-logo/<%=r.getResult_file()%>"
						alt="Tournament Logo">
					<!-- Tournament Name -->
					<div class="tournament-name"><%=r.getTournament_name()%></div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</body>

</section>

<!-- Footer Section -->
<!-- Footer Section -->
<footer style="background-color:  #0d1117; color: #aaa; width: 100vw; height: 32vw; padding: 20px 0;">
    <!-- Top Border -->
    <div style="border-top: 1px solid #444; margin-bottom: 20px; margin-top: 50px;"></div>

    <div style="max-width: 1200px; margin: auto; padding: 0 20px;">
        <div class="row" 
            style="display: flex; flex-wrap: wrap; justify-content: space-between; align-items: flex-start; margin-top: 90px;">

            <!-- Social Media Links -->
            <div class="col" style="flex: 1; min-width: 250px; margin-bottom: 20px;">
                <h4 style="color: #fff; text-align: center; font-size: 2.5rem; margin-bottom: 10px;">Connect with Me</h4>
                <ul style="list-style: none; padding: 0; display: flex; justify-content: center; gap: 20px;">
                    <li>
                        <a href="https://x.com/4kingcaliber" target="_blank" 
                           style="color: #aaa; text-decoration: none; transition: color 0.3s;">
                            <img src="images/x-logo.png" alt="Twitter" style="width: 30px; height: 30px;">
                        </a>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/itz_caliber_/" target="_blank" 
                           style="color: #aaa; text-decoration: none; transition: color 0.3s;">
                            <img src="images/Instagram-logo.png" alt="Instagram" style="width: 30px; height: 30px;">
                        </a>
                    </li>
                    <li>
                        <a href="https://www.github.com/itsmecaliber" target="_blank" 
                           style="color: #aaa; text-decoration: none; transition: color 0.3s;">
                            <img src="images/githubIcon.png" alt="GitHub" style="width: 37px; height: 37px;">
                        </a>
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/in/jeet-chatterjee" target="_blank" 
                           style="color: #aaa; text-decoration: none; transition: color 0.3s;">
                            <img src="images/linkedin2.png" alt="LinkedIn" style="width: 37px; height: 37px;">
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Contact Details -->
            <div class="col" style="flex: 1; min-width: 250px; margin-bottom: 20px;">
                <h4 style="color: #fff; text-align: center; margin-bottom: 10px;font-size: 2.5rem;">Contact</h4>
                <p style="text-align: center; margin: 5px 0;">Salt Lake Sector 5<br>Kolkata, West Bengal, India</p>
                <p style="text-align: center; margin: 5px 0;">
                    Email: <a href="mailto:itsmecaliberyt@gmail.com" 
                              style="color: #aaa; text-decoration: none; transition: color 0.3s;">
                              7488180857jeet@gmail.com
                    </a>
                </p>
                <p style="text-align: center; margin: 5px 0;">
                    Phone: <a href="tel:+919876543210" 
                              style="color: #aaa; text-decoration: none; transition: color 0.3s;">
                              7488180857
                    </a>
                </p>
            </div>

            <!-- About Me -->
            <div class="col" style="flex: 1; min-width: 250px; margin-bottom: 20px;">
                <h4 style="color: #fff; text-align: center; margin-bottom: 10px;font-size: 2.5rem;">About Me</h4>
                <p style="text-align: center;">Once an aspiring esports athlete, now a passionate developer.</p>
            </div>
        </div>
    </div>

    <!-- Footer Bottom -->
    <div style="padding: 10px 20px; text-align: center;">
        <p>&copy; 2024 <strong style="color: #fff;">itsmecaliber</strong>. All rights reserved.</p>
    </div>
</footer>

<style>
    /* Hover effect for social media links */
    footer a:hover {
        color: #fff !important; /* Changes link color to white on hover */
    }

    /* Hover effect for all text inside the footer */
    footer p:hover, footer h4:hover {
        color: #fff !important; /* Changes text color to white on hover */
    }
</style>





<div id="preloader">
	<div id="loader"></div>
</div>

<!-- Java Script
    ================================================== -->
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>

</body>

</html>