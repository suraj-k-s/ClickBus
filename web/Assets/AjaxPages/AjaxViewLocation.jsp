<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="org.json.JSONObject"%>
<%
    String latitude = "";
    String longitude = "";
    
    
    String selQry  = "select * from tbl_schedule where schedule_id='"+request.getParameter("id")+"'";
    ResultSet rs = con.selectCommand(selQry);
    if(rs.next())
    {
         latitude = rs.getString("schedule_latitude");
         longitude = rs.getString("schedule_longitude");
    }
   

    JSONObject jo = new JSONObject();
    jo.put("latitude", latitude);
    jo.put("longitude", longitude);
    jo.write(response.getWriter());


%>
