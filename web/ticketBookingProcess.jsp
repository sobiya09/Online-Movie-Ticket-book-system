<%-- 
    Document   : ticketBookingProcess
    Created on : Aug 9, 2024, 11:02:37 AM
    Author     : satal
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.BookingData"%>
 <%
    String selectedSeats = request.getParameter("selectedSeats");
    String date = request.getParameter("Date");
    String time = request.getParameter("Time");
    int totalAmount = 0;

    if (selectedSeats != null && date != null && time != null) {
        selectedSeats = selectedSeats.trim();
        date = date.trim();
        time = time.trim();

        String[] seatsArray = selectedSeats.split(",");
        int count = seatsArray.length-1;
        totalAmount = count * 500; // Assuming each seat costs 500

        String totalAmountStr = Integer.toString(totalAmount);

        // Format date to "yyyy-MM-dd"
        String numericDate = date.replaceAll("[^0-9]", "");
        SimpleDateFormat originalFormat = new SimpleDateFormat("dd");
        SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, Integer.parseInt(numericDate));
        String formattedDate = targetFormat.format(calendar.getTime());

        // Perform booking
        BookingData booking = new BookingData();
        boolean success = booking.bookSeats(selectedSeats, totalAmountStr, formattedDate, time, 0); // paymentId is set to 0 for now

        // Display information
        out.println("<html><body>");
        out.println("<p>Selected Seats: " + selectedSeats + "</p>");
        out.println("<p>Total Amount: " + totalAmount + "</p>");
        out.println("<p>Date: " + formattedDate + "</p>");
        out.println("<p>Time: " + time + "</p>");

        if (success) {
             
            out.println("<p>Booking was successful!</p>");
            response.sendRedirect("payment.jsp");
        } else {
            out.println("<p>Booking failed. Please try again.</p>");
        }
        out.println("</body></html>");
    } else {
        out.println("<html><body>");
        
        out.println("</body></html>");
    }
%>
