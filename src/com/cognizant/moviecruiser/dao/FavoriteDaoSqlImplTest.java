package com.cognizant.moviecruiser.dao;

import java.text.NumberFormat;
import java.util.List;

import com.cognizant.moviecruiser.model.Movie;

public class FavoriteDaoSqlImplTest {

	public static void main(String[] args) throws FavoriteEmptyException {
		System.out.println("favorite");
		testGetAllFavorite();
		testAddFavorite();
		System.out.println("favorites added");
		testGetAllFavorite();
		 testDeleteFavorite();
		 System.out.println("dlted");
		 testGetAllFavorite();

	}
	
	public static void testAddFavorite() throws FavoriteEmptyException {
		FavoriteDao favoriteDao = new FavoriteDaoSqlImpl();
		favoriteDao.addFavorite(1, 2L);
	}
	public static void testGetAllFavorite() throws FavoriteEmptyException {
		FavoriteDao favoriteDao = new FavoriteDaoSqlImpl();
		try {
			List<Movie> movieListCustomer = favoriteDao.getAllFavorite(1);

			NumberFormat box = NumberFormat.getInstance();
			box.setGroupingUsed(true);
			for (Movie movie : movieListCustomer) {
				System.out.println(movie.favDisplay());
			}
			System.out.println("Total No.of favorites :" + movieListCustomer.size() + "\n");
		} catch (FavoriteEmptyException e) {
			System.out.println(e.getMessage());
		}

	}
	public static void testDeleteFavorite() throws FavoriteEmptyException {
		FavoriteDao favoriteDao = new FavoriteDaoSqlImpl();
		//System.out.println("---------Movie removed from the Favorites successfully.----------------------");
		favoriteDao.deleteFavorite(1, 2);
	}
}
