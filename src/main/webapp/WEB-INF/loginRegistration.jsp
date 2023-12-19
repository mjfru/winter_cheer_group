<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Farsan&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/loginRegStyle.css"/>
	<script type="text/javascript" src="/js/pure-snow.js"></script>
	<title>Winter Cheer | Welcome</title>
</head>
<body>
	<div id="snow" data-count="200"></div>
	<div class="page-container">
		
		<div class="header">
				<h1>Winter Cheer</h1>		
				<h2>A Community WebApp to Make the Holidays Merrier</h2>
			</div>
		<hr>
		
		<div class="form-container">
			
			<div class="registration">
				<h3>Want to Contribute?</h3>
				<h4>Register Here: </h4>
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
						<button type="submit" value="Register" class="button">Register
							<img class="button-hat" src="https://res.cloudinary.com/freecodez/image/upload/v1701705719/images/guidvrtf8kre7pc3jdk5.webp" alt="">
						</button>
					</div>
				</form:form>
			</div>
			
			<div class="login">
				<h3>Already a Member?</h3>
				<h4>Login: </h4>
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
						<button type="submit" value="Log In" class="button">Log In
							<img class="button-hat" src="https://res.cloudinary.com/freecodez/image/upload/v1701705719/images/guidvrtf8kre7pc3jdk5.webp" alt="">
						</button>
					</div>
					
				</form:form>
			</div>
			
		</div>
	</div>	
</body>
</html>