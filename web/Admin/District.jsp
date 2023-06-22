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
            String district = request.getParameter("txt_district");
            String state = request.getParameter("sel_state");

            String ins = "insert into tbl_district (district_name,state_id) values('" + district + "','" + state + "')";

            if (con.executeCommand(ins)) {
                response.sendRedirect("District.jsp");
            }

        }

        if (request.getParameter("id") != null) {
            String del = "delete from tbl_district where district_id = '" + request.getParameter("id") + "'";
            if (con.executeCommand(del)) {
                response.sendRedirect("District.jsp");
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
                                                    <h3 class="mb-0" >Table District</h3>
                                                </div>
                                            </div>
                                            <form method="post">
                                                <div class="form-group">
                                                    <label for="txt_state">state</label>
                                                    <select class="form-control" name="sel_state" id="sel_state">
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
                                                    <label for="txt_state">District</label>
                                                    <input type="text" name="txt_district" id="txt_district" class="form-control"/>
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
                                                <td align="center" scope="col">state</td>
                                                <td align="center" scope="col">District </td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                                String sel = "select * from tbl_district p inner join tbl_state d on d.state_id=p.state_id";
                                                ResultSet data = con.selectCommand(sel);
                                                while (data.next()) 
                                                    {
                                                        i++;
                                            %> 
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=data.getString("state_name")%></td>
                                                <td align="center"><%=data.getString("district_name")%></td>
                                                <td align="center"><a href="District.jsp?id=<%=data.getString("district_id")%>" class="status_btn">Delete</a></td>                                     
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

    </body>
</html>