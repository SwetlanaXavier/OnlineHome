<%-- 
    Document   : ViewBookedList
    Created on : 22 Mar, 2018, 10:38:28 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Booked from Builders</p>
        <a href="BookingView.jsp">View property booking List</a><br>
        <a href="LeaseView.jsp">View Lease list</a><br>
        <a href="RentView.jsp">View Rent list</a>
        <p>Booked from Seller</p>
         <a href="PBookingView.jsp">View Seller property booking list</a>
          <a href="RentView.jsp">View Rent list</a>
           <a href="RentView.jsp">View Rent list</a>
    </body>
</html>
