<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Faverites Empty</title>
<link rel="stylesheet" type="text/css" href="./style/style.css" />
</head>
<body>
	<header> <span>Movie Cruiser</span> <img
		src="./images/logo.png"/ > <a id="movie" href="ShowFavorite">Favorites</a>
	<a id="movie" href="ShowMovieListCustomer">Movies</a> </header>
	<div class="content">
		<h2>Favorites</h2>
		<p class="empty">
			No items in favorites.Use 'Add to Favorite' option in <a
				class="menu-item" href="ShowMovieListCustomer">Movie list</a>
		</p>

	</div>
	<footer>
	<h4>Copyright@2019</h4>
	</footer>
</body>
</html>