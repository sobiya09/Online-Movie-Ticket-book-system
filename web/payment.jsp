<%-- 
    Document   : ticketBookingProcess
    Created on : Aug 9, 2024, 11:02:37 AM
    Author     : satal
--%>
<%@page import="app.Payment"%> 
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Form - Sagar Developer</title>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <style>

            * {
                box-sizing: border-box;
            }

            body {

                background: url("images1/bg2.jpg");
                color: #fff;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;

                font-family: "Lato", sans-serif;
                margin: 0;
            }



            .wrapper {
                background-color: #fff;
                width: 500px;
                padding: 25px;
                margin: 25px auto 0;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
            }

            .wrapper h2 {
                background-color: #fcfcfc;
                color:#6a0000;
                font-size: 24px;
                padding: 10px;
                margin-bottom: 8px;
                text-align: center;
                border: 1px dashed;
            }

            .wrapper h4 {
                padding-bottom: 5px;
                color: #6a0000;
            }

            .input_group {
                margin-bottom: 8px;
                width: 100%;
                position: relative;
                display: flex;
                flex-direction: row;
                padding: 5px 0;
            }

            .input_box {
                width: 100%;
                margin-right: 12px;
                position: relative;
            }

            .input_box:last-child {
                margin-right: 0;
            }

            .input_box .name {
                padding: 14px 10px 14px 50px;
                width: 100%;
                background-color: #fcfcfc;
                border: 1px solid #0003;
                outline: none;
                letter-spacing: 1px;
                transition: 0.3s;
                border-radius: 3px;
                color: #333;
            }

            .input_box .name:focus, .dob:focus {
                -webkit-box-shadow: 0 0 2px 1px ;
                -moz-box-shadow: 0 0 2px 1px #660000;
                box-shadow: 0 0 2px 1px #660000;
                border: 1px solid #660000;
            }

            .input_box .icon {
                width: 48px;
                display: flex;
                justify-content: center;
                align-items: center;
                position: absolute;
                top: 0px;
                left: 0px;
                bottom: 0px;
                color: #333;
                background-color: #f1f1f1;
                border-radius: 2px 0 0 2px;
                transition: 0.3s;
                font-size: 20px;
                pointer-events: none;
                border: 1px solid #00000003;
                border-right: none;
            }

            .name:focus+.icon {
                background-color: #660000;
                color: #fff;
                border-right: 1px solid #660000;
                border: none;
                transition: 1s;
            }

            .dob {
                width: 30%;
                padding: 14px;
                text-align: center;
                background-color: #fcfcfc;
                transition: 0.3s;
                outline: none;
                border: 1px solid #c0bfbf;
                border-radius: 3px;
            }

            .radio {
                display: none;

            }

            .input_box label {
                width: 50%;
                padding: 13px;
                background-color: #fcfcfc;
                display: inline-block;
                float: left;
                text-align: center;
                border: 1px solid #c0bfbf;
            }

            .input_box label:first-of-type {
                border-top-left-radius: 3px;
                border-bottom-right-radius: 3px;
                border-right: none;
            }

            .input_box label:last-of-type {
                border-top-right-radius: 3px;
                border-bottom-right-radius: 3px;
            }

            .radio:checked+label {
                background-color: #6a0000;
                color: #fff;
                transition: 0.5s;
            }

            .input_group {
                display: flex;
                justify-content: center;
                gap: 15px; /* Adds space between buttons */
                margin-top: 20px;
            }

            .input_box button {
                width: 100%;
                background-color: #660000;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 8px;
                color: white;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-align: center;
            }

            .input_box button:hover {
                background-color: #d9534f;
            }

            .input_box a {
                color: white;
                text-decoration: none;
                display: block;
            }



        </style>
    </head>


    <body>
        <div class="wrapper">
            <h2>Payment Form</h2>
            <form action="paymentprocess.jsp" method="post">
                <!-- Account Information Start -->
                <h4>Account</h4>
                <div class="input_group">
                    <div class="input_box">
                        <input type="text" placeholder="Full Name" required name="fname" class="name">
                        <i class="fa fa-user icon"></i>
                    </div>
                    <div class="input_box">
                        <input type="text" placeholder="Name on Card" required name="lname" class="name">
                        <i class="fa fa-user icon"></i>
                    </div>
                </div>
                <div class="input_group">
                    <div class="input_box">
                        <input type="email" placeholder="Email Address" name="email" required class="name">
                        <i class="fa fa-envelope icon"></i>
                    </div>
                </div>
                <div class="input_group">
                    <div class="input_box">
                        <input type="text" placeholder="Address" required name="address" class="name">
                        <i class="fa fa-map-marker icon" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="input_group">
                    <div class="input_box">
                        <input type="text" placeholder="City" name="city" required class="name">
                        <i class="fa fa-institution icon"></i>
                    </div>
                </div>
                <!-- Account Information End -->

                <!-- DOB & Gender Start -->
                <div class="input_group">
                    <div class="input_box">
                        <h4>Date Of Birth</h4>
                        <input type="text" name="dob_day" placeholder="DD" required class="dob">
                        <input type="text" name="dob_month" placeholder="MM" required class="dob">
                        <input type="text" name="dob_year" placeholder="YYYY" required class="dob">
                    </div>
                    <div class="input_box">
                        <h4>Gender</h4>
                        <input type="radio" name="gender" class="radio" id="b1" value="Male" checked>
                        <label for="b1">Male</label>
                        <input type="radio" name="gender" class="radio" id="b2" value="Female">
                        <label for="b2">Female</label>
                    </div>
                </div>
                <!-- DOB & Gender End -->

                <!-- Payment Details Start -->
                <div class="input_group">
                    <div class="input_box">
                        <h4>Payment Details</h4>
                        <input type="radio" name="pay" class="radio" id="bc1" value="Credit Card" checked>
                        <label for="bc1"><span>
                                <i class="fa fa-cc-visa"></i>Credit Card</span></label>
                        <input type="radio" name="pay" class="radio" id="bc2" value="Paypal">
                        <label for="bc2"><span>
                                <i class="fa fa-cc-paypal"></i>Paypal</span></label>
                    </div>
                </div>
                <div class="input_group">
                    <div class="input_box">
                        <input type="tel" name="card_number" class="name" placeholder="Card Number 1111-2222-3333-4444" required>
                        <i class="fa fa-credit-card icon"></i>
                    </div>
                </div>
                <div class="input_group">
                    <div class="input_box">
                        <input type="tel" name="card_cvc" class="name" placeholder="Card CVC 632" required>
                        <i class="fa fa-user icon"></i>
                    </div>
                </div>
                <div class="input_group">
                    <div class="input_box">
                        <input type="number" name="exp_month" placeholder="Exp Month" required class="name">
                        <i class="fa fa-calendar icon" aria-hidden="true"></i>
                    </div>
                    <div class="input_box">
                        <input type="number" name="exp_year" placeholder="Exp Year" required class="name">
                        <i class="fa fa-calendar-o icon" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="input_box">
                    <input type="number" name="amount" placeholder="Enter Amount" required class="name">
                    <i class="fa fa-money icon" aria-hidden="true"></i>
                </div>
                <!-- Payment Details End -->

                <div class="input_group">
                    <div class="input_box">
                        <button type="submit"><a href="ticket.jsp">PAY NOW</a></button>
                    </div>
                </div>
            </form>




        </div>


    </body>

</html>