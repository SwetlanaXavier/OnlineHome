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
         <h3 align="center"><a href="MyProfile.jsp">My Profile</a></h3>
         <h3 align="center"><a href="EditProfile.jsp">Edit Profile</a></h3>
         <br>
          <h3 align="center"><a href="Constructions.jsp">Constructions</a></h3>
         <h3 align="center"><a href="CompanySite.jsp">Company Site</a></h3>
          <h3 align="center"><a href="ConstructionDetails.jsp">Add Construction Details</a></h3>
          <br>
        <h3 align="center"><a href="Gallery.jsp">Gallery Upload(Property)</a></h3>
        <br>
        <h3 align="center"><a href="NewUserBookingList.jsp">New Proposal for buying</a></h3>
        <h3 align="center"><a href="NewRentBookingList.jsp">New Proposal for rent</a></h3>
        <h3 align="center"><a href="NewLeaseBookingList.jsp">New Proposal for lease</a></h3>
        
         <h3 align="center"><a href="#">View Accepted Proposal</a></h3>
         <br>
        <h3 align="center"><a href="#">Add new Technician vacancies </a></h3>
        
        
         <h3 align="center"><a href="ChangePassword.jsp">Change Password</a></h3>
        
         
         <h3 align="center"><a href="../Guest/Login.jsp">LogOut</a></h3>
    </body>
</html>
