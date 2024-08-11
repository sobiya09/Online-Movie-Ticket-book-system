<%-- 
    Document   : ticketBooking
    Created on : 07-Aug-2024, 18:52:24
    Author     : satal
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="app.BookingData" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>Movie Seat Booking</title>
        <style>
            body {
                background-color: #000;
                color: #fff;
                margin: 0;
                padding: 0;
            }



            /* Seat selection styling */
            .container {
                max-width: 900px;
                margin: 2rem auto;
                padding: 1rem;
                background-color: #262626;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.8);
                text-align: center;

            }

            .screen {
                background-color: #333;
                color: #fff;
                padding: 10px;
                margin-bottom: 20px;
                text-align: center;
                border-radius: 5px;
                background: linear-gradient(to bottom right, rgba(255, 255, 255, 0.9), rgba(0, 0, 0, 0.3));
                clip-path: polygon(0 0, 100% 0, 90% 100%, 10% 100%);

            }

            .seat {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 32px;
                height: 26px;
                margin: 3px;
                border: 1px solid #ddd;
                background-color: #555;
                border-radius: 5px;
                box-sizing: border-box;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }
            .seat input[type="checkbox"] {
                width: 30px;
                height: 18px;
                margin: 0;
                transform: scale(1.5);
                opacity: 0;
            }
            .seat.selected {
                background-color: #4caf50;
            }
            /*.date input[type="radio"] {
                            width: 30px;
                            height: 18px;
                            margin: 0;
                            transform: scale(1.5);
                            opacity: 0;
                        }
                       .dates-item.checked {
                background-color:#4caf50;  Change to desired color 
                color: #000;  Change text color when selected 
            }*/


            .seat.sold {
                background-color: #f44336;
            }

            .seat:not(.sold):hover {
                cursor: pointer;
                transform: scale(1.2);
            }

            /* Row styling */
            .row {
                display: flex;
                justify-content: center;
                margin-bottom: 10px;
            }

            /* Form and label styling */
            .form-group {
                margin: 20px 0;
            }

            .form-check {
                display: flex;
                justify-content: space-around;
                margin-top: 10px;
            }

            .dates-item {
                width: 100%;
                cursor: pointer;
                padding: 10px;
                background-color: #660000;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
                transition: background-color 0.3s ease;
                margin-right: 10px; /* Add space between dates */
            }

            .dates-item:hover {
                background-color: #135e13;
            }

            .time {
                width: 25%;
                cursor: pointer;
                padding: 10px;
                background-color: #6a0000;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                margin-right: 10px;
            }

            .time:hover {
                background: #135e13;
            }

            /* Date selection styling */
            input[name="date"]:checked + label.dates-item {
                background-color:#e09e10; /* Desired background color when selected */
                color: #000; /* Desired text color when selected */
            }

            /* Time selection styling */
            input[name="time"]:checked + label.time {
                background-color: #ffcc00; /* Desired background color when selected */
                color: #000; /* Desired text color when selected */
            }


            /* Booking summary */
            #bookingForm {
                margin-top: 20px;
            }

            #bookingForm p {
                font-weight: bold;
                font-size: 1.2rem;
            }

            #selectedSeatsDisplay {
                color: #007bff;
            }

            .btn-primary {
                background-color: maroon;
                border-color: maroon;
                padding: 10px 20px;
                font-size: 1.2rem;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn-primary:hover {
                background-color: #d9534f;
            }
            .list-inline {
                margin-bottom: 20px;
            }

            .list-inline-item {
                display: inline-block;
                text-align: center;
                margin-right: 15px;
            }

            .list-inline-item small {
                display: block;
                color: #ccc;
                margin-top: 5px;
                font-size: 0.85rem;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .navbar-brand {
                    font-size: 1.2rem;
                }

                .seat {
                    height: 25px;
                    width: 25px;
                }

                .btn-primary {
                    width: 100%;
                }
            }


        </style>

    </head>
    <body>

        <div class="container mt-5">
            <ul class="list-inline text-center">
                <li class="list-inline-item">
                    <div class="seat"></div>
                    <small>Available</small>
                </li>
                <li class="list-inline-item">
                    <div class="seat selected"></div>
                    <small>Selected</small>
                </li>
                <li class="list-inline-item">
                    <div class="seat sold"></div>
                    <small>Sold</small>
                </li>
            </ul>
            <div class="screen">Screen</div>

            <%-- Number of rows and columns --%>
            <%
                int rows = 5;
                int columns = 20;
            %>

            <div class="container">
                <%-- Loop through rows --%>
                <%
                    for (int i = 1; i <= rows; i++) {
                %>
                <div class="row">
                    <%-- Loop through columns (seats in each row) --%>
                    <%
                        for (int j = 1; j <= columns; j++) {
                    %>
                    <div id="seat-<%=i%>-<%=j%>" class="seat">
                        <input type="checkbox" name="seat">
                    </div>
                    <%
                        }
                    %>
                </div>
                <%
                    }
                %>
            </div>


            <form action="ticketBookingProcess.jsp" method="post" id="bookingForm">
                <div class="form-group">
                    <label for="date">Select Date:</label>
                    <div class="form-check">

                        <input type="radio" name="date" value="11" id="date-d1" checked />
                        <label for="date-d1" class="dates-item">
                            <div class="day">Sun</div>
                            <div class="date">11</div>
                        </label>
                        <input type="radio" id="date-d2" value="12" name="date" />
                        <label class="dates-item" for="date-d2">
                            <div class="day">Mon</div>
                            <div class="date">12</div>
                        </label>
                        <input type="radio" id="date-d3" value="13" name="date" />
                        <label class="dates-item" for="date-d3">
                            <div class="day">Tue</div>
                            <div class="date">13</div>
                        </label>
                        <input type="radio" id="date-d4" value="14" name="date" />
                        <label class="dates-item" for="date-d4">
                            <div class="day">Wed</div>
                            <div class="date">14</div>
                        </label>
                        <input type="radio" id="date-d5" value="15" name="date" />
                        <label class="dates-item" for="date-d5">
                            <div class="day">Thu</div>
                            <div class="date">15</div>
                        </label>
                        <input type="radio" id="date-d6" value="16" name="date" />
                        <label class="dates-item" for="date-d6">
                            <div class="day">Fri</div>
                            <div class="date">16</div>
                        </label>
                        <input type="radio" id="date-d7" value="17" name="date" />
                        <label class="dates-item" for="date-d7">
                            <div class="day">Sat</div>
                            <div class="date">17</div>
                        </label>
                    </div>
                </div>


                <div class="form-group">
                    <label for="time">Select Time:</label>
                    <div class="form-check">
                        <input type="radio" name="time" id="time-t1" value="11:00" checked />
                        <label for="time-t1" class="time">11:00</label>
                        <input type="radio" id="time-t2" value="14:30" name="time" />
                        <label for="time-t2" class="time">14:30</label>
                        <input type="radio" id="time-t3" value="18:00" name="time" />
                        <label for="time-t3" class="time">18:00</label>
                        <input type="radio" id="time-t4" value="21:30" name="time" />
                        <label for="time-t4" class="time">21:30</label>
                    </div>
                </div>
                <div class="form-group">
                    <p class="text">
                        You have selected <span id="count">0</span> seat(s) for a price of RS.<span id="total">0</span>
                        <br>
                        <!-- User select seat show -->
                    <p>Selected Seats: <span id="selectedSeatsDisplay"></span></p>
                    <input type="hidden" id="selectedSeats" name="selectedSeats" value="">

                    <!-- User select date and time show -->
                    <p>Selected date and time: <span id="selectedDateTimeDisplay"></span></p>
                    <!-- Servlet send inputs -->
                    <input type="hidden" id="totalHidden" name="total" value="">
                    <input type="hidden" id="Date" name="Date" value="">
                    <input type="hidden" id="Time" name="Time" value="">

                    <button type="submit" class="btn btn-primary">Book Seats</button>
                    </p>
                </div>
            </form>

            <script>
                function updateSelectedCount() {
                    const selectedSeats = document.querySelectorAll('.seat.selected');
                    const count = selectedSeats.length - 1;
                    const total = count * 500;

                    // User select seat count and amount
                    document.getElementById('count').textContent = count;
                    document.getElementById('total').textContent = total;
                    document.getElementById('totalHidden').value = total;

                    // Seat user selects, that seat show
                    const selectedSeatsNumbers = Array.from(selectedSeats).map(seat => seat.id);
                    document.getElementById('selectedSeats').value = selectedSeatsNumbers.join(',');
                    document.getElementById('selectedSeatsDisplay').textContent = selectedSeatsNumbers.join(', ');

                    // Update selected date and time
                    updateSelectedDateTime();
                }

                function updateSelectedDateTime() {
                    const selectedDateInput = document.querySelector('input[name="date"]:checked');
                    const selectedTimeInput = document.querySelector('input[name="time"]:checked');

                    if (selectedDateInput && selectedTimeInput) {
                        const selectedDate = selectedDateInput.nextElementSibling.querySelector('.day').textContent +
                                ', ' +
                                selectedDateInput.nextElementSibling.querySelector('.date').textContent;
                        const selectedTime = selectedTimeInput.nextElementSibling.textContent.trim();

                        document.getElementById('selectedDateTimeDisplay').textContent = selectedDate + ' at ' + selectedTime;
                        document.getElementById('Date').value = selectedDate;
                        document.getElementById('Time').value = selectedTime;
                    }
                }

                // Add event listeners to all seats and some time user click more time that action
                document.querySelectorAll('.seat').forEach(seat => {
                    seat.addEventListener('click', () => {
                        if (!seat.classList.contains('sold')) { // Ignore sold seats
                            seat.classList.toggle('selected');
                            updateSelectedCount();
                        }
                    });
                });

                // Add event listeners to date and time radio buttons
                document.querySelectorAll('input[name="date"]').forEach(input => {
                    input.addEventListener('change', updateSelectedDateTime);
                });
                document.querySelectorAll('input[name="time"]').forEach(input => {
                    input.addEventListener('change', updateSelectedDateTime);
                });

                // Initialize values on page load
                updateSelectedCount();
            </script>

        </div>
    </body>
</html>