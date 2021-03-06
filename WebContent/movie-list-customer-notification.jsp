<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Notification</title>
			<link rel="stylesheet" type="text/css" href="./style/style.css"/>
	</head>
	<body>
		<header>
			<span>Movie Cruiser</span>
				<img src="./images/logo.png" / > 
				<a id="movie" href="favorites.html">Favorites</a>
				<a id="movie" href="movie-list-customer.html">Movies</a>
		</header>
		<div class="content">
			<h2>Movies</h2>
			<h5 class="sucess">Movie added to Favorites Successfully</h5>
			<table>
				<tr>
					<th class="align-left">Title</th>
					<th class="align-right">Box Office</th>
					<th class="align-cent">Genre</th>
					<th class="align-cent">Has Teaser</th>
					<th class="align-cent">Action</th>
				</tr>
				<tr>
					<td class="align-left">Avatar</td>
					<td class="align-right">$2,787,965,087</td>
					<td class="align-cent">Science Fiction</td>
					<td class="align-cent">Yes</td>
					<td class="align-cent"><a href="movie-list-customer-notification.html"/> Add to Favorite</td>
				</tr>
				<tr>
					<td class="align-left">The Avengers</td>
					<td class="align-right">$1,518,812,988</td>
					<td class="align-cent">Superhero</td>
					<td class="align-cent">No</td>
					<td class="align-cent"><a href="movie-list-customer-notification.html"/> Add to Favorite</td>
				</tr>	
				<tr>
					<td class="align-left">Titanic</td>
					<td class="align-right">$2,187,463,944</td>
					<td class="align-cent">Romance</td>
					<td class="align-cent">No</td>
					<td class="align-cent"><a href="movie-list-customer-notification.html"/> Add to Favorite</td>
				</tr>	
			</table>	
		</div>
		<footer><h4>Copyright@2019</h4></footer>
	</body>
</html>