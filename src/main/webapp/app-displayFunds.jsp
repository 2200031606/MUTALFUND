<%@ page import="com.klef.jfsd.springboot.sdp.service.InvestorServiceImpl" %>
<%@ page import="com.klef.jfsd.springboot.sdp.model.Cart" %>

<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    }
%>

<%@ include file="app-header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Funds</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            width: 85%;
            margin: 20px auto;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .col-12 {
            width: 100%;
        }

        .card {
            background-color: #ffffff;
            border-radius: 8px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
            width: 100%;
            box-sizing: border-box;
        }

        .card-header {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }

        .card-body {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 16px;
        }

        .card-body img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 15px;
            border-radius: 50%;
        }

        .card-body b {
            display: block;
            margin-bottom: 8px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            color: #fff;
            text-align: center;
            cursor: pointer;
            border: none;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .mt-3 {
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="row">
                <!-- Loop through the funds passed from the controller -->
                <c:forEach items="${funds}" var="fund">
                    <div class="col-12 mb-4">
                        <div class="card">
                            <div class="card-header">
                                <c:out value="${fund.fundName}" />
                            </div>
                            <div class="card-body">
                                <!-- Display the image -->
                                <img src="/fundImages/growwlogo.png" alt="Fund Image">
                                <div>
                                    <b>Category: <c:out value="${fund.category}" /></b>
                                    <b>NAV: <c:out value="${fund.nav}" />%</b>
                                    <b>Expense Ratio: <c:out value="${fund.expenseRatio}" />%</b>
                                    <b>Risk Level: <c:out value="${fund.riskLevel}" />%</b>
                                </div>
                                <div class="mt-3" style="text-align: right;">
                                    <button class="btn btn-primary">Quick Invest</button>
                                    <form action="/addToCart" method="POST" style="display: inline;">
                                        <input type="hidden" name="iid" value="<c:out value='${investor.id}' />" />
                                        <input type="hidden" name="fid" value="<c:out value='${fund.id}' />" />
                                        <button type="submit" class="btn btn-secondary">Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

</body>
</html>
