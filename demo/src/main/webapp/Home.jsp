<%@ page import="com.example.dao.ProductDao" %>
<%@ page import="com.example.DatabaseConection.Database" %>
<%@ page import="com.example.Model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Model.Cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%!
    User user;
%>
<%
    ProductDao productDao = new ProductDao(Database.getConnection());
    List<Product> productList = productDao.getAllProduct();

    user = (User) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user",user);
    }

    ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (carts != null) {
        request.setAttribute("cart_list",carts);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Shop | Home</title>

    <!-- Font awesome -->
    <%--    <link href="/css/font-awesome.css" rel="stylesheet">--%>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="/css/jquery.simpleLens.css">
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="/css/theme-color/default-theme.css" rel="stylesheet">
    <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
    <!-- Top Slider CSS -->
    <link href="/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="/css/style.css" rel="stylesheet">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>
<!-- wpf loader Two -->
<div id="wpf-loader-two">
    <div class="wpf-loader-two-inner">
        <span>Loading</span>
    </div>
</div>
<!-- / wpf loader Two -->
<!-- SCROLL TOP BUTTON -->
<a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
<!-- END SCROLL TOP BUTTON -->
<%@include file="includes/navbarWeb.jsp" %>

<div id="frmDeleteConfirm" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <form action="/customers?action=delete" method="post" id="frmDelete">
                <div class="modal-header">
                    <h4 class="modal-title">Confirm Delete</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="idFrmDeleteConfirm" name="idFrmDeleteConfirm"  />
                    <p id="nameFrmDeleteConfirm">Name....?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="handleDeleteCustomer()">Delete</button>
                </div>
            </form>
        </div>

    </div>
</div>
<!-- Products section -->
<section id="aa-product">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-product-area">
                        <div class="aa-product-inner">
                            <!-- start prduct navigation -->
                            <ul class="nav nav-tabs aa-products-tab">
                                <li class="active"><a href="#men" data-toggle="tab">Men</a></li>
                                <li><a href="#women" data-toggle="tab">Women</a></li>
                                <li><a href="#sports" data-toggle="tab">Sports</a></li>
                                <li><a href="#electronics" data-toggle="tab">Electronics</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!-- Start men product category -->
                                <div class="tab-pane fade in active" id="men">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <%
                                            if (!productList.isEmpty()) {
                                                for (Product p : productList) {
                                                    if (p.getId() == 2) {
                                        %>
                                        <li>
                                            <figure>
                                                <input type="hidden" value="<%=p.getId()%>" name="id">
                                                <a class="aa-product-img" style="object-fit: contain" href="#">
                                                    <img style="width:250px" src="img/man/<%=p.getImage()%>"
                                                         alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="add-to-cart?id=<%=p.getId()%>"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span
                                                        class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span
                                                        class="fa fa-exchange"></span></a>
                                                <a href="link-update-product?id=<%=p.getId()%>" data-toggle2="tooltip" data-placement="top"
                                                   title="Edit"
                                                   data-toggle="modal" data-target="#quick-view-modal"><span
                                                        class="fa-regular fa-pen-to-square"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                        </li>
                                        <%
                                        } else {
                                        %>
                                        <li>
                                            <figure>
                                                <input type="hidden" value="<%=p.getId()%>" name="id">
                                                <a class="aa-product-img" style="object-fit: contain" href="#">
                                                    <img style="width:250px" src="img/man/<%=p.getImage()%>"
                                                         alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="add-to-cart?id=<%=p.getId()%>"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span
                                                        class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span
                                                        class="fa fa-exchange"></span></a>
                                                <a href="link-update-product?id=<%=p.getId()%>" data-toggle2="tooltip" data-placement="top"
                                                   title="Edit"
                                                   data-toggle="modal" data-target="#quick-view-modal"><span
                                                        class="fa-regular fa-pen-to-square"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sale" href="#">SALE!</span>
                                            <%--                          <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>--%>
                                        </li>
                                        <%
                                                    }
                                                }
                                            }
                                        %>

                                    </ul>
                                    <a class="aa-browse-btn" href="#">Browse all Product <span
                                            class="fa fa-long-arrow-right"></span></a>
                                </div>
                                <!-- / men product category -->
                                <!-- start women product category -->
                                <div class="tab-pane fade" id="women">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->å
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img style="width: 250px"
                                                                                        src="img/man/13.jpg"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sale" href="#">SALE!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/women/girl-2.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-hot" href="#">HOT!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/women/girl-3.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/women/girl-4.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/women/girl-5.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>

                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/women/girl-6.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/women/girl-7.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sale" href="#">SALE!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/women/girl-1.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                        </li>
                                    </ul>
                                    <a class="aa-browse-btn" href="#">Browse all Product <span
                                            class="fa fa-long-arrow-right"></span></a>
                                </div>
                                <!-- / women product category -->
                                <!-- start sports product category -->
                                <div class="tab-pane fade" id="sports">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/sports/sport-1.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sale" href="#">SALE!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/sports/sport-2.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="filecss/img/sports/sport-3.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/sports/sport-4.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-hot" href="#">HOT!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/sports/sport-5.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/sports/sport-6.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/sports/sport-7.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sale" href="#">SALE!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img src="img/sports/sport-8.png"
                                                                                        alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- / sports product category -->
                                <!-- start electronic product category -->
                                <div class="tab-pane fade" id="electronics">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-1.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sale" href="#">SALE!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-2.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-3.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-4.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-hot" href="#">HOT!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-6.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-7.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span><span
                                                        class="aa-product-price"><del>$65.50</del></span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sale" href="#">SALE!</span>
                                        </li>
                                        <!-- start single product item -->
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="#"><img
                                                        src="img/electronics/electronic-8.png" alt="polo shirt img"></a>
                                                <a class="aa-add-card-btn" href="#"><span
                                                        class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                    <span class="aa-product-price">$45.50</span>
                                                </figcaption>
                                            </figure>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Add to Wishlist"><span class="fa-regular fa-heart"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top"
                                                   title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top"
                                                   title="Quick View" data-toggle="modal"
                                                   data-target="#quick-view-modal"><span
                                                        class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                        </li>
                                    </ul>
                                    <a class="aa-browse-btn" href="#">Browse all Product <span
                                            class="fa fa-long-arrow-right"></span></a>
                                </div>
                                <!-- / electronic product category -->
                            </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Products section -->

<div class="container">
    <div class="row">

    </div>
</div>

<!-- popular section -->

<!-- / popular section -->
<!-- Support section -->
<section id="aa-support">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-support-area">
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-truck"></span>
                            <h4>FREE SHIPPING GG</h4>
                            <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-clock-o"></span>
                            <h4>30 DAYS MONEY BACK</h4>
                            <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-phone"></span>
                            <h4>SUPPORT 24/7</h4>
                            <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Support section -->

<!-- Subscribe section -->
<section id="aa-subscribe">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-subscribe-area">
                    <h3>Subscribe our newsletter </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex, velit!</p>
                    <form action="" class="aa-subscribe-form">
                        <input type="email" name="" id="#3" placeholder="Enter your Email">
                        <input type="submit" value="Subscribe">
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Subscribe section -->

<!-- footer -->
<footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-footer-top-area">
                        <div class="row">
                            <div class="col-md-3 col-sm-6">
                                <div class="aa-footer-widget">
                                    <h3>Main Menu</h3>
                                    <ul class="aa-footer-nav">
                                        <li><a href="#">Home</a></li>
                                        <li><a href="#">Our Services</a></li>
                                        <li><a href="#">Our Products</a></li>
                                        <li><a href="#">About Us</a></li>
                                        <li><a href="#">Contact Us</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="aa-footer-widget">
                                    <div class="aa-footer-widget">
                                        <h3>Knowledge Base</h3>
                                        <ul class="aa-footer-nav">
                                            <li><a href="#">Delivery</a></li>
                                            <li><a href="#">Returns</a></li>
                                            <li><a href="#">Services</a></li>
                                            <li><a href="#">Discount</a></li>
                                            <li><a href="#">Special Offer</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="aa-footer-widget">
                                    <div class="aa-footer-widget">
                                        <h3>Useful Links</h3>
                                        <ul class="aa-footer-nav">
                                            <li><a href="#">Site Map</a></li>
                                            <li><a href="#">Search</a></li>
                                            <li><a href="#">Advanced Search</a></li>
                                            <li><a href="#">Suppliers</a></li>
                                            <li><a href="#">FAQ</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="aa-footer-widget">
                                    <div class="aa-footer-widget">
                                        <h3>Contact Us</h3>
                                        <address>
                                            <p> 25 Astor Pl, NY 10003, USA</p>
                                            <p><span class="fa fa-phone"></span>+1 212-982-4589</p>
                                            <p><span class="fa fa-envelope"></span>dailyshop@gmail.com</p>
                                        </address>
                                        <div class="aa-footer-social">
                                            <a href="#"><span class="fa fa-facebook"></span></a>
                                            <a href="#"><span class="fa fa-twitter"></span></a>
                                            <a href="#"><span class="fa fa-google-plus"></span></a>
                                            <a href="#"><span class="fa fa-youtube"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-footer-bottom-area">
                        <p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
                        <div class="aa-footer-payment">
                            <span class="fa fa-cc-mastercard"></span>
                            <span class="fa fa-cc-visa"></span>
                            <span class="fa fa-paypal"></span>
                            <span class="fa fa-cc-discover"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- / footer -->

<!-- Login Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4>Login or Register</h4>
                <form class="aa-login-form" action="">
                    <label >Username or Email address<span>*</span></label>
                    <input type="text" placeholder="Username or email">
                    <label >Password<span>*</span></label>
                    <input type="password" placeholder="Password">
                    <button class="aa-browse-btn" type="submit">Login</button>
                    <label for="rememberme" class="rememberme"><input type="checkbox" id="rememberme"> Remember me
                    </label>
                    <p class="aa-lost-password"><a href="#">Lost your password?</a></p>
                    <div class="aa-register-now">
                        Don't have an account?<a href="account.html">Register now!</a>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/js/bootstrap.js"></script>
<!-- SmartMenus jQuery plugin -->
<script type="text/javascript" src="/js/jquery.smartmenus.js"></script>
<!-- SmartMenus jQuery Bootstrap Addon -->
<script type="text/javascript" src="/js/jquery.smartmenus.bootstrap.js"></script>
<!-- To Slider JS -->
<script src="/js/sequence.js"></script>
<script src="/js/sequence-theme.modern-slide-in.js"></script>
<!-- Product view slider -->
<script type="text/javascript" src="/js/jquery.simpleGallery.js"></script>
<script type="text/javascript" src="/js/jquery.simpleLens.js"></script>
<!-- slick slider -->
<script type="text/javascript" src="/js/slick.js"></script>
<!-- Price picker slider -->
<script type="text/javascript" src="filecss/js/nouislider.js"></script>
<!-- Custom js -->
<script src="/js/custom.js"></script>

</body>
</html>