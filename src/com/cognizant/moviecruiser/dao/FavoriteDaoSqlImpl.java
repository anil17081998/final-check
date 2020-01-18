package com.cognizant.moviecruiser.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.moviecruiser.model.Favorite;
import com.cognizant.moviecruiser.model.Movie;





public class FavoriteDaoSqlImpl implements FavoriteDao{

	@Override
	public void addFavorite(long userId, long movieId) {
		Connection con = ConnectionHandler.getConnection();
		try {
			String sql = "insert into favorite values(default,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, userId);

			ps.setLong(2, movieId);
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			try {

				con.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

	}

		

	@Override
	public List<Movie> getAllFavorite(long userId) throws FavoriteEmptyException {
		Connection con = ConnectionHandler.getConnection();
		List<Movie> movieList = new ArrayList<Movie>();
		PreparedStatement ps;
		ResultSet rs;
		Movie movie = null;
		try {

			Favorite favorite = new Favorite();
			StringBuffer sqlBuffer = new StringBuffer();

			sqlBuffer

					.append("select movie.mov_id,movie.mov_title,movie.mov_box_office,movie.mov_active,movie.mov_date_of_launch,movie.mov_genre,movie.mov_has_teaser from movie ")

					.append("inner join favorite on movie.mov_id = favorite.fav_mov_id WHERE fav_us_id = ?");

			ps = con.prepareStatement(sqlBuffer

					.toString());

			ps.setLong(1, userId);

			rs = ps.executeQuery();
			while(rs.next()) {
				int movieId = rs.getInt(1);
				String title=rs.getString(2);
		           long boxOffice=rs.getLong(3);
		           boolean active = rs.getString(4).equalsIgnoreCase("yes");
		           Date dateOfLaunch=rs.getDate(5);
		           String genre = rs.getString(6);
		       boolean hasTeaser= rs.getString(7).equalsIgnoreCase("yes");

		      movie=new Movie(movieId,title,boxOffice,active,dateOfLaunch,genre,hasTeaser);
		      movieList.add(movie);

			}

			favorite.setMovieList(movieList);
			
		} catch (SQLException e) {

			// TODO Auto-generated catch block

			System.out.println(e);

		} finally {

			try {

				con.close();

			} catch (SQLException e) {

				// TODO Auto-generated catch block

				e.printStackTrace();

			}

		}

		if (movieList.size() == 0) {

			throw new FavoriteEmptyException("favorite is Empty");

		}

		return movieList;

	}
	@Override
	public void deleteFavorite(long userId, long movieId) {
		Connection con = ConnectionHandler.getConnection();

		try {

			String sql = "delete from favorite where fav_us_id=? and  fav_mov_id=? limit 1";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setLong(1, userId);

			ps.setLong(2, movieId);

			ps.executeUpdate();

		} catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		} finally {

			try {

				con.close();

			} catch (SQLException e) {

				// TODO Auto-generated catch block

				e.printStackTrace();

			}

		}

	}

}