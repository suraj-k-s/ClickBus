<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("btn_login") != null) {

        String email = request.getParameter("txt_email");
        String pass = request.getParameter("txt_password");

        String selU = "select * from  tbl_user where user_email = '" + email + "' and user_password	 = '" + pass + "'";
        ResultSet rsU = con.selectCommand(selU);

        String selB = "select * from  tbl_bus_service where bs_email = '" + email + "' and bs_password	 = '" + pass + "'";
        ResultSet rsB = con.selectCommand(selB);

        String selA = "select * from tbl_admin where admin_email = '" + email + "' and  admin_password = '" + pass + "'";
        ResultSet rsA = con.selectCommand(selA);

        if (rsB.next()) {
            session.setAttribute("bid", rsB.getString("bs_id"));
            session.setAttribute("bname", rsB.getString("bs_name"));
            response.sendRedirect("Driver/HomePage.jsp");
        } else if (rsA.next()) {
            session.setAttribute("aid", rsA.getString("admin_id"));
            session.setAttribute("aname", rsA.getString("admin_name"));
            response.sendRedirect("Admin/HomePage.jsp");

        } else if (rsU.next()) {
            session.setAttribute("uid", rsU.getString("user_id"));
            session.setAttribute("uname", rsU.getString("user_name"));
            response.sendRedirect("User/HomePage.jsp");

        } else {
            out.println("<script>alert('Invalid Credentials')</script>");

        }

    }
%>



<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="Assets/Template/Login/fonts/icomoon/style.css">

        <link rel="stylesheet" href="Assets/Template/Login/css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="Assets/Template/Login/css/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="Assets/Template/Login/css/style.css">

        <title>Login #6</title>
    </head>
    <body>


        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('Assets/Template/Login/images/bg_1.jpg');"></div>
            <div class="contents order-2 order-md-1">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">
                            <div class="mb-4">
                                <h3>Sign In</h3>

                            </div>
                            <form method="post">
                                <div class="form-group first">
                                    <label for="username">Email</label>
                                    <input type="email" class="form-control" required name="txt_email">

                                </div>
                                <div class="form-group last mb-3">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" required name="txt_password">

                                </div>

                                <div class="d-flex mb-5 align-items-center">
                                    <label class="control control--checkbox mb-0">
                                    </label>
                                    <span align="left"><a href="User.jsp" class="forgot-pass" style="left:-29px">Sign Up</a></span> 
                                    <span class="ml-auto"><a href="index.jsp" class="forgot-pass">Back to Home</a></span> 
                                </div>

                                <input type="submit" value="Log In" name="btn_login" class="btn btn-block btn-primary">

                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <script src="Assets/Template/Login/js/jquery-3.3.1.min.js"></script>
        <script src="Assets/Template/Login/js/popper.min.js"></script>
        <script src="Assets/Template/Login/js/bootstrap.min.js"></script>
        <script src="Assets/Template/Login/js/main.js"></script>
    </body>
</html>