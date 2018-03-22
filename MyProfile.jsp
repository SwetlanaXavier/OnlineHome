<%-- 
    Document   : MyProfile
    Created on : 22 Feb, 2018, 10:23:03 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technician:MyProfile</title>
    </head>
    <body>
     
       <form name="frm_techprofile">
           <a href="HomePage.jsp"></a>    
                   <table class="table table-hover" align="center" border="1">
      <%
        
        String Sel="select * from tbl_technicians t inner join tbl_district d on t.district_id = d.district_id inner join tbl_login l on t.login_id=l.login_id where technician_id='"+session.getAttribute("technicianid") +"'";
                    ResultSet rs=obj.selectData(Sel);
                     while(rs.next())
                     {
                     %>
                     <tr>
                     <th>Technician Name</th>
                     <td><%=rs.getString("technician_name")%></td>
                     </tr>
                     
                     <tr>
                          <th>Address</th>
                           <td><%=rs.getString("technician_address")%></td>
                     </tr>
                     
                     <tr>
                         <th>Contact</th>
                         <td><%=rs.getString("technician_contact")%></td>
                     </tr>
                     
                     <tr>
                         <th>Email</th>
                          <td><%=rs.getString("technician_email")%></td>
                     </tr>
                     
                   <tr>
                       <th>District</th>
                   <td><%=rs.getString("district_id")%></td>
                   </tr>
                    <tr>
                       <th>Experience</th>
                   <td><%=rs.getString("technician_experience")%></td>
                   </tr>
                   
                   <tr>
                       <th>Photo</th>
                   <td><img src="../Technicians/Photo/<%=rs.getString("technician_photo")%>"></td>
                   </tr>
                   
                   <tr>
                       <th>Proof</th>
                   <td><img src="../Technicians/Proof/<%=rs.getString("technician_proof")%>"></td>
                   </tr>
                   
                   <tr>
                       <th>Username</th>
                   <td><%=rs.getString("login_username")%></td>
                   </tr>
                   
                   <tr>
                       <th>Password</th>
                   <td><%=rs.getString("login_password")%></td>
                   </tr>
                   
                  <%
                              
                                  }
                  %>
       
                   </table>
    </form>
    
    </body>
</html>
