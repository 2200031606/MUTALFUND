<%@ page import="com.klef.jfsd.springboot.sdp.service.InvestorServiceImpl" %>
<%@ page import="com.klef.jfsd.springboot.sdp.model.Cart" %>

<%
    Investor investor = (Investor) session.getAttribute("investor");
    long id;
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    } else {
        id = investor.getId();
    }
%>

<%@ include file="app-header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
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

        .page-titles {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .welcome-text h4 {
            font-size: 24px;
            font-weight: bold;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #f1f1f1;
            padding: 15px;
            text-align: center;
        }

        .card-body {
            padding: 15px;
            text-align: center;
        }

        .card-body p {
            font-size: 16px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #28a745;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border: none;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .mt-4 {
            margin-top: 30px;
        }

        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="page-titles">
        <div>
            <h4>Your Cart</h4>
            <span>Review your selected funds below.</span>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="row">
                <!-- Iterate through cart items -->
                <c:forEach var="cartItem" items="${cartItems}">
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">${cartItem.fundName}</h4>
                            </div>
                            <div class="card-body">
                                <p><strong>Category:</strong> ${cartItem.category}</p>
                                <p><strong>Net Value Assets:</strong> ${cartItem.nav}%</p>
                                <form action="/removeFromCart" method="POST" style="display: inline;">
                                    <input type="hidden" name="iid" value="<%= id %>" />
                                    <input type="hidden" name="fid" value="${cartItem.id}" />
                                    <button type="submit" class="btn btn-secondary">Remove from Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="row mt-4">
                <div class="col-12 text-center">
                    <button class="btn" onclick="proceedToCheckout()">Proceed to Checkout</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="displayFunds">
                        <button class="btn btn-secondary">Browse Funds</button>
                    </a>
                </div>
            </div>
        </div>
    </div> 
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<script>
    function removeFromCart() {
        alert('Fund removed from cart!');
    }

    function proceedToCheckout() {
        alert('Proceeding to checkout...');
    }
</script>

</body>
</html>
