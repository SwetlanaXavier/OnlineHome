<%-- 
    Document   : BuildersApprovedList
    Created on : 22 Feb, 2018, 12:19:21 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Builders Approved List</title>
    </head>
    <body>
       <form name="frm_builderpending">
            
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Builders Name</th>
                <th>Address</th>
                <th>Contact no</th>
                <th>Email</th>
                <th>District</th>
                <th>Logo</th>
                <th>Proof</th>
               
                       </tr>
                   
                     <% int i=1;
                    String str="select * from tbl_builders b inner join tbl_district d on b.district_id = d.district_id where builders_status=1";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                    <td><%=i%></td>
                   <td><%=rs.getString("builders_name")%></td>
                   <td><%=rs.getString("builders_address")%></td>
                   <td><%=rs.getString("builders_contact")%></td>
                   <td><%=rs.getString("builders_emailid")%></td>
                   <td><%=rs.getString("district_name")%></td>
                   <td><%=rs.getString("builders_logo")%></td>
                   <td><%=rs.getString("builders_proof")%></td>
         
                   
                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
      <br>
     <a href="NewBuildersList.jsp>">Back to New Builders Registration</a>
   
    </body>
</html>
