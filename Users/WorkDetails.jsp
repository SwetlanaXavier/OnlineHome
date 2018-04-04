<%-- 
    Document   : WorkDetails
    Created on : 15 Mar, 2018, 12:29:26 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Builders Work List detail</title>
    </head>
    <body>
       <form name="frm_workdescri">
          <table  align="center">
                        
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
           
    
        <%
            if(request.getParameter("btnbooking")!=null )    
            {
                String insert="insert into tbl_userbooking(userbooking_date,user_id,constructiondetails_id) values(curdate(),'"+session.getAttribute("userid")+"','"+session.getAttribute("cdetails")+"')";
                boolean b=obj.ExecuteCommand(insert);
                System.out.println(insert);
                if(b)
                {
                    %>
                    <script>
                        alert("Booked");
                    </script>
                    <%
                }
            }
            
            if(request.getParameter("btnrent")!=null)
            {
                String insertRent="insert into tbl_rentapplication(user_id,constructiondetails_id,date) values('"+session.getAttribute("userid")+"','"+session.getAttribute("cdetails")+"',curdate())";
                boolean b1=obj.ExecuteCommand(insertRent);
                System.out.println(insertRent);
                if(b1)
                {
                    %>
                    <script>
                        alert("Booked for Rent");
                    </script>
                    <%
                }
            }
           
            if(request.getParameter("btnlease")!=null)
            {
                String insertLease="insert into tbl_leaseapplication(leaseapply_date,user_id,constructiondetails_id) values(curdate(),'"+session.getAttribute("userid")+"','"+session.getAttribute("cdetails")+"')";
                boolean b2=obj.ExecuteCommand(insertLease);
                System.out.println(insertLease);
                if(b2)
                {
                    %>
                    <script>
                        alert("Booked for Lease");
                    </script>
                    <%
                }
            }
           
            String selQry="select * from tbl_constructiondetails cd inner join tbl_construction c on cd.construction_id = c.construction_id inner join tbl_builders b on b.builders_id = c.builders_id inner join tbl_constructiontype ct on c.constructiontype_id= ct.constructiontype_id inner join tbl_district d on b.district_id = d.district_id where constructiondetails_id="+session.getAttribute("cdetails");
            ResultSet rs=obj.selectData(selQry);
          
            if(rs.next())
            {
               
                
        %>

                <tr>
                    <th colspan="2" align="center"><img style="width: 300px;height: 300px" src="../Builders/Construction/<%=rs.getString("construction_image")%> " height="150" width="150">
                </tr>
                        <tr>
                            <td  align="center">
                     <%
                   
                   if ((rs.getString("construction_status").equals("1")))
                       {  %>
                            <td colspan="2"><font size="50" color="red">Sold Out</font></td>
                     
                       <%}
                   %>
                   
                    </td>
                        </tr>
                        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                    <td colspan="2"><h4><%=rs.getString("construction_caption")%></h4></td>
  
                </tr>
                <tr align="left">
                  <th>Address:</th>  
                    <td><%=rs.getString("construction_address")%></td>
                </tr>
                <tr align="left">
                    
                 <th>District:</th>
     
                     <td><%=rs.getString("district_name")%></td>
                </tr>
                <tr align="left">
                   
                  <th>Construction type:</th>  
                    <td><%=rs.getString("constructiontype_type")%></td>
                </tr>
                     <th>Building Permit Number :</th>
                    <td><%=rs.getString("construction_number")%></td>
                </tr>
                </tr>
                <tr align="left">
                     <th> Rate :</th>
                    <td><%=rs.getString("construction_amount")%></td>
                </tr>
                <tr align="left">
                     <th> Rent rate :</th>
                    <td><%=rs.getString("rent_amount")%></td>
                </tr>
                <tr align="left">
                     <th> Lease Rate :</th>
                    <td><%=rs.getString("lease_amount")%></td>
                </tr>
                 <tr>
                 <th>Specifications:</th>
     
                     <td><%=rs.getString("Description")%></td>
                </tr>
                  
               <%
            }
        %>
                                           
                     <tr><td colspan="2" align="center">
                             <input type="submit" name="btnbooking" value="Book Online">
                        <input type="submit" name="btnrent" value="Send Proposal for Rent">
                        <input type="submit" name="btnlease" value="Send Proposal for Lease">
                        <input type="submit" name="btnconstruction" value="Send Proposal for Construction">
                       
                    </td></tr>
                                           
                     <tr>
                  <td><a href="WorkList.jsp">Back...</a></td>
                  </tr>
        </table>
        </form>

    </body>
</html>
