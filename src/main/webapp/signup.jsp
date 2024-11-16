<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>



<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>



<%@page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Include Font Awesome -->
    <style>
        body {
            font-family: Arial, sans-serif; /* Basic font for the page */
            background-color: #f0f2f5; /* Light background similar to Facebook */
            color: #333; /* Dark text color for readability */
            margin: 0;
            padding: 0;
        }
        #signup {
            background-image: url('images/hero-bg.jpg'); /* Path to your background image */
            background-size: cover; /* Cover the entire section */
            background-position: center; /* Center the image */
            padding: 100px 0; /* Padding for the section */
            display: flex; /* Center content */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
        }
        .signup-form {
            max-width: 400px;
            background: #ffffff; /* White background for the form */
            padding: 40px; /* Increased padding */
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            position: relative; /* Relative positioning for child elements */
        }
        .branding {
            color: #39b54a; /* Green color for "Top Elites" */
            font-size: 28px; /* Font size for the branding */
            font-weight: bold; /* Make the text bold */
            text-align: center; /* Center the text */
            margin-bottom: 20px; /* Space below the branding */
            position: absolute; /* Position the branding */
            top: -20px; /* Move it above the box */
            left: 50%; /* Center horizontally */
            transform: translateX(-50%); /* Adjust for centering */
            background: #ffffff; /* White background for the branding */
            padding: 5px 10px; /* Padding around the branding text */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow effect */
        }
        h1 {
            font-size: 24px; /* Larger font for the heading */
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            position: relative; /* Required for positioning the eye icon */
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 10px; /* Space between inputs */
        }
        .role-select {
            width: 100%; /* Full width for dropdown */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 10px; /* Space between inputs */
        }
        .button {
            background-color: #39b54a; 
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%; /* Full width button */
        }
        .button:hover {
            background-color: #018713; 
        }
        .login-button {
            background-color: #007bff; /* Blue color for the login button */
            color: white;
            padding: 10px; /* Same padding as sign-up button */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%; /* Full width button */
            margin-top: 10px; /* Space above the login button */
        }
        .login-button:hover {
            background-color: #0056b3; /* Darker blue for hover effect */
        }
        .privacy-policy {
            font-size: 12px; /* Smaller font for the privacy text */
            text-align: center;
            margin-top: 15px; /* Space above privacy text */
        }
        .eye-icon {
            position: absolute; /* Position it inside the input field */
            right: 10px; /* Adjust positioning */
            top: 50%; /* Center vertically */
            transform: translateY(-20%); /* Adjust for vertical alignment */
            cursor: pointer; /* Pointer cursor for the icon */
            color: #aaa; /* Light color for the icon */
            font-size: 18px; /* Increase the icon size for better visibility */
        }
    </style>
</head>
<body>

<!-- Sign Up Section -->
<section id="signup">
    <div class="signup-form">
        <div class="branding">Top Elites</div> <!-- Branding inside the box -->
        <h1>Create an Account</h1>
        
      <div class="container">

				<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty failMsg }">
					<p class="text-center text-danger">${failMsg }</p>
					<c:remove var="failMsg" scope="session" />
				</c:if>

			</div>
        
        
        <form action="register" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required placeholder="Enter your name">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Create a password">
                <span id="togglePassword" class="eye-icon"><i class="fas fa-eye"></i></span> <!-- Eye icon -->
            </div>
            
            <div class="form-group">
                <button type="submit" class="button">Sign Up</button>
            </div>
            
            <div class="form-group">
                <a href="login.jsp" class="button login-button">Login</a> <!-- Login button -->
            </div>
        </form>
        <div class="privacy-policy">
            By clicking Sign Up, you agree to our Terms, Data Policy, and Cookies Policy.
        </div>
    </div>
</section>

<script>
    // Show/Hide Password Functionality
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');

    togglePassword.addEventListener('click', function() {
        // Toggle the type attribute
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        
        // Toggle the eye icon
        this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>'; // Change icon based on state
    });
</script>

</body>
</html>
