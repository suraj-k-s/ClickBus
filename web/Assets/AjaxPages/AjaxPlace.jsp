<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">Select Place</option> 
<%
    String disQry1 = "select * from tbl_place where district_id='" + request.getParameter("did") + "'";
    ResultSet data1 = con.selectCommand(disQry1);
    while (data1.next()) {
%> 
<option   value = "<%=data1.getString("place_id")%>"><%=data1.getString("place_name")%></option>
<%
    }
%>