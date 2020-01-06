<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Movie List Customer</title>
<link rel="stylesheet" type="text/css" href="./style/style.css" />
</head>
<body>
	<header> <span>Movie Cruiser</span> <img
		src="./images/logo.png"/ > <a id="movie" href="ShowFavorite">Favorites</a>
	<a id="movie" href="ShowMovieListCustomer">Movies</a> </header>
	<div class="content">
		<h2>Movies</h2>
		<table>
			<p>${addFavoriteStatus}</p>
			<tr>
				<th class="align-left">Title</th>
				<th class="align-right">Box Office</th>
				<th class="align-cent">Genre</th>
				<th class="align-cent">Has Teaser</th>
				<th class="align-cent">Action</th>
			</tr>
			<c:forEach items="${customerList}" var="movie">
				<tr>
					<td class="align-left">${movie.title}</td>
					<td class="align-right"><fmt:formatNumber type="currency" maxFractionDigits	="0"
							value="${movie.boxOffice}" var="formatNumber" />${formatNumber}</td>
					<td class="align-cent">${movie.genre}</td>
					<td class="align-cent"><c:if test="${movie.hasTeaser}">Yes</c:if>
						<c:if test="${!movie.hasTeaser}">No</c:if></td>
					<td class="align-cent"><a
						href="AddToFavorite?movieId=${movie.id}"> Add to Favorite </a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<footer>
	<h4>Copyright@2019</h4>
	</footer>
</body>
</html>