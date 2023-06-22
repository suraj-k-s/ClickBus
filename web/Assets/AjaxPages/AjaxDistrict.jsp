<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">Select District</option> 
<%
    String disQry1 = "select * from tbl_district where state_id='" + request.getParameter("sid") + "'";
    ResultSet data1 = con.selectCommand(disQry1);
    while (data1.next()) {
%> 
<option   value = "<%=data1.getString("district_id")%>"><%=data1.getString("district_name")%></option>
<%
    }
%>