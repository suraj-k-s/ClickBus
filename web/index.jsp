<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <!-- Required meta tags-->
            <meta charset="UTF-8" />
            <meta
                name="viewport"
                content="width=device-width, initial-scale=1, shrink-to-fit=no"
                />
            <meta name="description" content="Colrolib Templates" />
            <meta name="author" content="Colrolib" />
            <meta name="keywords" content="Colrolib Templates" />

            <!-- Title Page-->
            <title>Au Form Wizard</title>

            <link
                href="Assets/Template/Main/vendor/mdi-font/css/material-design-iconic-font.min.css"
                rel="stylesheet"
                media="all"
                />
            <link
                href="Assets/Template/Main/vendor/font-awesome-4.7/css/font-awesome.min.css"
                rel="stylesheet"
                media="all"
                />
            <link
                href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet"
                />
            <link
                href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
                rel="stylesheet"
                />
            <link
                href="Assets/Template/Main/vendor/select2/select2.min.css"
                rel="stylesheet"
                media="all"
                />
            <link
                href="Assets/Template/Main/vendor/datepicker/daterangepicker.css"
                rel="stylesheet"
                media="all"
                />
            <link
                href="Assets/Template/Main/css/main.css"
                rel="stylesheet"
                media="all"
                />
        </head>

        <body>

            <div class="page-wrapper bg-img-2 p-t-25 p-b-120"> 
                <div class="nav-bar">
                    <div class="nav-heading">Click Bus</div>
                    <div class="insta-default">
                        <a href="Login.jsp" class="insta-default">Log in</a>
                    </div>
                </div>
                <div class="wrapper wrapper--w1226" >
                <%
                    if (request.getParameter("btn_search") == null) {
                %>
                <div class="card card-5">
                    <div class="card-body">
                        <form method="POST">
                            <div class="row">
                                <div class="col">
                                    <div class="input-group">
                                        <label class="label">State From</label>
                                        <select
                                            class="input--style-1"
                                            name="state_from"
                                            onchange="getDistrict1(this.value)"
                                            required="required"
                                            style="width: 350px;margin:10px"
                                            >
                                            <option>------Select--------</option>
                                            <%
                                                String disQry1 = "select * from tbl_state";
                                                ResultSet data1 = con.selectCommand(disQry1);
                                                while (data1.next()) {
                                            %> 
                                            <option   value = "<%=data1.getString("state_id")%>"><%=data1.getString("state_name")%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <label class="label">District From</label>
                                        <select
                                            class="input--style-1"
                                            name="district_from"
                                            id="district_from"
                                            onchange="getPlace1(this.value)"
                                            required="required"
                                            style="width: 350px;margin:10px"
                                            >
                                            <option>------Select--------</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <label class="label">Place from</label>
                                        <select
                                            class="input--style-1"
                                            name="place_from"
                                            required="required"
                                            style="width: 350px;margin:10px"
                                            id="place_from"
                                            >
                                            <option>------Select--------</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="input-group">
                                        <label class="label">State To</label>
                                        <select
                                            class="input--style-1"
                                            name="state_from"
                                            onchange="getDistrict2(this.value)"
                                            required="required"
                                            style="width: 350px;margin:10px"
                                            >
                                            <option>------Select--------</option>
                                            <%
                                                String disQry = "select * from tbl_state";
                                                ResultSet data = con.selectCommand(disQry1);
                                                while (data.next()) {
                                            %> 
                                            <option   value = "<%=data.getString("state_id")%>"><%=data.getString("state_name")%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <label class="label">District To</label>
                                        <select
                                            class="input--style-1"
                                            name="district_to"
                                            id="district_to"
                                            onchange="getPlace2(this.value)"
                                            required="required"
                                            style="width: 350px;margin:10px"
                                            >
                                            <option>------Select--------</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <label class="label">Place To</label>
                                        <select
                                            class="input--style-1"
                                            name="place_to"
                                            required="required"
                                            style="width: 350px;margin:10px"
                                            id="place_to"
                                            >
                                            <option>------Select--------</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="row row-space">
                                        <div class="col-2"></div>
                                        <div class="col-2"></div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="row row-space">
                                        <div class="col-2"></div>
                                        <div class="col-2">
                                            <button class="btn-submit" name="btn_search" type="submit">search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <br><br><br><br><br>
                <%
                    }
                    if (request.getParameter("btn_search") != null) {
                        String fromPlace = request.getParameter("place_from");
                        String toPlace = request.getParameter("place_to");
                %>
                <div class="card card-5">
                    <div class="card-body">
                        <div class="row row-space">


                            <iframe style="border: none; border-radius: 15px; width: 100%; height: 653px ;" src = "List.jsp?fromPlace=<%=fromPlace%>&toPlace=<%=toPlace%>" ></iframe>


                        </div>
                    </div>
                </div>  
                <%
                    }
                %>

            </div>
        </div>
        <script src="Assets/Jq/jquery.js"></script>
        <script>

                                                function getDistrict1(sid) {
                                                    $.ajax({
                                                        type: "POST",
                                                        data: {sid: sid},
                                                        url: "Assets/AjaxPages/AjaxDistrict.jsp",
                                                        success: function(result) {
                                                            $("#district_from").html(result);
                                                        },
                                                    });
                                                }

                                                function getDistrict2(sid) {
                                                    $.ajax({
                                                        type: "POST",
                                                        data: {sid: sid},
                                                        url: "Assets/AjaxPages/AjaxDistrict.jsp",
                                                        success: function(result) {
                                                            $("#district_to").html(result);
                                                        },
                                                    });
                                                }


                                                function getPlace1(did1) {
                                                    $.ajax({
                                                        type: "POST",
                                                        data: {did: did1},
                                                        url: "Assets/AjaxPages/AjaxPlace.jsp",
                                                        success: function(result) {
                                                            $("#place_from").html(result);
                                                        },
                                                    });
                                                }
                                                function getPlace2(did2) {
                                                    var id = document.getElementById("place_from").value;

                                                    $.ajax({
                                                        type: "POST",
                                                        data: {did: did2, id: id},
                                                        url: "Assets/AjaxPages/AjaxPlace1.jsp",
                                                        success: function(result) {
                                                            $("#place_to").html(result);
                                                        },
                                                    });
                                                }
        </script>
        <script src="Assets/Template/Main/vendor/jquery/jquery.min.js"></script>
        <script src="Assets/Template/Main/vendor/select2/select2.min.js"></script>
        <script src="Assets/Template/Main/vendor/jquery-validate/jquery.validate.min.js"></script>
        <script src="Assets/Template/Main/vendor/bootstrap-wizard/bootstrap.min.js"></script>
        <script src="Assets/Template/Main/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="Assets/Template/Main/vendor/datepicker/moment.min.js"></script>
        <script src="Assets/Template/Main/vendor/datepicker/daterangepicker.js"></script>
        <script src="Assets/Template/Main/js/global.js"></script>
    </body>
</html>
