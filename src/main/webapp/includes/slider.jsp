
    <!-- Bootstrap CSS (optional, if needed) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"/>

    <!-- Embedded CSS -->
    <style>
        /* **********Slider Section *************** */
       .single_slider {
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    min-height: 600px; /* වෙනස් කරන්න අවශ්‍ය අනුව */
    position: relative;
    display: flex;
    align-items: center;
}

        .slider_area {
            margin-bottom: 35px;
        }

        .slider_area.owl-carousel .owl-dots {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
        }

        .slider_area.owl-carousel .owl-dots .owl-dot {
            width: 9px;
            height: 9px;
            border-radius: 50%;
            display: inline-block;
            background: #242424;
            margin: 0 5px;
            transition: 0.3s;
            position: relative;
        }

        .slider_area.owl-carousel .owl-dots .owl-dot.active::before {
            position: absolute;
            content: "";
            background: #a8741a;
            width: 13px;
            height: 13px;
            left: -3px;
            top: -3px;
            border-radius: 50%;
        }

        .slider_area .single_slider .row {
            height: 500px;
        }

        .slider_area .slider_content {
            margin-left: 20px;
            overflow: hidden;
        }

        .slider_black .slider_content p {
            color: #a8741a;
            font-size: 18px;
            margin-bottom: 0;
            line-height: 22px;
        }

        .slider_black .slider_content p.slider_price {
            color: #fff;
        }

        .slider_black .slider_content p.slider_price span {
            color: #a8741a;
            margin-bottom: 0;
        }

        .slider_black .slider_content h1 {
            color: #fff;
            font-weight: 400;
            margin-bottom: 10px;
            font-family: "Baloo 2", serif;
        }

        @media only screen and (min-width: 1200px) and (max-width: 1600px) {
            .slider_black .slider_content h1 {
                font-size: 40px;
                line-height: 46px;
                margin-bottom: 8px;
            }
         .slider_black .slider_content span {
                font-size: 18px;
                margin-bottom: 25px;
            }

            .slider_black .slider_content a {
                margin-top: 43px;
            }
        }

        .slider_black .slider_content span {
            font-size: 24px;
            color: #cccccc;
            margin-bottom: 35px;
            display: inline-block;
        }

        .slider_black .slider_content a {
            background: #a8741a;
            margin-top: 30px;
        }

        .slider_black .slider_content a:hover {
            background: #212121;
        }

        .active .slider_content > span,
        .active .slider_content p,
        .active .slider_content h1,
        .active .slider_content a {
            animation-fill-mode: both;
            animation-duration: 1s;
            animation-name: fadeInLeft;
        }

        .active .slider_content p,
        .active .slider_content a {
            animation-delay: 0.3s;
        }

        .active .slider_content h1 {
            animation-delay: 0.6s;
        }

        .active .slider_content a {
            animation-delay: 0.9s;
        }
         .slider_content {
    color: white; /* තේරෙන වර්ණයක් යොදන්න */
    background-color: rgba(0, 0, 0, 0.5); /* transparency effect */
    padding: 20px;
    border-radius: 10px;
}
   
        .slider_content p {
            font-size: 18px;
            line-height: 18px;
            font-weight: 400;
            color: #242424;
            margin-bottom: 11px;
            text-transform: capitalize;
        }

        .slider_content h1 {
            font-size: 60px;
            line-height: 60px;
            font-weight: 700;
            color: #212121;
            text-transform: capitalize;
            margin-bottom: 30px;
        }

        .slider_content p.slider_price {
            color: #fff;
            font-size: 18px;
        }

        .slider_content p.slider_price span {
            font-size: 22px;
            font-weight: 500;
            margin-left: 8px;
            color: #a8741a;
            margin-bottom: 0;
        }

        .slider_content a {
            font-weight: 500;
            margin-top: 25px;
            color: #fff;
            height: 50px;
            line-height: 50px;
            padding: 0 35px;
        }

        .slider_content a:hover {
            background: #212121;
        }

        .button {
            background: #a8741a;
            box-shadow: none;
            color: #fff;
            display: inline-block;
            height: 45px;
            line-height: 45px;
            padding: 0 22px;
            text-transform: uppercase;
            font-size: 13px;
            border-radius: 5px;
        }
        /* **********banner section ************ */
