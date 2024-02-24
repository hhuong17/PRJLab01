<%-- 
    Document   : index
    Created on : Oct 5, 2023, 2:33:36 PM
    Author     : HuongNTH
--%>

<%@page import="DAOs.LoginDAO"%>
<%@page import="Models.Login"%>
<%@page import="sun.security.provider.MD5"%>
<%@page import="sun.security.rsa.RSASignature"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login with behuongcutee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>      
        <form method="post" onsubmit="return checkValid();">
            <section class="vh-100" style="background-color: #508bfc;">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card shadow-2-strong" style="border-radius: 1rem;">
                                <div class="card-body p-5 text-center">

                                    <h3 class="mb-5">Login</h3>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="userName" name="userName" placeholder="Username" class="form-control form-control-lg">
                                        <label for="userName" class="form-label"></label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" name="password" id="password" placeholder="Password" class="form-control form-control-lg">

                                    </div>
                                    <input class="btn btn-primary btn-lg btn-block" name="submit"  type="submit" value="Login"/>

                                    <hr class="my-4">   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
        <%
            if (request.getParameter("submit") != null && request.getParameter("submit").equals("") == false) {
                LoginDAO uDAO = new LoginDAO();
                String userName = request.getParameter("userName").trim();
                String pass = request.getParameter("password").trim();
                String pass_hash = uDAO.getMd5(pass);
                Login acc = uDAO.getUser(userName, pass_hash);
                if (acc == null) {
        %>
        <script>
            alert("Username or password is fail!");
        </script>
        <%
                } else {
                    Cookie c = new Cookie("login", "username");
                    c.setMaxAge(24 * 60 * 60 * 3);
                    response.addCookie(c);
                    response.sendRedirect("list.jsp?userName=" + userName);
                }
            }
        %>
        <script>
            function checkValid() {
                var username = document.getElementById("userName").value.trim();
                var password = document.getElementById("password").value.trim();

                if (username.trim() === "" || password.trim() === "") {
                    alert("Username and password cannot be empty.");
                    return false;
                }
                return true;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
