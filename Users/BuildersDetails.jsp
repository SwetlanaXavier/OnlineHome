<%-- 
    Document   : BuildersDetails
    Created on : 12 Mar, 2018, 11:07:24 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Builder details</title>
    </head>
    <body>
        <form name="frm_builddertails" >
          <table  align="center">
                        
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
           
    
        <%
            if(request.getParameter("aid")!=null)
            {
            
            session.setAttribute("bid", request.getParameter("aid"));
            String selQry="select * from tbl_builders b inner join tbl_district d on b.district_id = d.district_id where builders_id="+request.getParameter("aid");
            ResultSet rs=obj.selectData(selQry);
           
            if(rs.next())
            {
               
                
        %>

                <tr>
                    <th colspan="2" align="center"><img style="width: 100px;height: 100px" src="../Builders/Logo/<%=rs.getString("builders_logo")%> " height="150" width="150">
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                  <td><%=rs.getString("builders_name")%></td>
  
                </tr>
                <tr align="left">
                  <th>Address:</th>  
                    <td><%=rs.getString("builders_address")%></td>
                </tr>
                <tr align="left">
                    <tr align="left">
                  <th>Contact  Number:</th>  
                    <td><%=rs.getString("builders_contact")%></td>
                </tr>
                     <th>E-mail:</th>
                    <td><%=rs.getString("builders_emailid")%></td>
                </tr>
                <tr align="left">
                    
                 <th>District:</th>
     
                     <td><%=rs.getString("district_name")%></td>
                </tr>
                
                   <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                                    
                     <tr><td colspan="2" align="center">
                             <input type="submit" name="btnsubmit" value="View Projects" formaction="WorkList.jsp">
                            <input type="submit" name="btnsubmit" value="Send Proposal for Construction" formaction="#">
                         </td></tr>
                                           
                   
                  <td><a href="ViewBuilders.jsp">Back...</a></td>
                 
         
               </tr>
               <%
                
            }
            }
        %>
        </table>
        </form>

    </body>
</html>
