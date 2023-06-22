<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    java.time.LocalDate currentDate = java.time.LocalDate.now();
    java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("Y-MM-d");
    String formattedDate = currentDate.format(formatter);

    if (request.getParameter("btn_save") != null) {
        String sel = "select count(seat_no) as no ,b.booking_id as bid from tbl_booking b inner join tbl_seat s on s.booking_id=b.booking_id where user_id='" + session.getAttribute("uid") + "' and shedule_id='" + request.getParameter("id") + "' and booking_date='" + request.getParameter("txt_date") + "' and booking_status=0 GROUP BY b.booking_id";
        System.out.print(sel);
        ResultSet data = con.selectCommand(sel);
        if (data.next()) {
            int amount = data.getInt("no") * Integer.parseInt(request.getParameter("amount"));

            String up = "update tbl_booking set booking_status=1, booking_amount='" + amount + "' where booking_id='" + data.getString("bid") + "'";
            if (con.executeCommand(up)) {
                String up1 = "update tbl_seat set seat_status=1 where booking_id='" + data.getString("bid") + "'";
                if (con.executeCommand(up1)) {
%>
<script>
    window.location = "Payment.jsp";
</script>
<%
                }
            }

        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="../Assets/Jq/jquery.js" type="text/javascript"></script> 

    </head>


    <body align='center' onLoad="getData()">


        <i class='fas fa-chair' style='font-size:50px;color:red; padding: 20px;'></i>Booked Seat 
        <i class='fas fa-chair' style='font-size:50px;color:gray;padding: 20px;'></i>Available Seat
        <i class='fas fa-chair' style='font-size:50px;color:green;padding: 20px;'></i>Selected Seat




        <br><br><br>
        <form method="post">  
            <input type="date" name="txt_date" min="<%=formattedDate%>" value="<%=formattedDate%>" onChange="getData()" id="txt_date">
            <br><br><br>
            <div id="dataT">

            </div>

            <input type="hidden" name="txt_amount" value="<%=request.getParameter("amount")%>">
            <input type="submit" name="btn_save" value="Pay Now">
        </form>
    </body>
    <script>
        function insert(seat, id)
        {
            var date = document.getElementById("txt_date").value;

            $.ajax({
                url: "../Assets/AjaxPages/AjaxSlot.jsp?action=insert&seat=" + seat + "&id=" + id + "&date=" + date,
                success: function(result) {
                    document.getElementById(seat).style.color = "green";
                }});
        }
        function deleteSlot(seat, id)
        {
            var date = document.getElementById("txt_date").value;

            $.ajax({
                url: "../Assets/AjaxPages/AjaxSlot.jsp?action=delete&seat=" + seat + "&id=" + id + "&date=" + date,
                success: function(result) {
                    document.getElementById(seat).style.color = "grey";
                }});
        }

        function getData()
        {
            var date = document.getElementById("txt_date").value;

            $.ajax({
                url: "../Assets/AjaxPages/AjaxSlotAvail.jsp?id=" +<%=request.getParameter("id")%> + "&date=" + date,
                success: function(result) {
                    document.getElementById("dataT").innerHTML = result;
                }});
        }
    </script>
</html>
