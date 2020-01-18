package com.cognizant.moviecruiser.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.moviecruiser.model.Movie;

public class MovieDaoSqlImpl implements MovieDao{

	@Override
	public List<Movie> getMovieListAdmin() {
		List<Movie> movieList = new ArrayList<>();
		Connection con = ConnectionHandler.getConnection();
        try {
            String sql = "select * from movie";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie m = new Movie();
                m.setId(rs.getInt(1));
                m.setTitle(rs.getString(2));
                m.setBoxOffice(rs.getLong(3));
                m.setActive(rs.getString(4).equalsIgnoreCase("yes"));
                m.setDateOfLaunch(rs.getDate(5));
                m.setGenre(rs.getString(6));
            m.setHasTeaser(rs.getString(7).equalsIgnoreCase("yes"));

               movieList.add(m);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return movieList;

		
	}

	@Override
	public List<Movie> getMovieListCustomer() {
		List<Movie> customerList = new ArrayList<>();
		Connection con = ConnectionHandler.getConnection();
		try {
            String sql = "select * from movie where mov_active='Yes' and mov_date_of_launch <= current_date()";
            		
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie m = new Movie();
                m.setId(rs.getInt(1));
                m.setTitle(rs.getString(2));
                m.setBoxOffice(rs.getLong(3));
                m.setActive(rs.getString(4).equalsIgnoreCase("yes"));
                m.setDateOfLaunch(rs.getDate(5));
                m.setGenre(rs.getString(6));
            m.setHasTeaser(rs.getString(7).equalsIgnoreCase("yes"));

            customerList.add(m);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return customerList;

	}

	@Override
	public void modifyMovie(Movie movie) {
		Connection con = ConnectionHandler.getConnection();
		
		try {
		String sql = "update movie set mov_title=?,mov_box_office=?,mov_active=?,mov_date_of_launch=?,mov_genre=?,mov_has_teaser=? where mov_id=?";

		PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, movie.getTitle());
				ps.setLong(2, movie.getBoxOffice());
				ps.setString(3, movie.isActive() ? "Yes" : "No");
				ps.setDate(4, new java.sql.Date(movie.getDateOfLaunch().getTime()));
				ps.setString(5, movie.getGenre());
				ps.setString(6, movie.isHasTeaser() ? "Yes" : "No");
				ps.setLong(7, movie.getId());
				ps.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
			
		} finally {
			try {
				con.close();
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public Movie getMovie(long movieId) {
		Connection con = ConnectionHandler.getConnection();

		Movie movie = null;
		try {
			
		String sql = "select * from movie where mov_id=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, movieId);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
          String title=rs.getString(2);
           long boxOffice=rs.getLong(3);
           boolean active = rs.getString(4).equalsIgnoreCase("yes");
           Date dateOfLaunch=rs.getDate(5);
           String genre = rs.getString(6);
       boolean hasTeaser= rs.getString(7).equalsIgnoreCase("yes");

      movie=new Movie(movieId,title,boxOffice,active,dateOfLaunch,genre,hasTeaser);
		}
		}catch(Exception ex){
			ex.printStackTrace();
			
		} finally {
			try {
				con.close();
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 return movie;
		
	}
	}

	
	
	

