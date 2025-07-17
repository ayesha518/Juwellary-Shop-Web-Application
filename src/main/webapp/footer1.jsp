<!-- footer.jsp -->
<footer class="footer">
  <div class="container">
    <div class="footer-content">
      <div class="footer-section about">
        <h5>About Us</h5>
        <p>Your one-stop destination for quality and affordable products. Follow us for new arrivals and offers!</p>
      </div>

      <div class="footer-section links">
        <h5>Quick Links</h5>
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="products.jsp">Products</a></li>
          <li><a href="contact.jsp">Contact</a></li>
          <li><a href="about.jsp">About</a></li>
        </ul>
      </div>

      <div class="footer-section contact">
        <h5>Contact Info</h5>
        <p>Email: goldhousejuwellary@gmail.com</p>
        <p>Phone: +94 71 234 5678</p>
        <div class="socials">
          <a href="#"><i class="ion-social-facebook"></i></a>
          <a href="#"><i class="ion-social-instagram"></i></a>
          <a href="#"><i class="ion-social-twitter"></i></a>
        </div>
      </div>
    </div>
    <hr>
    <p class="footer-bottom">© 2025 YourShop. All rights reserved.</p>
  </div>
</footer>

<!-- Footer Styles -->
<style>
.footer {
  background-color: #2c3e50;
  color: #ecf0f1;
  padding: 40px 0 20px;
  margin-top: 50px;
}

.footer h5 {
  font-size: 18px;
  margin-bottom: 15px;
  font-weight: bold;
}

.footer p, .footer a {
  font-size: 14px;
  color: #bdc3c7;
  text-decoration: none;
}

.footer a:hover {
  color: #ffffff;
  text-decoration: underline;
}

.footer-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.footer-section {
  flex: 1;
  margin: 20px;
  min-width: 200px;
}

.footer-bottom {
  text-align: center;
  font-size: 13px;
  margin-top: 20px;
}

.socials a {
  margin-right: 10px;
  font-size: 20px;
  color: #bdc3c7;
  transition: color 0.3s;
}

.socials a:hover {
  color: #e1306c;
}

/* Responsive */
@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    text-align: center;
  }

  .footer-section {
    margin: 10px 0;
  }
}
</style>

<!-- Ionicons for social icons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
