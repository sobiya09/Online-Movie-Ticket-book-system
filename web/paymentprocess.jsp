<%-- 
    Document   : ticketBookingProcess
    Created on : Aug 9, 2024, 11:02:37 AM
    Author     : satal
--%>


<%@page import="app.Payment"%>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String dayStr = request.getParameter("dob_day");
    String monthStr = request.getParameter("dob_month");
    String yearStr = request.getParameter("dob_year");
    String gender = request.getParameter("gender");
    String paymentMethod = request.getParameter("pay");
    String cardNumber = request.getParameter("card_number");
    String cardCVC = request.getParameter("card_cvc");
    String expMonth = request.getParameter("exp_month");
    String expYear = request.getParameter("exp_year");
    String amountStr = request.getParameter("amount");

    if (fname == null || lname == null || email == null || address == null || city == null
            || dayStr == null || monthStr == null || yearStr == null || gender == null || paymentMethod == null
            || cardNumber == null || cardCVC == null || expMonth == null || expYear == null || amountStr == null) {

        out.println("<p>Error: Missing required fields. Please check your input.</p>");
        return; // Stop further processing
    }

    int dobYear = 0;
    double amount = 0.0;

    try {
        dobYear = Integer.parseInt(yearStr);
        amount = Double.parseDouble(amountStr);
    } catch (NumberFormatException e) {
        out.println("<p>Error: Invalid year or amount format.</p>");
        return; // Stop further processing
    }

    // Create Payment object and insert data
    Payment pay = new Payment();
    boolean success = pay.insertPaymentData(fname, lname, email, address, city, dayStr, monthStr, yearStr, gender, paymentMethod, cardNumber, cardCVC, expMonth, expYear, amountStr);
//  response.sendRedirect("ticket.jsp");
    // Display information
    out.println("<html><body>");
    if (success) {
        out.println("<p>Payment successfully added.</p>");
        response.sendRedirect("ticket.jsp");
    } else {
        out.println("<p>Failed to add payment.</p>");
    }
    out.println("</body></html>");
%>
