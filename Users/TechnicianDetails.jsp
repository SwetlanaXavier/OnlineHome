<%-- 
    Document   : TechnicianDetails
    Created on : 1 Mar, 2018, 9:48:31 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>#</title>
    </head>
    <body>
        
         <table  align="center">
                        
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
           
    
        <%
            if(request.getParameter("aid")!=null)
            {
            
            
            String selQry="select * from tbl_technicians t inner join tbl_district d on t.district_id = d.district_id inner join tbl_techniciantype tt on t.techniciantype_id = tt.techniciantype_id where technician_id="+request.getParameter("aid");
            ResultSet rs=obj.selectData(selQry);
            if(rs.next())
            {
               
                
        %>

                <tr >
                    <th colspan="2" align="center"><img style="width: 100px;height: 100px" src="../Technicians/Photo/<%=rs.getString("technician_photo")%> " height="150" width="150">
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                  <th> Name:</th><td><%=rs.getString("technician_name")%></td>
  
                </tr>
                <tr align="left">
                  <th>Address:</th>  
                    <td><%=rs.getString("technician_address")%></td>
                </tr>
                <tr align="left">
                     <th>E-mail:</th>
                    <td><%=rs.getString("technician_email")%></td>
                </tr>
                <tr align="left"><th>Contact Number:</th><td><%=rs.getString("technician_contact")%></td></tr>
                <tr align="left">
                    
                 <th>District:</th>
     
                     <td><%=rs.getString("district_name")%></td>
                </tr>
                
                <tr align="left">
                    
                 <th>Type of Work:</th>   
                    
                    <td><%=rs.getString("techniciantype_type")%></td>
                </tr>
                <tr align="left">
                     <th>EXPERIENCE:</th>
                  <td><%=rs.getString("technician_experience")%></td>  
                    
                </tr>
                  <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                                    
                                                     
  
                  <td><a href="ViewTechnicians.jsp">Back...</a></td>
                 
         
               </tr>
               <%
               
             
                
            }
            }
        %>
        </table>
 
    </body>
</html>
