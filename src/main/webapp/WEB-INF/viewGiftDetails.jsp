<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Farsan&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/viewOneStyle.css"/>
<title>Viewing <c:out value="${gift.giftName}"/></title>
</head>
<body>
	<div class="header">
			<h1>Winter Cheer</h1>
			<a href="/home" class="btn btn-info button">Back to Home
			<img class="button-hat" src="https://res.cloudinary.com/freecodez/image/upload/v1701705719/images/guidvrtf8kre7pc3jdk5.webp" alt="">
			</a>
	</div>
	<h2>Viewing <span><c:out value="${gift.giftName}"/></span></h2>
	<hr>
	<div class="page-container">
		<div class="details-container">
			<p>This gift belongs in the "<c:out value="${gift.giftType}"/>" category 
			and can be purchased at <c:out value="${gift.storeName}"/> for about <c:out value="${numberFormat.format(gift.price)}"/>.</p>
			<p>This present was posted by <c:out value="${gift.user.username}"/> and he/she may be contacted at <c:out value="${gift.contactInfo}"/>
			before the requested date <c:out value="${dateFormat.format(dateNeeded)}"/>.</p>
			<p><c:out value="${gift.user.username}"/> provided the following details / instructions regarding their gift idea: <c:out value="${gift.giftDetails}"/>.</p>
		</div>
	</div>
	<form action="/gift/purchase/${gift.id}" method="POST" id="purchase">
		<input type="hidden" name="_method" value="delete"/>
		<input type="submit" value="Agree to Purchase" class="btn btn-success"/>
	</form>
		<div class="window">
		    <div class="santa">
		      <div class="head">
		        <div class="face">
		          <div class="redhat">
		            <div class="whitepart"></div>
		            <div class="redpart"></div>
		            <div class="hatball"></div>
		          </div>
		          <div class="eyes"></div>
		          <div class="beard">
		            <div class="nouse"></div>
		            <div class="mouth"></div>
		          </div>
		        </div>
		        <div class="ears"></div>
		      </div>
		      <div class="body"></div>
		    </div>
		</div>
		<div class="message">
		  <h1>Merry Christmas!</h1>
		  <p style="font-size:2px">pure css Santa Caul made with ♥ by Alireza Sheikholmolouki</p>
		</div>
	
</body>
</html>