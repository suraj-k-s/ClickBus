<%@page import="java.sql.ResultSet"%>
<%@include file="Head.jsp" %>

    <section class="main_content dashboard_part">
        <!-- menu  -->

        <!--/ menu  -->
        <div class="main_content_iner ">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="single_element">
                            <div class="quick_activity">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="quick_activity_wrap">
                                            <div class="single_quick_activity d-flex">
                                                <div class="icon">
                                                    <img src="../Assets/Template/Admin/img/icon/user.png" alt="">
                                                </div>
                                                <div class="count_content">
                                                    <h3><span class="counter">
                                                        <%
                                                            String sel = "select count(bs_id) as id from tbl_bus_service";
                                                            ResultSet data = con.selectCommand(sel);
                                                            data.next();
                                                            out.println(data.getString("id"));
                                                        %>
                                                    </span> </h3>
                                                <p>Private</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-12">
                    <div class="white_box card_height_100">
                        <div class="box_header border_bottom_1px  ">
                            <div class="main-title">
                                <h3 class="mb_25">Driver</h3>
                            </div>
                        </div>
                        <div class="staf_list_wrapper sraf_active owl-carousel">
                            <%
                                String selz = "select * from tbl_bus_service";
                                ResultSet data1 = con.selectCommand(selz);
                                                            
                                while (data1.next()) {
                            %>
                            <!-- single carousel  -->
                            <div class="single_staf">
                                <div class="staf_thumb">
                                    <img src="../Assets/Files/DriverPhoto/<%=data1.getString("bs_photo")%>" alt="">
                                </div>
                                <h4><%=data1.getString("bs_name")%></h4>
                                <p><%=data1.getString("bs_contact")%></p>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</section>
<!-- main content part end -->

<!-- footer  -->
<!-- jquery slim -->
<script src="../Assets/Template/Admin/js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="../Assets/Template/Admin/js/popper.min.js"></script>
<!-- bootstarp js -->
<script src="../Assets/Template/Admin/js/bootstrap.min.js"></script>
<!-- sidebar menu  -->
<script src="../Assets/Template/Admin/js/metisMenu.js"></script>
<!-- waypoints js -->
<script src="../Assets/Template/Admin/vendors/count_up/jquery.waypoints.min.js"></script>
<!-- waypoints js -->
<script src="../Assets/Template/Admin/vendors/chartlist/Chart.min.js"></script>
<!-- counterup js -->
<script src="../Assets/Template/Admin/vendors/count_up/jquery.counterup.min.js"></script>
<!-- swiper slider js -->
<script src="../Assets/Template/Admin/vendors/swiper_slider/js/swiper.min.js"></script>
<!-- nice select -->
<script src="../Assets/Template/Admin/vendors/niceselect/js/jquery.nice-select.min.js"></script>
<!-- owl carousel -->
<script src="../Assets/Template/Admin/vendors/owl_carousel/js/owl.carousel.min.js"></script>
<!-- gijgo css -->
<script src="../Assets/Template/Admin/vendors/gijgo/gijgo.min.js"></script>
<!-- responsive table -->
<script src="../Assets/Template/Admin/vendors/datatable/js/jquery.dataTables.min.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/dataTables.responsive.min.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/dataTables.buttons.min.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/buttons.flash.min.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/jszip.min.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/pdfmake.min.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/vfs_fonts.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/buttons.html5.min.js"></script>
<script src="../Assets/Template/Admin/vendors/datatable/js/buttons.print.min.js"></script>

<script src="../Assets/Template/Admin/js/chart.min.js"></script>
<!-- progressbar js -->
<script src="../Assets/Template/Admin/vendors/progressbar/jquery.barfiller.js"></script>
<!-- tag input -->
<script src="../Assets/Template/Admin/vendors/tagsinput/tagsinput.js"></script>
<!-- text editor js -->
<script src="../Assets/Template/Admin/vendors/text_editor/summernote-bs4.js"></script>

<script src="../Assets/Template/Admin/vendors/apex_chart/apexcharts.js"></script>

<!-- custom js -->
<script src="../Assets/Template/Admin/js/custom.js"></script>

<script src="../Assets/Template/Admin/vendors/apex_chart/bar_active_1.js"></script>
<script src="../Assets/Template/Admin/vendors/apex_chart/apex_chart_list.js"></script>
</body>
</html>