<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Add New User</title>
</head>

<body>
	<div style="float: left; width: 450px; border: 1px solid red;">
		<form:form style="float:left; width: 100%; margin-left: 10px;"
			id="addNewUserForm" method="post" action="/insertUser" modelAttribute="userForm">
			<div style="float: left; width: 100%; padding-bottom: 5px;">
				<form:label path="firstName"
					cssStyle="float: left; padding: 2px; line-height: 24px; text-align: right; min-width: 180px;">Tên:</form:label>
				<form:input path="firstName" />
			</div>
			<div style="float: left; width: 100%; padding-bottom: 5px;">
				<form:label path="lastName"
					cssStyle="float: left; padding: 2px; line-height: 24px; text-align: right; min-width: 180px;">Họ</form:label>
				<form:input path="lastName" />
			</div>
			<div style="float: left; width: 100%; padding-bottom: 5px;">
				<form:label path="address"
					cssStyle="float: left; padding: 2px; line-height: 24px; text-align: right; min-width: 180px;">Địa chỉ liên hệ</form:label>
				<form:input path="address" />
			</div>
			<div style="float: left; width: 100%; padding-bottom: 5px;">
				<form:label path="Email"
					cssStyle="float: left; padding: 2px; line-height: 24px; text-align: right; min-width: 180px;">Email</form:label>
				<form:input path="email" />
			</div>
			<div style="float: left; width: 100%; padding-bottom: 5px;">
				<form:label path="userName"
					cssStyle="float: left; padding: 2px; line-height: 24px; text-align: right; min-width: 180px;">Tên truy cập</form:label>
				<form:input path="userName" />
			</div>
			<div style="float: left; width: 100%; padding-bottom: 5px;">
				<form:label path="password"
					cssStyle="float: left; padding: 2px; line-height: 24px; text-align: right; min-width: 180px;">Mật khẩu</form:label>
				<form:password path="password" />
			</div>
			<div style="float: center; width: 100%; padding-bottom: 5px;">
				<input type="submit" value="Lưu" style="margin: 5px;" /> <input
					type="reset" value="Nhập lại" style="margin: 5px;" /> <input
					type="button" value="Thoát" style="margin: 5px;" />
			</div>
		</form:form>
	</div>
</body>
</html>