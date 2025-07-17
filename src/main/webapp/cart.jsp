<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Connection, java.sql.SQLException" %>
<%@ page import="java.util.*" %>
<%@ page import="cn.techtutorial.connection.DbCon" %>
<%@ page import="cn.techtutorial.model.user" %>
<%@ page import="cn.techtutorial.model.Cart" %>
<%@ page import="cn.techtutorial.dao.ProductDao" %>

<%
user auth = (user) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
Connection con = null; // Connection object එක මෙහිදී declare කරන්න
String errorMessage = null; // Error messages සඳහා

try {
    if (cart_List != null && !cart_List.isEmpty()) { // cart_List එක හිස් නොවේ නම් පමණක් database මෙහෙයුම් සිදු කරන්න
        con = DbCon.getConnection(); // Database connection එක ලබා ගනී
        ProductDao pDao = new ProductDao(con); // ProductDao object එකට connection එක ලබා දෙයි
        cartProduct = pDao.getCartProducts(cart_List); // Cart products ලබා ගනී
        request.setAttribute("cartProduct", cartProduct); // cartProduct list එක request attribute එකක් ලෙස set කරන්න
    } else {
        cartProduct = new ArrayList<>(); // cart_List එක null හෝ empty නම්, cartProduct හිස් list එකක් ලෙස සකසයි
    }

} catch (ClassNotFoundException e) {
    e.printStackTrace();
    errorMessage = "Database driver not found. Please contact support.";
    cartProduct = new ArrayList<>(); // Error වලදීත් list එක null නොවීමට
} catch (SQLException e) {
    e.printStackTrace();
    errorMessage = "Database error: " + e.getMessage();
    cartProduct = new ArrayList<>(); // Error වලදීත් list එක null නොවීමට
} catch (Exception e) { // වෙනත් ඕනෑම unexpected error එකක් හසුරුවයි
    e.printStackTrace();
    errorMessage = "An unexpected error occurred: " + e.getMessage();
    cartProduct = new ArrayList<>(); // Error වලදීත් list එක null නොවීමට
} finally {
    // Database connection එක වසා දැමීම අත්‍යවශ්‍යයි
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace(); // Connection closing error log කරන්න
        }
    }
}

// Error message එක request attribute එකක් ලෙස set කරන්න
if (errorMessage != null) {
    request.setAttribute("errorMessage", errorMessage);
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Cart Page</title>
    <%@ include file="includes/head.jsp" %>
    <style type="text/css">
        .table tbody td {
            vertical-align: middle;
        }
        .btn-incre, .btn-decre {
            box-shadow: none;
            font-size: 25px;
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    <div class="container">
        <div class="d-flex py-3">
           <%
    double total = 0;
    if (cartProduct != null) {
        for (Cart c : cartProduct) {
            total += c.getPrice() * c.getQuantity();
        }
    }
    session.setAttribute("totalAmount", total);  // session එකේ store කරයි
%>

            <h3>Total Price: Rs: <%= String.format("%.2f", total) %></h3>
            <a class="mx-3 btn btn-primary" href="registation.jsp">Check Out</a> 
        </div>

        <% 
        // Error message එක display කරන්න
        if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity & Buy</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (cartProduct != null && !cartProduct.isEmpty()) { // cartProduct හිස්දැයි පරීක්ෂා කරයි
                    for (Cart c : cartProduct) {
                %>
                <tr>
                    <td><%= c.getName() %></td>
                    <td><%= c.getCategory() %></td>
                    <td><%= String.format("%.2f", c.getPrice()) %> Rs</td>
                         
                    <td>
                        <form action="order-now" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%= c.getId() %>">
                            <div class="form-group d-flex justify-content-between w-50">
                                <a class="btn btn-sm btn-incre" href="quantity-decrease?id=<%= c.getId() %>">
                                    <i class="fa-solid fa-minus-square" style="color: blue;"></i>
                                </a>
                                <input type="text" name="quantity" class="form-control w-50" value="<%= c.getQuantity() %>" readonly>
                                <a class="btn btn-sm btn-decre" href="quantity-increase?id=<%= c.getId() %>">
                                    <i class="fa-solid fa-plus-square" style="color: blue;"></i>
                                </a>
                                <button type="submit" class="btn btn-primary btn-sm">Buy</button> 
                            </div>
                        </form>
                    </td>
                    <td>
                        <a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%= c.getId() %>">Remove</a>
                    </td>
                </tr>
                <%
                    }
                } else { %>
                <tr>
                    <td colspan="5" class="text-center text-info">Your cart is empty!</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <%@ include file="includes/footer.jsp" %>
</body>
</html>