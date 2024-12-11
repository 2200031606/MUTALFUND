<%@page import="com.klef.jfsd.springboot.sdp.model.MutualFund"%>
<%@page import="java.util.List"%>
<%
    // Ensure the user is logged in
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    }

    // Get the list of funds and any error messages
    List<MutualFund> funds = (List<MutualFund>) session.getAttribute("funds");
    String error = (String) session.getAttribute("message");
    session.removeAttribute("message");
%>

<%@ include file="app-header.jsp" %>

<!-- Add custom CSS for styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
    }

    .content-body {
        padding: 30px;
    }

    .page-titles {
        margin-bottom: 30px;
    }

    .breadcrumb {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .breadcrumb-item {
        display: inline-block;
        margin-right: 5px;
    }

    .breadcrumb-item a {
        text-decoration: none;
        color: #007bff;
    }

    .breadcrumb-item a:hover {
        text-decoration: underline;
    }

    .card {
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    .card-header {
        background-color: #f8f9fa;
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }

    .card-body {
        padding: 20px;
    }

    .card-title {
        font-size: 18px;
        font-weight: bold;
        margin: 0;
    }

    .welcome-text {
        font-size: 24px;
        font-weight: bold;
        color: #333;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
    }

    .col-lg-6, .col-sm-6 {
        width: 50%;
        padding: 15px;
    }

    .table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    .table th, .table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .table th {
        background-color: #f8f9fa;
    }

    .btn-primary {
        background-color: #007bff;
        color: white;
        padding: 8px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .text-center {
        text-align: center;
        margin-top: 20px;
    }

    .breadcrumb-item + .breadcrumb-item::before {
        content: ">";
        margin-left: 5px;
        color: #6c757d;
    }
</style>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Compare Funds</h4>
                    <span class="ml-1">Choose funds to compare their performance</span>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Fund Options</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Fund Comparer</a></li>
                </ol>
            </div>
        </div>
        
        <!-- Comparison Section -->
        <div class="row">
            <%
                for (MutualFund fund : funds) {
            %>
                <div class="col-lg-6 col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><%= fund.getFundName() %></h4>
                        </div>
                        <div class="card-body">
                            <b>Fund Name:</b> <%= fund.getFundName() %> <br>
                            <b>Returns:</b> <%= fund.getExpenseRatio() %> <br>
                            <b>Risk Level:</b> <%= fund.getRiskLevel() %> <br>
                            <div style="float: right;">
                                <form action="addToCompare" method="post">
                                    <input type="hidden" name="fundId" value="<%= fund.getId() %>">
                                    <button type="submit" class="btn-primary">Add to Compare</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                }
            %>
        </div>

        <!-- Comparison Results Section -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Comparison Result</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <%
                                List<MutualFund> selectedFunds = (List<MutualFund>) session.getAttribute("selectedFunds");
                                if (selectedFunds != null && selectedFunds.size() == 2) {
                                    MutualFund fund1 = selectedFunds.get(0);
                                    MutualFund fund2 = selectedFunds.get(1);
                            %>
                                <div class="col-md-6">
                                    <table class="table">
                                        <thead>
                                            <tr><th>Attribute</th><th><%= fund1.getFundName() %></th></tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Fund Size</td><td><%= fund1.getExpenseRatio() %></td></tr>
                                            <tr><td>Expense Ratio</td><td><%= fund1.getExpenseRatio() %></td></tr>
                                            <tr><td>Risk Level</td><td><%= fund1.getRiskLevel() %></td></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <table class="table">
                                        <thead>
                                            <tr><th>Attribute</th><th><%= fund2.getFundName() %></th></tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Fund Size</td><td><%= fund2.getExpenseRatio() %></td></tr>
                                            <tr><td>Expense Ratio</td><td><%= fund2.getExpenseRatio() %></td></tr>
                                            <tr><td>Risk Level</td><td><%= fund2.getRiskLevel() %></td></tr>
                                        </tbody>
                                    </table>
                                </div>
                            <%
                                } else {
                            %>
                                <div class="text-center">Please select two funds to compare.</div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
</body>
</html>
