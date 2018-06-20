<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Manager Home</title>
</head>
<body>
	<div align="center">
		<h1>Contact List</h1>
		<h3>
			<a href="/adduser">New Contact</a>
		</h3>
		<table border="1">
			<th>No</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>User Name</th>
			<th>Address</th>
			<th>Action</th>

			<c:forEach var="user" items="${users}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.userName}</td>
					<td>${user.address}</td>
					<td>
						<a href="/editContact?id=${user.id}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<a href="/deleteContact?id=${user.id}">Delete</a>
					</td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>