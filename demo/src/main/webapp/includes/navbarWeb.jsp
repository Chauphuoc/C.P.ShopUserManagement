
<!-- Start header section -->
<header id="aa-header">
  <!-- start header top  -->
  <div class="aa-header-top">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-header-top-area">
            <!-- start header top left -->
            <div class="aa-header-top-left">
              <!-- start language -->
              <div class="aa-language">
                <div class="dropdown">
                  <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    <img src="img/flag/english.jpeg" alt="english flag">ENGLISH
                    <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#"><img src="img/flag/french.jpg" alt="">FRENCH</a></li>
                    <li><a href="#"><img src="img/flag/english.jpg" alt="">ENGLISH</a></li>
                  </ul>
                </div>
              </div>
              <!-- / language -->

              <!-- start currency -->
              <div class="aa-currency">
                <div class="dropdown">
                  <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu2"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    <i class="fa fa-usd"></i>USD
                    <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#"><i class="fa fa-euro"></i>EURO</a></li>
                    <li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
                  </ul>
                </div>
              </div>
              <!-- / currency -->
              <!-- start cellphone -->
              <div class="cellphone hidden-xs">
                <p><span class="fa fa-phone"></span>00-62-658-658</p>
              </div>
              <!-- / cellphone -->
            </div>
            <!-- / header top left -->
            <div class="aa-header-top-right">
              <ul class="aa-head-top-nav-right">
                <li><a href="Home.jsp">Home</a></li>
                <li class="hidden-xs"><a href="myCart.jsp.html">Wishlist</a></li>
                <li class="hidden-xs"><a href="myCart.jsp" >Cart</a></li>
<%--                <%--%>
<%--                  if (user != null) {%>--%>
<%--                <li class="hidden-xs"><a href="checkout.html">Checkout</a></li>--%>
<%--                <li><a href="/log-out" >Logout</a></li>--%>
<%--                <%--%>
<%--                } else {%>--%>
<%--                <li><a href="account.jsp">Login</a></li>--%>
<%--                <%--%>
<%--                  }--%>
<%--                %>--%>
                <c:choose>
                    <c:when test="${sessionScope.user!=null}">
                      <li class="hidden-xs"><a href="orderWeb.jsp">Checkout</a></li>
                      <li><a href="/log-out" >Logout</a></li>
                    </c:when>
                    <c:otherwise>
                      <li><a href="/order-now">Login</a></li>
                    </c:otherwise>
                </c:choose>

              </ul>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- / header top  -->

  <!-- start header bottom  -->
  <div class="aa-header-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-header-bottom-area">
            <!-- logo  -->
            <div class="aa-logo">
              <!-- Text based logo -->
              <a href="index.html">
                <span class="fa fa-shopping-cart"></span>
                <p>C.P<strong>Shop</strong> <span>Your Shopping Partner</span></p>
              </a>
              <!-- img based logo -->
              <!-- <a href="index.html"><img src="img/logo.jpg" alt="logo img"></a> -->
            </div>
            <!-- / logo  -->
            <!-- cart box -->
            <div class="aa-cartbox">
              <a class="aa-cart-link" href="#">
                <span class="fa fa-shopping-basket"></span>
                <span class="aa-cart-title">${user.getName()}</span>
                <span class="aa-cart-notify">${cart_list.size()}</span>
              </a>
              <div class="aa-cartbox-summary">
                <ul>
                  <li>
                    <a class="aa-cartbox-img" href="#"><img src="img/woman-small-2.jpg"
                                                            alt="img"></a>
                    <div class="aa-cartbox-info">
                      <h4><a href="#">Product Name</a></h4>
                      <p>1 x $250</p>
                    </div>
                    <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                  </li>
                  <li>
                    <a class="aa-cartbox-img" href="#"><img src="img/woman-small-1.jpg"
                                                            alt="img"></a>
                    <div class="aa-cartbox-info">
                      <h4><a href="#">Product Name</a></h4>
                      <p>1 x $250</p>
                    </div>
                    <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
                  </li>
                  <li>
                      <span class="aa-cartbox-total-title">
                        Total
                      </span>
                    <span class="aa-cartbox-total-price">
                        $500
                      </span>
                  </li>
                </ul>
                <a class="aa-cartbox-checkout aa-primary-btn" href="checkout.html">Checkout</a>
              </div>
            </div>
            <!-- / cart box -->
            <!-- search box -->
            <div class="aa-search-box">
              <form action="">
                <input type="text" name="" id="#" placeholder="Search here ex. 'man' ">
                <button type="submit"><span class="fa fa-search"></span></button>
              </form>
            </div>
            <!-- / search box -->
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- / header bottom  -->
</header>
<!-- / header section -->

<!-- Start slider -->
<section id="aa-slider">
  <div class="aa-slider-area">
    <div id="sequence" class="seq">
      <div class="seq-screen">
        <ul class="seq-canvas">
          <!-- single slide item -->
          <li>
            <div class="seq-model">
              <img data-seq src="img/1.jpg" style="object-fit: contain" alt="Men slide img"/>
            </div>
            <div class="seq-title">
              <span data-seq>Save Up to 75% Off</span>
              <h2 data-seq>Men Collection</h2>
              <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
              <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
            </div>
          </li>
          <!-- single slide item -->
          <li>
            <div class="seq-model">
              <img data-seq src="img/2.jpg" style="object-fit: contain" alt="Wristwatch slide img"/>
            </div>
            <div class="seq-title">
              <span data-seq>Save Up to 40% Off</span>
              <h2 data-seq>Wristwatch Collection</h2>
              <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
              <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
            </div>
          </li>
          <!-- single slide item -->
          <li>
            <div class="seq-model">
              <img data-seq src="img/3.jpg" style="object-fit: contain" alt="Women Jeans slide img"/>
            </div>
            <div class="seq-title">
              <span data-seq>Save Up to 75% Off</span>
              <h2 data-seq>Jeans Collection</h2>
              <p data-seq>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.</p>
              <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
            </div>
          </li>
          <!-- slider navigation btn -->
          <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
            <a type="button" class="seq-prev" aria-label="Previous"><span
                    class="fa fa-angle-left"></span></a>
            <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
          </fieldset>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- / slider -->