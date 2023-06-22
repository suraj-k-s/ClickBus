<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String bid = session.getAttribute("bid").toString();
    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
    String sel = "select * from tbl_schedule  where bs_id='" + bid + "' ";
    ResultSet row = con.selectCommand(sel);
    if (row.next()) {

        String ins = "update tbl_schedule set schedule_longitude='" + longitude + "',schedule_latitude='" + latitude + "' where schedule_id='" + row.getString("schedule_id") + "'";
        if (con.executeCommand(ins)) {
            out.println("updated");
        }
    }

%>