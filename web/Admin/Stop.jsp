<%@page import="java.sql.ResultSet"%>
<%@include file="Head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
    </head>
    <%

        if (request.getParameter("btn_save") != null) {

            String insQry = "insert into tbl_stop(route_id,place_id,stop_time,stop_number,stop_km)"
                    + "values('" + request.getParameter("sel_route") + "','" + request.getParameter("sel_place") + "','" + request.getParameter("txt_time") + "','" + request.getParameter("txt_stop") + "','" + request.getParameter("txt_km") + "')";

            if (con.executeCommand(insQry)) {
                response.sendRedirect("Stop.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_stop where stop_id='" + request.getParameter("del") + "'";
            if (con.executeCommand(delQry)) {
                response.sendRedirect("Stop.jsp");
            }
        }


    %>

    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner">
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
                                                    <h3 class="mb-0" >Table Stop</h3>
                                                </div>
                                            </div>
                                            <form method="post">

                                                <div class="form-group">
                                                    <label for="sel_route">Select Route</label>
                                                    <select required="" class="form-control" name="sel_route" id="sel_route">
                                                        <option value="" >Select</option>
                                                        <%  String selQryz = "select * from tbl_route";
                                                            ResultSet dataz = con.selectCommand(selQryz);
                                                            while (dataz.next()) {
                                                        %>
                                                        <option value="<%=dataz.getString("route_id")%>"><%=dataz.getString("route_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
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
                                                    <select class="form-control" name="sel_district" onchange="getPlace(this.value)" id="sel_district">
                                                        <option value="">-----Select-----</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sel_place">Select Place</label>
                                                    <select required="" class="form-control" name="sel_place" id="sel_place">
                                                        <option value="" >Select</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_stop">Stop Number</label>
                                                    <input required="" type="number" class="form-control" id="txt_stop" name="txt_stop">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_stop">Stop KM</label>
                                                    <input required="" type="number" class="form-control" id="txt_km" name="txt_km">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_time">Required Time From Previous Stop</label>
                                                    <input required="" type="number" class="form-control" id="txt_time" name="txt_time">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
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
                                                <td align="center" scope="col">Route</td>
                                                <td align="center" scope="col">Stop No</td>
                                                <td align="center" scope="col">Stop</td>
                                                <td align="center" scope="col">Time</td>
                                                <td align="center" scope="col">KM</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                               String selQry2 = "select * from tbl_stop s inner join tbl_route r on r.route_id=s.route_id inner join tbl_place l on l.place_id=s.place_id";
                                               ResultSet rs1 = con.selectCommand(selQry2);
                                                            while (rs1.next()) {

                                                    i++;

                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs1.getString("route_name")%></td>
                                                <td align="center"><%=rs1.getString("stop_number")%></td>
                                                <td align="center"><%=rs1.getString("place_name")%></td>
                                                <td align="center"><%=rs1.getString("stop_time")%></td>
                                                <td align="center"><%=rs1.getString("stop_km")%></td>
                                                <td align="center"> 
                                                   <a href="Stop.jsp?del=<%=rs1.getString("stop_id")%>" class="status_btn">Delete</a>
                                                </td> 
                                            </tr>
                                            <%                      }


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
                                                        function getPlace(did)
                                                        {

                                                            $.ajax({
                                                                type: "POST",
                                                                data: {did: did},
                                                                url: "../Assets/AjaxPages/AjaxPlace.jsp",
                                                                success: function(result) {
                                                                    $("#sel_place").html(result);
                                                                }});
                                                        }
        </script>

    </body>
</html>