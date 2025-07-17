<nav class="navbar navbar-expand-lg bg-body-tertiary">

<div class="container">

<a class="navbar-brand d-flex align-items-center" href="index.jsp">

<img src="product-images/logo.webp" alt="Logo" width="100px" height="100px" class="me-2">

<h2>Gold House Juwellary Shop</h2>

</a>

<button class="navbar-toggler" type="button" data-bs-toggle="collapse"

data-bs-target="#navbarSupportedContent"

aria-controls="navbarSupportedContent" aria-expanded="false"

aria-label="Toggle navigation">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse justify-content-end" id="navbarNav">

<ul class="navbar-nav ml-auto">

<li class="nav-item active">

<a class="nav-link" aria-current="page" href="index.jsp">Home</a>

</li>

          <li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle" href="#" id="roomDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
    Product
  </a>
  <ul class="dropdown-menu" aria-labelledby="roomDropdown">
    <li><a class="dropdown-item" href="index.jsp#All Product">Rings</a></li>
    <li><a class="dropdown-item" href="index.jsp#All Product">Necklace</a></li>
    <li><a class="dropdown-item" href="index.jsp#All Product">Bangle</a></li>
    <li><a class="dropdown-item" href="index.jsp#All Product">Others</a></li>
  </ul>
</li>


<li class="nav-item">

<a class="nav-link" href="cart.jsp">Cart</a>

</li>

<%

Object sessionUser = session.getAttribute("auth");

%>

<% if (sessionUser != null) { %>

<li class="nav-item">

<a class="nav-link" href="orders.jsp">Orders</a>

</li>

<li class="nav-item">

<a class="nav-link" href="Log-out.jsp">Logout</a>

</li>

<% } else { %>

<li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownLog" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                   Sign
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownLog">
                    <li><a class="dropdown-item" href="registation.jsp">SignUp</a></li>
                    <li><a class="dropdown-item" href="login.jsp">SignIn</a></li>
                </ul>
            </li>
<% } %>



</ul>

</div>

</div>

</nav>

