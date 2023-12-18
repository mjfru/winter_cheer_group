<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/viewOneStyle.css"/>
<title>Viewing <c:out value="${gift.giftName}"/></title>
</head>
<body>
	<div class="header">
			<h1>Winter Cheer</h1>
			<a href="/home" class="btn btn-info">Back to Home</a>		
	</div>
	<h2>Viewing <c:out value="${gift.giftName}"/></h2>
	<hr>
	<div class="page-container">
		<div class="details-container">
			<p>This gift belongs in the "<c:out value="${gift.giftType}"/>" category 
			and can be purchased at <c:out value="${gift.storeName}"/> for about $<c:out value="${gift.price}"/>.</p>
			<p>This present was posted by <c:out value="${gift.user.username}"/> and he/she may be contacted at <c:out value="${gift.contactInfo}"/>
			before the requested date <c:out value="${gift.dateNeeded}"/>.</p>
			<p><c:out value="${gift.user.username}"/> provided the following details / instructions regarding their gift idea: <c:out value="${gift.giftDetails}"/>.</p>
		</div>
	</div>
	<form action="/gift/purchase/${gift.id}" method="POST" id="purchase">
		<input type="hidden" name="_method" value="delete"/>
		<input type="submit" value="Agree to Purchase" class="btn btn-success"/>
	</form>
</body>
</html>