<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Farsan&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/homeStyle.css"/>
<title>Winter Cheer | Home</title>
</head>
<body>
<div class="home_background">
	<div class="header">
		<div class="top-header">
			<h1>Winter Cheer</h1>
			<a href="/logout" class="btn btn-danger button">Log Out
				<img class="button-hat" src="https://res.cloudinary.com/freecodez/image/upload/v1701705719/images/guidvrtf8kre7pc3jdk5.webp" alt="">
			</a>		
		</div>
		<h2>Welcome, <span><c:out value="${user.username}"/></span>!</h2>
	</div>
	
	<c:if test="${purchaseSuccess.equals('true')}">
		<div class="page-container alert-container">
		
			<div class="alert alert-success" role="alert">
				<h4 class="alert-heading">Thanks!</h4>
				<p>You're making someone's holidays a bit brighter.</p>
			</div>
		
		</div>
	</c:if>

	<div class="page-container">
		
		<div class="gift-form">
			<h3>Add a Gift Idea:</h3>
			<form:form action="/gift/new" method="POST" modelAttribute="newGift">
				<form:input type="hidden" path="user" value="${user.id}"/>
				
				<div>
					<form:label path="giftName" class="form_label">Gift Name: </form:label>
					<form:input path="giftName" class="tranparent"/><br/>
					<form:errors path="giftName" class="errors"/>
				</div>
				
				<div>
					<form:label path="giftType" class="form_label">Type of Gift: </form:label>
					<form:select path="giftType" items="${types}" class="tranparent" id="select-box"/><br/>
					<form:errors path="giftType" class="errors"/>
				</div>
				
				<div>
					<form:label path="storeName" class="form_label">Where to Purchase: </form:label>
					<form:input path="storeName" class="tranparent"/><br/>
					<form:errors path="storeName" class="errors"/>
				</div>
				
				<div>
					<form:label path="price" class="form_label">Price: $</form:label>
					<form:input type="number" path="price" min = "1" max = "500" step="0.01" class="tranparent"/><br/>
					<form:errors path="price" class="errors"/>
				</div>
				
				<div>
					<form:label path="dateNeeded" class="form_label">Date Needed By: </form:label>
					<form:input type="date" path="dateNeeded" class="tranparent"/><br/>
					<form:errors path="dateNeeded" class="errors"/>
				</div>
				
				<div>
					<form:label path="contactInfo" class="form_label">Preferred Contact Method: </form:label>
					<form:input path="contactInfo" placeholder = "Email address / Phone #" class="tranparent"/><br/>
					<form:errors path="contactInfo" class="errors"/>
				</div>
				
				<div id="details">
					<form:label path="giftDetails" class="form_label">Details / Instructions: </form:label>
					<form:textarea path="giftDetails" rows = "4" cols = "25" placeholder = "Size, color, brand, best prices, etc." class="tranparent"/>
				</div>
				<form:errors path="giftDetails" class="errors"/>
				
				<div id="btn-box">
					<button type="submit" value="Add Gift" class="button-gift"> Add Gift
					</button>
				</div>
				
			</form:form>
		</div>
	
		<div class="posted-gifts">
			<h3>Gift Ideas In Your Community:</h3>
			<table class="table table-hover table-striped table-bordered giftTable">
				<thead>
					<tr>
						<th>Gift Name:</th>
						<th>Posted By:</th>
						<th>User Actions:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="gift" items="${allGifts}">
						<tr>
							<td id="gift-info"><c:out value="${gift.giftName}"/></td>
							<td id="gift-info"><c:out value="${gift.user.username}"/></td>
							<td class="user-actions">
								<a href="/gift/${gift.id}" class="btn btn-success" id="one-action">Details</a>
								<c:if test="${gift.user.id == user.id}">
									<a href="gift/edit/${gift.id}" class="btn btn-secondary" id="one-action">Edit</a>
									<form action="/gift/delete/${gift.id}" method="POST">
										<input type="hidden" name="_method" value="delete"/>
										<input type="submit" value="Delete" class="btn btn-danger" id="one-action"/>
									</form>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
	</div>
</div>
	
	
</body>
</html>