package com.cognizant.moviecruiser.dao;

import java.text.NumberFormat;
import java.util.List;

import com.cognizant.moviecruiser.model.Movie;

public class FavoriteDaoCollectionImplTest {

	public static void main(String[] args) throws FavoriteEmptyException {
		System.out.println("--------------------Favorites-------------------");
		testGetAllFavorite();
		System.out.println("---------------Movies added to the favorites successfully------------------");
		testAddFavorite();
		testGetAllFavorite();
		testDeleteFavorite();
		testGetAllFavorite();

	}

	public static void testAddFavorite() throws FavoriteEmptyException {
		FavoriteDao favoriteDao = new FavoriteDaoCollectionImpl();
		favoriteDao.addFavorite(1, 2L);
		favoriteDao.addFavorite(1, 5L);
		favoriteDao.addFavorite(1, 4L);

	}

	public static void testGetAllFavorite() throws FavoriteEmptyException {
		FavoriteDao favoriteDao = new FavoriteDaoCollectionImpl();
		try {
			List<Movie> movieListCustomer = favoriteDao.getAllFavorite(1);

			NumberFormat box = NumberFormat.getInstance();
			box.setGroupingUsed(true);
			for (Movie movie : movieListCustomer) {
				System.out.println(movie.favDisplay());
				// System.out.printf("%-20s $%-20s %-20s Delete \n", movie.getTitle(),
				// box.format(movie.getBoxOffice()),
				// movie.getGenre(),movie.isHasTeaser()?"Yes":"No");

			}
			System.out.println("Total No.of favorites :" + movieListCustomer.size() + "\n");
		} catch (FavoriteEmptyException e) {
			System.out.println(e.getMessage());
		}

	}

	public static void testDeleteFavorite() throws FavoriteEmptyException {
		FavoriteDao favoriteDao = new FavoriteDaoCollectionImpl();
		System.out.println("---------Movie removed from the Favorites successfully.----------------------");
		favoriteDao.deleteFavorite(1, 2);
	}

}
