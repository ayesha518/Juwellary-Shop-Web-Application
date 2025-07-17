<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body>
    <%@ include file="includes/navbar2.jsp" %>
    <div class="container mt-5 text-center">
        <h3><%= request.getAttribute("message") %></h3>
        <a href="index.jsp" class="btn btn-primary mt-3">Back to Home</a>
    </div>
    <%@ include file="includes/footer.jsp" %>
</body>
</html>
