<%@ page import="java.util.*" %>
<%@ page import="cn.techtutorial.model.Cart" %>
<%@ page import="cn.techtutorial.model.user" %>

<%
    user auth = (user) session.getAttribute("auth");
    ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");
    double total = 0;

    if (cart_List != null) {
        for (Cart c : cart_List) {
            total += c.getPrice() * c.getQuantity();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Form</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        .payment-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 25px;
            background: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<%@ include file="includes/navbar2.jsp" %>

<div class="container payment-container">
    <h2 class="text-center mb-4">Cart Payment</h2>
    <form action="payment-process" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="fullname" class="form-control" required value="<%= auth != null ? auth.getName() : "" %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="email" class="form-control" required value="<%= auth != null ? auth.getEmail() : "" %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Shipping Address</label>
            <textarea name="address" class="form-control" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Card Number</label>
            <input type="text" name="card" class="form-control" maxlength="16" placeholder="1234 5678 9012 3456" required>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Expiry Date</label>
                <input type="text" name="expiry" class="form-control" placeholder="MM/YY" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">CVV</label>
                <input type="password" name="cvv" class="form-control" maxlength="4" required>
            </div>
        </div>

        <!-- Total Price Display -->
        <div class="mb-3">
            <h3>Your Total Amount: Rs: <%= total %></h3>
        </div>

        <!-- Hidden input to pass total to servlet -->
        <input type="hidden" name="total" value="<%= total %>">

        <button type="submit" class="btn btn-success w-100">Make Payment</button>
    </form>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
