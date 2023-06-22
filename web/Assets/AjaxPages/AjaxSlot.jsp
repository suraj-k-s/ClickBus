<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("action") != null) {
        String uid = session.getAttribute("uid").toString();
        String id = request.getParameter("id");
        String date = request.getParameter("date");
        String seat = request.getParameter("seat");
        String bid = "";
        if (request.getParameter("action").equals("insert")) {
            String sel = "select * from tbl_booking where user_id='" + uid + "' and shedule_id='" + id + "' and booking_date='" + date + "' and booking_status=0";
            ResultSet row = con.selectCommand(sel);
            if (row.next()) {

                String ins = "insert into tbl_seat(seat_no,booking_id)values('" + seat + "','" + row.getString("booking_id") + "')";
                if (con.executeCommand(ins)) {
                    out.println("Inserted as Exist");

                }
            } else {
                String ins1 = "insert into tbl_booking(user_id,shedule_id,booking_date,booked_date)values('" + uid + "','" + id + "','" + date + "',curdate())";
                if (con.executeCommand(ins1)) {

                    String sel1 = "select * from tbl_booking where user_id='" + uid + "' and shedule_id='" + id + "' and booking_date='" + date + "' and booking_status=0";
                    ResultSet row1 = con.selectCommand(sel1);
                    if (row1.next()) {
                        bid = row1.getString("booking_id");
                    }
                    String ins2 = "insert into tbl_seat(seat_no,booking_id)values('" + seat + "','" + bid + "')";
                    if (con.executeCommand(ins2)) {
                        out.println("Inserted as New");
                    }
                }
            }
        }
        if (request.getParameter("action").equals("delete")) {

            String seld = "select * from tbl_booking where user_id='" + uid + "' and shedule_id='" + id + "' and booking_date='" + date + "' and booking_status=0";
            ResultSet row12 = con.selectCommand(seld);
            if (row12.next()) {
                String del = "delete from tbl_seat where seat_no='" + seat + "' and booking_id='" + row12.getString("booking_id") + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");

                }
            }
        }
    }

%>