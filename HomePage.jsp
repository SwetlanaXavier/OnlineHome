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
        <title>Technician Homepage</title>
    </head>
    <body>
         <%
            String sel="select technician_name from tbl_technicians where technician_id='"+session.getAttribute("technicianid") +"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
                %>
                <h1 align="center">Welcome <%=rs.getString("technician_name")%></h1>
                <%
            }
        %>
        <h3 align="center"><a href="MyProfile.jsp">My Profile</a></h3>
        <h3 align="center"><a href="EditProfileTech.jsp">Edit Profile</a></h3>
         <h3 align="center"><a href="ChangePassword.jsp">Change Password</a></h3>
         <h3 align="center"><a href="WorkPost.jsp">Work Post</a></h3>
          <h3 align="center"><a href="../Guest/Login.jsp">LogOut</a></h3>
         <br>
        <h3 align="center"><a href="#">Work Quotations </a></h3>
        <h3 align="center"><a href="#">New Jobs vacancies</a></h3>
    </body>
</html>
