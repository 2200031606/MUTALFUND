<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin View - Users & Fund Advisors</title>
    <style>
        /* Base Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f5f7;
            color: #333;
        }

        /* Main Wrapper */
        #main-wrapper {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Navigation Header */
        .nav-header {
            background-color: #007bff;
            color: white;
            display: flex;
            align-items: center;
            padding: 20px 30px;
        }

        .nav-header h1 {
            font-size: 1.5rem;
            padding-left: 20%;
            padding-top: 8%;
        }

        .nav-control .hamburger {
            display: none;
        }

        /* Header */
        .header {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h4 {
            font-size: 1.5rem;
            margin: 0;
        }

        .navbar-nav {
            list-style: none;
            display: flex;
            margin: 0;
        }

        .navbar-nav .nav-item {
            margin-left: 20px;
        }

        .navbar-nav .nav-item a {
            text-decoration: none;
            color: #333;
            font-size: 1rem;
        }

        .header-profile .dropdown-menu {
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #fff;
            border-radius: 4px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 200px;
            z-index: 1000;
        }

        .header-profile .dropdown-item {
            padding: 10px;
            text-decoration: none;
            color: #333;
            font-size: 1rem;
            display: block;
        }

        .header-profile .dropdown-item:hover {
            background-color: #007bff;
            color: white;
        }

        .quixnav {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
            flex-shrink: 0;
        }

        .quixnav .metismenu {
            list-style: none;
            padding-left: 20px;
        }

        .quixnav .metismenu li {
            padding: 10px 0;
        }

        .quixnav .metismenu li a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
        }

        .quixnav .metismenu li a:hover {
            background-color: #34495e;
            padding-left: 30px;
        }

        .quixnav .metismenu li .has-arrow {
            cursor: pointer;
        }

        .quixnav .metismenu li .has-arrow:after {
            content: ' ▼';
        }

        .quixnav .metismenu li ul {
            list-style: none;
            padding-left: 20px;
            display: none;
        }

        .quixnav .metismenu li a:focus + ul {
            display: block;
        }

    </style>
</head>

<body>
    <div id="main-wrapper">
        <div class="nav-header">
            <a href="/">
                <h1 class="d-flex align-items-center">EverGrow</h1>
            </a>
            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>

        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <h4>Admin Panel</h4>
                        </div>
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="admin-profile" class="dropdown-item">
                                        <i class="icon-user"></i> <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="logout" class="dropdown-item">
                                        <i class="icon-key"></i> <span class="ml-2">Logout </span>
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
                    <li><a href="admin-dashboard"><i class="icon icon-single-04"></i> <span class="nav-text">Dashboard</span></a></li>
                    <li><a href="javascript:void()" class="has-arrow"><i class="icon icon-app-store"></i> <span class="nav-text">Manage Users</span></a>
                        <ul aria-expanded="false">
                            <li><a href="viewAllInvestors">View All Users</a></li>
                            <li><a href="adminuseractivites">User Activity Logs</a></li>
                            <li><a href="addFunds">Add Funds</a></li>
                            <li><a href="viewAllFunds">View All Funds</a></li>
                        </ul>
                    </li>
                    <li><a href="adminfeedback"><i class="icon icon-comment"></i> <span class="nav-text">Feedback and Reviews</span></a></li>
                </ul>
            </div>
        </div>
    </div>
</body>

</html>
