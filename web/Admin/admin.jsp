<%-- 
    Document   : admin
    Created on : Jul 13, 2024, 1:18:01 PM
    Author     : sobi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
            />
        <!-- Font Awesome CSS -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <title>CinemaGate-Admin</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4;
            }
            .sidebar {
                margin: 0;
                padding: 0;
                width: 250px;
                background-color: #343a40;
                position: fixed;
                height: 100%;
                overflow: auto;
                transition: width 0.3s;
            }
            .sidebar a {
                display: block;
                color: white;
                padding: 18px;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
                font-size: 1.1rem;
            }
            .sidebar img {
                margin-top: 20px;
                margin-left: 75px;
                width: 100px;
                height: 100px;
                border-radius: 50%;
                border: 3px solid #fff;
                margin-bottom: 20px;
            }
            .sidebar a.active {
                background-color: maroon;
                color: white;
            }
            .sidebar a:hover:not(.active) {
                background-color: #575d63;
                color: white;
            }
            .sidebar a i {
                margin-right: 10px;
            }
            .content {
                margin-left: 250px;
                padding: 20px;
                height: 100vh;



            }
            .h1hed {

                font-size: 3rem;
                font-weight: 700;
                color: maroon;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            }
            .container {
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            }

            .team .member {
                background: linear-gradient( #800000, #000000);
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
                padding: 30px;
                margin: 15px;
                margin-top: 50px;
                transition: transform 0.3s;
            }
            .team .member:hover {
                transform: translateY(-10px);
            }
            .team .member-img {
                height: 200px;
                position: relative;
                overflow: hidden;
                border-radius: 50%;
                margin-bottom: 15px;
            }
            .team .member-img img {
                transition: all 0.3s;
            }
            .team .member:hover img {
                transform: scale(1.1);
            }
            .team .member-info h4 {
                font-size: 18px;
                font-weight: bold;
                color: #fff;
                margin: 10px 0 5px;
            }
            .team .member-info span {
                display: block;
                font-size: 16px;
                color:#fff;
            }
            @media screen and (max-width: 700px) {
                .sidebar {
                    width: 100%;
                    height: auto;
                    position: relative;
                }
                .sidebar a {
                    float: left;
                    width: 100%;
                }
                .content {
                    margin-left: 0;
                }
            }
            @media screen and (max-width: 400px) {
                .sidebar a {
                    text-align: center;
                    float: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <img src="./images/Admin.jpg" alt="Admin">
            <a class="active" href="./admin.jsp"><i class="fas fa-tachometer-alt"></i> DashBoard</a>
            <a href="./addmovie.jsp"><i class="fas fa-plus"></i> Add Movie</a>
            <a href="./view.jsp"><i class="fas fa-eye"></i> View Movies</a>
            <a href="./search.jsp"><i class="fas fa-search"></i> Search Movies</a>
            <a href="./update.jsp"><i class="fas fa-edit"></i> Update Movies</a>
            <a href="./viewusers.jsp"><i class="fas fa-user"></i>View Users</a>
            <a href="viewbooking.jsp"><i class="fas fa-ticket"></i>Bookings</a>
            <a  href="viewpayment.jsp"><i class="fas fa-money-check-alt"></i>Payments</a>
            <a href="./adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>

        </div>
        <div class="content">
            <div class="container mt-5">
                <h1 class="text-center h1hed">Our Team</h1>
                <br>
                <hr>
                <!--Team Section-->
                <section id="team" class="team">
                    <div class="container" >
                        <div class="row">
                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                <div class="member" data-aos="fade-up" data-aos-delay="100">
                                    <div class="member-img">
                                        <img src="./images/Sobi.jpeg" class="img-fluid" alt="">
                                    </div>
                                    <div class="member-info">
                                        <h4>P.Sobiya</h4>
                                        <span style="font-size: 10px; font-weight: bold;">UWU/CST/21/006</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                <div class="member" data-aos="fade-up" data-aos-delay="100">
                                    <div class="member-img">
                                        <img src="images/Asiri.jpeg" class="img-fluid" alt="">
                                    </div>
                                    <div class="member-info">
                                        <h4>W.D.V.A.Weerasinghe</h4>
                                        <span style="font-size: 10px; font-weight: bold;">UWU/CST/21/050</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                <div class="member" data-aos="fade-up" data-aos-delay="100">
                                    <div class="member-img">
                                        <img src="images/Satalan.jpeg" class="img-fluid" alt="" style="">
                                    </div>
                                    <div class="member-info">
                                        <h4>A.Satalan</h4>
                                        <span style="font-size: 10px; font-weight: bold;">UWU/CST/21/078</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                <div class="member" data-aos="fade-up" data-aos-delay="100">
                                    <div class="member-img">
                                        <img src="images/Dewmini.jpeg" class="img-fluid" alt="">
                                    </div>
                                    <div class="member-info">
                                        <h4>W.M.M.Dewmini</h4>
                                        <span style="font-size: 10px; font-weight: bold;">UWU/CST/21/089</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div> 
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>
