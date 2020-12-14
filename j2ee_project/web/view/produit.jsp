<%--
  Created by IntelliJ IDEA.
  User: Moumen
  Date: 1/16/2020
  Time: 12:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getParameter("sucess") != null) {
        out.println("<h1 class=\"display-4\">Le produit ajouter avec sucessé.</h1>");
    }
    Boolean connected = false;

    if (session.getAttribute("userIsConnected") != null) {
%>


<div class="jumbotron" id="singup" style="background-color: #f5f8fa;">
    <div class="row justify-content-md-center" >
        <div class="col-9 cader cpn" style="background-color: #ffffff;">
            <h4 class=" lead" style="font-size:35px" >Ajouter un nouveau produit</h4>
            <hr>
            <form action="add-product" method="POST" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="col-xl-2 form-inline">
                        <label class="h6 mb-1">Libelle</label>
                        <span style="color: red;" class="h6 mb-2">*</span>
                    </div>
                    <div class="input-group mb-1 col-xl-10">
                        <input type="text" class="form-control" placeholder="Libelle"  name="libelle" >
                     </div>
                </div>
                <div class="form-row">
                    <div class="col-xl-2 form-inline">
                        <label class="h6 mb-1">Libelle</label>
                        <span style="color: red;" class="h6 mb-2">*</span>
                    </div>
                    <div class="input-group mb-1 col-xl-10">
                        <input type="text" class="form-control" placeholder="Prix"  name="prix" >
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-xl-2 form-inline">
                        <label class="h6 mb-1">Quantité</label>
                        <span style="color: red;" class="h6 mb-2">*</span>
                    </div>
                    <div class="input-group mb-1 col-xl-10">
                        <input type="number" class="form-control" placeholder="Quantité"  name="qte" >
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-xl-2 form-inline">
                        <label class="h6 mb-1">Photo</label>
                        <span style="color: red;" class="h6 mb-2">*</span>
                    </div>
                    <div class="input-group  mb-1 col-xl-10">
                        <div class="custom-file">
                            <input  type="file" name="photo" accept="image/x-png, image/gif, image/jpeg, image/jpg" class="custom-file-input">
                            <label class="custom-file-label" >Choisir une photo</label>
                        </div>
                    </div>
                </div>

                <button class="btn btn-primary btn-block" type="submit" style="margin-top: 20px" name="singup"><img src="images/lock.png" width="17" class="mb-1 mr-1" alt="lock">Submit</button>
            </form>
        </div>
    </div>
</div>
<%
}else {
%>
<div class="jumbotron" id="singup" style="background-color: #f5f8fa;">
    <div class="row justify-content-md-center" >
        <div class="col-9 cader cpn" style="background-color: #ffffff;">
            <h4 class=" lead" style="font-size:35px" >404 ACCESS FORBIDDEN</h4>
        </div>
    </div>
</div>
<%
    }%>