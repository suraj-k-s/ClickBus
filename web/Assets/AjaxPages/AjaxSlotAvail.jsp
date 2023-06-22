<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    int flag = 0;
    int j = 0;
    for (int i = 1; i <= 30; i++) {
        j++;

        String sel = "SELECT * from tbl_booking b inner join tbl_user u on u.user_id=b.user_id inner join tbl_seat s on s.booking_id=b.booking_id where seat_no='" + "s" + i + "' and booking_date='" + request.getParameter("date") + "'";
        ResultSet row = con.selectCommand(sel);
        if (row.next()) {

            if (row.getString("seat_no").equals("s" + i) && row.getString("seat_status").equals("1") && row.getString("booking_status").equals("1")) {
%>
<i class='fas fa-chair' style='font-size:50px;color:red;padding: 20px;'  id="s<%=i%>"></i>
<%

} else if (row.getString("seat_no").equals("s" + i) && row.getString("seat_status").equals("0") && row.getString("booking_status").equals("0") && row.getString("user_id").equals(session.getAttribute("uid"))) {
%>
<i onClick="deleteSlot(this.id,<%=request.getParameter("id")%>)" id="s<%=i%>" class='fas fa-chair' style='font-size:50px;color:green;padding: 20px;'  id="s<%=i%>"></i>
<%
    }

} else {
%>
<i onClick="insert(this.id,<%=request.getParameter("id")%>)" id="s<%=i%>" class='fas fa-chair' style='font-size:50px;color:grey;padding: 20px;'></i> 
<%
            flag = 1;
        }
        if (j == 10) {
            out.print("<br>");
            j = 0;
        }
    }
%>