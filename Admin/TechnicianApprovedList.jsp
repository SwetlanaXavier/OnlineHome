<%-- 
    Document   : TechnicianList
    Created on : 16 Feb, 2018, 11:39:26 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Approved Technicians</title>
    </head>
    <body>
    
       <form name="frm_technicianreject">
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                 <tr>
                <th>sl.no</th>
                <th>Technicians Name</th>
                <th>Address</th>
                <th>Contact number</th>
                <th>Email</th>
                <th>Photo</th>
                 <th>Type of Work</th>
                <th>Experience</th>
                <th>Proof</th>
                <th>District</th>
               
                       </tr>
                     <% int i=1;
                    String str="select * from tbl_technicians b inner join tbl_district d on b.district_id = d.district_id inner join tbl_techniciantype t on t.techniciantype_id = b.techniciantype_id  where technician_status=1";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                     <td><%=i%></td>
                   <td><%=rs.getString("technician_name")%></td>
                   <td><%=rs.getString("technician_address")%></td>
                   <td><%=rs.getString("technician_contact")%></td>
                   <td><%=rs.getString("technician_email")%></td>
                   <td><%=rs.getString("technician_photo")%></td>
                   <td><%=rs.getString("techniciantype_type")%></td>
                   <td><%=rs.getString("technician_experience")%></td>
                   <td><%=rs.getString("technician_proof")%></td>
                   <td><%=rs.getString("district_name")%></td>
                     </tr>
                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
       <a href="NewTechniciansList.jsp">Back to New Builders Registration</a>    </body>
</html>
