package app;


import classes.DbConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Payment {

    public boolean insertPaymentData(String fname, String lname, String email, String address, String city,
                                     String dayStr, String monthStr, String yearStr, String gender,
                                     String paymentMethod, String cardNumber, String cardCVC,
                                     String expMonth, String expYear, String amount) throws Exception {
        String insertSQL = "INSERT INTO payments (first_name, last_name, email, address, city, dob_day, dob_month, dob_year, gender, payment_method, card_number, card_cvc, exp_month, exp_year, amount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DbConnector.getConnection();
             PreparedStatement pstmt = con.prepareStatement(insertSQL)) {

            // Set parameters for the PreparedStatement
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, email);
            pstmt.setString(4, address);
            pstmt.setString(5, city);
            pstmt.setString(6, dayStr);
            pstmt.setString(7, monthStr);
            pstmt.setString(8, yearStr);
            pstmt.setString(9, gender);
            pstmt.setString(10, paymentMethod);
            pstmt.setString(11, cardNumber);
            pstmt.setString(12, cardCVC);
            pstmt.setString(13, expMonth);
            pstmt.setString(14, expYear);
            pstmt.setString(15, amount);

            // Execute the update
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Return true if one or more rows were affected

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            return false; // Return false in case of an error
        }
    }
}