.banner_section {
  border-bottom: 1px solid #ebebeb;
  margin-bottom: 70px;
}
.banner_black {
  border-bottom: 1px solid #2d2d2d;
}

.banner_black .banner_content {
  transition: 0.5s;
  bottom: 25px;
  top: inherit;
}

.banner_black .banner_content p {
  color: #ffffff;
  margin-bottom: 10px;
}

.banner_black .banner_content h2 {
  color: #a8741a;
  font-weight: 400;
  font-family: "Baloo 2", serif;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
  .banner_black .banner_content h2 {
    font-size: 21px;
    line-height: 23px;
    margin-bottom: 13px;
  }
}

.banner_black .banner_content span {
  color: #fff;
}

.banner_black .banner_thumb:hover .banner_content {
  transform: scale(1.1);
}

.banner_thumb {
  position: relative;
  overflow: hidden;
}

.banner_thumb::before {
  position: absolute;
  content: "";
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.11);
  top: 0;
  left: 0;
  transition: 0.3s;
  opacity: 0;
  pointer-events: none;
  z-index: 1;
}

.banner_thumb img {
  transition: 0.3s;
}

.banner_thumb:hover::before {
  opacity: 1;
}

.banner_thumb:hover img {
  transform: scale(1.1);
}

.banner_black .banner_thumb:hover .banner_content {
  transform: scale(1.1);
}
.banner_content {
  position: absolute;
  top: 25px;
  left: 25px;
}

.banner_content p {
  color: #7d7d7d;
  margin-bottom: 0;
}

.banner_content h2 {
  color: #242424;
  font-size: 24px;
  font-weight: 700;
  line-height: 27px;
  margin-bottom: 15px;
}
.banner_content span {
  color: #242424;
}
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
<div class="slider_area slider_black owl-carousel">
    <div class="single_slider" style="background-image: url('product-images/slider1.png');">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="slider_content">
                        <p>exclusive offer -20% off this week</p>
                        <h1>Necklace</h1>
                        <span>22 Carat gold necklace for wedding</span>
                        <p class="slider_price">starting at <span>Rs. 75,999</span></p>
                        <a href="" class="button">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="single_slider" style="background-image: url('product-images/slider2.jpg');">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="slider_content">
                        <p>exclusive offer -40% off this week</p>
                        <h1>Earings and Pendant</h1>
                        <span>Complete bridal set with white pearls</span>
                        <p class="slider_price">starting at <span>Rs. 89,499</span></p>
                        <a href="#" class="button">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="single_slider" style="background-image: url('product-images/slider3.jpg');">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="slider_content">
                        <p>exclusive offer -10% off this week</p>
                        <h1>Wedding Rings</h1>
                        <span>Ashirwaad Special wedding rings for couples.</span>
                        <p class="slider_price">starting at <span>Rs. 14,999</span></p>
                        <a href="#" class="button">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


 <!-- banner section starts -->
 
<h2 class="sale-heading">Sale Product</h2>

        <section class="banner_section banner_black">
            <div class="container">
                <div class="row">          
                    <div class="col-lg-4 col-md-6">
                        <div class="single_banner">
                            <div class="banner_thumb">
                                <a href="#"><img src="product-images/bg3.jpg" alt="banner1"></a>
                                <div class="banner_content">
                                    <p>Bestselling Rings</p>
                                    <h2>White gold rings</h2>
                                    <span>Sale 10% </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_banner">
                            <div class="banner_thumb">
                                <a href="#"><img src="product-images/bg2.jpg" alt="banner2"></a>
                                <div class="banner_content">
                                    <p>Bestselling Rings</p>
                                    <h2>White gold rings</h2>
                                    <span>Sale 10% </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_banner">
                            <div class="banner_thumb">
                                <a href="#"><img src="product-images/bg-3.jpg" alt="banner3"></a>
                                <div class="banner_content">
                                    <p>Featured Rings</p>
                                    <h2>Platinium Rings</h2>
                                    <span>Sale 30% </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- banner section ends -->

<br>
<br>
<br>


  <!-- JQuery + Owl Carousel JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <!-- Slider JS -->
    <script>
        $(".slider_area").owlCarousel({
            animateOut: "fadeOut",
            autoplay: true,
            loop: true,
            nav: false,
            autoplayTimeout: 6000,
            items: 1,
            dots: true,
        });
       

    </script>



