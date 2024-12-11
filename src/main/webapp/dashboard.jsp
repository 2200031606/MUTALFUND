<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="app-header.jsp" %>

<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    }
%>

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="card stat-card">
                    <div class="stat-widget-two">
                        <div class="stat-content">
                            <div class="stat-text">Today Expenses</div>
                            <div class="stat-digit"><i class="fa fa-usd"></i> 8500</div>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-bar" style="width: 85%"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="card stat-card">
                    <div class="stat-widget-two">
                        <div class="stat-content">
                            <div class="stat-text">Income Detail</div>
                            <div class="stat-digit"><i class="fa fa-usd"></i> 7800</div>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-bar" style="width: 75%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xl-8 col-lg-8 col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Sales Overview</h4>
                    </div>
                    <div class="card-body">
                        <div id="morris-bar-chart"></div>
                    </div>
                </div>
            </div>

            <div class="col-xl-4 col-lg-4 col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="card-title">Customer Feedback</h4>
                        <h2>385749</h2>
                        <div class="widget-card-circle mt-5 mb-5" id="info-circle-card">
                            <i class="ti-control-shuffle"></i>
                        </div>
                        <ul class="widget-line-list">
                            <li class="border-right">92% <br><span class="text-success"><i class="ti-hand-point-up"></i> Positive</span></li>
                            <li>8% <br><span class="text-danger"><i class="ti-hand-point-down"></i> Negative</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="copyright">
        <!-- <p>Copyright © Designed & Developed by <a href="#" target="_blank">Quixkit</a> 2019</p> -->
    </div>
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
<script src="./vendor/raphael/raphael.min.js"></script>
<script src="./vendor/morris/morris.min.js"></script>
<script src="./vendor/circle-progress/circle-progress.min.js"></script>
<script src="./vendor/chart.js/Chart.bundle.min.js"></script>
<script src="./vendor/gaugeJS/dist/gauge.min.js"></script>
<script src="./vendor/flot/jquery.flot.js"></script>
<script src="./vendor/flot/jquery.flot.resize.js"></script>
<script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>
<script src="./js/dashboard/dashboard-1.js"></script>

<style>
    /* Global Styles */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    .content-body {
        padding: 30px;
        background-color: #fff;
        margin-top: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Card Styles */
    .card {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    .stat-card {
        margin-bottom: 30px;
    }

    .stat-widget-two {
        padding: 20px;
    }

    .stat-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .stat-text {
        font-size: 18px;
        color: #333;
    }

    .stat-digit {
        font-size: 22px;
        color: #4CAF50;
    }

    .progress-bar-container {
        margin-top: 10px;
    }

    .progress-bar {
        height: 5px;
        background-color: #4CAF50;
        border-radius: 3px;
    }

    /* Row Styles */
    .row {
        margin-top: 20px;
    }

    .widget-card-circle {
        border-radius: 50%;
        background-color: #e0e0e0;
        width: 100px;
        height: 100px;
        margin: 0 auto;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .widget-line-list {
        list-style: none;
        padding-left: 0;
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }

    .widget-line-list li {
        font-size: 16px;
        color: #333;
    }

    .widget-line-list li span {
        font-size: 14px;
    }

    .widget-line-list li .text-success {
        color: #4CAF50;
    }

    .widget-line-list li .text-danger {
        color: #f44336;
    }

    /* Footer Styles */
    .footer {
        background-color: #2e2e2e;
        color: #fff;
        padding: 20px;
        text-align: center;
    }
</style>

</body>
</html>
