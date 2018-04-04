<%-- 
    Document   : SellersWorkDetails
    Created on : 27 Mar, 2018, 7:08:48 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sellers Work List detail</title>
    </head>
    <body>
         <form name="frm_sellerworkdescri">
          <table  align="center">
                        
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
           
    
        <%
            if(request.getParameter("btnpropertybooking")!=null )    
            {
                String insert="insert into tbl_propertybooking(pbooking_date,user_id,propertydetails_id) values(curdate(),'"+session.getAttribute("userid")+"','"+session.getAttribute("pdetails")+"')";
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
            
            if(request.getParameter("btnpropertyrent")!=null)
            {
                String insertRent="insert into tbl_propertyrent(propertyrent_date,user_id,propertydetails_id) values(curdate(),'"+session.getAttribute("userid")+"','"+session.getAttribute("pdetails")+"')";
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
           
            if(request.getParameter("btnpropertylease")!=null)
            {
                String insertLease="insert into tbl_propertylease(propertylease_date,user_id,propertydetails_id) values(curdate(),'"+session.getAttribute("userid")+"','"+session.getAttribute("cdetails")+"')";
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
            //session.setAttribute("bid", request.getParameter("pdetails"));
            String selQry="select * from tbl_propertydetails cd inner join tbl_property c on cd.property_id = c.property_id inner join tb_user b on b.user_id = c.user_id inner join tbl_constructiontype ct on c.constructiontype_id= ct.constructiontype_id inner join tbl_district d on b.district_id = d.district_id where propertydetails_id="+session.getAttribute("pdetails");
            ResultSet rs=obj.selectData(selQry);
          
            if(rs.next())
            {
               
                
        %>

                <tr>
                    <th colspan="2" align="center"><img style="width: 300px;height: 300px" src="../Users/PropertyImages/<%=rs.getString("property_image")%> " height="150" width="150">
                </tr>
                        <tr>
                            <td  align="center">
                     <%
                   
                   if ((rs.getString("property_status").equals("1")))
                       {  %>
                            <td colspan="2"><font size="50" color="red">Sold Out</font></td>
                     
                       <%}
                   %>
                     <tr><td colspan="2" align="left">
                             
                             
                             <input type="submit" name="btnsellerlist" value="View Seller" formaction="ViewSellers.jsp">
                       
                    </td></tr>
                                 
                    </td>
                        </tr>
                        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                    <td colspan="2"><h4><%=rs.getString("property_caption")%></h4></td>
  
                </tr>
                <tr align="left">
                  <th>Address:</th>  
                    <td><%=rs.getString("property_address")%></td>
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
                    <td><%=rs.getString("property_number")%></td>
                </tr>
                </tr>
                <tr align="left">
                     <th> Rate :</th>
                    <td><%=rs.getString("property_amount")%></td>
                </tr>
                <tr align="left">
                     <th> Rent rate :</th>
                    <td><%=rs.getString("property_rentamount")%></td>
                </tr>
                <tr align="left">
                     <th> Lease Rate :</th>
                    <td><%=rs.getString("property_leaseamount")%></td>
                </tr>
                 <tr>
                 <th>Specifications:</th>
     
                     <td><%=rs.getString("propertydetails_description")%></td>
                </tr>
                  
               <%
            }
        %>
                                           
                     <tr><td colspan="2" align="center">
                             
                             <input type="submit" name="btnpropertybooking" value="Book Online">
                        <input type="submit" name="btnpropertyrent" value="Send Proposal for Rent">
                        <input type="submit" name="btnpropertylease" value="Send Proposal for Lease">
                      
                    </td></tr>
                                           
                     <tr>
                         
                         
                  <td><a href="SellerWorkList.jsp">Back...</a></td>
                  </tr>
        </table>
        </form>

    </body>
</html>
