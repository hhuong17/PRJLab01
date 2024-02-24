<%-- 
    Document   : list
    Created on : Oct 5, 2023, 3:34:55 PM
    Author     : HuongNTH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Login"%>
<%@page import="DAOs.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <%
            Cookie[] cList = null;
            cList = request.getCookies();
            if (cList == null) {
                response.sendRedirect("index.jsp");
            } else {
                boolean flag = false;
                for (Cookie c : cList) {
                    if (c.getName().equals("login") && c.getValue().equals("username")) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    response.sendRedirect("index.jsp");
                }
            }
        %> 

        <h1 style="padding: 20px 0 20px 50px">List User</h1>
        <%
            if (request.getParameter("logout") != null && request.getParameter("logout").equals("true")) {
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("login")) {
                            cookie.setValue("");
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                    }
                }
                response.sendRedirect("index.jsp");
            }
        %>


        <%
            LoginDAO uDAO = new LoginDAO();
            String userName = request.getParameter("userName");
            Login acc = uDAO.getInfo(userName);
            if (acc != null) {
        %>
        <div style="width:300px; float: right; margin-bottom: 50px "> Hello, <%=acc.getFullName()%> | <a href="?logout=true">Sign Out</a></div>
        <%
            }

        %>

        <div style="width: 100%" class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Full Name</th>
                        <th>Gender</th>
                        <th>Birthday</th>
                        <th>Department</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        ResultSet rs = uDAO.getAll();
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("username")%></td>
                        <td><%=rs.getString("fullname")%></td>
                        <td><%=rs.getString("gender")%></td>
                        <td><%=rs.getString("birthday")%></td>
                        <td><%=rs.getString("department")%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

        </div>


    </body>
</html>
