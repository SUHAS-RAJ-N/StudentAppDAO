<%@page import="com.student.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Page</title>
<!-- Bootstrap CSS -->
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

a {
	color: white;
}
</style>
</head>
<body>

	<div class="container">
		<h1 class="heading">Pentagon Space</h1>
		<h2 heading="sub">Update Your Account</h2>
		<%Student user=(Student)session.getAttribute("student");
	if(user!=null){%>
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
		String error = (String) request.getAttribute("error");
		%>
		<%
		if (error != null) {
		%>
		<h3><%=error%></h3>
		<%
		}
		%>

		<form action="update" method="POST">
			<table border="0"
				style="width: 100%; max-width: 500px; margin: auto;">
				<tr>
					<td><label class="form-label">Enter your Name:</label></td>
					<td><input type="text" class="form-control" name="name"
						value="<%=user.getName() %>" required></td>
				</tr>

				<tr>
					<td><br> <br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter your Phone Number:</label></td>
					<td><input type="number" class="form-control" name="phone"
						value="<%=user.getPhone() %>" required></td>
				</tr>

				<tr>
					<td><br> <br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter the Mail ID:</label></td>
					<td><input type="email" class="form-control" name="mail"
						value="<%=user.getMail() %>" required></td>
				</tr>

				<tr>
					<td><br> <br></td>
				</tr>

				<!--<tr>
					<td><label class="form-label">Enter the Branch:</label></td>
					<td><select name="branch" class="form-control" value="<%=user.getBranch() %>">
							<option>Select the branch</option>
							<option>CSE</option>
							<option>ISE</option>
							<option>ECE</option>
							<option>EEE</option>
							<option>MECH</option>
							<option>CIVIL</option>
							<option>AIML</option>
					</select></td>
				</tr>-->
				<tr>
					<td><label class="form-label">Enter the Branch:</label></td>
					<td><input type="text" class="form-control" name="branch"
						value="<%=user.getBranch()%>"></td>
				</tr>

				<tr>
					<td><br> <br></td>
				</tr>

				<tr>
					<td><label class="form-label">Enter the Location:</label></td>
					<!--  <td><select name="loc" class="form-control" value="<%=user.getLoc() %>">
							<option>Select the Location</option>
							<option>Bengaluru</option>
							<option>Mysuru</option>
							<option>Hyderabad</option>
							<option>Mandya</option>
							<option>Chennai</option>
							<option>Vizag</option>
					</select></td>-->
					<td><input type="text" class="form-control" name="location"
						value="<%=user.getLoc()%>"></td>
				</tr>

				<tr>
					<td><br></td>
				</tr>



				<tr>
					<td><br></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center; padding-top: 10px;">
						<input type="submit" class="btn btn-primary"
						value="Update Account">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center; padding-top: 10px;">
						<a href="Dashboard.jsp" class="btn btn-primary">Back</a>

					</td>
				</tr>
			</table>
		</form>
		<%
		} else {
		%>
		<h3 style="color: red; text-align: center;">User not found.
			Please log in.</h3>
		<%
		}
		%>


	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
