<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Farsan&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/editStyle.css"/>
<meta charset="UTF-8">
<title>Editing <c:out value="${gift.giftName}"/></title>
</head>
<body>
	<div class="header">
		<h1>Winter Cheer</h1>
		<a href="/home" class="btn btn-info button">Back to Home
			<img class="button-hat" src="https://res.cloudinary.com/freecodez/image/upload/v1701705719/images/guidvrtf8kre7pc3jdk5.webp" alt="">
		</a>		
	</div>
	<h2>Editing <c:out value="${gift.giftName}"/></h2>
	<hr>
		<div class="page-container">
			<div class="gift-form">
				<form:form action="/gift/edit/${gift.id}" method="PUT" modelAttribute="gift">
					<form:input type="hidden" path="id" value="${gift.id}"/>
					<form:input type="hidden" path="user.id" value="${gift.user.id}"/>
	
					
					<div>
						<form:label path="giftName">Gift Name: </form:label>
						<form:input path="giftName"/><br/>
						<form:errors path="giftName" class="errors"/>
					</div>
					
					<div>
						<form:label path="giftType">Type of Gift: </form:label>
						<form:select path="giftType" items="${types}"/><br/>
						<form:errors path="giftType" class="errors"/>
					</div>
					
					<div>
						<form:label path="storeName">Where to Purchase: </form:label>
						<form:input path="storeName"/><br/>
						<form:errors path="storeName" class="errors"/>
					</div>
					
					<div>
						<form:label path="price">Price: $</form:label>
						<form:input type="number" path="price" min = "1" max = "500" step="0.01"/><br/>
						<form:errors path="price" class="errors"/>
					</div>
					
					<div>
						<form:label path="dateNeeded">Date Needed By: </form:label>
						<form:input type="date" path="dateNeeded" value="${gift.dateNeeded}"/><br/>
						<form:errors path="dateNeeded" class="errors"/>
					</div>
					
					<div>
						<form:label path="contactInfo">Preferred Contact Method: </form:label>
						<form:input path="contactInfo" placeholder = "Email address / Phone #"/><br/>
						<form:errors path="contactInfo" class="errors"/>
					</div>
					
					<div id="details">
						<form:label path="giftDetails">Details / Instructions: </form:label>
						<form:textarea path="giftDetails" rows = "4" cols = "25" placeholder = "Size, color, brand, best prices, etc."/>
					</div>
					<form:errors path="giftDetails" class="errors"/>
					
					<div id="btn-box">
						<input type="submit" value="Confirm Edit" class="button-gift"/>
					</div>
					
				</form:form>		
			</div>
			<div class="christmas">
			  <div class="tree">
			    <div class="chain"></div>
			    <div class="chain2"></div>
			  </div>
			  <div class="lights">
			    <div class="light1"></div>
			    <div class="light2"></div>
			    <div class="light3"></div>
			    <div class="light4"></div>
			    <div class="light5"></div>
			    <div class="light6"></div>
			    <div class="light7"></div>
			    <div class="light8"></div>
			    <div class="light9"></div>
			    <div class="light10"></div>
			  </div>
			  <div class="balls">
			    <div class="ball1"></div>  
			  </div>
			  <div class="star"></div>
			  <div class="gift"></div>
			  <div class="ribbon"></div>
			  <div class="gift2"></div>
			  <div class="ribbon2"></div>
			  <div class="gift3"></div>
			  <div class="ribbon3"></div>
			  <div class="shadow"></div>
			  
			</div>
		</div>

</body>
</html>