/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import classes.DbConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author puvan
 */
public class Bookingfetch {
    private Connection connect;
    
    public Bookingfetch() throws SQLException, Exception {
        this.connect = DbConnector.getConnection();
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM bookings ORDER BY id DESC LIMIT 1";

        try (PreparedStatement pstmt = connect.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String seats = rs.getString("seats");
                String total = rs.getString("total");
                String date = rs.getString("date");
                String time = rs.getString("time");
                int paymentId = rs.getInt("payment_id");
                String bookingTime = rs.getString("booking_time");

                Booking booking = new Booking(id, seats, total, date, time, paymentId, bookingTime);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return bookings;
    }
}
