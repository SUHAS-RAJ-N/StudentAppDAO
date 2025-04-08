<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
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
	max-width: 400px;
	margin: 80px auto;
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

.table-borderless tr, .table-borderless td {
	border: none !important;
}

.table td {
	padding: 8px;
}

.form-label {
	white-space: nowrap; /* Prevents text from wrapping */
	text-align: right;
	padding-right: 10px;
}

.form-control {
	width: 100%;
}

.text-center a {
	text-decoration: none;
}

#one, #three {
	color: green;
}

#two {
	color: red;
}
</style>
</head>
<body>

	<div class="container">
		<h1>Pentagon Space</h1>
		<h2>Login Form</h2>


		<%
		String error = (String) session.getAttribute("error");
		%>
		<%
		if (error != null) {
		%>
		<h3 id="two"><%=error%></h3>
		<%
		}
		%>
		<%
		String successMessage1 = (String) request.getAttribute("success1");
		%>
		<%
		if (successMessage1 != null) {
		%>
		<h3 id="three"><%=successMessage1%></h3>
		<%
		}
		%>
		<br>

		<form action="login" method="POST">
			<table border="0" style="width: 100%; max-width: 500px">
				<tr>
					<td><label class="form-label">Enter your Email ID</label></td>
					<td><input type="text" class="form-control" name="mail"
						required></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td><label class="form-label">Enter your Password</label></td>
					<td><input type="password" class="form-control"
						name="password" required></td>
				</tr>
				<tr>
					<td><br>
					<br></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center"><input type="submit"
						class="btn btn-primary w-40" value="Login"></td>
				</tr>
			</table>
		</form>

		<p class="text-center mt-3">
			Don't have an account? <a href="SignUp.jsp">Sign up</a>
		</p>
		<p class="text-center mt-3">
			Forgot Pin? <a href="Forgot.jsp">Reset Pin</a>
		</p>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
