<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="admin-header.jsp" />

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        session.setAttribute("message", "Please login to access the Admin Dashboard.");
        response.sendRedirect("adminlogin");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f5f7;
            color: #333;
            line-height: 1.6;
        }

        .content-body {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .page-titles .welcome-text h4 {
            font-size: 1.8em;
            color: #333;
        }

        .breadcrumb {
            list-style: none;
            display: flex;
            gap: 8px;
        }

        .breadcrumb-item a {
            text-decoration: none;
            color: #007bff;
        }

        .breadcrumb-item.active a {
            color: #555;
            pointer-events: none;
        }

        .card {
            margin: 15px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .card-title {
            font-size: 1.5em;
            margin: 0;
        }

        .card-body {
            padding: 20px;
            text-align: center;
        }

        .card-body p {
            font-size: 1em;
            color: #555;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        #result {
            margin-top: 15px;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles mx-0">
                <div class="col-sm-6">
                    <div class="welcome-text">
                        <h4>Admin Dashboard</h4>
                    </div>
                </div>
                <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Dashboard</a></li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <!-- Manage Users Card -->
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Manage Users</h4>
                        </div>
                        <div class="card-body">
                            <p>View and manage all registered users in the system.</p>
                            <a href="viewAllInvestors" class="btn">View Users</a>
                        </div>
                    </div>
                </div>

                <!-- Manage Funds Card -->
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Manage Funds</h4>
                        </div>
                        <div class="card-body">
                            <p>View and manage all mutual funds in the system.</p>
                            <a href="addFunds" class="btn">Manage Funds</a>
                        </div>
                    </div>
                </div>

                <!-- Manage Fund Advisors Card -->
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Manage Fund Advisors</h4>
                        </div>
                        <div class="card-body">
                            <p>View and manage all registered fund advisors.</p>
                            <a href="./admin-advisors.html" class="btn">View Advisors</a>
                        </div>
                    </div>
                </div>

                <!-- Manage Events Card -->
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Manage Events</h4>
                        </div>
                        <div class="card-body">
                            <p>Create, update, and delete events for users and advisors.</p>
                            <a href="./admin-events.html" class="btn">Manage Events</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function calculateReturns() {
            const investment = document.getElementById('investment').value;
            const rate = document.getElementById('rate').value;
            const years = document.getElementById('years').value;

            if (investment && rate && years) {
                const totalReturns = investment * Math.pow(1 + (rate / 100), years);
                document.getElementById('result').innerHTML = 
                    `<h5>Total Returns: ₹${totalReturns.toFixed(2)}</h5>`;
            } else {
                document.getElementById('result').innerHTML = '<h5>Please enter valid values</h5>';
            }
        }
    </script>

    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>
</body>
</html>
