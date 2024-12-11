<%@page import="com.klef.jfsd.springboot.sdp.model.Investor"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Invest Mart</title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    <!-- Add custom styles for layout -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }
        #preloader {
            display: none; /* Hide preloader by default */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8) url('./images/loading.gif') center no-repeat;
            z-index: 9999;
        }
        #main-wrapper {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }
        .nav-header {
            background-color: #1e3d58;
            padding: 10px 20px;
        }
        .nav-header h1 {
            color: white;
            font-size: 1.5rem;
            text-align: center;
        }
        .header {
            background-color: #ffffff;
            padding: 10px 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header .navbar .search_bar {
            position: relative;
        }
        .header .navbar .search_icon {
            font-size: 20px;
            cursor: pointer;
        }
        .header .navbar .header-right {
            display: flex;
            align-items: center;
        }
        .header .navbar .header-profile {
            margin-left: 20px;
        }
        .quixnav {
            background-color: #2f3b52;
            width: 250px;
            height: 100vh;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }
        .quixnav-scroll {
            padding-left: 0;
        }
        .quixnav .nav-label {
            font-weight: bold;
            font-size: 1.2rem;
            color: #fff;
            padding: 10px 15px;
        }
        .quixnav ul {
            list-style: none;
            padding: 0;
        }
        .quixnav ul li {
            padding: 10px 15px;
        }
        .quixnav ul li a {
            color: #ffffff;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 1rem;
        }
        .quixnav ul li a:hover {
            background-color: #1a2a3b;
            border-radius: 5px;
            padding: 5px;
        }
        .quixnav .has-arrow i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>

    <div id="main-wrapper">
        <div class="nav-header">
            <a href="/">
                <h1>EverGrow</h1>
            </a>
            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <div class="header">
            <div class="header-content">
                <nav class="navbar">
                    <div class="collapse navbar-collapse">
                        <div class="header-left">
                            <div class="search_bar">
                                <span class="search_icon">
                                    <i class="mdi mdi-magnify"></i>
                                </span>
                                <div class="dropdown-menu">
                                    <form>
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="investorProfile" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile</span>
                                    </a>
                                    <a href="cart" class="dropdown-item">
                                        <i class="mdi mdi-cart"></i>
                                        <span class="ml-2">Cart</span>
                                    </a>
                                    <a href="logout" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">Main Menu</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="icon icon-single-04"></i><span class="nav-text">Dashboard</span></a>
                        <ul aria-expanded="false">
                            <li><a href="dashboard">Dashboard</a></li>
                        </ul>
                    </li>
                    
                    <li class="nav-label">Investment</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="icon icon-briefcase"></i><span class="nav-text">Fund Options</span></a>
                        <ul aria-expanded="false">
                            <li><a href="displayFunds">Add Fund</a></li>
                            <li><a href="fundcalculator">Fund Calculator</a></li>
                            <li><a href="fundcomparer">Fund Comparer</a></li>
                            <li><a href="transactionHistory">Transaction History</a></li>
                            <li><a href="investmentGoals">Manage Goals</a></li>
                            <li><a href="investorWallet">Wallet</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Fund Education</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="icon icon-app-store"></i><span class="nav-text">Educational Contents</span></a>
                        <ul aria-expanded="false">
                            <li><a href="app-videos.jsp">Educational Videos</a></li>
                            <li><a href="app-blogs.jsp">Blogs</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
