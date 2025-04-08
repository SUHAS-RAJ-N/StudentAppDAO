<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SignUp Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: lightcyan;
	font-family: sans-serif;
}

.container {
	max-width: 500px;
	margin: 50px auto;
	background: lightblue;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px gray;
}

h1 {
	color: darkbrown;
	text-align: center;
}

h2 {
	color: yellow;
	text-align: center;
}

select {
	height: 40px;
	width: 100%;
}

h3 {
	color: red;
	text-align: center;
}

#one {
	color: green;
	text-align: center;
}


</style>
</head>
<body>

	<div class="container">
		<h1>Pentagon Space</h1>
		<h2>Application Form</h2>

		<%
		String successMessage = (String) request.getAttribute("success");
		%>
		<%
		if (successMessage != null) {
		%>
		<h3 id="one"><%=successMessage%></h3>
		<%
		}
		%>

		<%
		String error = (String) session.getAttribute("error");
		%>
		<%
		if (error != null) {
		%>
		<h3><%=error%></h3>
		<%
		}
		%>
		<br>
		<form action="signup" method="POST">
			<table border="0"
				style="width: 100%; max-width: 500px; margin: auto;">
				<tr>
					<td><label class="form-label">Enter your Name:</label></td>
					<td><input type="text" class="form-control" name="name"
						required></td>
				</tr>

				<tr>
					<td><br><br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter your Phone Number:</label></td>
					<td><input type="number" class="form-control" name="phone"
						required></td>
				</tr>

				<tr>
					<td><br><br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter the Mail ID:</label></td>
					<td><input type="email" class="form-control" name="mail"
						required></td>
				</tr>

				<tr>
					<td><br><br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter the Branch:</label></td>
					<td><select name="branch" class="form-control">
							<option>Select the branch</option>
							<option>CSE</option>
							<option>ISE</option>
							<option>ECE</option>
							<option>EEE</option>
							<option>MECH</option>
							<option>CIVIL</option>
							<option>AIML</option>
					</select></td>
				</tr>

				<tr>
					<td><br><br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter the Location:</label></td>
					<td><select name="loc" class="form-control">
							<option>Select the Location</option>
							<option>Bengaluru</option>
							<option>Mysuru</option>
							<option>Hyderabad</option>
							<option>Mandya</option>
							<option>Chennai</option>
							<option>Vizag</option>
					</select></td>
				</tr>

				<tr>
					<td><br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter the Password:</label></td>
					<td><input type="password" class="form-control"
						name="password" required></td>
				</tr>

				<tr>
					<td><br></td>
				</tr>

				<tr>
					<td><label class="form-label">Confirm the Password:</label></td>
					<td><input type="password" class="form-control"
						name="confirmPassword" required></td>
				</tr>

				<tr>
					<td><br></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center; padding-top: 10px;">
						<input type="submit" class="btn btn-primary"
						value="Create Account">
					</td>
				</tr>
			</table>
		</form>

		<p class="text-center mt-3">
			Already have an account? <a href="Login.jsp">Login</a>
		</p>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
