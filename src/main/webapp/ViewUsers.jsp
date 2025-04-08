<%@page import="com.student.dao.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.student.dao.StudentDAOImplementation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.student.dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>View Users</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.header {
	display: flex;
	justify-content: space-between;
	padding: 10px 20px;
	background-color: black;
	color: white;
}

.header a {
	color: white;
	text-decoration: none;
	margin-left: 20px;
}

.logout {
	color: white;
	background-color: red;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

.container {
	padding: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	border: 1px solid black;
}

th, td {
	padding: 10px;
	border: 1px solid black;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

#one {
	color: green;
	text-align: center;
}

.delete-btn {
	background-color: red;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 5px;
}
</style>
</head>
<body>
	<%
	Student user = (Student) session.getAttribute("student");
	if (user != null) {
	%>
	<div class="header">
		<div>
			<span>Welcome <%=user.getName()%></span>
		</div>
		<div>
			<%
			if (user.getId() == 1) {
			%>
			<a href="ViewUsers.jsp">View Data</a>
			<%
			}
			%>
			<a href="Forgot.jsp">Reset Password</a> <a href="UpdateAccount.jsp">Update
				Data</a> <a href="Login.jsp"><button class="logout">Logout</button></a>
		</div>
	</div>

	<div class="container">
		<h1 style="text-align: center;">Dashboard</h1>



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

		<h2>View Your Data</h2>


		<table>
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Mail ID</th>
					<th>Branch</th>
					<th>Location</th>
					<th>Delete User</th>
				</tr>
			</thead>
			<%
			StudentDAO sdao = new StudentDAOImplementation();
			ArrayList<Student> studentlist = sdao.getStudent();
			for (Student s : studentlist) {
			%>
			<tbody>
				<tr>
					<td><%=s.getId()%></td>
					<td><%=s.getName()%></td>
					<td><%=s.getPhone()%></td>
					<td><%=s.getMail()%></td>
					<td><%=s.getBranch()%></td>
					<td><%=s.getLoc()%></td>
					<td>
						<form action="Delete" method="post">
							<input type="hidden" name="id" value="<%=s.getId()%>">
							<button type="submit" class="delete-btn">Delete</button>
						</form>
					</td>
				</tr>

			</tbody>

			<%
			}
			%>
		</table>
	</div>
	<%
	}
	%>
</body>
</html>