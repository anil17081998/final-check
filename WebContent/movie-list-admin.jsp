<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>Movie List</title>
<link rel="stylesheet" type="text/css" href="./style/style.css" />
</head>
<body>
	<header> <span>Movie Cruiser</span> <img
		src="./images/logo.png"/ > <a id="movie"
		href="ShowMovieListAdmin">Movies</a> </header>
	<div class="content">
		<h2>Movies</h2>
		<table>

			<tr>
				<th class="align-left">Title</th>
				<th class="align-right">Box Office</th>
				<th class="align-cent">Active</th>
				<th class="align-cent">Date of Launch</th>
				<th class="align-cent">Genre</th>
				<th class="align-cent">Has Teaser</th>
				<th class="align-cent">Action</th>
			</tr>
			<c:forEach items="${movieList}" var="movie">
				<tr>
					<td class="align-left">${movie.title}</td>
					<td class="align-right"><fmt:formatNumber type="currency" maxFractionDigits	="0"
							value="${movie.boxOffice}" var="formatNumber" />${formatNumber}</td>
					<td class="align-cent"><c:if test="${movie.active}">Yes</c:if>
						<c:if test="${!movie.active}">No</c:if></td>
					<td class="align-cent"><fmt:formatDate pattern="dd/MM/yyyy"
							value="${movie.dateOfLaunch}" /></td>
					<td class="align-cent">${movie.genre}</td>
					<td class="align-cent"><c:if test="${movie.hasTeaser}">Yes</c:if>
						<c:if test="${!movie.hasTeaser}">No</c:if></td>
					<td class="align-cent"><a
						href="ShowEditMovie?movieId=${movie.id}"> Edit</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<footer>
	<h4>Copyright@2019</h4>
	</footer>
</body>
</html>