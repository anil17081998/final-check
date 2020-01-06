<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Edit Movie</title>
<link rel="stylesheet" type="text/css" href="./style/style.css" />
<script src="./js/script.js" type="text/javascript">
	
</script>
</head>
<body>
	<header> <span>Movie Cruiser</span> <img
		src="./images/logo.png"/ > <a id="movie"
		href="ShowMovieListAdmin">Movies</a> </header>
	<div class="content">
		<h2>Edit Movies</h2>
		<form name="movielist" method="post"
			action="EditMovie?movieId=${movie.id}" onSubmit="return validation()">
			<table>
				<tr>
					<td colspan="4" class="table-head"><label for="movname">
							Title</label></td>
				</tr>
				<tr>
					<td colspan="4"><input class="area" type="text" id="movname"
						name="movname" value="${movie.title}" size="80" /></td>
				</tr>
				<tr>
					<td class="table-head"><label for="gross">Gross($)</label></td>
					<td class="table-head">Active</td>
					<td class="table-head"><label for="launch">Date of
							Launch</label></td>
					<td class="table-head"><label for="gnr">Genre</label></td>

				</tr>
				<tr>
					<td><input class="align-cent" type="text" id="gross"
						name="gross" value="${movie.boxOffice}" /></td>
					<td><input type="radio" id="ys" name="ysno" checked
						value="Yes" <c:if test="${movie.active eq 'true'}">Checked</c:if>><label
						for="ys">Yes </label> <label for="no"><input type="radio"
							id="no" name="ysno" value="No"
							<c:if test="${movie.active eq 'false'}">Checked</c:if>>No</label>
					</td>
					<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
							value="${movie.dateOfLaunch}" var="formatDate" /> <input
						type="text" id="launch" name="launch" value="${formatDate}" /></td>
					<td><select name="category" id="gnr">
							<option
								<c:if test="${movie.genre eq 'Science Fiction'}">Selected</c:if>>Science
								Fiction</option>
							<option
								<c:if test="${movie.genre eq 'Superhero'}">Selected</c:if>>Superhero</option>
							<option <c:if test="${movie.genre eq 'Romance'}">Selected</c:if>>Romance</option>
							<option <c:if test="${movie.genre eq 'Comedy'}">Selected</c:if>>Comedy</option>
							<option
								<c:if test="${movie.genre eq 'Adventure'}">Selected</c:if>>Adventure</option>
							<option <c:if test="${movie.genre eq 'Thriller'}">Selected</c:if>>Thriller</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="checkbox" name="Chbox"
						<c:if test="${movie.hasTeaser eq 'true'}">Checked</c:if>
						<c:if test="${movie.hasTeaser eq 'false'}"></c:if>> <label
						for="chbox">Has Teaser</label></td>
				</tr>
				<tr>
					<td colspan="2"><input class="bt" type="submit" value="Save"
						name="submit" onClick="validate" /></td>
				</tr>
			</table>
		</form>
	</div>
	<footer>
	<h4>Copyright@2019</h4>
	</footer>
</body>
</html>