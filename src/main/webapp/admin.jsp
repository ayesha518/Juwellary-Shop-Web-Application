<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Connection, java.sql.SQLException, cn.techtutorial.connection.DbCon" %>
<%@ page import="cn.techtutorial.dao.ProductDao" %>
<%@ page import="cn.techtutorial.model.*" %>
<%@ page import="java.util.*" %>

<%
// User authentication from session
user auth = (user) request.getSession().getAttribute("auth");
if(auth != null){
    // "auth" user object එක request attribute එකක් ලෙස set කිරීම
    // මෙය අනිවාර්ය නොවේ, session එකෙන් කෙලින්ම භාවිතා කළ හැක.
    // කෙසේ වෙතත්, ඔබගේ අනෙකුත් jsp files මගින් request attribute එකක් ලෙස අපේක්ෂා කරන්නේ නම්, මෙය තබා ගන්න.
    request.setAttribute("auth", auth);
}

List<product> products = null; // products list එක ආරම්භයේදී null ලෙස සකසයි
Connection con = null; // Connection object එකත් null ලෙස සකසයි

try {
    con = DbCon.getConnection(); // Database Connection එක ලබා ගනී
    ProductDao pd = new ProductDao(con); // ProductDao object එක සාදයි
    products = pd.getAllProduct(); // සියලුම නිෂ්පාදන ලබා ගනී

} catch (ClassNotFoundException e) {
    e.printStackTrace();
    // Log the error or display a user-friendly message
    // System.out.println("Database driver not found: " + e.getMessage());
    request.setAttribute("errorMessage", "Database driver not found. Please contact support.");

} finally {
    // Connection එක වසා දැමීම අත්‍යවශ්‍යයි
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

// Fallback: if products list is still null (due to error), assign empty to avoid NullPointerException
if (products == null) {
    products = new ArrayList<>();
}

// Cart List handling
ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_List != null) {       
        request.setAttribute("cart_List", cart_List);       
    } 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Shopping Cart!</title>
    <%@ include file="includes/head.jsp" %>
   <style>
.sale-heading {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 32px;
    color: #e74c3c; /* bright red */
    text-align: center;
    background: linear-gradient(to right, #ffe6e6, #fff5f5);
    padding: 15px 25px;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    margin: 20px auto;
    width: fit-content;
    transition: transform 0.3s ease;
}

.sale-heading:hover {
    transform: scale(1.05);
}


</style>

</head>

<body>
    <%@ include file="includes/navbar2.jsp" %>
     <%@ include file="includes/slider.jsp" %>
       <div class="container">    
       <h2 class="sale-heading">All Product</h2>
      
<div class="row">
<% 
// Display error message if any
if (request.getAttribute("errorMessage") != null) { %>
    <div class="col-12">
        <p class="alert alert-danger"><%= request.getAttribute("errorMessage") %></p>
    </div>
<% } 
// Display products
if (!products.isEmpty()) {
     for (product p : products) {
%>
    <div class="col-md-3 my-3">
      <div class="card w-100" style="width: 18rem;">
       <img class="card-img-top" src="product-images/<%= p.getImage() %>" alt="<%= p.getName() %>" width="100">
        <div class="card-body">
          <h5 class="card-title"><%= p.getName() %></h5>
          <h6 class="price">Price: Rs.<%= String.format("%.2f", p.getPrice()) %></h6>

          <h6 class="category">Category: <%= p.getCategory() %></h6>
          <div class="mt-3 d-flex justify-content-between">
            <a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
            <a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Buy Now</a>
          </div>    
        </div> 
      </div>
    </div>
<%   } // end for
   } else { %>
    <div class="col-12">
      <p class="text-danger">No products found.</p>
    </div>
<% } %>
</div>


     </div>
      
   <%@ include file="includes/banner.jsp" %>
  
       
              <%@ include file="includes/instegram.jsp" %>
  
        <%@ include file="footer1.jsp" %>
                       
    <%@ include file="includes/footer.jsp" %>
</body>
</html>