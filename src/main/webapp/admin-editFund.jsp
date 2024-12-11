<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.sdp.model.MutualFund"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Edit Fund Details</title>
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
        }

        .content-body {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .page-titles .welcome-text h4 {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 20px;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
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
            padding: 8px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .form-control:focus {
            border-color: #007bff;
            background-color: #fff;
            outline: none;
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

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        img {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles mx-0">
                <div class="col-sm-6">
                    <div class="welcome-text">
                        <h4>Edit Fund Details</h4>
                    </div>
                </div>
            </div>

            <!-- Edit Fund Form -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Edit Mutual Fund
                        </div>
                        <div class="card-body">
                            <form action="admin-updatefund" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${fund.id}" />

                                <div class="form-group">
                                    <label>Fund Name</label>
                                    <input type="text" class="form-control" name="fundName" value="${fund.fundName}" required />
                                </div>
                                
                                <div class="form-group">
                                    <label>Category</label>
                                    <input type="text" class="form-control" name="category" value="${fund.category}" required />
                                </div>
                                
                                <div class="form-group">
                                    <label>NAV (₹)</label>
                                    <input type="number" step="0.01" class="form-control" name="nav" value="${fund.nav}" required />
                                </div>
                                
                                <div class="form-group">
                                    <label>Expense Ratio (%)</label>
                                    <input type="number" step="0.01" class="form-control" name="expenseRatio" value="${fund.expenseRatio}" required />
                                </div>
                                
                                <div class="form-group">
                                    <label>Risk Level</label>
                                    <select class="form-control" name="riskLevel" required>
                                        <option value="High" <c:if test="${fund.riskLevel == 'High'}">selected</c:if>>High</option>
                                        <option value="Medium" <c:if test="${fund.riskLevel == 'Medium'}">selected</c:if>>Medium</option>
                                        <option value="Low" <c:if test="${fund.riskLevel == 'Low'}">selected</c:if>>Low</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Launch Date</label>
                                    <input type="date" class="form-control" name="launchDate" value="${fund.launchDate}" required />
                                </div>

                                <div class="form-group">
                                    <label>Fund Image (JPEG or PNG only)</label>
                                    <input type="file" class="form-control" name="fundImage" accept="image/jpeg, image/png" />
                                    <c:if test="${not empty fund.imagePath}">
                                        <p>Current Image: <img src="${fund.imagePath}" alt="Fund Image" style="width: 100px; height: auto;" /></p>
                                    </c:if>
                                </div>

                                <button type="submit" class="btn">Update Fund</button>
                                <a href="admin-viewfunds" class="btn btn-secondary">Cancel</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>
</body>
</html>
