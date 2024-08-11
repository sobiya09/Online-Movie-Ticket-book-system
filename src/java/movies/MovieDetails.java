/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movies;

/**
 *
 * @author sobi
 */

import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDetails {

    private String categories;
    private String title;
    private String isbn;
    private String publicationDate;
    private String author;
    private String review;
    private String language;
    private String hours;

    // Constructor
    public MovieDetails(String categories, String title, String isbn, String publicationDate, String author, String review,String language, String hours ) {
        this.categories = categories;
        this.title = title;
        this.isbn = isbn;
        this.publicationDate = publicationDate;
        this.author = author;
        this.review = review;
        this.language=language;
        this.hours=hours;
    }

    // Getter methods
    public String getCategories() {
        return categories;
    }

    public String getTitle() {
        return title;
    }

    public String getISBN() {
        return isbn;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public String getAuthor() {
        return author;
    }


    public String getReview() {
        return review;
    }

    public String getLanguage() {
        return language;
    }

    public String getHours() {
        return hours;
    }
    
    

    public static List<MovieDetails> retrieveMovieData(Connection connection, String Category) {

        List<MovieDetails> moviedetails = new ArrayList<>();

        try {
            // SQL query
            String query = "SELECT Categories,Movie_ID, Movie_Name, Release_Date, Director, Review, Language,Hours FROM movie where Categories=?";

            // Create a statement
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Category);
            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String category = resultSet.getString("Categories");
                String movieId = resultSet.getString("Movie_ID");
                String movieName = resultSet.getString("Movie_Name");
                String releaseDate = resultSet.getString("Release_Date");
                String director = resultSet.getString("Director");
                String review = resultSet.getString("Review");
                String language=resultSet.getString("Language");
                String hours=resultSet.getString("Hours");

                MovieDetails movie = new MovieDetails(category, movieName, movieId, releaseDate, director, review,language,hours);
                moviedetails.add(movie);
               

            }
            // Close the resources
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return moviedetails;
    }

    // Static method to get book details by ISBN from the database
    public static MovieDetails getMovieDetailsByISBN(Connection connection, String isbn) {
        String query = "SELECT * FROM movie WHERE Movie_ID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, isbn);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String categories = resultSet.getString("Categories");
                    String title = resultSet.getString("Movie_Name");
                    String publicationDate = resultSet.getString("Release_Date");
                    String author = resultSet.getString("Director");
                    String review = resultSet.getString("Review");
                    String language=resultSet.getString("Language");
                    String hours=resultSet.getString("Hours");

                    return new MovieDetails(categories, title, isbn, publicationDate, author, review,language,hours);
                } else {
                    return null; // No data found for the given ISBN
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}

