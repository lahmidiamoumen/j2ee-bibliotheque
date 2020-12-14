package controller;

import Dao.DaoProduct;
import model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "getAllProduct")
public class getAllProduct extends HttpServlet {
    private DaoProduct daoProduct = new DaoProduct();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter sd = response.getWriter();
        StringBuilder s = new StringBuilder();
        if(request.getParameter("view") != null){
            if(request.getParameter("view").equals("product")){
                s.append("      <div class=\" row mb-4\">");
                for (Product product: daoProduct.getAll(null)){
                   s.append(" <div class=\"col-md-3 col-xl-2 col-6 my-3 pr-0 pl-1  column\" style=\"overflow: hidden;\">\n" +
                           "      <div class=\"card card-cascade sc-product-item thumbnail\">\n" +
                           "            <div class=\"cont\">\n" +
                           "              <img class=\"card-img-top\" src=\"images/")
                   .append(product.getPhoto()).append("\" data-name=\"product_image\"\n")
                   .append("              style=\" max-width:245px;max-height:184px;width: auto;height: auto;\" alt=\"phones\" />\n")
                   .append("              <div class=\"middle_\">\n")
                   .append("                <a class=\"btn  btn-default mb-2\" href=\"home?action=article&id="+product.getLibelle()+"\" style=\"font-size: 17px;outline:none;\">\n")
                   .append("                  <span class=\"lead\"style=\"font-size:15px\">View</span> <i class=\"ion-ios-search \"></i></a>\n")
                   .append("              </div>\n")
                   .append("              <div class=\"middle_1\">\n")
                   .append("                  <button class=\"btn sc-add-to-cart btn-default  mb-2\" style=\"font-size: 17px;outline:none;\">\n")
                   .append("                    <span class=\"lead \"style=\"font-size:15px \">Add</span> <i class=\"ion-ios-cart-outline \"></i></button>\n")
                   .append("              </div>\n")
                   .append("            </div>\n")
                   .append("            <div class=\"p-2 bg-light text-center\" >\n")
                   .append("              <a data-name=\"product_name\" class=\" d-block label\" href=\"#\">")
                   .append(product.getLibelle()).append("</a>\n")
                   .append("              <p  class=\"lead\" style=\"font-size:14px\">No description yet</p>\n")
                   .append("                <span class=\"labels label-success\"> <i class=\"ion-ios-cart mr-10\" ></i>"+product.getPrix()+" DA</span>\n");
                   if(product.getQte().equals("0")){
                       s.append("<span class=\"labels label-danger\"> <i class=\"ion-ios-cart mr-2\"></i><del>NOT IN STOCK</del></span>\n");
                   }
                   s.append("              <input name=\"product_price\" value=\"")
                   .append(product.getPrix()).append("\" type=\"hidden\" />\n")
                   .append("              <input name=\"product_id\" value=\"<?php echo $key->getId(); ?>\" type=\"hidden\" />\n")
                   .append("              <input name=\"client_id\" value=\"<?php echo $_SESSION['userid'] ?>\" type=\"hidden\" />\n")
                   .append("            </div>\n")
                   .append("        </div>\n")
                   .append("      </div>");
                }
                s.append("      </div> </div>");

            }
        }
        sd.println(s);
    }
}
