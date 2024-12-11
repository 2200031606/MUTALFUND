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
    String msg = (String) session.getAttribute("msg");
    session.removeAttribute("msg");
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
    .card-header h6 {
        margin: 0;
        font-size: 14px;
        color: #f8f9fa;
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
    .btn {
        padding: 5px 10px;
        text-decoration: none;
        color: #fff;
        border-radius: 5px;
        font-size: 14px;
    }
    .btn-warning {
        background-color: #ffc107;
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
                    <h4>Admin - View All Funds</h4>
                </div>
            </div>
        </div>

        <!-- Funds Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h6 class="card-title"><% out.print(msg); %></h6>
                        <h4 class="card-title">All Mutual Funds</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Fund Name</th>
                                        <th>Category</th>
                                        <th>NAV (₹)</th>
                                        <th>Expense Ratio (%)</th>
                                        <th>Risk Level</th>
                                        <th>Launch Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="fund" items="${funds}">
                                        <tr>
                                            <td><c:out value="${fund.id}"/></td>
                                            <td><c:out value="${fund.fundName}"/></td>
                                            <td><c:out value="${fund.category}"/></td>
                                            <td><c:out value="${fund.nav}"/></td>
                                            <td><c:out value="${fund.expenseRatio}"/></td>
                                            <td><c:out value="${fund.riskLevel}"/></td>
                                            <td><c:out value="${fund.launchDate}"/></td>
                                            <td>
                                                <a href="admin-editfund?id=${fund.id}" class="btn btn-warning">Edit</a>
                                                <a href="admin-deletefund?id=${fund.id}" class="btn btn-danger">Delete</a>
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
    </div>
</div>

<!-- Scripts -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
</body>
</html>
