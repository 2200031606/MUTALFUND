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

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        color: #333;
    }
    .container-fluid {
        max-width: 900px;
        margin: auto;
        padding: 20px;
    }
    .welcome-text h4 {
        color: #007bff;
        margin-bottom: 20px;
    }
    .card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-top: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card-header {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .card-title {
        margin: 0;
    }
    .card-body {
        padding: 20px;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    .table th, .table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    .table th {
        background-color: #007bff;
        color: #fff;
        width: 30%;
    }
    .btn-secondary {
        background-color: #6c757d;
        color: #fff;
        text-decoration: none;
        padding: 8px 15px;
        border-radius: 5px;
        display: inline-block;
        margin-top: 15px;
    }
    .btn-secondary:hover {
        background-color: #5a6268;
    }
</style>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>User Details</h4>
                </div>
            </div>
        </div>

        <!-- User Details -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Complete User Details</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th>ID:</th>
                                    <td><c:out value="${user.id}"/></td>
                                </tr>
                                <tr>
                                    <th>First Name:</th>
                                    <td><c:out value="${user.firstName}"/></td>
                                </tr>
                                <tr>
                                    <th>Last Name:</th>
                                    <td><c:out value="${user.lastName}"/></td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td><c:out value="${user.email}"/></td>
                                </tr>
                                <tr>
                                    <th>Phone Number:</th>
                                    <td><c:out value="${user.phoneNumber}"/></td>
                                </tr>
                                <tr>
                                    <th>Date of Birth:</th>
                                    <td><c:out value="${user.dob}"/></td>
                                </tr>
                                <tr>
                                    <th>State:</th>
                                    <td><c:out value="${user.state}"/></td>
                                </tr>
                                <tr>
                                    <th>Country:</th>
                                    <td><c:out value="${user.country}"/></td>
                                </tr>
                                <tr>
                                    <th>Proof of Identity:</th>
                                    <td><c:out value="${user.proofOfIdentity}"/></td>
                                </tr>
                                <!-- Add more fields as needed -->
                            </table>
                        </div>
                        <a href="viewAllInvestors" class="btn-secondary">Back to List</a>
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
