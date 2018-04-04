<%-- 
    Document   : BookingView
    Created on : 22 Mar, 2018, 10:39:04 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User Booked Details </title>
    </head>
    <body>
      <form name="frm_bookingview">
            
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Image</th>
                <th>Address</th>
                <th>Rate</th>
                <th>Booking Date</th>
                <th>Builders Name</th>
                <th>Status</th>
                       </tr>
                   
                     <% int i=1;
                    String str="select * from tbl_userbooking u inner join tbl_constructiondetails cd on u.constructiondetails_id = cd.constructiondetails_id inner join tbl_construction c on c.construction_id = cd.construction_id inner join tbl_builders b on c.builders_id = b.builders_id  where u.user_id='"+session.getAttribute("userid")+"'";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                         
                       
                     %>
                     <tr>
                    <td><%=i%></td>
                    <td><img style="width: 250px;height: 200px" src="../Builders/Construction/<%=rs.getString("construction_image")%>"></td>
                   <td><%=rs.getString("construction_address")%></td>
                   <td><%=rs.getString("construction_amount")%></td>
                   <td><%=rs.getString("userbooking_date")%></td>
                   <td><%=rs.getString("builders_name")%></td>
                   <%
                   if ((rs.getString("status").equals("0")))
                       {  %>
                       <td>Pending</td>
                    <%   }
                   else if ((rs.getString("status").equals("1")))
                       {  %>
                           <td>Accepted</td>
                      <% }
                   else if((rs.getString("status").equals("2")))
                       {  %>
                           <td>Rejected</td>
                       <%}
                   %>
                   
                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
    
    </body>
</html>
