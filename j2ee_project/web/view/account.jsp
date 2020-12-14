<%--
  Created by IntelliJ IDEA.
  User: Moumen
  Date: 1/20/2020
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Boolean connected = false;

    if (session.getAttribute("userIsConnected") != null) {
        connected = true;
    }
%>
<div class="jumbotron" style="background-color: #f5f8fa;">
    <div class="row justify-content-md-center">
        <div class="col-6">
            <% if (connected) { %>
            <div class="col-9 cader cpn" style="background-color: #ffffff;">
                <h4 class=" lead" style="font-size:35px" >Account </h4>
                <hr>
                 <a href="connect?log=out" class="nav-link lead  pt-0">Logout</a>
            </div>
            <% } else {%>
                <form class="form cader cpn" method="post" action="connect" style="background-color: #ffffff;">
                    <h4 class=" lead" style="font-size:35px">Login</h4>
                    <hr>
                    <div class="row" id="login">
                        <div class="col-3">
                            <label class="h6 mt-2">Username</label>
                            <span style="color: red;" class="h6">*</span>
                        </div>
                        <div class="input-group mb-1 col-9">
                            <input type="text" class="form-control form-control-danger" placeholder="username" name="username" >
                        </div>
                        <div class="col-3">
                            <label class="h6 mt-2">Password</label>
                            <span style="color: red;" class="h6">*</span>
                        </div>
                        <div class="input-group mb-1 col-9">
                            <input type="password" class="form-control form-control-danger" placeholder="************" name="password" >
                        </div>

                    </div>
                    <%--<div id="remember" class="checkbox col-7 text-muted mx-2 my-3" >--%>
                    <%--<label><input type="checkbox" value="remember-me" name="remember"> Remember me</label>--%>
                    <%--</div>--%>
                    <%
                        if (request.getParameter("error") != null) {
                            out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    "                <strong>Oops!</strong> Incorrect username or password.\n" +
                                    "        </div>");
                        }
                    %>
                    <button class="btn btn-primary btn-block mt-3" type="submit" name="login">LOGIN</button>
                </form>
            <% } %>

    </div>
</div>
</div>
