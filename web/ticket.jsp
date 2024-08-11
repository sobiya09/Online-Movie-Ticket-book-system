<%-- 
    Document   : ticketBooking
    Created on : 07-Aug-2024, 18:52:24
    Author     : satal
--%>
<%@ page import="java.util.List" %>
<%@ page import="app.Bookingfetch" %>
<%@ page import="app.Booking" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Tickets</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Staatliches&display=swap");
            @import url("https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap");

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                height: 100vh;
                margin: 0;
                display: grid;
                font-family: "Staatliches", cursive;
                color: black;
                font-size: 14px;
                letter-spacing: 0.1em;
                background: url("images1/bg3.jpg") no-repeat center center;
                background-size: cover;
            }

            .ticket {
                margin: auto;
                margin-top: 15%;
                display: flex;
                background: white;
                box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
            }

            .left {
                display: flex;
            }

            .image {
                height: 250px;
                width: 250px;
                background: url("images1/bg.jpg") no-repeat center center fixed;
                background-size: contain;
                opacity: 0.85;
            }

            .admit-one {
                position: absolute;
                color: darkgray;
                height: 250px;
                padding: 0 10px;
                letter-spacing: 0.15em;
                display: flex;
                text-align: center;
                justify-content: space-around;
                writing-mode: vertical-rl;
                transform: rotate(-180deg);
            }

            .admit-one span:nth-child(2) {
                color: white;
                font-weight: 700;
            }

            .left .ticket-number {
                height: 250px;
                width: 250px;
                display: flex;
                justify-content: flex-end;
                align-items: flex-end;
                padding: 5px;
            }

            .ticket-info {
                padding: 10px 30px;
                display: flex;
                flex-direction: column;
                text-align: center;
                justify-content: space-between;
                align-items: center;
            }

            .date {
                border-top: 1px solid gray;
                border-bottom: 1px solid gray;
                padding: 5px 0;
                font-weight: 700;
                display: flex;
                align-items: center;
                justify-content: space-around;
            }

            .date span {
                width: 100px;
            }

            .date span:first-child {
                text-align: left;
            }

            .date span:last-child {
                text-align: right;
            }

            .date .june-29 {
                color: #d83565;
                font-size: 20px;
            }

            .show-name {
                font-size: 32px;
                font-family: "Nanum Pen Script", cursive;
                color: #d83565;
            }

            .show-name h1 {
                font-size: 48px;
                font-weight: 700;
                letter-spacing: 0.1em;
                color: #4a437e;
            }

            .time {
                padding: 10px 0;
                color: #4a437e;
                text-align: center;
                display: flex;
                flex-direction: column;
                gap: 10px;
                font-weight: 700;
            }

            .time span {
                font-weight: 400;
                color: gray;
            }

            .left .time {
                font-size: 16px;
            }


            .location {
                display: flex;
                justify-content: space-around;
                align-items: center;
                width: 100%;
                padding-top: 8px;
                border-top: 1px solid gray;
            }

            .location .separator {
                font-size: 20px;
            }

            .right {
                width: 180px;
                border-left: 1px dashed #404040;
            }

            .right .admit-one {
                color: darkgray;
            }

            .right .admit-one span:nth-child(2) {
                color: gray;
            }

            .right .right-info-container {
                height: 250px;
                padding: 10px 10px 10px 35px;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                align-items: center;
            }

            .right .show-name h1 {
                font-size: 18px;
            }

            .barcode {
                height: 100px;
            }

            .barcode img {
                height: 100%;
            }

            .right .ticket-number {
                color: gray;
            }.form-group {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .btn-primary {
                background-color: maroon;
                border-color: maroon;
                padding: 10px 20px;
                font-size: 1.2rem;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                color: white;
                text-align: center;
                height: 50px;
            }

            .btn-primary a {
                color: white;
                text-decoration: none;

            }

            .btn-primary:hover {
                background-color: #d9534f;
            }

            .btn-primary a:hover {
                color: white;
            }

        </style>
    </head>
    <body>


        <%
            Bookingfetch bookingData = new Bookingfetch();
            List<Booking> bookings = bookingData.getAllBookings();
        %>

        <% if (bookings != null && !bookings.isEmpty()) {
        Booking firstBooking = bookings.get(0);%>

        <div class="ticket created-by-anniedotexe">
            <div class="left">
                <div class="image">
                    <p class="admit-one">
                        <span>CinemaGate</span>
                        <span>CinemaGate</span>
                        <span>CinemaGate</span>

                    </p>
                    <div class="ticket-number">
                        <p>#<%= firstBooking.getId()%></p>
                    </div>
                </div>
                <div class="ticket-info">
                    <p class="date">
                        <span class="june-29"><%= firstBooking.getDate()%></span>
                    </p>
                    <div class="show-name">
                        <h1>Cinema Gate</h1>
                        <h2>Ticket</h2>
                    </div>
                    <div class="time">
                        <p><%= firstBooking.getTime()%> <span>TO</span> <%= firstBooking.getTime() + 300.00%></p>
                        <p><%= firstBooking.getTime()%></p>
                    </div>
                    <p class="location">
                        <span>East High School</span> <!-- Replace with actual location if available -->
                        <span class="separator"><i class="far fa-smile"></i></span>
                        <span>Salt Lake City, Utah</span> <!-- Replace with actual location if available -->
                    </p>
                </div>
            </div>
            <div class="right">
                <p class="admit-one">
                    <span>CinemaGate</span>
                    <span>CinemaGate</span>
                    <span>CinemaGate</span>
                </p>
                <div class="right-info-container">
                    <div class="show-name">
                        <h1>Cinema Gate</h1>
                    </div>
                    <div class="time">
                        <p><%= firstBooking.getTime()%> <span>TO</span> <%= firstBooking.getTime()%></p>
                        <p>DOORS <span>@</span> <%= firstBooking.getTime()%></p>
                    </div>
                    <div class="barcode">
                        <img src="https://external-preview.redd.it/cg8k976AV52mDvDb5jDVJABPrSZ3tpi1aXhPjgcDTbw.png?auto=webp&s=1c205ba303c1fa0370b813ea83b9e1bddb7215eb" alt="QR code">
                    </div>
                    <p class="ticket-number">
                        #<%= firstBooking.getId()%>
                    </p>
                </div>
            </div>

        </div>
        <div class="form-group">

            <button type="submit" class="btn btn-primary"><a href="Categories.jsp">Movies</a></button>
        </div>
        <% } else { %>
        <p>No bookings found.</p>
        <% }%>

    </body>
</html>
