<%@page import="cn.techtutorial.model. *"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // This part redirects already logged-in users to index.jsp
    // Assuming 'amila' is the session attribute name for a logged-in user
    user auth = (user) request.getSession().getAttribute("auth");
    if(auth !=null){
        response.sendRedirect("index.jsp"); // If logged in, go to index.jsp
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping-cart Login</title>
    <%@include file="includes/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@include file="includes/navbar.jsp" %>
    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">User Login</div>
            <div class="card-body">
                <form action="user-login" method="post">
    <div class="form-group">
        <label>Email Address</label>
        <input type="email" class="form-control" name="email" placeholder="Enter Your Email" required>
    </div><br>
    <div class="form-group">
        <label>Password</label>
        <input type="password" class="form-control" name="password" placeholder="*******" required>
    </div><br>
    <div class="text-center">
        <button type="submit" class="btn btn-primary">Login</button>
    </div>
</form>

            </div>
        </div>
    </div>
<% String registerSuccess = request.getParameter("registerSuccess"); %>
<% if ("true".equals(registerSuccess)) { %>
    <div class="alert alert-success text-center" role="alert">
        Registration successful! Please login.
    </div>
<% } %>

    <%@include file="includes/footer.jsp" %>
</body>
</html>