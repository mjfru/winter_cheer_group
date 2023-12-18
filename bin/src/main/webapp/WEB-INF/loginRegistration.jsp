<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/loginRegStyle.css"/>
<title>Winter Cheer | Welcome</title>
</head>
<body>
	<div class="page-container">
		
		<div class="header">
				<h1>Winter Cheer</h1>		
				<h2>A Community WebApp to Make the Holidays Merrier</h2>
			</div>
		</div>
		<hr>
		
		<div class="form-container">
			
			<div class="registration">
				<h3>Want to Contribute?</h3>
				<h3>Register Here: </h3>
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div>
						<form:label path="username">Username: </form:label>
						<form:input path="username"/><br/>
						<form:errors path="username" class="errors"/>
					</div>
					
					<div>
						<form:label path="email">Email: </form:label>
						<form:input path="email"/><br/>
						<form:errors path="email" class="errors"/>
					</div>
					
					<div>
						<form:label path="password">Password: </form:label>
						<form:input type="password" path="password"/><br/>
						<form:errors path="password" class="errors"/>
					</div>
					
					<div>
						<form:label path="confirmPassword">Confirm Password: </form:label>
						<form:input type="password" path="confirmPassword"/><br/>
						<form:errors path="confirmPassword" class="errors"/>
					</div>
					<div class="buttons">
						<input type="submit" value="Register" class="btn btn-success"/>
					</div>
				</form:form>
			</div>
			
			<div class="login">
				<h3>Already a Member?</h3>
				<h3>Login: </h3>
				<form:form action="/login" method="POST" modelAttribute="newLogin">
					<div>
						<form:label path="email">Email: </form:label>
						<form:input path="email"/><br/>
						<form:errors path="email" class="errors"/>
					</div>
					
					<div>
						<form:label path="password">Password: </form:label>
						<form:input type="password" path="password"/><br/>
						<form:errors path="password" class="errors"/>
					</div>
					
					<div class="buttons">
						<input type="submit" value="Log In" class="btn btn-success"/>
					</div>
					
				</form:form>
			</div>
			
		</div>
			
	</div>
	
</body>
</html>