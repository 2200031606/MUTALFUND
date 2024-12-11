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
        max-width: 1200px;
        margin: auto;
        padding: 20px;
    }
    .welcome-text h4 {
        color: #007bff;
    }
    .card {
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-top: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card-header {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        font-size: 18px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
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
    }
    .badge {
        padding: 5px 10px;
        border-radius: 5px;
        color: #fff;
        font-size: 12px;
    }
    .badge-success {
        background-color: #28a745;
    }
    .badge-danger {
        background-color: #dc3545;
    }
    .btn {
        padding: 5px 10px;
        text-decoration: none;
        color: #fff;
        border-radius: 5px;
        font-size: 14px;
    }
    .btn-primary {
        background-color: #007bff;
    }
    .btn-success {
        background-color: #28a745;
    }
    .btn-danger {
        background-color: #dc3545;
    }
</style>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Admin - View Users and Fund Advisors</h4>
                    <h3><c:out value="${msg}"/></h3>
                </div>
            </div>
        </div>

        <!-- Users Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">All Users</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>Verification Status</th>
                                        <th></th>
                                        <th>Action</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="investor" items="${investors}">
                                        <tr>
                                            <td><c:out value="${investor.id}"/></td>
                                            <td><c:out value="${investor.firstName} ${investor.lastName}"/></td>
                                            <td><c:out value="${investor.email}"/></td>
                                            <td><c:out value="${investor.phoneNumber}"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${investor.verified}">
                                                        <span class="badge badge-success">Verified</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-danger">Not Verified</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:if test="${!investor.verified}">
                                                    <a href="admin-verifyuser?id=${investor.id}" class="btn btn-success">Verify</a>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="admin-viewuserdetails?id=${investor.id}" class="btn btn-primary">View Details</a>
                                            </td>
                                            <td>
                                                <a href="admin-deleteuser?id=${investor.id}" class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Fund Advisors Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">All Fund Advisors</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Specialization</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Alice Brown</td>
                                        <td>alice@example.com</td>
                                        <td>Equity Funds</td>
                                        <td><button class="btn btn-danger">Remove</button></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Bob White</td>
                                        <td>bob@example.com</td>
                                        <td>Debt Funds</td>
                                        <td><button class="btn btn-danger">Remove</button></td>
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

<!-- Scripts -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
</body>
</html>
