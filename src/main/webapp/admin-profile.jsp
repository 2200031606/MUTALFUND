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

<%@ include file="app-header.jsp" %>

<style>
    /* Reset and Base Styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: Arial, sans-serif;
        color: #333;
    }
    .container {
        max-width: 1200px;
        margin: auto;
        padding: 20px;
    }

    /* Header and Breadcrumb */
    .page-titles {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    .page-titles .welcome-text h4 {
        color: #2c3e50;
    }
    .breadcrumb a {
        color: #3498db;
        text-decoration: none;
        margin-right: 5px;
    }
    .breadcrumb a:hover {
        text-decoration: underline;
    }

    /* Profile Section */
    .profile-section {
        display: flex;
        align-items: center;
        background-color: #f8f9fa;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
    }
    .profile-photo img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        margin-right: 20px;
    }
    .profile-info h4 {
        color: #2980b9;
    }

    /* News Section */
    .news-section {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-bottom: 20px;
    }
    .news-section h5 {
        color: #2c3e50;
        margin-bottom: 15px;
    }
    .news-item {
        display: flex;
        margin-bottom: 15px;
    }
    .news-item img {
        width: 50px;
        height: 50px;
        margin-right: 15px;
        border-radius: 5px;
    }

    /* Settings and Tabs */
    .settings-section .tab-list {
        list-style: none;
        display: flex;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    .settings-section .tab-list li {
        margin-right: 15px;
    }
    .settings-section .tab-list a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }
    .settings-section .tab-list a:hover {
        color: #3498db;
    }
    .tab-content {
        display: none;
        margin-top: 20px;
    }
    .tab-content.active {
        display: block;
    }
</style>

<div class="content-body">
    <div class="container">
        <div class="page-titles">
            <div class="welcome-text">
                <h4>Hi, <c:out value="${admin.firstName}" /> <c:out value="${admin.lastName}" />! Welcome back!</h4>
                <h4> <c:out value="${ errorMessage }"></c:out> </h4>
                <p>Happy Investment!</p>
            </div>
            <div class="breadcrumb">
                <a href="#">App</a> / <a href="#">Profile</a>
            </div>
        </div>
        
        <div class="profile-section">
            <div class="profile-photo">
                <img src="images/profile/profile.png" alt="Profile Photo">
            </div>
            <div class="profile-info">
                <h4><c:out value="${admin.firstName}" /> <c:out value="${admin.lastName}" /></h4>
                <p>Admin</p>
                <p>Email: <c:out value="${admin.email}" /></p>
                <p>Phone: <c:out value="${admin.phoneNumber}" /></p>
            </div>
        </div>

        <div class="news-section">
            <h5>Mutual Funds Latest News</h5>
            <div class="news-item">
                <img src="images/profile/5.jpg" alt="Market Insights">
                <div>
                    <h5>Market Insights</h5>
                    <p>Experts predict a bullish trend for mutual funds...</p>
                </div>
            </div>
            <!-- Additional news items here -->
        </div>

        <div class="settings-section">
            <ul class="tab-list">
                <li><a href="#about-me">About Me</a></li>
                <li><a href="#profile-settings">Settings</a></li>
            </ul>
            <div id="about-me" class="tab-content active">
                <h4>About Me</h4>
                <p><c:out value="${admin.firstName}" /> <c:out value="${admin.lastName}" /> is an admin.</p>
            </div>
            <div id="profile-settings" class="tab-content">
                <h4>Account Settings</h4>
                <form action="updateadminprofile" method="post">
                    <!-- Form fields remain unchanged -->
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // JavaScript for tab switching
    document.querySelectorAll('.tab-list a').forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));
            document.querySelector(this.getAttribute('href')).classList.add('active');
        });
    });
</script>
