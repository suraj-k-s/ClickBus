<%@page import="java.sql.ResultSet"%>
<%@include file="Head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
    </head>
    <%

        if (request.getParameter("id") != null) {
            String del = "delete from tbl_bus_service where bs_id = '" + request.getParameter("id") + "'";
            if (con.executeCommand(del)) {
                response.sendRedirect("NewBusService.jsp");
            }
        }


    %>

    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Bus Driver</h3>
                                                </div>
                                            </div>
                                            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPage/DriverActionPage.jsp">
                                                <div class="form-group">
                                                    <label for="txt_name">Name</label>
                                                    <input type="text" name="txt_name" id="txt_name" class="form-control"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_contact">Contact</label>
                                                    <input type="text" name="txt_contact" id="txt_contact" class="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_email">Email</label>
                                                    <input type="text" name="txt_email" id="txt_email" class="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_state">State</label>
                                                    <select class="form-control" name="sel_state" id="sel_state" onchange="getDistrict(this.value)">
                                                        <option value="">-----Select-----</option>
                                                        <%                                                            String selQry = "select * from tbl_state";
                                                            ResultSet rs = con.selectCommand(selQry);
                                                            while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getString("state_id")%>" 
                                                                ><%=rs.getString("state_name")%></option >

                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_district">District</label>
                                                    <select class="form-control" name="sel_district" onchange="getPlace1(this.value)" id="sel_district">
                                                        <option value="">-----Select-----</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sel_place">Select Place</label>
                                                    <select required="" class="form-control" name="sel_place1" id="sel_place1">
                                                        <option value="" >Select</option>
                                                    </select>
                                                </div>                                                <div class="form-group">
                                                    <label for="file_photo">Photo</label>
                                                    <input type="file" name="file_photo" id="file_photo" class="form-control" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_password">Password</label>
                                                    <input type="text" name="txt_password" id="txt_password" class="form-control" />
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Name</td>
                                                <td align="center" scope="col">Email </td>
                                                <td align="center" scope="col">Contact</td>
                                                <td align="center" scope="col">District</td>
                                                <td align="center" scope="col">Place</td>
                                                <td align="center" scope="col">Action </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                                String sel = "select * from tbl_bus_service bs inner join tbl_place p on p.place_id=bs.place_id inner join tbl_district d on d.district_id=p.district_id";
                                                ResultSet rs1 = con.selectCommand(sel);
                                                while (rs1.next()) {
                                                    i++;
                                            %>  
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs1.getString("bs_name")%></td>
                                                <td align="center"><%=rs1.getString("bs_email")%></td>
                                                <td align="center"><%=rs1.getString("bs_contact")%></td>
                                                <td align="center"><%=rs1.getString("district_name")%></td>
                                                <td align="center"><%=rs1.getString("place_name")%></td>
                                                <td align="center">
                                                    <a class="status_btn"  href="NewDriver.jsp?id=<%=rs1.getString("bs_id")%>">Delete </a>
                                                </td>
                                            </tr>
                                            <%
                                                }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <script src="../Assets/Jq/jquery.js"></script>
        <script>
                                                        function getDistrict(sid) {
                                                            $.ajax({
                                                                type: "POST",
                                                                data: {sid: sid},
                                                                url: "../Assets/AjaxPages/AjaxDistrict.jsp",
                                                                success: function(result) {
                                                                    $("#sel_district").html(result);
                                                                },
                                                            });
                                                        }

                                                        function getPlace1(did1)
                                                        {

                                                            $.ajax({
                                                                type: "POST",
                                                                data: {did: did1},
                                                                url: "../Assets/AjaxPages/AjaxPlace.jsp",
                                                                success: function(result) {
                                                                    $("#sel_place1").html(result);
                                                                }});
                                                        }

        </script>
    </body>
</html>