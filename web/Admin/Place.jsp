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
            String place = request.getParameter("txt_place");
            String district = request.getParameter("sel_district");

            String ins = "insert into tbl_place (place_name,district_id) values('" + place + "','" + district + "')";

            if (con.executeCommand(ins)) {
                response.sendRedirect("Place.jsp");
            }

        }

        if (request.getParameter("id") != null) {
            String del = "delete from tbl_place where place_id = '" + request.getParameter("id") + "'";
            if (con.executeCommand(del)) {
                response.sendRedirect("Place.jsp");
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
                                                    <h3 class="mb-0" >Table Place</h3>
                                                </div>
                                            </div>
                                            <form method="post">
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
                                                    <label for="txt_district">district</label>
                                                    <select class="form-control" name="sel_district" id="sel_district">
                                                        <option value="">-----Select-----</option>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_district">Place</label>
                                                    <input type="text" name="txt_place" id="txt_place" class="form-control"/>
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
                                                <td align="center" scope="col">State</td>
                                                <td align="center" scope="col">district</td>
                                                <td align="center" scope="col">Place </td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                                String sel = "select * from tbl_place p inner join tbl_district d on d.district_id=p.district_id inner join tbl_state s on s.state_id=d.state_id";
                                                ResultSet data = con.selectCommand(sel);
                                                while (data.next()) {
                                                    i++;
                                            %> 
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=data.getString("state_name")%></td>
                                                <td align="center"><%=data.getString("district_name")%></td>
                                                <td align="center"><%=data.getString("place_name")%></td>
                                                <td align="center"><a href="Place.jsp?id=<%=data.getString("place_id")%>" class="status_btn">Delete</a></td>                                     
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
        </script>
    </body>
</html>