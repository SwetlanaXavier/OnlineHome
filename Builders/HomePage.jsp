<%-- 
    Document   : HomePage
    Created on : 22 Feb, 2018, 10:22:33 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Builder:HomePage</title>
    </head>
    <body>
        <%
            String sel="select builders_name from tbl_builders where builders_id='"+session.getAttribute("buildersid") +"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
                %>
                <h1 align="center">Welcome <%=rs.getString("builders_name")%></h1>
                <%
            }
        %>
        <h3 align="center"><a href="MyProfile.jsp">MyProfile</a></h3>
        <h3 align="center"><a href="EditProfile.jsp">EditProfile</a></h3>
        <h3 align="center"><a href="ChangePassword.jsp">Change Password</a></h3>
        
    </body>
</html>
