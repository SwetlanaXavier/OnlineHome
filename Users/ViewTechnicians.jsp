<%-- 
    Document   : ViewTechnicians
    Created on : 16 Feb, 2018, 11:48:10 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Technician</title>
    </head>
    <body>
        
        <form name="frm_viewtech">
                   <table class="table table-hover" align="center" border="0">
                       <tr>
                           
        <%
          String TechId="";  
          String TechName="";
          String Photo="";
          String District="";
          String Email="";
          String Type="";
          String Experience="";
          String Contact="";
            String selQry="select * from tbl_technicians where technician_status=1 ";
            ResultSet rs =obj.selectData(selQry);
                 int i=0;
            while(rs.next())
            {
                TechId=rs.getString("technician_id");
                TechName=rs.getString("technician_name");
                District=rs.getString("district_id");
                Photo=rs.getString("technician_photo");
                Email=rs.getString("technician_email");
                Type=rs.getString("techniciantype_id");
                Experience=rs.getString("technician_experience");
                Contact=rs.getString("technician_contact");
                
                  %>
                  
                      <td><img style="width: 100px;height: 100px" src="../Technicians/Photo/<%=rs.getString("technician_photo")%> ">
                       <h3>Name:<%=TechName%></h3>
                       <h3>Contact NO:<%=Contact%></h3>
                       <h3>Type of Work:<%=Type%></h3>
                       <h3>EXPERIENCE:<%=Experience%></h3>
                       <h3><a href="TechnicianDetails.jsp?aid=<%=TechId%>">view more details...</a></h3>
                   </td>
                   <%
                   i++;
                   %>
          <% }   
        %>
                    
                   </tr>
            
                   </table>
        </form>
          
            </body>
</html>
