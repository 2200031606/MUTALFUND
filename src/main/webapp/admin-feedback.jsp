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
    <title>User Feedback and Reviews</title>
    <style>
        /* Base Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            line-height: 1.6;
        }

        .content-body {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .welcome-text h4, .card-title {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 10px;
        }

        .breadcrumb {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 5px;
        }

        .breadcrumb a {
            color: #007bff;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            overflow: hidden;
        }

        .card-header {
            padding: 15px;
            background: #007bff;
            color: #fff;
            font-size: 1.5em;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .form-control:focus {
            border-color: #007bff;
            outline: none;
            background-color: #fff;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .table-responsive {
            overflow-x: auto;
            margin-top: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: #f2f2f2;
            color: #333;
            font-weight: bold;
        }

        .table tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>User Feedback and Reviews</h4>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li><a href="javascript:void(0)">Admin</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Feedback</a></li>
                </ol>
            </div>
        </div>

        <!-- Feedback Form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">Submit Feedback</div>
                    <div class="card-body">
                        <form id="feedback-form">
                            <div class="form-group">
                                <label for="user-id">User ID</label>
                                <input type="text" class="form-control" id="user-id" placeholder="Enter User ID" required>
                            </div>
                            <div class="form-group">
                                <label for="user-name">User Name</label>
                                <input type="text" class="form-control" id="user-name" placeholder="Enter User Name" required>
                            </div>
                            <div class="form-group">
                                <label for="feedback">Feedback</label>
                                <textarea class="form-control" id="feedback" rows="4" placeholder="Write your feedback here..." required></textarea>
                            </div>
                            <button type="submit" class="btn">Submit Feedback</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Feedback and Reviews Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">User Feedback and Reviews</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Feedback ID</th>
                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>Feedback</th>
                                        <th>Timestamp</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>101</td>
                                        <td>John Doe</td>
                                        <td>Great service! Really enjoyed my experience.</td>
                                        <td>2024-10-01 12:00:00</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>102</td>
                                        <td>Jane Smith</td>
                                        <td>Could use some improvements, but overall good.</td>
                                        <td>2024-10-01 12:15:00</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>103</td>
                                        <td>Michael Brown</td>
                                        <td>Had a wonderful time! Will recommend.</td>
                                        <td>2024-10-01 12:30:00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
