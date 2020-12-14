<%@ page import="Dao.DaoProduct" %>
<%@ page import="model.Product" %><%--
  Created by IntelliJ IDEA.
  User: Moumen
  Date: 1/16/2020
  Time: 12:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="row">
    <div class="col-md-6 card card-cascade sc-product-item">
        <%

            DaoProduct d =new DaoProduct();
            Product p = d.get();
        %>

        <!-- Profile Image -->
        <div class="box box-primary ">
            <div class="box-body box-profile">
                <div class="easyzoom easyzoom--overlay">
                    <a href="<?php echo "uploads/img/".$product->getImage();?>">
                        <img class="card-img-top" data-name="product_image" src="<?php echo "uploads/img/".$product->getImage();?>" alt="no image" />
                    </a>
                    <span data-name="product_name" type="hidden"><?php echo $product->getName(); ?></span>
                </div>
            </div>
        </div>
        <button class="btn sc-add-to-cart btn-default  mb-2" style="font-size: 17px;outline:none;">
            <span class="lead "style="font-size:15px ">Add to Shopping Cart</span> <i class="ion-ios-cart-outline "></i></button>
        <input name="product_price" value="<?php echo $product->getPrice(); ?>" type="hidden" />
        <input name="product_id" value="<?php echo $product->getId(); ?>" type="hidden" />
        <input name="client_id" value="<?php echo $_SESSION['userid'] ?>" type="hidden" />
    </div>
    <div class="col">
        <div class="box box-solid font-weight-light">
            <div class="box-header with-border">

                <h3 data-name="product_name" class="box-title font-weight-light"><i class="fa fa-tag pr-2"></i><?php echo $product->getName(); ?></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body ">
                <dl class="dl-horizontal">
                    <dt>Product ID</dt>
                    <dd><?php echo $product->getId(); ?></dd>
                    <dt>Categorie</dt>
                    <dd><?php echo $product->getCategories(); ?></dd>
                    <dt>Brand</dt>
                    <dd><?php echo $product->getCompany(); ?></dd>
                    <dt>Description </dt>
                    <dd><?php echo $product->getDesc(); ?></dd>
                    <dt>Max Quantity</dt>
                    <dd><?php echo $product->getAmount(); ?></dd>
                    <dt>Price</dt>
                    <dd><del><?php echo $product->getPrice()." DA"; ?></del></dd>
                    <dt>Promotion</dt>
                    <dd><?php echo $product->product_promotion; ?></dd>
                    <?php if ($product->product_promotion === "YES"): ?>
                    <dt>NEW Price</dt>
                    <dd><?php echo $product->product_new_price." DA"; ?></dd>
                    <?php endif; ?>
                    <dt>Rating</dt>
                    <dd>
                        <input type="text" class="kv-fa rating-loading" value="2" data-size="xs" title="" id="starts">
                    </dd>
                </dl>
            </div>
            <!-- /.box-body -->

        </div>
        <div class="mt-3 ">
            <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-share"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Shar this Product </span>
                    <span class="info-box-number">NOW</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <div id="share" ></div>
    </div>
</div>