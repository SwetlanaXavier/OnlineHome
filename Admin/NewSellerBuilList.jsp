<%-- 
    Document   : NewSellerBuilList
    Created on : 27 Mar, 2018, 7:35:41 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin approval for Seller selling construction</title>
    </head>
    <body>
         <%
         if(request.getParameter("BId")!=null)
        {
          String updateApproval="update tbl_propertydetails set propertydetails_status=1 where propertydetails_id='"+request.getParameter("BId")+"'";
          boolean b=obj.ExecuteCommand(updateApproval);
          if(b)
          {
              response.sendRedirect("NewSellerBuilList.jsp");
          }
          else
          {
              out.print(updateApproval);
          }
        }
         if(request.getParameter("Did")!=null)
        {
          String updateReject="update tbl_propertydetails set propertydetails_status=2 where propertydetails_id='"+request.getParameter("Did")+"'";
          boolean b2=obj.ExecuteCommand(updateReject);
          if(b2)
          {
              response.sendRedirect("NewSellerBuilList.jsp");
          }
          else
          {
              out.print(updateReject);
          }
        }        
    %>

    <br>
    <br>
    
    <form name="frm_buildingpending">
            
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Photo</th>
                 <th>Seller Name</th>
                 <th>Contact address</th>
                 <th>Contact Number</th>
                <th>Email Id</th>
                <th>Image</th>
                <th> Caption</th>
                <th>Construction type</th>
                <th>Address</th>
                <th>Description</th>
                 <th>Property Rate</th>
                  <th>Rent Rate</th>
                  <th>Lease Rate</th>
                </tr>
                



                   
                     <% int i=1;
                    String str="select * from tbl_propertydetails cd inner join tbl_property c on c.property_id =cd.property_id inner join tbl_constructiontype ctype on ctype.constructiontype_id = c.constructiontype_id inner join tb_user b on b.user_id = c.user_id where propertydetails_status=0";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                    <td><%=i%></td>
                   <td><img style="width:100px; height:100px" src="../Users/Photo/<%=rs.getString("user_photo")%>"></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_address")%></td>
                   <td><%=rs.getString("user_contact")%></td>
                    <td><%=rs.getString("user_emailid")%></td>
                    
                    <td><img style="width:100px; height:100px" src="../Users/PropertyImages/<%=rs.getString("property_image")%>"></td>
                   <td><%=rs.getString("property_caption")%></td>
                     <td><%=rs.getString("constructiontype_type")%></td>
                   <td><%=rs.getString("property_address")%></td>
                   <td><%=rs.getString("propertydetails_description")%></td>
                   <td><%=rs.getString("property_amount")%></td>
                   <td><%=rs.getString("property_rentamount")%></td>
                   <td><%=rs.getString("property_leaseamount")%></td>
                   
                   
                   
                     <td><a href="NewSellerBuilList.jsp?BId=<%=rs.getString("propertydetails_id")%>">APPROVE</a></td>
                     <td><a href="NewSellerBuilList.jsp?Did=<%=rs.getString("propertydetails_id")%>">REJECT</a></td></tr>

                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
      
    </body>
</html>
