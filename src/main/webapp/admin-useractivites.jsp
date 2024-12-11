<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.sdp.model.ActivityLogs"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="admin-header.jsp" />

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        session.setAttribute("message", "Please login to access the Admin Dashboard.");
        response.sendRedirect("adminlogin");
        return; 
    }
%>

<%@ include file="app-header.jsp" %>

<style>
    body {
        font-family: Arial, sans-serif;
        color: #333;
        background-color: #f8f9fa;
    }
    .container-fluid {
        max-width: 1200px;
        margin: auto;
        padding: 20px;
    }
    .welcome-text h4 {
        font-size: 24px;
        color: #007bff;
    }
    .breadcrumb {
        list-style: none;
        display: flex;
        gap: 5px;
        font-size: 14px;
        color: #6c757d;
    }
    .breadcrumb a {
        color: #007bff;
        text-decoration: none;
    }
    .card {
        background: #fff;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }
    .card-header {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
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
</style>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>User Activity Logs</h4>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li><a href="javascript:void(0)">Admin</a> /</li>
                    <li class="active"><a href="javascript:void(0)">Activity Logs</a></li>
                </ol>
            </div>
        </div>

        <!-- Activity Logs Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">User Activity Logs</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Log ID</th>
                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>Activity</th>
                                        <th>Timestamp</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="log" items="${activitylogs}">
                                        <tr>
                                            <td>${log.id}</td>
                                            <td>${log.investorId}</td>
                                            <td>${log.investorName}</td>
                                            <td>${log.activity}</td>
                                            <td>${log.timestamp}</td>
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
