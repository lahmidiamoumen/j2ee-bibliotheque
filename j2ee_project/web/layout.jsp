<%--
  Created by IntelliJ IDEA.
  User: Moumen
  Date: 1/15/2020
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action;
    String[] active = new String[5];
    String get = request.getParameter("action");
    Boolean connected = false;

    if (session.getAttribute("userIsConnected") != null) {
        connected = true;
    }

    if(get!=null ) {
        action =  request.getParameter("action");
        if(get.equals("produit")){
            active[1] = "active";
        }else if(get.equals("cart")){
            active[2] = "active";
        }
        else if(get.equals("account")){
            active[3] = "active";
        }

    }else{
        action = "all";
        active[0] = "active";
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Home | Soukom </title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resource/css/bootstrap.min.css"  crossorigin="anonymous">
    <link rel="stylesheet" href="resource/css/master.css">
    <link rel="stylesheet" href="resource/css/css_.css">
    <link rel="stylesheet" href="resource/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="resource/bower_components/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="resource/css/jssocials.css" />
    <link rel="stylesheet" type="text/css" href="resource/css/jssocials-theme-flat.css" />
    <link href="resource/css/smart_cart.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="resource/css/star-rating.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="resource/css/theme.css" media="all" type="text/css"/>

    <script src="js/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"  crossorigin="anonymous"></script>
    <style media="screen">.form-control:focus { box-shadow: 0 0 0 1.2px rgba(0,123,255,.25);}  </style>

</head>

<body lang="en">
<div class="bg-dark navbar-expand py-0 navbar-dark navbar">
    <div class="container">
        <a class="navbar-brand title py-0" href="home">  Soukom  </a>
        <ul class="navbar-nav ml-md-auto ">
            <% if (connected) { %>
                  <li class="nav-item " ><a href="connect?log=out" class="nav-link lead  pt-0">Logout</a></li>
            <% } else {%>
                    <li class="nav-item " ><a href="home?action=account" class="nav-link lead  pt-0">Login</a></li>
            <% } %>
        </ul>
    </div>
</div>
<nav class="navbar navbar-expand-lg pt-0 navbar-dark bg-dark " style="border-bottom: 1px solid #d3e0e9;"  role="navigation">
    <div class="container p-0">
        <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-nav-scroll navbar-collapse collapse" id="collapsingNavbar">
            <ul class="navbar-nav">
                    <li class="nav-item <%out.print(active[0]);%> lead hidden-xs">
                        <a class="nav-link" href="home"> Accueil </a>
                    </li>
                    <% if (connected) { %>
                        <li class="nav-item <%out.print(active[1]);%> lead hidden-xs">
                            <a class="nav-link" href="home?action=produit"> Produit </a>
                        </li>
                    <% } %>
                    <li class="nav-item <%out.print(active[2]);%> lead hidden-xs">
                        <a class="nav-link" href="home?action=cart"> Panier </a>
                    </li>
                    <li class="nav-item <%out.print(active[3]);%> lead hidden-xs">
                        <a class="nav-link" href="home?action=account"> Account </a>
                    </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <!--_________________________________ Search _____________________________________________      -->
                <li class="nav-item mt-2 ">
                    <form method="get" action="home?action=search">
                        <div class=" input-group px-0">
                            <div class="input-group-prepend">
                                <button class="input-group-text btn" type="submit" id="basic-addon1" style="border: none;background-color: #494e53;">
                                    <img alt="ciew" src="images/search.png" width="20" height ="20">
                                </button>
                            </div>
                            <label>
                                <input  type="text" name="action" value="search" hidden>
                            </label>
                            <input type="text" class="form-control lead srch " id="tags"  placeholder="Search..." name="search"  aria-label="Username" >
                        </div>
                    </form>
                </li>
                <!--_________________________________ Soping_cart ________________________________________      -->
                <li class="nav-item dropdown">
                    <a class="nav-link lead pb-0 " href="" data-toggle="dropdown">
                        <i class="fa fa-cart-plus" style="font-size: 25px;"></i>
                        <span class="badge bg-yellow pull-right sc-cart-count" style="font-size:10px;"></span>
                    </a>

                    <%
                        if(!action.equals("cart") ){
                            out.print("" +
                                    "<div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"false\" style=\"background-color:#f5f5f5; width:300px !important\">\n" +
                                        "<div class=\"box-body box-profile\">" +
                                            "<div id=\"smartcart\">" +
                                        "</div>\n" +
                                    "</div>");
                        }
                    %>

                </li>
            </ul>
        </div>
    </div>
</nav>

<!--_________________________________ Main View  ___________________________________________      -->
<ol class="breadcrumb container">
    <li><a href="home"><i class="ion-ios-home-outline"></i><%out.print(" "+action.substring(0, 1).toUpperCase() + action.substring(1));%></a></li>

</ol>
<div class="container py-5">

        <jsp:include page='<%="/view/"+action+".jsp"%>'/>

</div>
<!--_________________________________ Fotter  ___________________________________________      -->
<!--Footer-->
<footer class="page-footer  pt-4 mt-4 lead small footer navbar-fixed-bottom" style=";background-color: #3e4551!important;">

    <!--Footer Links-->
    <div class="container text-center text-md-left">

        <!-- Footer links -->
        <div class="row text-center text-md-left mt-3 pb-3">

            <!--First column-->
            <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">who we are</h6>
                <p>Soukom is an online shop based in Algeria. Purchase electronics, fashion, books, home appliance and more .</p>
            </div>
            <!--/.First column-->

            <hr class="w-100 clearfix d-md-none">

            <!--Second column-->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">MAKE MONEY WITH US</h6>
                <p><a href="#!">Sell on Soukom</a></p>
                <p><a href="#!">Become an Affiliate Partner</a></p>

            </div>
            <!--/.Second column-->

            <hr class="w-100 clearfix d-md-none">

            <!--Third column-->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Useful links</h6>
                <p><a href="#!">Your Account</a></p>
                <p><a href="#!">Become an Affiliate</a></p>
                <p><a href="#!">Shipping Rates</a></p>
                <p><a href="#!">Help</a></p>
            </div>
            <!--/.Third column-->

            <hr class="w-100 clearfix d-md-none">

            <!--Fourth column-->
            <div class=" col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                <span class="form-inline mb-2"> <i class="mr-3 icon">home</i><label> Dar El Beida, Algiers 16100, DZ</label> </span>
                <span class="form-inline mb-2"> <i class="mr-3 icon">email</i><label> soukom@comp.com</label> </span>
                <span class="form-inline mb-2"> <i class="mr-3 icon">phone</i><label> +21355 466 327</label> </span>
                <span class="form-inline mb-2"> <i class="mr-3 icon">print</i><label> 021753698</label> </span>
            </div>
            <!--/.Fourth column-->
        </div>
        <!-- Footer links -->
        <hr>
        <div class="row py-3 d-flex align-items-center">
            <!--Grid column-->
            <div class="col-md-6 col-lg-6">
                <!--Copyright-->
                <p class="text-center text-md-left" style="color: #9e9e9e!important">© 2020 Copyright : <a href="https://fs.univ-boumerdes.dz/"><strong> UMBB</strong></a> ,Inc.</p>
                <!--/.Copyright-->
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-6 col-lg-6 ml-lg-0">
                <!--Social buttons-->
                <div id="share">
                </div>

                <!--/.Social buttons-->

            </div>
            <!--Grid column-->

        </div>

    </div>

</footer>

<script src="js/jquery-1.12.4.js"></script>
<script src="js/jquery.smartCart.min.js" type="text/javascript"></script>
<script src="js/jssocials.js"></script>
<script src="js/star-rating.js" type="text/javascript"></script>
<script src="js/theme.js" type="text/javascript"></script>

</body>
<script src="js/easyzoom.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        // Initialize Smart Cart
        $('#smartcart').smartCart({
            submitSettings: {
                submitType: 'form', // form, paypal, ajax
                ajaxURL: 'ajax'    //    HttpSession httpSession;
                // Ajax submit URL
            }});
        // $("#smartcart").on("itemAdded", function(e) {
        //
        //   alert("Item added");
        // });
        // $("#smartcart").on("itemUpdated", function(e) {
        //   alert("Item updated");
        // });
        // $("#smartcart").on("itemRemoved", function(e) {
        //   alert("Item removed");
        // });
        $("#share").jsSocials({
            shares: ["email", "linkedin", "twitter", "pinterest", "stumbleupon" , "facebook", "googleplus"]
        });
        $('.kv-fa').rating({
            theme: 'krajee-fa',
            filledStar: '<i class="fa fa-star"></i>',
            emptyStar: '<i class="fa fa-star-o"></i>'
        });
        $('.kv-fa').on(
            'change', function () {
                alert('Rating selected: ' + $(this).val());
            });
    });
    // Example starter JavaScript for disabling form submissions if there are invalid fields

    var $easyzoom = $('.easyzoom').easyZoom();
    // Get an instance API
    var api = $easyzoom.data('easyZoom');

</script>


</html>