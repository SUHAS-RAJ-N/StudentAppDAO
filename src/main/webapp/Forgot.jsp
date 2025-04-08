<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Pin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: lightgrey;
	font-family: sans-serif;
}

.container {
	max-width: 500px;
	margin: 50px auto;
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px gray;
}

h1 {
	color: darkblue;
	text-align: center;
}

h2 {
	color: cyan;
	text-align: center;
}

#one, #two, #three {
	color: red;
	text-align: center;
}
/* Remove table row borders */
.table-borderless tr, .table-borderless td {
	border: none !important;
}

a {
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Pentagon Space</h1>
		<h2>Reset Pin</h2>

		<% String error = (String) request.getAttribute("error1");
       if (error != null) { %>
		<h3 id="one"><%= error %></h3>
		<% } %>

		<% String error1 = (String) request.getAttribute("mismatch1");
       if (error1 != null) { %>
		<h3 id="two"><%= error1 %></h3>
		<% } %>

		<% String error2 = (String) request.getAttribute("not found");
       if (error2 != null) { %>
		<h3 id="three"><%= error2 %></h3>
		<% } %>

		<form action="forgot" method="POST">
			<table class="table table-borderless">
				<tr>
					<td><label class="form-label">Enter your Phone Number:</label></td>
					<td><input type="number" class="form-control" name="phone"
						required></td>
				</tr>
				<tr>
					<td><label class="form-label">Enter the Mail ID:</label></td>
					<td><input type="email" class="form-control" name="mail"
						required></td>
				</tr>
				<tr>
					<td><label class="form-label">Enter the Password:</label></td>
					<td><input type="password" class="form-control"
						name="password" required></td>
				</tr>
				<tr>
					<td><label class="form-label">Confirm the Password:</label></td>
					<td><input type="password" class="form-control"
						name="confirmPassword" required></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center"><input type="submit"
						class="btn btn-primary" value="Update Account"><a href="Dashboard.jsp"></a></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center; padding-top: 10px;">
						<button type="submit" class="btn btn-primary">
							<a href="Dashboard.jsp">Back</a>
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
