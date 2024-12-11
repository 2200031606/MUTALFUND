<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="admin-header.jsp" />
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("adminlogin");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Mutual Fund</title>
    <style>
        /* Reset styling */
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
            font-size: 16px;
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

        .card {
            width: 100%;
            max-width: 600px;
            margin: 20px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: #007bff;
            padding: 15px;
            color: #fff;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .card-title {
            font-size: 1.6em;
            margin: 0;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        .form-control, .form-control-file, .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
        }

        .form-control-file {
            border: none;
        }

        .form-control:focus, .form-select:focus {
            outline: none;
            border-color: #007bff;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        #result {
            margin-top: 15px;
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
                        <h4>Add Mutual Fund</h4>
                    </div>
                </div>
            </div>

            <!-- Add Mutual Fund Form -->
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <c:out value="${msg}" />
                            <h4 class="card-title">Enter Fund Details</h4>
                        </div>
                        <div class="card-body">
                            <form action="/add-fund" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="fundName">Fund Name:</label>
                                    <input type="text" class="form-control" id="fundName" name="fundName" 
                                        placeholder="Enter fund name" required>
                                </div>

                                <div class="form-group">
                                    <label for="category">Category:</label>
                                    <input type="text" class="form-control" id="category" name="category" 
                                        placeholder="Enter fund category" required>
                                </div>

                                <div class="form-group">
                                    <label for="nav">NAV (₹):</label>
                                    <input type="number" class="form-control" id="nav" name="nav" 
                                        step="0.01" placeholder="Enter NAV value" required>
                                </div>

                                <div class="form-group">
                                    <label for="expenseRatio">Expense Ratio (%):</label>
                                    <input type="number" class="form-control" id="expenseRatio" name="expenseRatio" 
                                        step="0.01" placeholder="Enter expense ratio" required>
                                </div>

                                <div class="form-group">
                                    <label for="riskLevel">Risk Level:</label>
                                    <select class="form-control" id="riskLevel" name="riskLevel" required>
                                        <option value="" disabled selected>Select risk level</option>
                                        <option value="High">High</option>
                                        <option value="Medium">Medium</option>
                                        <option value="Low">Low</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="launchDate">Launch Date:</label>
                                    <input type="date" class="form-control" id="launchDate" name="launchDate" required>
                                </div>

                                <div class="form-group">
                                    <label for="fundImage">Upload Fund Image:</label>
                                    <input type="file" class="form-control-file" id="fundImage" name="fundImage" accept=".jpeg, .jpg, .png" required>
                                </div>

                                <button type="submit">Add Fund</button>
                            </form>

                            <div id="result"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
