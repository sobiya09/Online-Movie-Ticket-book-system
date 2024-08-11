package app;


import classes.DbConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookingData {

    private final Connection connect;

    public BookingData() throws SQLException, Exception {
        this.connect = DbConnector.getConnection();
    }

    public boolean bookSeats(String selectedSeats, String total, String date, String time, int paymentId) {
        if (connect == null) {
            throw new IllegalStateException("Database connection is not established.");
        }

        String insertBookingSql = "INSERT INTO bookings (seats, total, date, time, booking_time) VALUES (?, ?, ?, ?, NOW())";
        String updateSeatsSql = "UPDATE seats SET status = 'sold' WHERE CONCAT(row, '-', seat) = ?";

        try {
            connect.setAutoCommit(false); // Start transaction

            try (PreparedStatement insertPstmt = connect.prepareStatement(insertBookingSql)) {
                insertPstmt.setString(1, selectedSeats);
                insertPstmt.setString(2, total);
                insertPstmt.setString(3, date);
                insertPstmt.setString(4, time);
              

                int rowsAffected = insertPstmt.executeUpdate();
                if (rowsAffected > 0) {
                    String[] seatsArray = selectedSeats.split(",");
                    for (String seat : seatsArray) {
                        try (PreparedStatement updateSinglePstmt = connect.prepareStatement(updateSeatsSql)) {
                            updateSinglePstmt.setString(1, seat.trim());
                            int updateRowsAffected = updateSinglePstmt.executeUpdate();
                            if (updateRowsAffected == 0) {
                                System.out.println("Seat not updated: " + seat.trim());
                            }
                        }
                    }
                    connect.commit(); // Commit transaction
                    return true;
                } else {
                    System.out.println("No rows affected by booking insert.");
                }
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        } catch (SQLException e) {
             System.err.println(e.getMessage());
        } finally {
            try {
                connect.setAutoCommit(true); 
            } catch (SQLException e) {
               System.err.println(e.getMessage());
            }
        }
        return false;
    }

    public void deleteOldBookings() {
        if (connect == null) {
            throw new IllegalStateException("Database connection is not established.");
        }

        String sql = "DELETE FROM bookings WHERE booking_time < NOW() - INTERVAL 2 HOUR";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            int rowsDeleted = pstmt.executeUpdate();
            System.out.println("Old bookings deleted: " + rowsDeleted);
        } catch (SQLException e) {
             System.err.println(e.getMessage());
        }
    }
}
